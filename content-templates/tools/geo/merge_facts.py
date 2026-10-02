#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
merge_facts.py — ادغام برداشت‌های خام در «پروندهٔ حقیقتِ» هر شهرستان.

قاعده‌ها:
  ۱. هر مقدار همراه منبع و تاریخ ذخیره می‌شود (بدون منبع = بی‌ارزش).
  ۲. اولویت منبع برای هر ستون فرق دارد: تقسیمات از ویکی‌پدیا، مختصات/مساحت از ویکی‌دیتا،
     و هر چیزی که انسان تأیید کرده (status=verified/manual) **هرگز** بازنویسی نمی‌شود.
  ۳. اگر دو منبع عدد متفاوت بدهند، مقدار اولویت‌دار می‌نشیند و دیگری در `conflicts`
     می‌ماند تا بازبین انسانی در چند ثانیه داوری کند.
  ۴. خروجی تک‌فایل برای هر شهرستان: content/data/counties/<slug>.json

    python3 content-templates/tools/geo/merge_facts.py --province fars
    python3 content-templates/tools/geo/merge_facts.py --all
"""
import argparse
import json
import os
import sys
from datetime import date

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

# ستون → ترتیب منابع (اولی برنده).
PRIORITY = {
    'center':          ['manual', 'wikidata', 'wikipedia'],
    'population':      ['manual', 'wikipedia', 'wikidata'],
    'census_year':     ['manual', 'wikipedia', 'wikidata'],
    'area':            ['manual', 'wikidata', 'wikipedia'],
    'elevation':       ['manual', 'wikidata', 'wikipedia'],
    'lat':             ['manual', 'wikidata'],
    'lon':             ['manual', 'wikidata'],
    'districts':       ['manual', 'wikipedia'],
    'rural_districts': ['manual', 'wikipedia'],
    'cities':          ['manual', 'wikipedia'],
    'villages':        ['manual', 'wikipedia'],
    'climate':         ['manual', 'wikipedia'],
    'neighbors':       ['manual', 'wikidata'],
    'language':        ['manual'],
    'livelihood':      ['manual'],
    'best_time':       ['manual'],
    'distance_center': ['manual'],
    'poi_nature':      ['manual'],
    'poi_offbeat':     ['manual'],
    'poi_recreation':  ['manual'],
    'poi_heritage':    ['manual'],
}
LOCKED = ('verified', 'manual')  # دست‌نخوردنی


def load_harvest(kind, province):
    path = os.path.join(registry.HARVEST_DIR, kind, province + '.json')
    if not os.path.isfile(path):
        return {}
    with open(path, encoding='utf-8') as fh:
        return json.load(fh)


def load_facts(slug):
    path = os.path.join(registry.FACTS_DIR, slug + '.json')
    if os.path.isfile(path):
        with open(path, encoding='utf-8') as fh:
            return json.load(fh)
    return None


def merge_province(province, dry=False):
    sources = {
        'wikidata': load_harvest('wikidata', province),
        'wikipedia': load_harvest('wikipedia', province),
        'manual': load_harvest('manual', province),
    }
    today = date.today().isoformat()
    stats = {'new': 0, 'updated': 0, 'kept': 0, 'conflicts': 0}
    os.makedirs(registry.FACTS_DIR, exist_ok=True)

    for row in registry.by_province(province)[province]:
        slug = row['slug']
        doc = load_facts(slug) or {
            'slug': slug, 'name': row['name'], 'province': province, 'fields': {}, 'conflicts': {},
        }
        doc['name'], doc['province'] = row['name'], province
        doc.setdefault('fields', {})
        doc['conflicts'] = {}
        touched = False

        for field, order in PRIORITY.items():
            current = doc['fields'].get(field)
            if current and current.get('status') in LOCKED:
                stats['kept'] += 1
                continue
            offers = []
            for src in order:
                rec = sources.get(src, {}).get(slug) or {}
                val = rec.get(field)
                if val in (None, '', [], 0):
                    continue
                offers.append((src, val, rec.get('_source', ''), rec.get('_fetched', today)))
            if not offers:
                continue
            src, val, url, fetched = offers[0]

            def same(a, b):
                """۱۳۹۵ و "1395" و 1395.0 یک چیزند — تعارض ساختگی نسازیم."""
                try:
                    return abs(float(a) - float(b)) < 1e-9
                except (TypeError, ValueError):
                    return str(a).strip() == str(b).strip()

            others = {s: v for s, v, _u, _f in offers[1:] if not same(v, val)}
            if others:
                doc['conflicts'][field] = {'chosen': {src: val}, 'others': others}
                stats['conflicts'] += 1
            new = {'value': val, 'source': src, 'url': url, 'fetched': fetched, 'status': 'auto'}
            if not current:
                stats['new'] += 1
                touched = True
            elif current.get('value') != val:
                stats['updated'] += 1
                touched = True
            doc['fields'][field] = new

        if touched and not dry:
            with open(os.path.join(registry.FACTS_DIR, slug + '.json'), 'w', encoding='utf-8') as fh:
                json.dump(doc, fh, ensure_ascii=False, indent=1, sort_keys=True)
    return stats


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--province')
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--dry-run', action='store_true')
    args = ap.parse_args()
    targets = sorted(registry.by_province()) if args.all else [args.province]
    if not targets or targets == [None]:
        raise SystemExit('--province <slug> یا --all لازم است.')
    total = {'new': 0, 'updated': 0, 'kept': 0, 'conflicts': 0}
    for prov in targets:
        s = merge_province(prov, args.dry_run)
        for k in total:
            total[k] += s[k]
        print('%-24s تازه %3d · به‌روز %3d · دست‌نخورده %3d · تعارض %3d' %
              (prov, s['new'], s['updated'], s['kept'], s['conflicts']))
    print('—' * 60)
    print('جمع: تازه %d · به‌روز %d · دست‌نخورده %d · تعارض %d' %
          (total['new'], total['updated'], total['kept'], total['conflicts']))


if __name__ == '__main__':
    main()
