#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
registry.py — یک منبع حقیقت برای ۳۱ استان و ۴۸۳ شهرستان.

فهرست رسمی داخل خود قالب فرزند زندگی می‌کند
(`wp-content/themes/sarzaminaryan-child/data/counties.php`) تا سایت و ابزارها
هرگز دو فهرست متفاوت نداشته باشند. این ماژول همان فایل PHP را می‌خواند.

استفاده:
    from registry import counties, provinces, by_province, county
"""
import os
import re

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..'))
THEME = os.path.join(ROOT, 'wp-content', 'themes', 'sarzaminaryan-child')
COUNTIES_PHP = os.path.join(THEME, 'data', 'counties.php')
PROVINCES_PHP = os.path.join(THEME, 'data', 'provinces.php')

FACTS_DIR = os.path.join(ROOT, 'content', 'data', 'counties')
HARVEST_DIR = os.path.join(ROOT, 'content', 'data', 'harvest')

_ROW = re.compile(
    r"array\(\s*'slug'\s*=>\s*'([^']+)'\s*,\s*'name'\s*=>\s*'([^']+)'\s*,"
    r"\s*'province'\s*=>\s*'([^']+)'\s*,\s*'status'\s*=>\s*'([^']+)'"
)
_PROV = re.compile(
    r"'slug'\s*=>\s*'([^']+)'\s*,\s*'name'\s*=>\s*'([^']+)'"
)


def counties():
    """[{slug, name, province, status}] — ۴۸۳ ردیف به ترتیب استان."""
    with open(COUNTIES_PHP, encoding='utf-8') as fh:
        src = fh.read()
    return [
        {'slug': m.group(1), 'name': m.group(2), 'province': m.group(3), 'status': m.group(4)}
        for m in _ROW.finditer(src)
    ]


def provinces():
    """{slug: name} برای ۳۱ استان."""
    with open(PROVINCES_PHP, encoding='utf-8') as fh:
        src = fh.read()
    out = {}
    for m in _PROV.finditer(src):
        out.setdefault(m.group(1), m.group(2))
    return out


def by_province(province=None):
    """گروه‌بندی بر اساس استان؛ با آرگومان، فقط همان استان."""
    groups = {}
    for row in counties():
        groups.setdefault(row['province'], []).append(row)
    if province:
        return {province: groups.get(province, [])}
    return groups


def county(slug):
    for row in counties():
        if row['slug'] == slug:
            return row
    return None


def slug_of_name(name):
    """نام فارسی → نامک (برای تطبیق خروجی ویکی‌دیتا/ویکی‌پدیا)."""
    norm = normalize_fa(name)
    for row in counties():
        if normalize_fa(row['name']) == norm:
            return row['slug']
    return None


_ZWNJ = '\u200c'


def normalize_fa(text):
    """نرمال‌سازی نام فارسی: حذف «شهرستان»، نیم‌فاصله، «و» میانی، ی/ک عربی."""
    t = (text or '').strip()
    t = t.replace('شهرستان', ' ').replace(_ZWNJ, '')
    t = t.replace('ي', 'ی').replace('ك', 'ک').replace('ۀ', 'ه').replace('ة', 'ه')
    t = re.sub(r'\(.*?\)', ' ', t)
    t = re.sub(r'\s+و\s+', '', t)
    t = re.sub(r'[\s\-_]+', '', t)
    return t


def ensure_dirs():
    os.makedirs(FACTS_DIR, exist_ok=True)
    os.makedirs(HARVEST_DIR, exist_ok=True)


if __name__ == '__main__':
    rows = counties()
    pv = by_province()
    print('counties:', len(rows), '| provinces:', len(pv))
    for slug, items in pv.items():
        print('%-24s %3d' % (slug, len(items)))
