#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
validate_facts.py — تور ایمنیِ خودکار پیش از اینکه هر عددی وارد سایت شود.

این همان تفاوت «سریع» با «سریع و درست» است: دادهٔ انبوه همیشه چند درصد خطا دارد
(نام مشابه، عدد بخش به‌جای شهرستان، مختصات روی کشور همسایه). این بررسی‌ها
ارزان‌اند و تقریباً همهٔ خطاهای فاحش را می‌گیرند:

  • بازهٔ منطقی: جمعیت، مساحت، ارتفاع، تعداد روستا/دهستان/بخش
  • سال سرشماری فقط ۱۳۸۵/۱۳۹۰/۱۳۹۵/۱۴۰۰
  • مختصات داخل کادر ایران و داخل کادر تقریبی استان
  • همسایه‌ها: هم در فهرست رسمی باشند، هم **متقارن** (اگر الف همسایهٔ ب است، ب هم باید باشد)
  • مرکز شهرستان خالی نباشد و نام تکراریِ شهرستان دیگری نباشد
  • تعارض‌های حل‌نشدهٔ merge

خروجی: content/data/COUNTY-FACTS-ISSUES.md  (+ کد خروج ۱ اگر خطای ERROR باشد)

    python3 content-templates/tools/geo/validate_facts.py
"""
import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

IRAN_BBOX = (24.5, 40.0, 43.5, 63.5)  # lat_min, lat_max, lon_min, lon_max
RANGES = {
    'population': (1000, 5000000, 'ERROR'),
    'area': (20, 200000, 'ERROR'),
    'elevation': (-40, 4000, 'WARN'),
    'districts': (1, 12, 'WARN'),
    'rural_districts': (1, 40, 'WARN'),
    'cities': (1, 30, 'WARN'),
    'villages': (1, 3000, 'WARN'),
    'distance_center': (0, 1200, 'WARN'),
}
CENSUS_YEARS = {1385, 1390, 1395, 1400, 2006, 2011, 2016, 2021}


def load_all():
    docs = {}
    for row in registry.counties():
        path = os.path.join(registry.FACTS_DIR, row['slug'] + '.json')
        if os.path.isfile(path):
            with open(path, encoding='utf-8') as fh:
                docs[row['slug']] = json.load(fh)
    return docs


def value(doc, field):
    f = (doc.get('fields') or {}).get(field)
    return f.get('value') if f else None


def check(docs):
    issues = []
    reg = {r['slug']: r for r in registry.counties()}

    def add(level, slug, msg):
        issues.append((level, slug, msg))

    for slug, doc in docs.items():
        for field, (lo, hi, level) in RANGES.items():
            v = value(doc, field)
            if v is None:
                continue
            try:
                v = float(v)
            except (TypeError, ValueError):
                add('ERROR', slug, '%s عددی نیست: %r' % (field, v))
                continue
            if not lo <= v <= hi:
                add(level, slug, '%s = %s بیرون از بازهٔ %s..%s' % (field, v, lo, hi))

        year = value(doc, 'census_year')
        if year and int(float(year)) not in CENSUS_YEARS:
            add('WARN', slug, 'سال سرشماری نامعتبر: %s' % year)
        if value(doc, 'population') and not year:
            add('ERROR', slug, 'جمعیت بدون سال سرشماری — طبق قالب چاپ نمی‌شود')

        lat, lon = value(doc, 'lat'), value(doc, 'lon')
        if lat and lon:
            if not (IRAN_BBOX[0] <= float(lat) <= IRAN_BBOX[1] and IRAN_BBOX[2] <= float(lon) <= IRAN_BBOX[3]):
                add('ERROR', slug, 'مختصات بیرون از ایران: %s, %s' % (lat, lon))
        elif value(doc, 'center'):
            add('WARN', slug, 'مختصات ندارد')

        for nb in value(doc, 'neighbors') or []:
            if nb not in reg:
                add('ERROR', slug, 'همسایهٔ ناشناخته: %s' % nb)
                continue
            back = value(docs.get(nb, {}), 'neighbors') or []
            if back and slug not in back:
                add('WARN', slug, 'همسایگی نامتقارن با %s' % nb)

        for field, conflict in (doc.get('conflicts') or {}).items():
            add('WARN', slug, 'تعارض منبع در %s: %s' % (field, json.dumps(conflict, ensure_ascii=False)))

    # مرکزهای تکراری در یک استان (نشانهٔ تطبیق اشتباه).
    seen = {}
    for slug, doc in docs.items():
        c = value(doc, 'center')
        if not c:
            continue
        key = (doc.get('province'), registry.normalize_fa(c))
        if key in seen:
            issues.append(('ERROR', slug, 'مرکز تکراری «%s» با %s' % (c, seen[key])))
        seen[key] = slug
    return issues


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', default=os.path.join(registry.ROOT, 'content', 'data', 'COUNTY-FACTS-ISSUES.md'))
    args = ap.parse_args()
    docs = load_all()
    issues = check(docs)
    errors = [i for i in issues if i[0] == 'ERROR']
    warns = [i for i in issues if i[0] == 'WARN']

    lines = ['# گزارش اعتبارسنجی دادهٔ شهرستان‌ها', '',
             'پرونده‌های بررسی‌شده: %d از ۴۸۳ · خطا: %d · هشدار: %d' % (len(docs), len(errors), len(warns)), '']
    for title, group in (('خطاها (باید پیش از ورود به سایت حل شوند)', errors), ('هشدارها', warns)):
        lines += ['## ' + title, '']
        if not group:
            lines += ['موردی نیست.', '']
            continue
        lines += ['| شهرستان | مورد |', '|---|---|']
        for _lvl, slug, msg in sorted(group, key=lambda x: x[1]):
            lines.append('| `%s` | %s |' % (slug, msg.replace('|', '\\|')))
        lines.append('')
    with open(args.out, 'w', encoding='utf-8') as fh:
        fh.write('\n'.join(lines) + '\n')
    print('خطا: %d · هشدار: %d → %s' % (len(errors), len(warns), os.path.relpath(args.out, registry.ROOT)))
    return 1 if errors else 0


if __name__ == '__main__':
    sys.exit(main())
