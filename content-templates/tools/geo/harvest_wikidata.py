#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
harvest_wikidata.py — برداشت «یک بخش از کل» از ویکی‌دیتا برای همهٔ ۴۸۳ شهرستان.

فلسفه: به‌جای تحقیق شهرستان‌به‌شهرستان، هر بار **یک ستون داده** را برای کل کشور
(یا یک استان) می‌کشیم. یک پرس‌وجو، یک قالب، یک بار بازبینی.

ستون‌های پوشش‌داده‌شده (هر کدام با مرجع و تاریخ برداشت):
    center        P36  مرکز شهرستان
    population    P1082 + گزارهٔ point in time (P585)
    area          P2046 مساحت (کیلومتر مربع)
    lat/lon       P625 مختصات
    neighbors     P47  همسایه‌ها (فقط آن‌هایی که در فهرست رسمی ما هستند)
    elevation     P2044

خروجی: content/data/harvest/wikidata/<province>.json

اجرا (نیازمند اینترنت؛ در سندباکس عامل شبکه ندارد — روی سیستم خودتان یا
با ورک‌فلوی .github/workflows/harvest-counties.yml اجرا کنید):

    python3 content-templates/tools/geo/harvest_wikidata.py --province fars
    python3 content-templates/tools/geo/harvest_wikidata.py --all --sleep 3
