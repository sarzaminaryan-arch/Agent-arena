#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Pass 4: sourced attraction lists from county articles and confirmed county seats.

Only EMPTY poi_* fields are filled. Statistics, existing lists and manual/verified
fields are never changed. Unclassified links are NOT labelled "offbeat". Every new
name retains its source page/revision/section; these are sourced editorial drafts,
not a claim that every attraction or administrative boundary has been verified.

    python3 content-templates/tools/geo/harvest_poi.py --all --sleep 1
    python3 content-templates/tools/geo/harvest_poi.py --province isfahan
"""
import argparse
import datetime
import json
import os
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry
from harvest_wikipedia import infobox_fields, strip_markup

API = 'https://fa.wikipedia.org/w/api.php'
UA = 'sarzaminaryan-geo-harvester/1.1 (https://sarzaminaryan.ir; Mail@sarzaminaryan.ir)'
FIELDS = ('poi_nature', 'poi_offbeat', 'poi_recreation', 'poi_heritage')
PROTECTED = ('manual', 'verified')
HEADINGS = re.compile(r'^(={2,6})\s*([^=\n]+?)\s*\1\s*$', re.M)
LINKS = re.compile(r'\[\[([^\[\]\n]+)\]\]')
CONTEXT = ('جاذبه', 'گردشگر', 'دیدنی', 'طبیعت', 'آثار تاریخی', 'بناهای تاریخی',
           'اماکن تاریخی', 'مکانهای تاریخی', 'مکان های تاریخی', 'تفریح',
           'نقاط بکر', 'روستاهای گردشگری', 'زیارت', 'بوستان', 'پارکها', 'پارک ها')
NATURE = ('آبشار', 'غار', 'تنگه', 'دریاچه', 'تالاب', 'جنگل', 'کوه ', 'قله',
          'چشمه', 'رودخانه', 'دره', 'کویر', 'بیابان', 'آبگرم', 'آب گرم',
          'گنبد نمکی', 'سراب', 'مرداب', 'خلیج', 'جزیره', 'ساحل', 'پارک ملی',
          'منطقه حفاظت', 'پناهگاه حیات وحش')
RECREATION = ('پارک', 'بوستان', 'تله کابین', 'پیست', 'شهربازی', 'مجموعه تفریحی',
              'مرکز خرید', 'باغ وحش', 'پارک آبی')
HERITAGE = ('مسجد', 'امامزاده', 'امام زاده', 'قلعه', 'ارگ', 'کاروانسرا', 'حمام',
            'بازار', 'تیمچه', 'خانه ', 'عمارت', 'کاخ', 'برج ', 'مناره', 'مقبره',
            'آرامگاه', 'آتشکده', 'پل ', 'محوطه', 'کلیسا', 'بقعه', 'حرم', 'موزه',
            'آب انبار', 'گورستان', 'سنگ نگاره', 'کتیبه', 'قنات', 'باغ ', 'حسینیه',
            'تخت جمشید', 'تخت سلیمان', 'طاق بستان', 'نقش رستم', 'هگمتانه', 'چغازنبیل')
GENERIC = {'ایران', 'گردشگری', 'طبیعت', 'مسجد', 'موزه', 'پارک', 'روستا', 'کوه',
           'آبشار', 'غار', 'جنگل', 'دریاچه', 'شهر', 'شهرستان', 'استان',
           'تاریخ', 'آثار تاریخی', 'جاذبه های گردشگری', 'تفریح', 'زیارت'}


def normal(text):
    text = str(text or '').replace('\u200c', ' ').replace('ي', 'ی').replace('ك', 'ک')
    return re.sub(r'\s+', ' ', text).strip()


def page_url(title):
    return 'https://fa.wikipedia.org/wiki/' + urllib.parse.quote(title.replace(' ', '_'))


def decode_pages(data, requested):
    """Resolve MediaWiki normalization AND redirect chains back to requested titles."""
    if 'error' in data or 'query' not in data:
        raise ValueError('MediaWiki did not return a successful query')
    query = data['query']
    pages = {}
    for p in query.get('pages', []):
        revisions = p.get('revisions') or []
        if p.get('ns', 0) != 0 or not revisions:
            continue
        rev = revisions[0]
        wt = rev.get('slots', {}).get('main', {}).get('content')
        if not isinstance(wt, str) or not p.get('pageid') or not rev.get('revid'):
            continue
        pages[p['title']] = {'title': p['title'], 'text': wt, 'pageid': p['pageid'],
                             'revid': rev['revid'], 'url': page_url(p['title'])}
    aliases = {}
    for group in ('normalized', 'redirects', 'converted'):
        aliases.update({a['from']: a['to'] for a in query.get(group, [])})
    out = {}
    for title in requested:
        canonical, seen = title, set()
        while canonical in aliases and canonical not in seen:
            seen.add(canonical)
            canonical = aliases[canonical]
        if canonical in pages:
            out[title] = pages[canonical]
    return out


def fetch_pages(titles, sleep=1.0):
    result = {}
    titles = sorted(set(t for t in titles if t))
    for start in range(0, len(titles), 20):
        chunk = titles[start:start + 20]
        params = {'action': 'query', 'prop': 'revisions', 'rvprop': 'ids|content',
                  'rvslots': 'main', 'format': 'json', 'formatversion': '2',
                  'redirects': '1', 'maxlag': '5', 'titles': '|'.join(chunk)}
        url = API + '?' + urllib.parse.urlencode(params)
        for attempt in range(3):
            try:
                req = urllib.request.Request(url, headers={'User-Agent': UA})
                with urllib.request.urlopen(req, timeout=90) as response:
                    data = json.loads(response.read().decode('utf-8'))
                result.update(decode_pages(data, chunk))
                break
            except (urllib.error.URLError, OSError, ValueError) as exc:
                if attempt == 2:
                    raise RuntimeError('Wikipedia batch %d failed; no fact files will be written' %
                                       (start // 20 + 1)) from exc
                time.sleep(3 * (attempt + 1))
        time.sleep(max(0, sleep))
        print('  pages %d/%d' % (min(start + 20, len(titles)), len(titles)), flush=True)
    return result


def tourism_sections(wt):
    """Keep nested tourism sections, but stop at the next unrelated parent heading."""
    heads = list(HEADINGS.finditer(wt))
    parents = []
    for i, match in enumerate(heads):
        level, heading = len(match.group(1)), normal(match.group(2))
        while parents and parents[-1][0] >= level:
            parents.pop()
        parents.append((level, heading))
        context = ' / '.join(h for _, h in parents)
        if any(term in context for term in CONTEXT):
            end = heads[i + 1].start() if i + 1 < len(heads) else len(wt)
            yield context, wt[match.end():end]


def classify(name, section):
    name, section = normal(name), normal(section)
    if any(k in section for k in ('نقاط بکر', 'روستاهای گردشگری', 'روستاهای دیدنی')):
        return 'poi_offbeat'
    if any(k in name for k in NATURE):
        return 'poi_nature'
    if any(k in name for k in RECREATION):
        return 'poi_recreation'
    if any(k in name for k in HERITAGE):
        return 'poi_heritage'
    # Historical paragraphs also link to people, dynasties and countries.
    # A heading alone is not enough to turn an untyped link into a monument.
    # A generic tourism link is not evidence that a place is "offbeat".
    return None


def strip_media_links(text):
    """Remove balanced media links, including nested wikilinks inside captions."""
    start_pattern = re.compile(r'\[\[(?:پرونده|تصویر|File|Image):', re.I)
    while True:
        match = start_pattern.search(text)
        if not match:
            return text
        depth, pos = 1, match.end()
        while pos < len(text) and depth:
            if text[pos:pos + 2] == '[[':
                depth += 1
                pos += 2
            elif text[pos:pos + 2] == ']]':
                depth -= 1
                pos += 2
            else:
                pos += 1
        text = text[:match.start()] + text[pos:]


def extract_candidates(page, location):
    candidates, seen = [], set()
    for section, body in tourism_sections(page['text']):
        body = re.sub(r'<ref\b[^>]*>.*?</ref>|<ref\b[^>]*/>|<!--.*?-->', '', body, flags=re.S)
        # File captions can contain several nested links to unrelated places.
        body = strip_media_links(body)
        for link in LINKS.findall(body):
            title = re.sub(r'\s+', ' ', link.split('|', 1)[0].split('#', 1)[0].replace('_', ' ')).strip()
            if (':' in title or '|' in title or not 4 <= len(title) <= 100 or
                    title.startswith(('شهرستان ', 'استان ', 'بخش ', 'دهستان '))):
                continue
            name = re.sub(r'\s*\([^)]*\)\s*$', '', title).strip()
            if normal(name) in GENERIC:
                continue
            field = classify(name, section)
            if not field or (field, normal(name)) in seen:
                continue
            seen.add((field, normal(name)))
            candidates.append({'name': name, 'field': field, 'target_title': title,
                               'source_title': page['title'], 'source_url': page['url'],
                               'pageid': page['pageid'], 'revision_id': page['revid'],
                               'section': section, 'location_evidence': location})
    return candidates


def city_belongs_to_county(page, county_name):
    """Fail closed on an explicit different county; don't copy city figures to a county."""
    text = page['text']
    lead = text[:HEADINGS.search(text).start()] if HEADINGS.search(text) else text[:12000]
    fields = infobox_fields(lead)
    for key, value in fields.items():
        if normal(key) in ('شهرستان', 'نام شهرستان', 'county'):
            return registry.normalize_fa(strip_markup(value)) == registry.normalize_fa(county_name)
    # The Wikidata seat relation is also required by the caller. Accept a direct county
    # link in the lead, not incidental mentions further down a history section.
    lead = lead[:4000]
    for link in LINKS.findall(lead):
        target = link.split('|', 1)[0].strip()
        if target.startswith('شهرستان ') and registry.normalize_fa(target) == registry.normalize_fa(county_name):
            return True
    plain = normal(strip_markup(lead))
    needle = normal('مرکز شهرستان ' + county_name)
    return bool(re.search(re.escape(needle) + r'(?=[ ،.؛]|$)', plain))


