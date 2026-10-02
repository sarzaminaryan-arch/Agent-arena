#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
coverage_facts.py — ماتریس پوشش «ستون × استان»: دقیقاً بگو کدام تکهٔ پازل جا مانده.

چون کار ستونی پیش می‌رود (یک ستون برای کل کشور)، گزارش هم باید ستونی باشد:
کدام ستون در کدام استان هنوز زیر ۸۰٪ است → همان‌جا هدف برداشت بعدی است.

خروجی: content/data/COUNTY-FACTS-COVERAGE.md

    python3 content-templates/tools/geo/coverage_facts.py
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import registry  # noqa: E402

COLUMNS = [
    ('center', 'مرکز'), ('population', 'جمعیت'), ('census_year', 'سال'), ('area', 'مساحت'),
    ('lat', 'مختصات'), ('districts', 'بخش'), ('rural_districts', 'دهستان'),
    ('cities', 'شهر'), ('villages', 'روستا'), ('neighbors', 'همسایه'),
    ('climate', 'اقلیم'), ('best_time', 'فصل'), ('poi_nature', 'طبیعت'),
    ('poi_offbeat', 'بکر'), ('poi_recreation', 'تفریحی'), ('poi_heritage', 'تاریخی'),
]
FA = '۰۱۲۳۴۵۶۷۸۹'


def fa(n):
    return ''.join(FA[int(c)] if c.isdigit() else c for c in str(n))


def main():
    provinces = registry.provinces()
    groups = registry.by_province()
    lines = ['# پوشش دادهٔ ۴۸۳ شهرستان — ماتریس ستون × استان', '',
             'هر خانه = درصد شهرستان‌های آن استان که آن ستون را دارند. 🟩 ≥۸۰٪ · 🟨 ۴۰–۷۹٪ · 🟥 <۴۰٪', '',
             '| استان | کل | ' + ' | '.join(label for _k, label in COLUMNS) + ' |',
             '|---|---|' + '---|' * len(COLUMNS)]
    totals = {k: 0 for k, _ in COLUMNS}
    grand = 0

    for prov in sorted(groups, key=lambda p: -len(groups[p])):
        rows = groups[prov]
        grand += len(rows)
        counts = {k: 0 for k, _ in COLUMNS}
        for row in rows:
            path = os.path.join(registry.FACTS_DIR, row['slug'] + '.json')
            if not os.path.isfile(path):
                continue
            with open(path, encoding='utf-8') as fh:
                fields = (json.load(fh).get('fields') or {})
            for key, _label in COLUMNS:
                v = (fields.get(key) or {}).get('value')
                if v not in (None, '', []):
                    counts[key] += 1
                    totals[key] += 1
        cells = []
        for key, _label in COLUMNS:
            pct = round(100 * counts[key] / len(rows)) if rows else 0
            icon = '🟩' if pct >= 80 else ('🟨' if pct >= 40 else '🟥')
            cells.append('%s%s' % (icon, fa(pct)))
        lines.append('| %s | %s | %s |' % (provinces.get(prov, prov), fa(len(rows)), ' | '.join(cells)))

    lines.append('| **کل کشور** | **%s** | %s |' % (
        fa(grand), ' | '.join('**%s٪**' % fa(round(100 * totals[k] / grand)) for k, _l in COLUMNS)))
    lines += ['', '## ستون‌های بعدی برای برداشت', '']
    for key, label in sorted(COLUMNS, key=lambda c: totals[c[0]]):
        lines.append('- **%s** — %s٪ (%s از %s شهرستان)' % (label, fa(round(100 * totals[key] / grand)), fa(totals[key]), fa(grand)))

    out = os.path.join(registry.ROOT, 'content', 'data', 'COUNTY-FACTS-COVERAGE.md')
    with open(out, 'w', encoding='utf-8') as fh:
        fh.write('\n'.join(lines) + '\n')
    print('→ %s' % os.path.relpath(out, registry.ROOT))


if __name__ == '__main__':
    main()
