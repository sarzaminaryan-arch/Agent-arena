#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
enrich_facts.py — پر کردن خانه‌هایی که «محاسبه‌شدنی» هستند، بدون اینترنت.

از روی همان داده‌ای که قبلاً برداشت شده (مختصات + فهرست جاذبه‌های ویکی‌پدیا)
چهار دسته خانهٔ خالی را پر می‌کند:

  ۱. distance_center  — فاصلهٔ خط مستقیم تا مرکز استان (هاورساین، کیلومتر).
  ۲. neighbors        — همسایه‌های شهرستان، از گراف گابریل روی مختصات مراکز
                        به‌همراه جهت (شمال، جنوب‌شرق…). «تقریبی و نیازمند بازبینی».
  ۳. poi_*            — تقسیم poi_candidates ویکی‌پدیا میان چهار خانهٔ جاذبه
                        (طبیعت‌گردی / تاریخی و زیارتی / تفریحی / بکر).
  ۴. google_map_url   — لینک گوگل‌مپ از روی مختصات.

هیچ‌کدام مقدار دست‌نویس (status=verified/manual) را بازنویسی نمی‌کنند.

    python3 content-templates/tools/geo/enrich_facts.py            # همهٔ استان‌ها
    python3 content-templates/tools/geo/enrich_facts.py --province qom