def fill_empty_fields(doc, candidates, fetched):
    """Only four POI fields may change; an existing value of any origin is preserved."""
    written = {}
    for field in FIELDS:
        old = doc.get('fields', {}).get(field) or {}
        if old.get('status') in PROTECTED or old.get('value') not in (None, '', []):
            continue
        entries, seen = [], set()
        for entry in candidates:
            name = normal(entry['name'])
            if entry['field'] == field and name not in seen:
                seen.add(name)
                entries.append(entry)
        entries = entries[:12]
        if not entries:
            continue
        doc.setdefault('fields', {})[field] = {
            'value': '\n'.join(e['name'] for e in entries), 'source': 'wikipedia-poi',
            'url': entries[0]['source_url'], 'fetched': fetched, 'status': 'draft',
            'note': 'فهرست منبع‌دار از مقالهٔ شهرستان یا مرکزِ تأییدشده؛ دسته‌بندی و موقعیت پیش از انتشار بازبینی شود. فاصله و توضیح حدس زده نشده است.',
            'entries': entries,
        }
        written[field] = len(entries)
    return written


def field_counts(docs):
    return {field: sum(1 for d in docs.values() if
                      (d.get('fields', {}).get(field) or {}).get('value') not in (None, '', []))
            for field in FIELDS}


