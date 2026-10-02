#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
export_meta.py — تبدیل پرونده‌های حقیقت به چیزی که سایت می‌خورد.

سه خروجی از یک داده:
  ۱. content/data/export/<province>.meta.json  → برای صفحهٔ «ورود انبوه داده» در پیشخان
     (شهرها ← پوشش ۴۸۳ شهرستان ← ورود داده) یا دستور وردپرس‌سی‌ال‌آی.
  ۲. content/data/export/<province>.wp-cli.sh  → برای کسانی که SSH دارند.
  ۳. content/cities/<slug>.md (با --stubs) → اسکلت مقاله با جدول «مشخصات کلی» از پیش پرشده،
     تا نویسنده فقط روایت را بنویسد نه عدد را.

    python3 content-templates/tools/geo/export_meta.py --province fars
    python3 content-templates/tools/geo/export_meta.py --all --stubs
"""
import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

EXPORT_DIR = os.path.join(registry.ROOT, 'content', 'data', 'export')
STUB_DIR = os.path.join(registry.ROOT, 'content', 'cities')

# ستون پرونده → کلید متای وردپرس (قالب فرزند ۲.۸.۰).
META_MAP = {
    'center': 'sa_cty_center',
    'population': 'sa_cty_population',
    'census_year': 'sa_cty_census_year',
    'area': 'sa_cty_area',
    'districts': 'sa_cty_districts',
    'rural_districts': 'sa_cty_rural_districts',
    'cities': 'sa_cty_cities',
    'villages': 'sa_cty_villages',
    'distance_center': 'sa_cty_distance_center',
    'climate': 'sa_cty_climate',
    'language': 'sa_cty_language',
    'livelihood': 'sa_cty_livelihood',
    'best_time': 'sa_cty_best_time',
    'neighbors': 'sa_cty_neighbors',
    'poi_nature': 'sa_cty_poi_nature',
    'poi_offbeat': 'sa_cty_poi_offbeat',
    'poi_recreation': 'sa_cty_poi_recreation',
    'poi_heritage': 'sa_cty_poi_heritage',
    'lat': 'sa_city_latitude',
    'lon': 'sa_city_longitude',
    'elevation': 'sa_city_elevation',
    'google_map_url': 'sa_google_map_url',
    'city_population': 'sa_city_population',
}
FA = '۰۱۲۳۴۵۶۷۸۹'


def fa_digits(value):
    return ''.join(FA[int(ch)] if ch.isdigit() else ch for ch in str(value))


def doc_of(slug):
    path = os.path.join(registry.FACTS_DIR, slug + '.json')
    if not os.path.isfile(path):
        return None
    with open(path, encoding='utf-8') as fh:
        return json.load(fh)


def val(doc, field):
    f = (doc.get('fields') or {}).get(field)
    return f.get('value') if f else None


def to_meta(doc):
    out = {}
    for field, key in META_MAP.items():
        v = val(doc, field)
        if v in (None, '', []):
            continue
        if field == 'neighbors':
            dirs = val(doc, 'neighbor_dirs') or {}
            v = '\n'.join(
                ('%s - %s' % (n, dirs[n])) if dirs.get(n) else str(n) for n in v
            )
        elif isinstance(v, float) and v.is_integer():
            v = int(v)
        out[key] = v
    return out


def stub(doc, row):
    """اسکلت مقاله: عددها از پرونده، روایت برای نویسنده خالی می‌ماند."""
    name = row['name']
    pop, year = val(doc, 'population'), val(doc, 'census_year')
    rows = [
        ('مرکز شهرستان', val(doc, 'center')),
        ('جمعیت', '%s نفر (سرشماری %s)' % (fa_digits('{:,}'.format(int(pop))), fa_digits(year)) if pop and year else None),
        ('مساحت', '%s کیلومتر مربع' % fa_digits('{:,}'.format(int(val(doc, 'area')))) if val(doc, 'area') else None),
        ('ارتفاع مرکز', '%s متر' % fa_digits(int(val(doc, 'elevation'))) if val(doc, 'elevation') else None),
        ('مختصات', '%s، %s' % (val(doc, 'lat'), val(doc, 'lon')) if val(doc, 'lat') else None),
        ('تقسیمات', '، '.join(filter(None, [
            '%s بخش' % fa_digits(int(val(doc, 'districts'))) if val(doc, 'districts') else None,
            '%s دهستان' % fa_digits(int(val(doc, 'rural_districts'))) if val(doc, 'rural_districts') else None,
            '%s شهر' % fa_digits(int(val(doc, 'cities'))) if val(doc, 'cities') else None,
            '%s روستا' % fa_digits(int(val(doc, 'villages'))) if val(doc, 'villages') else None,
        ])) or None),
        ('همسایه‌ها', '، '.join((registry.county(s) or {}).get('name', s) for s in (val(doc, 'neighbors') or [])) or None),
    ]
    table = '\n'.join('| %s | %s |' % (k, v) for k, v in rows if v)
    poi = '\n'.join('- %s' % p for p in (val(doc, 'poi_candidates') or [])) or '- (از برداشت ویکی‌پدیا پر می‌شود)'
    return """---
