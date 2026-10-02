#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
harvest_wikipedia.py — برداشت ستون‌هایی که ویکی‌دیتا ندارد، از ویکی‌پدیای فارسی.

ویکی‌دیتا تقسیمات داخلی (بخش/دهستان/شهر/**تعداد روستا**) و فهرست جاذبه‌ها را ندارد؛
جعبهٔ اطلاعات و سرتیترهای ویکی‌پدیای فارسی دارند. این اسکریپت با API رسمی
(`action=query&prop=revisions`) ویکی‌متن را می‌گیرد و فقط فیلدهای عددی/فهرستی را درمی‌آورد.

ستون‌ها: districts, rural_districts, cities, villages, population(+year), area,
elevation, climate, poi_candidates (نام‌های زیر سرتیتر جاذبه/دیدنی/طبیعت).

خروجی: content/data/harvest/wikipedia/<province>.json  (+ فیلد _source با نشانی مقاله)

    python3 content-templates/tools/geo/harvest_wikipedia.py --province fars
    python3 content-templates/tools/geo/harvest_wikipedia.py --all --sleep 1
"""
import argparse
import json
import os
import re
import sys
import time
import urllib.parse
import urllib.request
from datetime import date

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

API = 'https://fa.wikipedia.org/w/api.php'
UA = 'sarzaminaryan-geo-harvester/1.0 (https://sarzaminaryan.ir; Mail@sarzaminaryan.ir)'
FA_DIGITS = str.maketrans('۰۱۲۳۴۵۶۷۸۹٬،', '0123456789,,')

POI_HEADS = ('جاذبه', 'دیدنی', 'گردشگر', 'طبیعت', 'آثار تاریخی', 'مکان‌های')


def api_wikitext(titles):
    """چند عنوان در یک درخواست (حداکثر ۲۰ تا) → {title: wikitext}"""
    params = {
        'action': 'query', 'prop': 'revisions', 'rvprop': 'content', 'rvslots': 'main',
        'format': 'json', 'formatversion': '2', 'redirects': '1',
        'titles': '|'.join(titles),
    }
    req = urllib.request.Request(API + '?' + urllib.parse.urlencode(params), headers={'User-Agent': UA})
    with urllib.request.urlopen(req, timeout=90) as resp:
        data = json.loads(resp.read().decode('utf-8'))
    out = {}
    for page in data.get('query', {}).get('pages', []):
        if 'revisions' in page:
            out[page['title']] = page['revisions'][0]['slots']['main']['content']
    # ریدایرکت‌ها را به عنوان درخواستی برگردان.
    for r in data.get('query', {}).get('redirects', []):
        if r['to'] in out:
            out[r['from']] = out[r['to']]
    return out


def num(text):
    if not text:
        return None
    t = str(text).translate(FA_DIGITS)
    t = re.sub(r'\[\[|\]\]|<[^>]+>|\{\{[^}]*\}\}', ' ', t)
    m = re.search(r'-?\d[\d,]*(?:\.\d+)?', t)
    return float(m.group(0).replace(',', '')) if m else None


def infobox_fields(wt):
    """پارامترهای جعبهٔ اطلاعات به صورت {نام: مقدار خام}."""
    out = {}
    for m in re.finditer(r'^\s*\|\s*([^=|\n]{1,40}?)\s*=\s*([^\n]*)$', wt, re.M):
        key = m.group(1).strip()
        val = m.group(2).strip()
        if val and key not in out:
            out[key] = val
    return out


def pick(fields, *names):
    for n in names:
        for k, v in fields.items():
            if n in k:
                return v
    return None


def count_items(value):
    """«۳ بخش، ۷ دهستان» یا فهرست با «،» → عدد."""
    n = num(value)
    if n is not None:
        return int(n)
    if value and '،' in value:
        return len([x for x in value.split('،') if x.strip()])
    return None


def poi_candidates(wt):
    """نام‌های برجسته زیر سرتیترهای جاذبه/طبیعت — فقط «نامزد»، نه دادهٔ نهایی."""
    out = []
    for m in re.finditer(r'^==+\s*([^=\n]+?)\s*==+\s*$', wt, re.M):
        head = m.group(1)
        if not any(h in head for h in POI_HEADS):
            continue
        body = wt[m.end(): m.end() + 4000]
        body = body.split('\n==', 1)[0]
        for item in re.findall(r'\[\[([^\]|#]{3,60})(?:\|[^\]]*)?\]\]', body):
            item = item.strip()
            if item and item not in out and not item.startswith(('پرونده', 'رده', 'الگو')):
                out.append(item)
        for item in re.findall(r"^\*\s*'''([^']{3,60})'''", body, re.M):
            if item not in out:
                out.append(item)
    return out[:25]


def harvest(province, sleep=1.0):
    rows, today = {}, date.today().isoformat()
    targets = registry.by_province(province)[province]
    for i in range(0, len(targets), 15):
        chunk = targets[i:i + 15]
        titles = ['شهرستان ' + c['name'] for c in chunk]
        try:
            pages = api_wikitext(titles)
        except Exception as exc:  # noqa: BLE001
            print('  ✗ دسته %d: %s' % (i // 15 + 1, exc))
            continue
        for c, title in zip(chunk, titles):
            wt = pages.get(title)
            if not wt:
                continue
            fields = infobox_fields(wt)
            rows[c['slug']] = {
                'slug': c['slug'],
                'districts': count_items(pick(fields, 'بخش')),
                'rural_districts': count_items(pick(fields, 'دهستان')),
                'cities': count_items(pick(fields, 'شهرها', 'تعداد شهر')),
                'villages': count_items(pick(fields, 'روستا', 'آبادی')),
                'population': int(num(pick(fields, 'جمعیت')) or 0) or None,
                'census_year': (lambda y: int(y) if y and 1300 < y < 1450 else None)(num(pick(fields, 'سال سرشماری', 'تاریخ سرشماری'))),
                'area': num(pick(fields, 'مساحت')),
                'elevation': num(pick(fields, 'ارتفاع')),
                'climate': pick(fields, 'آب و هوا', 'اقلیم'),
                'poi_candidates': poi_candidates(wt),
                '_source': 'https://fa.wikipedia.org/wiki/' + urllib.parse.quote(title.replace(' ', '_')),
                '_fetched': today,
            }
        time.sleep(sleep)
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--province')
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--sleep', type=float, default=1.0)
    args = ap.parse_args()

    targets = sorted(registry.by_province()) if args.all else [args.province]
    if not targets or targets == [None]:
        raise SystemExit('--province <slug> یا --all لازم است.')
    out_dir = os.path.join(registry.HARVEST_DIR, 'wikipedia')
    os.makedirs(out_dir, exist_ok=True)
    for prov in targets:
        rows = harvest(prov, args.sleep)
        path = os.path.join(out_dir, prov + '.json')
        with open(path, 'w', encoding='utf-8') as fh:
            json.dump(rows, fh, ensure_ascii=False, indent=1, sort_keys=True)
        expected = len(registry.by_province(prov)[prov])
        print('✓ %-24s %3d/%3d شهرستان → %s' % (prov, len(rows), expected, os.path.relpath(path, registry.ROOT)))


if __name__ == '__main__':
    main()