def write_json(path, data):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    temp = path + '.tmp'
    with open(temp, 'w', encoding='utf-8') as fh:
        json.dump(data, fh, ensure_ascii=False, indent=1, sort_keys=True)
        fh.write('\n')
    os.replace(temp, path)


def harvest(rows, sleep=1.0):
    today = datetime.date.today().isoformat()
    docs = {}
    for row in rows:
        with open(os.path.join(registry.FACTS_DIR, row['slug'] + '.json'), encoding='utf-8') as fh:
            docs[row['slug']] = json.load(fh)
    before = field_counts(docs)
    county_titles = {r['slug']: 'شهرستان ' + r['name'] for r in rows}
    county_pages = fetch_pages(list(county_titles.values()), sleep)
    if not county_pages:
        raise RuntimeError('No county articles were retrieved; leaving facts and exports unchanged')
    centers = {}
    for row in rows:
        center = docs[row['slug']].get('fields', {}).get('center') or {}
        if isinstance(center.get('value'), str) and center.get('url') and center.get('source'):
            title = center['value'].strip()
            if title and not title.startswith('شهرستان '):
                centers[row['slug']] = title
    city_pages = fetch_pages(list(centers.values()), sleep)
    # All network reads finish before any files are written.
    raw, changes, rejected_centers = {}, {}, []
    for row in rows:
        slug = row['slug']
        candidates, sources = [], []
        county = county_pages.get(county_titles[slug])
        if county:
            candidates.extend(extract_candidates(county, 'county tourism section'))
            sources.append(county['url'])
        city = city_pages.get(centers.get(slug))
        if city and city_belongs_to_county(city, row['name']):
            candidates.extend(extract_candidates(city, 'Wikidata seat + explicit county in city article'))
            sources.append(city['url'])
        elif city:
            rejected_centers.append(slug)
        raw[slug] = {'county': row['name'], 'province': row['province'], 'sources': sources,
                     'fetched': today, 'candidates': candidates,
                     'center_confirmed': bool(city and slug not in rejected_centers)}
        added = fill_empty_fields(docs[slug], candidates, today)
        if added:
            changes[slug] = added
    for slug in changes:
        write_json(os.path.join(registry.FACTS_DIR, slug + '.json'), docs[slug])
    provinces = sorted({r['province'] for r in rows})
    for province in provinces:
        write_json(os.path.join(registry.HARVEST_DIR, 'poi', province + '.json'),
                   {r['slug']: raw[r['slug']] for r in rows if r['province'] == province})
    after = field_counts(docs)
    report = ['# مرحلهٔ چهارم — تکمیل فهرست جاذبه‌های شهرستان‌ها', '',
              'تاریخ برداشت: `%s` · شهرستان‌های بررسی‌شده: %d · پرونده‌های تکمیل‌شده: %d' %
              (today, len(rows), len(changes)),
              'مقالهٔ شهرستان دریافت‌شده: %d · مقالهٔ مرکز دریافت‌شده: %d.' %
              (len(county_pages), len(city_pages)), '',
              'فقط خانه‌های خالی جاذبه پر شدند. آمار، فهرست‌های قبلی و داده‌های دستی تغییر نکردند.',
              'این فهرست‌ها پیش‌نویس منبع‌دارند؛ صحت نهاییِ موقعیت، دسته‌بندی، فاصله و توضیح نیاز به بازبینی دارد.', '',
              '| بخش | قبل | بعد | خانهٔ تازه |', '|---|---:|---:|---:|']
    labels = {'poi_nature': 'طبیعت', 'poi_offbeat': 'نقاط بکر',
              'poi_recreation': 'تفریحی', 'poi_heritage': 'تاریخی'}
    for field in FIELDS:
        report.append('| %s | %d | %d | %d |' %
                      (labels[field], before[field], after[field], after[field] - before[field]))
    report += ['', 'مقاله‌های مرکز شهرستان که نسبت مکانی‌شان تأیید نشد و کنار گذاشته شدند: %d.' %
               len(rejected_centers), '',
               '| استان | شهرستان | پروندهٔ تکمیل‌شده | خانهٔ تازه |', '|---|---:|---:|---:|']
    for province in provinces:
        members = [r['slug'] for r in rows if r['province'] == province]
        report.append('| `%s` | %d | %d | %d |' %
                      (province, len(members), sum(s in changes for s in members),
                       sum(len(changes.get(s, {})) for s in members)))
    report += ['', '## منبع و بازبینی', '',
               '- نام صفحه، URL، شناسهٔ صفحه، شناسهٔ نسخه و سرتیتر هر نام تازه در `fields.poi_*.entries` ثبت شده است.',
               '- همهٔ نامزدهای استخراج‌شده در `content/data/harvest/poi/<province>.json` قابل بررسی‌اند.',
               '- لینک عمومی یا دسته‌بندی‌نشده «نقطهٔ بکر» فرض نشده است؛ آمار شهر نیز آمار شهرستان فرض نشده است.',
               '- ورود به وردپرس: نسخهٔ ۲.۸.۹ ← انتخاب استان ← پیش‌نمایش ← دریافت و اعمال، بدون بازنویسی خانه‌های پرشده.', '']
    report_path = os.path.join(registry.ROOT, 'content', 'data', 'COUNTY-POI-PASS4.md')
    with open(report_path, 'w', encoding='utf-8') as fh:
        fh.write('\n'.join(report))
    print(json.dumps({'checked': len(rows), 'changed_counties': len(changes),
                      'before': before, 'after': after, 'unconfirmed_centers': len(rejected_centers)},
                     ensure_ascii=False), flush=True)
    return changes


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    scope = parser.add_mutually_exclusive_group(required=True)
    scope.add_argument('--province', choices=sorted(registry.by_province()))
    scope.add_argument('--all', action='store_true')
    parser.add_argument('--sleep', type=float, default=1.0)
    args = parser.parse_args()
    rows = registry.counties() if args.all else registry.by_province(args.province)[args.province]
    harvest(rows, args.sleep)


if __name__ == '__main__':
    main()
