#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
profile_facts.py — پیش‌نویسِ چهار خانهٔ «تحریری» که از هیچ پایگاه داده‌ای درنمی‌آیند.

  • climate     — ردهٔ اقلیمی از ارتفاع + عرض جغرافیایی + پهنهٔ استان (اگر ویکی‌پدیا نداده باشد)
  • best_time   — بهترین زمان سفر، از همان ردهٔ اقلیمی
  • language    — زبان و گویش رایج، از جدول استانی (با استثناهای شهرستانی)
  • livelihood  — معیشت اصلی، از جدول استانی

این‌ها «پیش‌نویس قابل ویرایش»اند نه حقیقت نهایی: مقدارشان با source=derived و
status=auto ذخیره می‌شود، هر چیزی که انسان بنویسد (verified/manual) دست‌نخورده
می‌ماند، و هر بار می‌توان با --force دوباره ساختشان.

    python3 content-templates/tools/geo/profile_facts.py
    python3 content-templates/tools/geo/profile_facts.py --province gilan --force
"""
import argparse
import datetime
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

TODAY = datetime.date.today().isoformat()
PROTECTED = ('verified', 'manual')

CASPIAN = {'gilan', 'mazandaran', 'golestan'}
GULF = {'hormozgan', 'bushehr'}
DESERT = {'yazd', 'qom', 'semnan', 'south-khorasan', 'isfahan', 'kerman'}

CLIMATE = {
    'khazari': 'معتدل و مرطوب خزری؛ بارش فراوان در پاییز و زمستان، تابستان گرم و شرجی',
    'khazari-kuh': 'در دشت معتدل و مرطوب خزری و در ارتفاعات البرز سرد کوهستانی با زمستان پربرف',
    'shorji': 'گرم و شرجی سواحل جنوب؛ تابستان بسیار گرم و مرطوب، زمستان ملایم و دلپذیر',
    'garm-khoshk': 'گرم و خشک؛ تابستان‌های بسیار گرم و زمستان‌های ملایم با بارش اندک',
    'kaviri': 'گرم و خشک کویری؛ اختلاف دمای شبانه‌روزی زیاد و بارش بسیار کم',
    'sardsir': 'سردسیری کوهستانی؛ زمستان‌های سرد و پربرف و تابستان‌های خنک',
    'motadel-kuh': 'معتدل کوهستانی؛ زمستان سرد، بهار پرباران و تابستان خنک',
    'nimekhoshk': 'نیمه‌خشک معتدل؛ زمستان سرد و تابستان گرم و خشک',
}
BEST_TIME = {
    'khazari': 'اردیبهشت تا شهریور؛ پاییز هم زیباست اما پرباران است',
    'khazari-kuh': 'خرداد تا شهریور برای ییلاق‌ها؛ دی تا اسفند برای برف',
    'shorji': 'آبان تا فروردین؛ تابستان به‌سبب گرما و شرجی توصیه نمی‌شود',
    'garm-khoshk': 'آبان تا اسفند؛ تابستان بسیار گرم است',
    'kaviri': 'مهر تا فروردین؛ شب‌های کویر در پاییز و زمستان بهترین‌اند',
    'sardsir': 'اردیبهشت تا شهریور برای طبیعت‌گردی؛ دی تا اسفند برای زمستان‌گردی',
    'motadel-kuh': 'فروردین تا خرداد و شهریور تا آبان',
    'nimekhoshk': 'فروردین تا خرداد و شهریور تا آبان',
}

LANGUAGE = {
    'east-azerbaijan': 'ترکی آذربایجانی؛ فارسی زبان اداری و آموزشی',
    'west-azerbaijan': 'ترکی آذربایجانی و کردی (سورانی و کرمانجی)؛ در بخش‌هایی آشوری و ارمنی',
    'ardabil': 'ترکی آذربایجانی؛ فارسی زبان اداری و آموزشی',
    'zanjan': 'ترکی آذربایجانی؛ در بخش‌هایی تاتی و کردی',
    'alborz': 'فارسی؛ در کنارش ترکی آذربایجانی، مازندرانی و کردی به‌سبب مهاجرت',
    'tehran': 'فارسی؛ گویش‌های محلی و زبان‌های مهاجران در کنار آن',
    'qom': 'فارسی؛ در کنارش ترکی آذربایجانی و عربی',
    'qazvin': 'فارسی با گویش قزوینی؛ در بخش‌هایی ترکی آذربایجانی و تاتی',
    'markazi': 'فارسی؛ در بخش‌هایی ترکی آذربایجانی و لری',
    'isfahan': 'فارسی با گویش‌های محلی اصفهانی؛ در بخش‌هایی ترکی قشقایی و بختیاری',
    'fars': 'فارسی با گویش شیرازی و گویش‌های محلی؛ ترکی قشقایی و لری در بخش‌هایی',
    'kerman': 'فارسی با گویش کرمانی؛ در جنوب استان بلوچی',
    'yazd': 'فارسی با گویش یزدی؛ گویش بهدینان در میان زرتشتیان',
    'semnan': 'فارسی با گویش‌های سمنانی، سنگسری و شهمیرزادی',
    'golestan': 'فارسی، ترکمنی، مازندرانی (کتولی) و سیستانی',
    'gilan': 'گیلکی؛ در بخش‌هایی تالشی، کردی و ترکی',
    'mazandaran': 'مازندرانی (طبری)؛ فارسی زبان اداری و آموزشی',
    'north-khorasan': 'کردی کرمانجی، ترکی و فارسی خراسانی',
    'razavi-khorasan': 'فارسی با گویش خراسانی؛ در بخش‌هایی ترکی و کردی کرمانجی',
    'south-khorasan': 'فارسی با گویش خراسان جنوبی (بیرجندی و قاینی)',
    'sistan-baluchestan': 'بلوچی در جنوب و سیستانی در شمال استان',
    'hormozgan': 'فارسی با گویش‌های بندری؛ در بخش‌هایی عربی و بلوچی',
    'bushehr': 'فارسی با گویش بوشهری و دشتستانی؛ در بخش‌هایی عربی',
    'khuzestan': 'فارسی، عربی خوزستانی، لری بختیاری و دزفولی–شوشتری',
    'ilam': 'کردی (کلهری، فیلی و لکی)؛ در بخش‌هایی لری و عربی',
    'kermanshah': 'کردی (کلهری، سورانی و لکی)؛ فارسی زبان اداری و آموزشی',
    'kurdistan': 'کردی سورانی و هورامی؛ در بخش‌هایی کردی جنوبی',
    'lorestan': 'لری و لکی؛ فارسی زبان اداری و آموزشی',
    'kohgiluyeh-boyer-ahmad': 'لری (بویراحمدی، بهمئی و طیبی)؛ فارسی زبان اداری و آموزشی',
    'chaharmahal-bakhtiari': 'لری بختیاری؛ در بخش‌هایی ترکی و فارسی',
    'hamadan': 'فارسی با گویش همدانی؛ در بخش‌هایی لری، لکی، کردی و ترکی آذربایجانی',
}

LIVELIHOOD = {
    'east-azerbaijan': 'کشاورزی و باغداری، دامداری، صنایع ماشین‌سازی و فرش دست‌باف',
    'west-azerbaijan': 'باغداری (سیب و انگور)، دامداری، تجارت مرزی و صنایع غذایی',
    'ardabil': 'کشاورزی (گندم و سیب‌زمینی)، دامداری، گردشگری آب‌گرم و صنایع غذایی',
    'zanjan': 'کشاورزی و دامداری، صنایع فلزی و روی، چاقوسازی و ملیله‌کاری',
    'alborz': 'صنعت و خدمات، کشاورزی حومه‌ای و گردشگری کوهستان',
    'tehran': 'خدمات، صنعت و بازرگانی؛ کشاورزی در حاشیهٔ شهرستان‌ها',
    'qom': 'خدمات مذهبی و گردشگری زیارتی، صنعت، کشاورزی و دامداری',
    'qazvin': 'کشاورزی (گندم و انگور)، صنایع بزرگ و حمل‌ونقل',
    'markazi': 'صنعت (ماشین‌سازی و پتروشیمی)، کشاورزی و دامداری',
    'isfahan': 'صنعت (فولاد و نساجی)، کشاورزی، صنایع دستی و گردشگری',
    'fars': 'کشاورزی و باغداری، دامداری عشایری، صنعت و گردشگری تاریخی',
    'kerman': 'باغداری (پسته و خرما)، معدن مس و زغال‌سنگ، صنایع دستی',
    'yazd': 'صنایع نساجی و کاشی، معدن، باغداری پسته و انار و گردشگری',
    'semnan': 'کشاورزی و باغداری، صنعت، معدن و حمل‌ونقل جاده‌ای',
    'golestan': 'کشاورزی (گندم، پنبه و برنج)، دامداری، شیلات و گردشگری',
    'gilan': 'برنج‌کاری، چای، شیلات، ابریشم و گردشگری',
    'mazandaran': 'برنج‌کاری، مرکبات، دامداری، شیلات و گردشگری',
    'north-khorasan': 'کشاورزی و دامداری، صنایع غذایی و گردشگری طبیعی',
    'razavi-khorasan': 'خدمات زیارتی و گردشگری، کشاورزی (زعفران و زرشک)، صنعت و معدن',
    'south-khorasan': 'زعفران، زرشک و عناب، دامداری، معدن و تجارت مرزی',
    'sistan-baluchestan': 'کشاورزی و دامداری، تجارت مرزی و صنایع دستی؛ در جنوب شیلات و بنادر',
    'hormozgan': 'شیلات و صیادی، بنادر و تجارت، نفت و گاز و گردشگری ساحلی',
    'bushehr': 'نفت و گاز (پارس جنوبی)، شیلات، نخلستان و بنادر بازرگانی',
    'khuzestan': 'نفت و گاز، پتروشیمی، کشاورزی (نیشکر و گندم) و بنادر',
    'ilam': 'نفت و گاز، کشاورزی و دامداری، تجارت مرزی و صنایع دستی',
    'kermanshah': 'کشاورزی و دامداری، پالایشگاه و پتروشیمی، تجارت مرزی',
    'kurdistan': 'کشاورزی و باغداری، دامداری، تجارت مرزی و صنایع دستی',
    'lorestan': 'کشاورزی و دامداری، صنایع غذایی و گردشگری طبیعی',
    'kohgiluyeh-boyer-ahmad': 'دامداری و کشاورزی، نفت و گاز، عسل و گردشگری طبیعت',
    'chaharmahal-bakhtiari': 'دامداری عشایری، کشاورزی، صنایع دستی و گردشگری',
    'hamadan': 'کشاورزی (سیب‌زمینی و غلات)، دامداری، سفالگری و گردشگری تاریخی',
}


def climate_class(province, elevation, lat):
    if province in CASPIAN:
        return 'khazari-kuh' if (elevation or 0) >= 1200 else 'khazari'
    if province in GULF:
        return 'shorji'
    if province == 'sistan-baluchestan':
        return 'shorji' if (lat or 99) < 26.5 else 'garm-khoshk'
    if province == 'khuzestan':
        return 'garm-khoshk' if (elevation or 0) < 500 else 'nimekhoshk'
    if elevation is None:
        return 'kaviri' if province in DESERT else 'nimekhoshk'
    if elevation >= 2000:
        return 'sardsir'
    if elevation >= 1500:
        return 'motadel-kuh'
    if elevation >= 900:
        return 'kaviri' if province in DESERT else 'nimekhoshk'
    return 'kaviri' if province in DESERT else 'garm-khoshk'


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


def put(doc, field, value, note, force=False):
    cur = (doc.get('fields') or {}).get(field)
    if cur:
        if cur.get('status') in PROTECTED:
            return False
        if cur.get('source') not in (None, '', 'derived'):
            return False  # داده‌ی منبع‌دار (ویکی‌پدیا/ویکی‌داده) هرگز با برآورد جایگزین نمی‌شود
        if cur.get('source') == 'derived' and not force:
            return False
    doc.setdefault('fields', {})[field] = {
        'value': value, 'source': 'derived', 'url': '',
        'fetched': TODAY, 'status': 'auto', 'note': note,
    }
    return True


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--province')
    ap.add_argument('--force', action='store_true')
    args = ap.parse_args()

    # میانهٔ ارتفاع هر استان، برای شهرستان‌هایی که ارتفاعشان ناشناخته است.
    elev_by_prov = {}
    for row in registry.counties():
        doc = load(row['slug'])
        if not doc:
            continue
        e = val(doc, 'elevation')
        if isinstance(e, (int, float)):
            elev_by_prov.setdefault(row['province'], []).append(float(e))
    median = {}
    for prov, vals in elev_by_prov.items():
        vals.sort()
        median[prov] = vals[len(vals) // 2]

    # ارتفاع تک‌تک شهرستان‌ها، برای برآورد از روی همسایه‌ها.
    elev_by_slug = {}
    neighbors_of = {}
    for row in registry.counties():
        doc = load(row['slug'])
        if not doc:
            continue
        e = val(doc, 'elevation')
        if isinstance(e, (int, float)):
            elev_by_slug[row['slug']] = float(e)
        neighbors_of[row['slug']] = val(doc, 'neighbors') or []

    def guess_elevation(slug, prov):
        vals = sorted(elev_by_slug[n] for n in neighbors_of.get(slug, []) if n in elev_by_slug)
        if vals:
            return vals[len(vals) // 2]
        return median.get(prov)

    stats = {'climate': 0, 'best_time': 0, 'language': 0, 'livelihood': 0}
    touched = 0
    for row in registry.counties():
        if args.province and row['province'] != args.province:
            continue
        doc = load(row['slug'])
        if not doc:
            continue
        prov = row['province']
        changed = False

        elevation = val(doc, 'elevation')
        if not isinstance(elevation, (int, float)):
            elevation = guess_elevation(row['slug'], prov)
        cls = climate_class(prov, elevation, val(doc, 'lat'))
        if put(doc, 'climate', CLIMATE[cls],
               'ردهٔ اقلیمی برآوردشده از ارتفاع و موقعیت جغرافیایی — بازبینی شود', args.force):
            stats['climate'] += 1
            changed = True
        if put(doc, 'best_time', BEST_TIME[cls],
               'از ردهٔ اقلیمی شهرستان — بازبینی شود', args.force):
            stats['best_time'] += 1
            changed = True
        if prov in LANGUAGE and put(doc, 'language', LANGUAGE[prov],
                                    'زبان رایج استان؛ تفاوت‌های شهرستانی را دستی اصلاح کنید', args.force):
            stats['language'] += 1
            changed = True
        if prov in LIVELIHOOD and put(doc, 'livelihood', LIVELIHOOD[prov],
                                      'معیشت غالب استان؛ ویژگی خاص شهرستان را دستی بیفزایید', args.force):
            stats['livelihood'] += 1
            changed = True

        if changed:
            save(doc)
            touched += 1

    print('پرونده‌های به‌روزشده: %d' % touched)
    for k, v in stats.items():
        print('  %-12s %d' % (k, v))


if __name__ == '__main__':
    main()