"""
import argparse
import json
import os
import sys
import time
import urllib.parse
import urllib.request
from datetime import date

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

ENDPOINT = 'https://query.wikidata.org/sparql'
UA = 'sarzaminaryan-geo-harvester/1.0 (https://sarzaminaryan.ir; Mail@sarzaminaryan.ir)'

QUERY = """
SELECT ?county ?countyLabel ?centerLabel ?pop ?popDate ?area ?coord ?elev
       (GROUP_CONCAT(DISTINCT ?nbLabel; separator="|") AS ?neighbors) WHERE {
  ?county wdt:P31 wd:Q137535 ; wdt:P131* wd:%(prov_qid)s .
  OPTIONAL { ?county wdt:P36 ?center. }
  OPTIONAL { ?county p:P1082 ?popSt. ?popSt ps:P1082 ?pop. OPTIONAL { ?popSt pq:P585 ?popDate. } }
  OPTIONAL { ?county wdt:P2046 ?area. }
  OPTIONAL { ?county wdt:P625 ?coord. }
  OPTIONAL { ?county wdt:P2044 ?elev. }
  OPTIONAL { ?county wdt:P47 ?nb. ?nb rdfs:label ?nbLabel. FILTER(LANG(?nbLabel)="fa") }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "fa,en". }
}
GROUP BY ?county ?countyLabel ?centerLabel ?pop ?popDate ?area ?coord ?elev
"""

# QID استان‌ها (ثابت‌اند؛ یک‌بار برای همیشه).
PROVINCE_QID = {
    'east-azerbaijan': 'Q170085', 'west-azerbaijan': 'Q170089', 'ardabil': 'Q170063',
    'isfahan': 'Q83210', 'alborz': 'Q1125160', 'ilam': 'Q170070', 'bushehr': 'Q170067',
    'tehran': 'Q3908', 'chaharmahal-bakhtiari': 'Q170074', 'south-khorasan': 'Q170072',
    'razavi-khorasan': 'Q170072', 'north-khorasan': 'Q170071', 'khuzestan': 'Q170078',
    'zanjan': 'Q170095', 'semnan': 'Q170092', 'sistan-baluchestan': 'Q170093',
    'fars': 'Q163263', 'qazvin': 'Q170080', 'qom': 'Q170081', 'kurdistan': 'Q170077',
    'kerman': 'Q170082', 'kermanshah': 'Q170083', 'kohgiluyeh-boyer-ahmad': 'Q170084',
    'golestan': 'Q170075', 'gilan': 'Q170076', 'lorestan': 'Q170086', 'mazandaran': 'Q170088',
    'markazi': 'Q170087', 'hormozgan': 'Q170069', 'hamadan': 'Q170068', 'yazd': 'Q170096',
}
# استان‌هایی که QID بالا را باید دستی تأیید کنید (خراسان‌ها در ویکی‌دیتا جابه‌جا ثبت شده‌اند).
SUSPECT = {'razavi-khorasan', 'south-khorasan'}


def sparql(query):
    url = ENDPOINT + '?' + urllib.parse.urlencode({'query': query, 'format': 'json'})
    req = urllib.request.Request(url, headers={'User-Agent': UA, 'Accept': 'application/sparql-results+json'})
    with urllib.request.urlopen(req, timeout=120) as resp:
        return json.loads(resp.read().decode('utf-8'))


def parse_point(coord):
    """'Point(51.26 30.95)' → (lat, lon)"""
    try:
        lon, lat = coord.replace('Point(', '').rstrip(')').split(' ')
        return round(float(lat), 5), round(float(lon), 5)
    except Exception:
        return None, None


def harvest(province):
    qid = PROVINCE_QID.get(province)
    if not qid:
        raise SystemExit('QID استان %s تعریف نشده است.' % province)
    data = sparql(QUERY % {'prov_qid': qid})
    today = date.today().isoformat()
    rows = {}
    for b in data['results']['bindings']:
        name = b.get('countyLabel', {}).get('value', '')
        slug = registry.slug_of_name(name)
        if not slug:
            continue  # نام‌های تاریخی/بخش‌ها — عمداً دور ریخته می‌شوند.
        lat, lon = parse_point(b.get('coord', {}).get('value', ''))
        nb_slugs, nb_raw = [], b.get('neighbors', {}).get('value', '')
        for nb in filter(None, nb_raw.split('|')):
            s = registry.slug_of_name(nb)
            if s and s != slug:
                nb_slugs.append(s)
        rec = {
            'slug': slug,
            'name': name,
            'qid': b['county']['value'].rsplit('/', 1)[-1],
            'center': b.get('centerLabel', {}).get('value'),
            'population': int(float(b['pop']['value'])) if 'pop' in b else None,
            'census_year': (b.get('popDate', {}).get('value') or '')[:4] or None,
            'area': float(b['area']['value']) if 'area' in b else None,
            'elevation': int(float(b['elev']['value'])) if 'elev' in b else None,
            'lat': lat, 'lon': lon,
            'neighbors': sorted(set(nb_slugs)),
            '_source': 'https://www.wikidata.org/wiki/' + b['county']['value'].rsplit('/', 1)[-1],
            '_fetched': today,
        }
        prev = rows.get(slug)
        # چند ردیف جمعیت → تازه‌ترین سرشماری برنده است.
        if not prev or (rec['census_year'] or '') > (prev['census_year'] or ''):
            rows[slug] = rec
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--province')
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--sleep', type=float, default=2.0)
    args = ap.parse_args()

    targets = list(PROVINCE_QID) if args.all else [args.province]
    if not targets or targets == [None]:
        raise SystemExit('--province <slug> یا --all لازم است.')
    out_dir = os.path.join(registry.HARVEST_DIR, 'wikidata')
    os.makedirs(out_dir, exist_ok=True)

    for prov in targets:
        if prov in SUSPECT:
            print('⚠️  %s: QID مشکوک است، خروجی را دستی بررسی کنید.' % prov)
        expected = len(registry.by_province(prov)[prov])
        try:
            rows = harvest(prov)
        except Exception as exc:  # noqa: BLE001
            print('✗ %-24s %s' % (prov, exc))
            continue
        path = os.path.join(out_dir, prov + '.json')
        with open(path, 'w', encoding='utf-8') as fh:
            json.dump(rows, fh, ensure_ascii=False, indent=1, sort_keys=True)
        print('✓ %-24s %3d/%3d شهرستان → %s' % (prov, len(rows), expected, os.path.relpath(path, registry.ROOT)))
        time.sleep(args.sleep)


if __name__ == '__main__':
    main()
