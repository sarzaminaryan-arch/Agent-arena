#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Pass 4: sourced attraction lists from county articles and confirmed county seats.

Only EMPTY poi_* fields from before this pass are filled. Statistics and manual/
verified fields never change. Explicit refresh may correct this pass's own drafts. Unclassified links are NOT labelled "offbeat". Every new
name retains its source page/revision/section; these are sourced editorial drafts,
not a claim that every attraction or administrative boundary has been verified.

    python3 content-templates/tools/geo/harvest_poi.py --all --sleep 1
    python3 content-templates/tools/geo/harvest_poi.py --province isfahan
"""
import argparse
import datetime
import functools
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
          'گنبد نمکی', 'سراب', 'مرداب', 'خلیج', 'جزیره', 'ساحل', 'سد ', 'پارک ملی',
          'منطقه حفاظت', 'پناهگاه حیات وحش')
RECREATION = ('پارک', 'بوستان', 'تله کابین', 'پیست', 'شهربازی', 'مجموعه تفریحی',
              'مرکز خرید', 'باغ وحش', 'پارک آبی', 'سینما', 'مجتمع تفریحی',
              'باغ پرندگان', 'باغ خزندگان', 'باغ گیاه شناسی', 'باغ گیاهشناسی')
HERITAGE = ('مسجد', 'امامزاده', 'امام زاده', 'قلعه', 'ارگ', 'کاروانسرا', 'حمام',
            'بازار', 'تیمچه', 'خانه ', 'عمارت', 'کاخ', 'برج ', 'مناره', 'مقبره',
            'آرامگاه', 'آتشکده', 'پل ', 'محوطه', 'کلیسا', 'بقعه', 'حرم', 'موزه',
            'آب انبار', 'گورستان', 'سنگ نگاره', 'کتیبه', 'قنات', 'باغ ', 'حسینیه',
            'تخت جمشید', 'تخت سلیمان', 'طاق بستان', 'نقش رستم', 'هگمتانه', 'چغازنبیل')
GENERIC = {'ایران', 'گردشگری', 'طبیعت', 'مسجد', 'موزه', 'پارک', 'روستا', 'کوه',
           'آبشار', 'غار', 'جنگل', 'دریاچه', 'شهر', 'شهرستان', 'استان',
           'تاریخ', 'آثار تاریخی', 'جاذبه های گردشگری', 'تفریح', 'زیارت',
           'بازار', 'کاروانسرا', 'امامزاده', 'امام زاده', 'آرامگاه', 'قلعه',
           'پارک جنگلی', 'دریاچه سد', 'آب انبار', 'پل', 'قنات', 'ساحل', 'جزیره',
           'تالاب', 'حسینیه', 'خانه تاریخی', 'باغ', 'بوستان', 'پیست اسکی',
           'سینما', 'شهربازی', 'باغ وحش', 'پارک آبی', 'مرکز خرید', 'پیست',
           'تله کابین', 'منطقه حفاظت شده', 'پناهگاه حیات وحش', 'آبگرم',
           'آب گرم', 'سراب', 'گورستان', 'مناره', 'حمام', 'عمارت', 'کاخ',
           'کلیسا', 'آتشکده', 'برج', 'دیر', 'خلیج', 'قله', 'چشمه', 'رودخانه',
           'دره', 'کویر', 'بیابان', 'تنگه', 'سد', 'گنبد نمکی', 'مرداب', 'سنگ نگاره',
           'باغ ایرانی', 'باغ ژاپنی'}


def normal(text):
    text = str(text or '').replace('\u200c', ' ').replace('ي', 'ی').replace('ك', 'ک')
    return re.sub(r'\s+', ' ', text).strip()


# Bare type names are concepts, not county-specific landmarks. These six names
# are actual named heritage sites, not type keywords.
_PROPER_HERITAGE = {'تخت جمشید', 'تخت سلیمان', 'طاق بستان', 'نقش رستم', 'هگمتانه', 'چغازنبیل'}
GENERIC.update(normal(k.strip()) for group in (NATURE, RECREATION, HERITAGE)
               for k in group if k.strip() not in _PROPER_HERITAGE)


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
                             'revid': rev['revid'], 'url': page_url(p['title']),
                             'disambiguation': 'disambiguation' in p.get('pageprops', {})}
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
        params = {'action': 'query', 'prop': 'revisions|pageprops', 'ppprop': 'disambiguation',
                  'rvprop': 'ids|content',
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
    base = re.sub(r'\s*\([^)]*\)\s*$', '', name).strip()
    if (base in GENERIC or name.startswith(('کشور', 'فهرست', 'تاریخ ', 'انواع ', 'معماری ',
                                            'شهرستان ', 'استان ', 'فرهنگ ', 'رده:'))):
        return None
    if any(k in section for k in ('نقاط بکر', 'روستاهای گردشگری', 'روستاهای دیدنی')):
        return 'poi_offbeat'
    # The venue type takes precedence over a word in its proper name: a cinema
    # named "Sahel" is not a coast. National/protected parks are natural sites.
    if any(k in name for k in ('پارک ملی', 'منطقه حفاظت', 'پناهگاه حیات وحش')):
        return 'poi_nature'
    if any(k in name for k in RECREATION):
        return 'poi_recreation'
    if name.startswith(('پل ', 'پلهای ', 'پل های ')):
        return 'poi_heritage'
    if any(k in name for k in NATURE):
        return 'poi_nature'
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
            name = title
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


@functools.lru_cache(maxsize=8)
def location_patterns(prefix, names):
    return [(name, re.compile(re.escape(prefix) + r'\s*' +
             re.escape(normal(name)).replace(r'\ ', r'\s*') + r'(?=$|[\s،.؛:])'))
            for name in sorted(names, key=len, reverse=True)]


def location_mentions(text, prefix, names):
    if prefix not in text:
        return set()
    return {name for name, pattern in location_patterns(prefix, tuple(names)) if pattern.search(text)}


def target_location_conflicts(target, county_name, province_name=None, seats=None):
    """Reject explicit conflicting county/province/city evidence, not infer new borders."""
    lead = target['text'].split('\n==', 1)[0][:12000]
    fields = infobox_fields(lead)
    wanted = registry.normalize_fa(county_name)
    for key, value in fields.items():
        key = normal(key)
        value = strip_markup(value)
        if key in ('شهرستان', 'نام شهرستان', 'county'):
            if registry.normalize_fa(value) != wanted:
                return 'explicitly different county'
        elif key in ('استان', 'نام استان', 'province') and province_name:
            found = registry.normalize_fa(value.replace('استان', ''))
            valid = {registry.normalize_fa(n) for n in registry.provinces().values()}
            if found in valid and found != registry.normalize_fa(province_name):
                return 'explicitly different province'
        elif key in ('شهر', 'نام شهر', 'city') and seats:
            owners = seats.get(registry.normalize_fa(value))
            if owners and wanted not in owners:
                return 'explicit city in another county'
    plain = normal(strip_markup(lead))[:4000]
    counties = location_mentions(plain, 'شهرستان', tuple(r['name'] for r in registry.counties()))
    if counties and wanted not in {registry.normalize_fa(n) for n in counties}:
        return 'lead locates target in another county'
    if province_name:
        provinces = location_mentions(plain, 'استان', tuple(registry.provinces().values()))
        if provinces and registry.normalize_fa(province_name) not in {registry.normalize_fa(n) for n in provinces}:
            return 'lead locates target in another province'
    return None


def target_location_support(target, county_name, seats=None):
    """Require corroboration in the target, not just a list on a city article."""
    lead = target['text'].split('\n==', 1)[0][:12000]
    wanted = registry.normalize_fa(county_name)
    for key, value in infobox_fields(lead).items():
        key = normal(key)
        value = registry.normalize_fa(strip_markup(value))
        if key in ('شهرستان', 'نام شهرستان', 'county') and value == wanted:
            return 'target infobox names this county'
        if key in ('شهر', 'نام شهر', 'city') and seats and wanted in seats.get(value, set()):
            return 'target city is a confirmed seat of this county'
    # Only the opening definition/placement paragraph is evidence. A later
    # climate comparison ('temperature in county X') is not the POI's location.
    clean = strip_markup(strip_media_links(lead)).strip()
    paragraphs = [part.strip() for part in re.split(r'\n\s*\n', clean) if len(part.strip()) >= 25]
    plain = normal(paragraphs[0] if paragraphs else clean)[:1200]
    if location_mentions(plain, 'در شهرستان', (county_name,)):
        return 'target lead explicitly locates it in this county'
    if seats:
        # "Near another city's road" is NOT enough. We accept an explicit "in
        # city" clause for our confirmed seat; everything else stays review-only.
        for name, owners in seats.items():
            if wanted not in owners:
                continue
            spelling = r'\s*'.join(re.escape(ch) for ch in name)
            if re.search(r'در\s+(?:شهر\s+)?' + spelling + r'(?=$|[\s،.؛:])', plain):
                return 'target lead explicitly locates it in this county seat'
    return None


def validate_targets(candidates, pages, county_name, province_name=None, seats=None):
    """Require an existing target article, deduplicate redirects, reject wrong counties."""
    accepted, rejected, seen = [], [], set()
    for original in candidates:
        target = pages.get(original['target_title'])
        if not target:
            rejected.append({'name': original['name'], 'reason': 'target page missing'})
            continue
        if target.get('disambiguation'):
            rejected.append({'name': original['name'], 'reason': 'disambiguation page'})
            continue
        name = target['title'].strip()
        field = classify(name, original['section'])
        if not field:
            rejected.append({'name': original['name'], 'reason': 'generic or untyped target'})
            continue
        conflict = target_location_conflicts(target, county_name, province_name, seats)
        if conflict:
            rejected.append({'name': name, 'reason': conflict})
            continue
        support = target_location_support(target, county_name, seats)
        if not support:
            rejected.append({'name': name, 'reason': 'county placement needs manual corroboration'})
            continue
        # The title "garden" alone does not distinguish an old garden from a
        # municipal park. Use an explicit park/boستان description when present.
        if field == 'poi_heritage' and 'باغ' in normal(name):
            lead = normal(strip_markup(target['text'].split('\n==', 1)[0]))[:1200]
            if any(k in lead for k in ('از پارک', 'یک پارک', 'بوستان', 'جعبه اطلاعات پارک')):
                field = 'poi_recreation'
        identity = (field, target['pageid'])
        if identity in seen:
            continue
        seen.add(identity)
        entry = dict(original)
        entry.update({'name': name, 'field': field, 'target_title': target['title'],
                      'target_url': target['url'], 'target_pageid': target['pageid'],
                      'target_revision_id': target['revid'], 'target_location_evidence': support})
        accepted.append(entry)
    return accepted, rejected


def fill_empty_fields(doc, candidates, fetched, refresh_drafts=False):
    """Only POI fields change. Refresh may replace this pass's own unverified drafts."""
    written = {}
    for field in FIELDS:
        old = doc.get('fields', {}).get(field) or {}
        own_draft = refresh_drafts and old.get('source') == 'wikipedia-poi' and old.get('status') == 'draft'
        if old.get('status') in PROTECTED or (old.get('value') not in (None, '', []) and not own_draft):
            continue
        entries, seen = [], set()
        for entry in candidates:
            name = normal(entry['name'])
            if entry['field'] == field and name not in seen:
                seen.add(name)
                entries.append(entry)
        entries = entries[:12]
        if not entries:
            if own_draft:
                del doc['fields'][field]
                written[field] = 0
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