"""
import argparse
import datetime
import json
import math
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

TODAY = datetime.date.today().isoformat()
PROTECTED = ('verified', 'manual')

# مرکز هر استان (نام شهر) — برای محاسبهٔ فاصله.
CAPITALS = {
    'east-azerbaijan': 'تبریز', 'west-azerbaijan': 'ارومیه', 'ardabil': 'اردبیل',
    'isfahan': 'اصفهان', 'alborz': 'کرج', 'ilam': 'ایلام', 'bushehr': 'بوشهر',
    'tehran': 'تهران', 'south-khorasan': 'بیرجند', 'razavi-khorasan': 'مشهد',
    'north-khorasan': 'بجنورد', 'khuzestan': 'اهواز', 'zanjan': 'زنجان',
    'semnan': 'سمنان', 'sistan-baluchestan': 'زاهدان', 'fars': 'شیراز',
    'qazvin': 'قزوین', 'qom': 'قم', 'kurdistan': 'سنندج', 'kerman': 'کرمان',
    'kermanshah': 'کرمانشاه', 'kohgiluyeh-boyer-ahmad': 'یاسوج', 'golestan': 'گرگان',
    'gilan': 'رشت', 'lorestan': 'خرم‌آباد', 'mazandaran': 'ساری', 'markazi': 'اراک',
    'hormozgan': 'بندرعباس', 'hamadan': 'همدان', 'yazd': 'یزد',
    'chaharmahal-bakhtiari': 'شهرکرد',
}

DIRECTIONS = ['شمال', 'شمال‌شرق', 'شرق', 'جنوب‌شرق', 'جنوب', 'جنوب‌غرب', 'غرب', 'شمال‌غرب']

# دسته‌بندی جاذبه‌ها بر پایهٔ کلیدواژهٔ نام.
NATURE = ('آبشار', 'غار', 'تنگ', 'تنگه', 'دریاچه', 'تالاب', 'جنگل', 'کوه', 'قله',
          'چشمه', 'رودخانه', 'دره', 'سد ', 'کویر', 'بیابان', 'آبگرم', 'آب‌گرم',
          'گنبد نمکی', 'سراب', 'یخچال', 'مرداب', 'خلیج', 'جزیره', 'ساحل', 'آبشارهای')
HERITAGE = ('مسجد', 'امامزاده', 'امام‌زاده', 'قلعه', 'ارگ', 'کاروانسرا', 'حمام', 'بازار',
            'تیمچه', 'خانه', 'عمارت', 'کاخ', 'برج', 'مناره', 'گنبد', 'مقبره', 'مقابر',
            'آرامگاه', 'آتشکده', 'پل ', 'تپه', 'محوطه', 'کلیسا', 'بقعه', 'حرم', 'زیارتگاه',
            'موزه', 'دیر', 'آب‌انبار', 'آب انبار', 'یخچال تاریخی', 'گورستان', 'سنگ‌نگاره',
            'کتیبه', 'قنات', 'میدان', 'مدرسه', 'حسینیه', 'تکیه', 'مزار', 'باغ')
RECREATION = ('پارک', 'تله‌کابین', 'تله کابین', 'پیست', 'مجموعه تفریحی', 'شهربازی',
              'بوستان', 'استخر', 'مرکز خرید', 'دهکده')


def haversine(a, b):
    lat1, lon1, lat2, lon2 = map(math.radians, (a[0], a[1], b[0], b[1]))
    h = math.sin((lat2 - lat1) / 2) ** 2 + math.cos(lat1) * math.cos(lat2) * math.sin((lon2 - lon1) / 2) ** 2
    return 2 * 6371.0 * math.asin(math.sqrt(h))


def bearing(a, b):
    lat1, lon1, lat2, lon2 = map(math.radians, (a[0], a[1], b[0], b[1]))
    dl = lon2 - lon1
    y = math.sin(dl) * math.cos(lat2)
    x = math.cos(lat1) * math.sin(lat2) - math.sin(lat1) * math.cos(lat2) * math.cos(dl)
    return (math.degrees(math.atan2(y, x)) + 360) % 360


def direction_fa(a, b):
    return DIRECTIONS[int(((bearing(a, b) + 22.5) % 360) // 45)]


def load(slug):
    path = os.path.join(registry.FACTS_DIR, slug + '.json')
    if not os.path.isfile(path):
        return None
    with open(path, encoding='utf-8') as fh:
        return json.load(fh)


def save(doc):
    path = os.path.join(registry.FACTS_DIR, doc['slug'] + '.json')
    with open(path, 'w', encoding='utf-8') as fh:
        json.dump(doc, fh, ensure_ascii=False, indent=1, sort_keys=True)
        fh.write('\n')


def val(doc, field):
    f = (doc.get('fields') or {}).get(field)
    return f.get('value') if f else None


def put(doc, field, value, note):
    """فقط اگر خالی باشد یا خودش هم مشتق‌شده باشد."""
    cur = (doc.get('fields') or {}).get(field)
    if cur and cur.get('status') in PROTECTED:
        return False
    if cur and cur.get('source') not in (None, '', 'derived'):
        return False
    doc.setdefault('fields', {})[field] = {
        'value': value,
        'source': 'derived',
        'url': '',
        'fetched': TODAY,
        'status': 'auto',
        'note': note,
    }
    return True


def classify_poi(names):
    out = {'poi_nature': [], 'poi_heritage': [], 'poi_recreation': [], 'poi_offbeat': []}
    for raw in names:
        name = re.sub(r'\s*\([^)]*\)\s*$', '', str(raw)).strip()
        if not name or len(name) > 60:
            continue
        low = name.replace('\u200c', ' ')
        if any(k.replace('\u200c', ' ') in low for k in NATURE):
            out['poi_nature'].append(name)
        elif any(k.replace('\u200c', ' ') in low for k in HERITAGE):
            out['poi_heritage'].append(name)
        elif any(k.replace('\u200c', ' ') in low for k in RECREATION):
            out['poi_recreation'].append(name)
        else:
            out['poi_offbeat'].append(name)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--province')
    ap.add_argument('--max-neighbor-km', type=float, default=160.0)
    args = ap.parse_args()

    rows = registry.counties()
    docs = {}
    coords = {}
    for row in rows:
        doc = load(row['slug'])
        if not doc:
            continue
        docs[row['slug']] = doc
        lat, lon = val(doc, 'lat'), val(doc, 'lon')
        if isinstance(lat, (int, float)) and isinstance(lon, (int, float)):
            coords[row['slug']] = (float(lat), float(lon))

    names = {r['slug']: r['name'] for r in rows}
    province_of = {r['slug']: r['province'] for r in rows}

    # --- مرکز هر استان ---
    capital_coord = {}
    for prov, capital in CAPITALS.items():
        best = None
        for slug, p in province_of.items():
            if p != prov or slug not in coords:
                continue
            doc = docs[slug]
            if val(doc, 'center') == capital or names[slug] == capital:
                best = slug
                break
        if best:
            capital_coord[prov] = (best, coords[best])

    # --- گراف گابریل برای همسایگی ---
    slugs = sorted(coords)
    pts = [coords[s] for s in slugs]
    neighbors = {s: [] for s in slugs}
    for i, si in enumerate(slugs):
        near = []
        for j, sj in enumerate(slugs):
            if i == j:
                continue
            d = haversine(pts[i], pts[j])
            if d <= args.max_neighbor_km:
                near.append((d, j))
        near.sort()
        near = near[:14]
        for d, j in near:
            mid = ((pts[i][0] + pts[j][0]) / 2, (pts[i][1] + pts[j][1]) / 2)
            r = d / 2
            blocked = False
            for _, k in near:
                if k == j:
                    continue
                if haversine(mid, pts[k]) < r * 0.96:
                    blocked = True
                    break
            if not blocked:
                neighbors[si].append((slugs[j], d))
    for si, lst in list(neighbors.items()):
        for other, d in lst:
            if si not in [x for x, _ in neighbors[other]]:
                neighbors[other].append((si, d))

    touched = 0
    stats = {'distance_center': 0, 'neighbors': 0, 'google_map_url': 0,
             'poi_nature': 0, 'poi_heritage': 0, 'poi_recreation': 0, 'poi_offbeat': 0}

    for slug, doc in docs.items():
        if args.province and province_of.get(slug) != args.province:
            continue
        changed = False

        # ۱. فاصله تا مرکز استان
        cap = capital_coord.get(province_of.get(slug))
        if cap and slug in coords:
            cap_slug, cap_pt = cap
            if cap_slug != slug:
                km = int(round(haversine(coords[slug], cap_pt)))
                if km > 0 and put(doc, 'distance_center', km,
                                  'خط مستقیم روی نقشه (نه مسافت جاده‌ای) — از مختصات مراکز شهرستان و استان'):
                    stats['distance_center'] += 1
                    changed = True

        # ۲. همسایه‌ها (فهرست نامک + جهت جداگانه، تا اعتبارسنجی تقارن را بسنجد)
        if neighbors.get(slug):
            ordered = [o for o, _ in sorted(neighbors[slug], key=lambda x: x[1])]
            note = 'تقریبی: از مجاورت مختصات مراکز شهرستان‌ها محاسبه شده — پیش از انتشار بازبینی شود'
            if put(doc, 'neighbors', ordered, note):
                stats['neighbors'] += 1
                changed = True
            dirs = {o: direction_fa(coords[slug], coords[o]) for o in ordered}
            put(doc, 'neighbor_dirs', dirs, note)

        # ۳. لینک گوگل‌مپ
        if slug in coords:
            lat, lon = coords[slug]
            url = 'https://www.google.com/maps/search/?api=1&query=%s,%s' % (lat, lon)
            if put(doc, 'google_map_url', url, 'ساخته‌شده از مختصات مرکز شهرستان'):
                stats['google_map_url'] += 1
                changed = True

        # ۴. جاذبه‌ها
        hv = os.path.join(registry.HARVEST_DIR, 'wikipedia', province_of.get(slug, '') + '.json')
        cands = []
        if os.path.isfile(hv):
            with open(hv, encoding='utf-8') as fh:
                blob = json.load(fh)
            cands = (blob.get(slug) or {}).get('poi_candidates') or []
        if cands:
            buckets = classify_poi(cands)
            for field, items in buckets.items():
                if not items:
                    continue
                if put(doc, field, '\n'.join(items[:12]),
                       'نام‌های استخراج‌شده از بخش جاذبه‌های ویکی‌پدیای فارسی — توضیح و فاصله را خودتان بیفزایید'):
                    stats[field] += 1
                    changed = True

        if changed:
            save(doc)
            touched += 1

    print('پرونده‌های به‌روزشده: %d' % touched)
    for k, v in stats.items():
        print('  %-16s %d' % (k, v))


if __name__ == '__main__':
    main()
