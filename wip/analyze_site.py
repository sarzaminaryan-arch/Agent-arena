#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
تحلیل وضعیت مقالات شهرستانی سایت «سرزمین آریایی‌ها» (sarzaminaryan.ir)
منابع:
  - 31/*.md                 → فهرست رسمی شهرستان‌های هر استان (جدول مقالهٔ استان)
  - WordPress.2026-10-02 city.xml → آخرین خروجی وردپرس (وضعیت واقعی سایت)
خروجی: wip/analysis.json
"""
import re, os, glob, json
import xml.etree.ElementTree as ET

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NS = {'wp':'http://wordpress.org/export/1.2/','content':'http://purl.org/rss/1.0/modules/content/'}

PROVINCES = [  # slug, نام فارسی (مطابق provinces.php)
 ('east-azerbaijan','آذربایجان شرقی'),('west-azerbaijan','آذربایجان غربی'),('ardabil','اردبیل'),
 ('isfahan','اصفهان'),('alborz','البرز'),('ilam','ایلام'),('bushehr','بوشهر'),('tehran','تهران'),
 ('chaharmahal-bakhtiari','چهارمحال و بختیاری'),('south-khorasan','خراسان جنوبی'),
 ('razavi-khorasan','خراسان رضوی'),('north-khorasan','خراسان شمالی'),('khuzestan','خوزستان'),
 ('zanjan','زنجان'),('semnan','سمنان'),('sistan-baluchestan','سیستان و بلوچستان'),('fars','فارس'),
 ('qazvin','قزوین'),('qom','قم'),('kurdistan','کردستان'),('kerman','کرمان'),('kermanshah','کرمانشاه'),
 ('kohgiluyeh-boyer-ahmad','کهگیلویه و بویراحمد'),('golestan','گلستان'),('gilan','گیلان'),
 ('lorestan','لرستان'),('mazandaran','مازندران'),('markazi','مرکزی'),('hormozgan','هرمزگان'),
 ('hamadan','همدان'),('yazd','یزد')]
PROV_FA = dict(PROVINCES)

# نام‌های جایگزین: کلیدِ نرمال‌شدهٔ نام در جدول مقاله → نام‌های ممکن در پست‌ها
ALIASES = {
    'نایین': ['نائین'],                        # غلط تایپی در جدول مقالهٔ اصفهان
    'مانه و سملقان': ['مانه'],                  # تفکیک به «مانه» و «سملقان»
    'طرقبه شاندیز': ['بینالود'],
    'دوره': ['چگنی'],                           # تغییر نام دوره به چگنی
    'خلیل اباد': ['خلیل اباد'],
}

def norm(s):
    s = re.sub(r'\*\*(.+?)\*\*', r'\1', s)
    s = re.sub(r'<sup>.*?</sup>', '', s)
    s = re.sub(r'\([^)]*\)', '', s)
    s = re.sub(r'→.*$', '', s)
    s = s.replace('‌','').replace('‍','')
    s = s.replace('ي','ی').replace('ك','ک').replace('آ','ا').replace('أ','ا').replace('إ','ا')
    s = s.replace('ۀ','ه').replace('ٔ','')
    s = re.sub(r'\s+',' ',s).strip(' .؛;،-')
    s = re.sub(r'^شهرستان\s*','',s)
    s = re.sub(r'^استان\s*','',s)
    return s

def strip_city_prefix(n):
    """حذف پیشوند «شهر/بندر/شهرستان» برای تطبیق نام مرکز با عنوان پست"""
    n = re.sub(r'^(بندر|شهر)\s+', '', n)
    return n

# ---------- 1) فهرست شهرستان‌های هر استان از مقاله‌های 31 ----------
def parse_block(sec):
    """جدول → فهرست (شهرستان، مرکز)"""
    lines = [l.strip() for l in sec.splitlines() if l.strip().startswith('|')]
    rows = [[re.sub(r'\s+',' ',c.strip()) for c in l.strip('|').split('|')] for l in lines]
    tbl = []
    for r in rows:
        if len(r) < 2: continue
        if r[0] in ('ردیف','شهرستان','نام شهرستان','شهرستان‌ها') or set(r[0]) <= set('-: '):
            continue
        tbl.append(r)
    if not tbl: return []
    def isnum(x):
        d = re.sub(r'\D','',x)
        return bool(d) and d == x.replace(',','').strip()
    col = 1 if all(isnum(r[0]) for r in tbl[:3]) else 0
    # ستون مرکز: نخستین ستونی که سرجدولش «مرکز» دارد؛ وگرنه ستون بعد از نام
    hdr = None
    for r in rows:
        if r and (r[0] in ('شهرستان','نام شهرستان','ردیف') or set(r[0])<=set('-: ')):
            if set(r[0])<=set('-: '): break
            hdr = r; continue
        if hdr: break
    ccol = None
    if hdr:
        for i,c in enumerate(hdr):
            if 'مرکز' in c and i!=col: ccol=i; break
    out = []
    for r in tbl:
        if len(r) > col and r[col].strip():
            center = r[ccol].strip() if (ccol is not None and len(r)>ccol) else ''
            center = re.sub(r'<sup>.*?</sup>','',center)
            center = re.sub(r'\s*\([^)]*\)\s*',' ',center).strip()
            out.append((r[col], center))
    return out

def bold_list(sec):
    # قالب آذربایجان شرقی: «**شهرستان تبریز** — مرکز: تبریز. …»
    pairs = re.findall(r'\*\*شهرستان\s+([^*]+?)\*\*[^—]*—\s*مرکز:\s*([^.\n]+)', sec)
    out = [(n.strip(), c.strip()) for n, c in pairs]
    if not out:
        out = [(n, n) for n in re.findall(r'\*\*شهرستان\s+([^*]+?)\*\*', sec)]
    return out

def county_list_from_article(path):
    txt = open(path, encoding='utf-8').read()
    candidates = []
    m = re.search(r'\n## [^\n]*شهرستان[^\n]*\n(.*?)(?=\n## |\Z)', txt, re.S)
    sections = [m.group(1)] if m else []
    for t in re.finditer(r'((?:^\|.*\n)+)', txt, re.M):
        block = t.group(1)
        if 'نام شهرستان' in block.splitlines()[0]:
            sections.append(block)
    for sec in sections:
        out = parse_block(sec) or bold_list(sec)
        if out:
            candidates.append(out)
    return max(candidates, key=len) if candidates else []

articles = {}
for f in sorted(glob.glob(os.path.join(ROOT,'31','[0-9][0-9]-*.md'))):
    slug = os.path.basename(f).split('-',1)[1].replace('.md','')
    raw = county_list_from_article(f)
    articles[slug] = {'raw': [c for c,_ in raw],
                      'center': dict((norm(c), norm(ctr)) for c,ctr in raw),
                      'norm': [norm(c) for c,_ in raw]}

# ---------- 2) پست‌های city از خروجی وردپرس ----------
tree = ET.parse(os.path.join(ROOT,'WordPress.2026-10-02 city.xml'))
channel = tree.getroot().find('channel')
posts = []
attachments = 0
media_titles = []
for it in channel.findall('item'):
    ptype = it.findtext('wp:post_type', namespaces=NS)
    if ptype == 'attachment':
        attachments += 1
        media_titles.append(it.findtext('title') or '')
        continue
    if ptype != 'city':
        continue
    meta = {}
    for pm in it.findall('wp:postmeta', NS):
        meta[pm.findtext('wp:meta_key', namespaces=NS)] = pm.findtext('wp:meta_value', namespaces=NS) or ''
    content = it.findtext('content:encoded', namespaces=NS) or ''
    text = re.sub(r'<[^>]+>',' ', content)
    words = len(re.findall(r'\S+', text))
    cats = [c.text for c in it.findall('category')]
    prov_fa = cats[0] if cats else ''
    prov = ''
    batch = meta.get('_sa_import_batch','')
    if batch in PROV_FA:
        prov = batch
    else:
        for s,fa in PROVINCES:
            if fa == prov_fa: prov = s; break
    faq = meta.get('sa_faq','')
    try:    faq_n = len(json.loads(faq)) if faq else 0
    except Exception: faq_n = faq.count('"q"')
    src = meta.get('sa_sources','') or ''
    src_n = len([l for l in src.splitlines() if l.strip() and 'FACT CHECK' not in l])
    posts.append(dict(
        title=(it.findtext('title') or '').strip(),
        slug=it.findtext('wp:post_name', namespaces=NS) or '',
        status=it.findtext('wp:status', namespaces=NS) or '',
        prov=prov, prov_fa=prov_fa,
        date=it.findtext('wp:post_date', namespaces=NS) or '',
        words=words, has_content=len(content.strip()) > 10,
        faq=faq_n, sources=src_n,
        thumb=bool(meta.get('_thumbnail_id','')),
        population=meta.get('sa_cty_population','') or meta.get('sa_city_population',''),
        center=meta.get('sa_cty_center',''),
    ))

# ---------- 3) تطبیق ----------
def post_keys(p):
    """کلیدهای یک پست: عنوان + مرکزِ متا (با/بدون پیشوند شهر و بندر)"""
    keys = set()
    for t in [p['title'], p['center']]:
        if not t: continue
        n = norm(t)
        keys |= {n, strip_city_prefix(n)}
    return keys - {''}

report = {}
for slug, fa in PROVINCES:
    art = articles.get(slug,{})
    ref_raw, ref_norm, centers = art.get('raw',[]), art.get('norm',[]), art.get('center',{})
    pub  = [p for p in posts if p['prov']==slug and p['status']=='publish']
    drf  = [p for p in posts if p['prov']==slug and p['status']!='publish']
    pubn = {k:p for p in pub for k in post_keys(p)}
    drfn = {k:p for p in drf for k in post_keys(p)}
    published, drafted, missing = [], [], []
    matched_ids = set()
    for cname, n in zip(ref_raw, ref_norm):
        # کلیدهای ممکن این شهرستان: نام + نام‌های جایگزین + مرکز
        keys = {n, strip_city_prefix(n)}
        for a in (ALIASES.get(n) or []):
            keys |= {norm(a), strip_city_prefix(norm(a))}
        ctr = centers.get(n)
        if ctr: keys |= {ctr, strip_city_prefix(ctr)}
        p = next((pubn[k] for k in keys if k in pubn), None)
        d = next((drfn[k] for k in keys if k in drfn), None)
        if p:   published.append(cname); matched_ids.add(id(p))
        elif d: drafted.append(cname);   matched_ids.add(id(d))
        else:   missing.append(cname)
    extra_pub  = [p['title'] for p in pub if id(p) not in matched_ids]
    extra_drf  = [p['title'] for p in drf if id(p) not in matched_ids]
    report[slug] = dict(
        fa=fa, total_ref=len(ref_raw),
        published=published, drafted=drafted, missing=missing,
        extra_pub=extra_pub, extra_draft=extra_drf,
        pub_words=sum(p['words'] for p in pub),
        pub_faq=sum(p['faq'] for p in pub),
        pub_src=sum(p['sources'] for p in pub),
        pub_thumb=sum(1 for p in pub if p['thumb']),
        pub_dates=[p['date'][:10] for p in pub if p['date']],
    )

json.dump(dict(articles=articles, posts=posts, report=report,
               attachments=attachments, media_titles=media_titles),
          open(os.path.join(ROOT,'wip','analysis.json'),'w',encoding='utf-8'),
          ensure_ascii=False, indent=1)

# ---------- 4) خلاصهٔ کنسولی ----------
grand = dict(ref=0, pub=0, drf=0, miss=0, xp=0, xd=0)
print(f"{'استان':24s} {'کل':>4s} {'منتشر':>5s} {'پیش‌نویس':>9s} {'بدون صفحه':>9s}  اضافه‌ها")
for slug, fa in PROVINCES:
    r = report[slug]
    grand['ref']+=r['total_ref']; grand['pub']+=len(r['published'])
    grand['drf']+=len(r['drafted']); grand['miss']+=len(r['missing'])
    grand['xp']+=len(r['extra_pub']); grand['xd']+=len(r['extra_draft'])
    flag = ''
    if r['extra_pub']: flag += f" pub+{len(r['extra_pub'])}"
    if r['extra_draft']: flag += f" drf+{len(r['extra_draft'])}"
    print(f"{fa:24s} {r['total_ref']:4d} {len(r['published']):5d} {len(r['drafted']):9d} {len(r['missing']):9d} {flag}")
print("\nTOTAL: ref=%d published=%d drafted=%d missing=%d | extra_pub=%d extra_draft=%d | posts=%d attachments=%d" %
      (grand['ref'], grand['pub'], grand['drf'], grand['miss'], grand['xp'], grand['xd'], len(posts), attachments))
print("\n=== MISSING:")
for slug,x in report.items():
    for m in x['missing']: print(f"  {x['fa']:22s} {m}")
print("=== EXTRA PUB:")
for slug,x in report.items():
    for m in x['extra_pub']: print(f"  {x['fa']:22s} {m}")
print("=== EXTRA DRAFTS:")
for slug,x in report.items():
    for m in x['extra_draft']: print(f"  {x['fa']:22s} {m}")