slug: {slug}
title: شهرستان {name}
province: {province}
status: draft
data_source: content/data/counties/{slug}.json
---

## مشخصات کلی

| مورد | مقدار |
|---|---|
{table}

## معرفی شهرستان

<!-- نویسنده: ۲۰۰ تا ۳۰۰ واژه، فقط مثبت، با تکیه بر جاذبه‌ها -->

## طبیعت و جاذبه‌های دیدنی

<!-- نامزدهای برداشت‌شده (هر کدام باید با منبع تأیید یا حذف شود):
{poi}
-->

## روستاها و نقاط بکر

## تفریح و اقامت

## چطور برویم؟

## پرسش‌های پرتکرار
""".format(slug=row['slug'], name=name, province=row['province'], table=table, poi=poi)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--province')
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--stubs', action='store_true', help='ساخت اسکلت مقاله در content/cities/ (فایل موجود بازنویسی نمی‌شود)')
    args = ap.parse_args()
    targets = sorted(registry.by_province()) if args.all else [args.province]
    if not targets or targets == [None]:
        raise SystemExit('--province <slug> یا --all لازم است.')
    os.makedirs(EXPORT_DIR, exist_ok=True)

    for prov in targets:
        payload, cli, stubs = {}, ['#!/usr/bin/env bash', 'set -euo pipefail', ''], 0
        for row in registry.by_province(prov)[prov]:
            doc = doc_of(row['slug'])
            if not doc:
                continue
            meta = to_meta(doc)
            if not meta:
                continue
            payload[row['slug']] = meta
            cli.append('# %s' % row['name'])
            cli.append('ID=$(wp post list --post_type=city --name=%s --field=ID | head -1)' % row['slug'])
            for k, v in meta.items():
                cli.append('[ -n "$ID" ] && wp post meta update "$ID" %s %s' % (k, json.dumps(str(v), ensure_ascii=False)))
            cli.append('')
            if args.stubs:
                path = os.path.join(STUB_DIR, row['slug'] + '.md')
                if not os.path.exists(path):
                    with open(path, 'w', encoding='utf-8') as fh:
                        fh.write(stub(doc, row))
                    stubs += 1
        with open(os.path.join(EXPORT_DIR, prov + '.meta.json'), 'w', encoding='utf-8') as fh:
            json.dump(payload, fh, ensure_ascii=False, indent=1, sort_keys=True)
        with open(os.path.join(EXPORT_DIR, prov + '.wp-cli.sh'), 'w', encoding='utf-8') as fh:
            fh.write('\n'.join(cli) + '\n')
        print('✓ %-24s %3d شهرستان آمادهٔ ورود%s' % (prov, len(payload), ' · %d اسکلت تازه' % stubs if args.stubs else ''))


if __name__ == '__main__':
    main()