def harvest(rows, sleep=1.0, refresh_drafts=False):
    today = datetime.date.today().isoformat()
    docs = {}
    for row in rows:
        with open(os.path.join(registry.FACTS_DIR, row['slug'] + '.json'), encoding='utf-8') as fh:
            docs[row['slug']] = json.load(fh)
    before = field_counts(docs)
    summary_path = os.path.join(registry.ROOT, 'content', 'data', 'COUNTY-POI-PASS4.json')
    if os.path.isfile(summary_path):
        with open(summary_path, encoding='utf-8') as fh:
            summary = json.load(fh)
        if summary.get('scope') == sorted(r['slug'] for r in rows):
            before = summary['baseline_coverage']
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
    seats = {}
    for county_row in registry.counties():
        path = os.path.join(registry.FACTS_DIR, county_row['slug'] + '.json')
        if not os.path.isfile(path):
            continue
        with open(path, encoding='utf-8') as fh:
            center = json.load(fh).get('fields', {}).get('center') or {}
        if center.get('value') and center.get('url'):
            seats.setdefault(registry.normalize_fa(center['value']), set()).add(registry.normalize_fa(county_row['name']))
    target_titles = [e['target_title'] for record in raw.values() for e in record['candidates']]
    target_pages = fetch_pages(target_titles, sleep)
    for row in rows:
        slug = row['slug']
        accepted, rejected = validate_targets(raw[slug]['candidates'], target_pages, row['name'],
                                               registry.provinces().get(row['province']), seats)
        raw[slug]['candidates'] = accepted
        raw[slug]['rejected_candidates'] = rejected
        added = fill_empty_fields(docs[slug], accepted, today, refresh_drafts=refresh_drafts)
        if added:
            changes[slug] = added
    for slug in changes:
        write_json(os.path.join(registry.FACTS_DIR, slug + '.json'), docs[slug])
    provinces = sorted({r['province'] for r in rows})
    for province in provinces:
        write_json(os.path.join(registry.HARVEST_DIR, 'poi', province + '.json'),
                   {r['slug']: raw[r['slug']] for r in rows if r['province'] == province})
    after = field_counts(docs)
    own_fields = {slug: [k for k, v in doc.get('fields', {}).items()
                        if k in FIELDS and v.get('source') == 'wikipedia-poi' and
                        v.get('status') == 'draft' and v.get('value')] for slug, doc in docs.items()}
    completed = {slug for slug, fields in own_fields.items() if fields}
    write_json(summary_path, {'scope': sorted(r['slug'] for r in rows),
                             'baseline_coverage': before, 'after': after, 'fetched': today,
                             'changed_counties': len(completed),
                             'rejected_targets': sum(len(r['rejected_candidates']) for r in raw.values())})
    report = ['# مرحلهٔ چهارم — تکمیل فهرست جاذبه‌های شهرستان‌ها', '',
              'تاریخ برداشت: `%s` · شهرستان‌های بررسی‌شده: %d · پرونده‌های تکمیل‌شده: %d' %
              (today, len(rows), len(completed)),
              'مقالهٔ شهرستان دریافت‌شده: %d · مقالهٔ مرکز دریافت‌شده: %d.' %
              (len(county_pages), len(city_pages)),
              'صفحهٔ مقصد جاذبهٔ دریافت‌شده: %d؛ نام‌های عمومی/ناموجود/دارای تعارض مکانی یا فاقد تأیید شهرستان کنار گذاشته شدند و ریدایرکت‌های تکراری ادغام شدند.' % len(target_pages), '',
              'فقط خانه‌های خالی جاذبهٔ مرحلهٔ قبلی پر شدند؛ بازبینی این بسته فقط پیش‌نویس‌های تولیدشدهٔ خودش را تصحیح کرد. آمار، فهرست‌های قبلی و داده‌های دستی تغییر نکردند.',
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
                      (province, len(members), sum(s in completed for s in members),
                       sum(len(own_fields.get(s, [])) for s in members)))
    report += ['', '## منبع و بازبینی', '',
               '- نام صفحه، URL، شناسهٔ صفحه/نسخهٔ منبع و مقصد و سرتیتر هر نام تازه در `fields.poi_*.entries` ثبت شده است.',
               '- همهٔ نامزدهای استخراج‌شده در `content/data/harvest/poi/<province>.json` قابل بررسی‌اند.',
               '- لینک عمومی یا دسته‌بندی‌نشده «نقطهٔ بکر» فرض نشده است؛ آمار شهر نیز آمار شهرستان فرض نشده است.',
               '- ورود به وردپرس: نسخهٔ ۲.۸.۹ ← انتخاب استان ← پیش‌نمایش ← دریافت و اعمال، بدون بازنویسی خانه‌های پرشده.', '']
    report_path = os.path.join(registry.ROOT, 'content', 'data', 'COUNTY-POI-PASS4.md')
    with open(report_path, 'w', encoding='utf-8') as fh:
        fh.write('\n'.join(report))
    print(json.dumps({'checked': len(rows), 'changed_counties': len(completed),
                      'before': before, 'after': after, 'unconfirmed_centers': len(rejected_centers)},
                     ensure_ascii=False), flush=True)
    return changes


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    scope = parser.add_mutually_exclusive_group(required=True)
    scope.add_argument('--province', choices=sorted(registry.by_province()))
    scope.add_argument('--all', action='store_true')
    parser.add_argument('--sleep', type=float, default=1.0)
    parser.add_argument('--refresh-drafts', action='store_true',
                        help='بازبینی فقط پیش‌نویس‌های تولیدشدهٔ همین مرحله؛ دستی/verified محفوظ است')
    args = parser.parse_args()
    rows = registry.counties() if args.all else registry.by_province(args.province)[args.province]
    harvest(rows, args.sleep, refresh_drafts=args.refresh_drafts)


if __name__ == '__main__':
    main()
