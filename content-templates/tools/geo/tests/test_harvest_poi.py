"""Offline regressions for pass 4. Fixtures are synthetic, not published facts."""
import copy
import io
import json
import pathlib
import sys
import tempfile
import unittest
from unittest import mock

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1]))
import harvest_poi as poi


def page(text, title='شهرستان نمونه'):
    return {'title': title, 'text': text, 'pageid': 123, 'revid': 456,
            'url': poi.page_url(title)}


class PageMappingTests(unittest.TestCase):
    def test_normalization_and_redirect_chain(self):
        data = {'query': {
            'normalized': [{'from': 'شهرستان_نمونه', 'to': 'شهرستان نمونه'}],
            'redirects': [{'from': 'شهرستان نمونه', 'to': 'شهرستان جدید'}],
            'pages': [{'title': 'شهرستان جدید', 'ns': 0, 'pageid': 10,
                       'revisions': [{'revid': 11, 'slots': {'main': {'content': 'متن'}}}]}]}}
        result = poi.decode_pages(data, ['شهرستان_نمونه'])
        self.assertEqual(result['شهرستان_نمونه']['revid'], 11)
        self.assertEqual(result['شهرستان_نمونه']['title'], 'شهرستان جدید')

    def test_missing_pages_are_not_empty_successful_articles(self):
        self.assertEqual(poi.decode_pages({'query': {'pages': [
            {'title': 'ناموجود', 'missing': True}]}}, ['ناموجود']), {})

    def test_api_errors_fail_closed(self):
        for data in ({}, {'error': {'code': 'maxlag'}}):
            with self.assertRaises(ValueError):
                poi.decode_pages(data, ['نمونه'])

    def test_network_error_retries_and_does_not_succeed(self):
        with mock.patch.object(poi.urllib.request, 'urlopen', side_effect=OSError('offline')), \
             mock.patch.object(poi.time, 'sleep'):
            with self.assertRaises(RuntimeError):
                poi.fetch_pages(['نمونه'], sleep=0)


class ExtractionTests(unittest.TestCase):
    def test_nested_sections_do_not_leak_into_history(self):
        wt = '''== جاذبه‌های گردشگری ==
[[غار نمونه]]
=== آثار تاریخی ===
[[قلعه نمونه]]
=== پارک‌ها ===
[[بوستان نمونه]]
== تاریخ ==
[[قلعه نامرتبط]]
'''
        items = poi.extract_candidates(page(wt), 'county section')
        names = {i['name'] for i in items}
        self.assertEqual(names, {'غار نمونه', 'قلعه نمونه', 'بوستان نمونه'})
        self.assertEqual({i['field'] for i in items},
                         {'poi_nature', 'poi_heritage', 'poi_recreation'})

    def test_unknown_and_generic_links_are_not_offbeat(self):
        wt = '== جاذبه‌ها ==\n[[نام نامشخص]] [[ایران]] [[موزه]] [[رده:غارهای ایران]]'
        self.assertEqual(poi.extract_candidates(page(wt), 'county section'), [])

    def test_offbeat_requires_explicit_source_section(self):
        wt = '== روستاهای گردشگری و نقاط بکر ==\n[[روستای نمونه]]'
        items = poi.extract_candidates(page(wt), 'county section')
        self.assertEqual(items[0]['field'], 'poi_offbeat')

    def test_national_park_is_nature_not_amusement(self):
        self.assertEqual(poi.classify('پارک ملی نمونه', 'جاذبه‌ها'), 'poi_nature')

    def test_references_comments_and_media_captions_are_ignored(self):
        wt = '''== جاذبه‌ها ==
<ref>[[قلعه ارجاع]]</ref><!-- [[قلعه نظر]] -->
[[پرونده:تصویر.jpg|بندانگشتی|[[قلعه تصویر]] و [[پارک تصویر]]]]
[[غار واقعی|این غار]]
'''
        items = poi.extract_candidates(page(wt), 'county section')
        self.assertEqual([i['name'] for i in items], ['غار واقعی'])

    def test_administrative_links_are_not_attractions(self):
        wt = '== آثار تاریخی ==\n[[شهرستان دیگر]] [[استان نمونه]] [[بخش نمونه]] [[قلعه نمونه]]'
        self.assertEqual([i['name'] for i in poi.extract_candidates(page(wt), 'county')],
                         ['قلعه نمونه'])

    def test_historical_context_does_not_make_people_or_countries_places(self):
        wt = '== آثار تاریخی و جاذبه‌ها ==\n[[حافظ]] [[آلمان]] [[معماری]] [[قلعه نمونه]]'
        self.assertEqual([i['name'] for i in poi.extract_candidates(page(wt), 'county')],
                         ['قلعه نمونه'])

    def test_disambiguation_and_zwnj_keep_display_names_intact(self):
        wt = '== جاذبه‌ها ==\n[[آبشار نمونه‌ها (شهرستان نمونه)|آبشار]]'
        wt = wt.replace('\x0c', '\u200c')
        items = poi.extract_candidates(page(wt), 'county')
        self.assertEqual(items[0]['name'], 'آبشار نمونه\u200cها (شهرستان نمونه)')

    def test_each_name_keeps_source_revision_and_section(self):
        item = poi.extract_candidates(page('== جاذبه‌ها ==\n[[غار نمونه]]'), 'county')[0]
        self.assertEqual(item['revision_id'], 456)
        self.assertEqual(item['pageid'], 123)
        self.assertTrue(item['source_url'].startswith('https://fa.wikipedia.org/wiki/'))
        self.assertIn('جاذبه', item['section'])


class TargetValidationTests(unittest.TestCase):
    def candidate(self, title):
        return {'name': title, 'target_title': title, 'field': 'poi_heritage',
                'section': 'جاذبه‌ها', 'source_url': poi.page_url('شهرستان نمونه')}

    def test_generic_political_region_is_not_nature(self):
        self.assertIsNone(poi.classify('کشورهای عربی خلیج فارس', 'جاذبه‌ها'))

    def test_cinema_name_is_not_a_coast(self):
        self.assertEqual(poi.classify('سینما ساحل اهواز', 'جاذبه‌ها'), 'poi_recreation')

    def test_generic_building_types_are_not_named_landmarks(self):
        for title in ('بازار', 'کاروانسرا', 'امام زاده', 'پارک جنگلی', 'دریاچه سد'):
            self.assertIsNone(poi.classify(title, 'جاذبه‌ها'))

    def test_all_bare_type_keywords_are_rejected_except_proper_names(self):
        proper = {'تخت جمشید', 'تخت سلیمان', 'طاق بستان', 'نقش رستم', 'هگمتانه', 'چغازنبیل'}
        for group in (poi.NATURE, poi.RECREATION, poi.HERITAGE):
            for keyword in group:
                name = keyword.strip()
                if name not in proper:
                    self.assertIsNone(poi.classify(name, 'جاذبه‌ها'), name)

    def test_type_qualifier_does_not_make_generic_park_a_named_place(self):
        self.assertIsNone(poi.classify('بوستان (پارک)', 'جاذبه‌ها'))

    def test_garden_design_style_is_not_a_specific_destination(self):
        self.assertIsNone(poi.classify('باغ ایرانی', 'جاذبه‌ها'))

    def test_bridge_named_seven_springs_is_not_a_spring(self):
        self.assertEqual(poi.classify('پل هفت‌چشمه', 'جاذبه‌ها'), 'poi_heritage')

    def test_bird_garden_is_recreation(self):
        self.assertEqual(poi.classify('باغ پرندگان اصفهان', 'جاذبه‌ها'), 'poi_recreation')

    def test_other_province_is_rejected(self):
        p = page('{{جعبه اطلاعات مکان\n| استان = خوزستان\n}}', 'پل نمونه')
        with mock.patch.object(poi.registry, 'provinces', return_value={'ardabil':'اردبیل', 'khuzestan':'خوزستان'}):
            self.assertEqual(poi.target_location_conflicts(p, 'اردبیل', 'اردبیل'),
                             'explicitly different province')

    def test_lead_county_location_conflict_is_rejected(self):
        p = page('این پل در [[شهرستان اندیمشک]] واقع شده است.', 'پل نمونه')
        with mock.patch.object(poi.registry, 'counties', return_value=[{'name':'اردبیل'},{'name':'اندیمشک'}]):
            self.assertEqual(poi.target_location_conflicts(p, 'اردبیل'),
                             'lead locates target in another county')

    def test_known_center_city_in_other_county_is_rejected(self):
        p = page('{{مکان\n| شهر = سلطانیه\n}}', 'گنبد نمونه')
        seats={poi.registry.normalize_fa('سلطانیه'):{poi.registry.normalize_fa('سلطانیه')}}
        self.assertEqual(poi.target_location_conflicts(p, 'زنجان', seats=seats),
                         'explicit city in another county')

    def test_redirect_aliases_are_deduplicated_by_page_id(self):
        entries = [self.candidate('مسجد قدیم'), self.candidate('مسجد نام تازه')]
        target = page('یک مسجد', 'مسجد نام تازه')
        accepted, rejected = poi.validate_targets(entries,
            {'مسجد قدیم': target, 'مسجد نام تازه': target}, 'نمونه')
        self.assertEqual(len(accepted), 1)
        self.assertEqual(accepted[0]['name'], 'مسجد نام تازه')
        self.assertEqual(accepted[0]['target_revision_id'], 456)
        self.assertEqual(rejected, [])

    def test_disambiguation_target_is_not_exported(self):
        target = page('صفحهٔ ابهام‌زدایی', 'قلعه نمونه')
        target['disambiguation'] = True
        accepted, rejected = poi.validate_targets([self.candidate('قلعه نمونه')],
                                                  {'قلعه نمونه': target}, 'نمونه')
        self.assertEqual(accepted, [])
        self.assertEqual(rejected[0]['reason'], 'disambiguation page')

    def test_missing_target_is_not_exported(self):
        accepted, rejected = poi.validate_targets([self.candidate('قلعه ناموجود')], {}, 'نمونه')
        self.assertEqual(accepted, [])
        self.assertEqual(rejected[0]['reason'], 'target page missing')

    def test_target_in_explicitly_other_county_is_not_exported(self):
        target = page('{{جعبه اطلاعات مکان\n| شهرستان = دیگر\n}}', 'قلعه نمونه')
        accepted, rejected = poi.validate_targets([self.candidate('قلعه نمونه')],
                                                  {'قلعه نمونه': target}, 'نمونه')
        self.assertEqual(accepted, [])
        self.assertEqual(rejected[0]['reason'], 'explicitly different county')


class LocalityTests(unittest.TestCase):
    def test_explicit_county_match_and_persian_characters(self):
        p = page('{{جعبه اطلاعات شهر\n| شهرستان = [[شهرستان سی‌سخت|سی‌سخت]]\n}}')
        self.assertTrue(poi.city_belongs_to_county(p, 'سیسخت'))

    def test_different_infobox_county_overrules_incidental_mentions(self):
        p = page('{{شهر\n| شهرستان = شهرستان دیگر\n}}\nدر نزدیکی [[شهرستان نمونه]]')
        self.assertFalse(poi.city_belongs_to_county(p, 'نمونه'))

    def test_incidental_history_mention_does_not_confirm_location(self):
        p = page('این یک شهر است.\n== تاریخ ==\n[[شهرستان نمونه]]')
        self.assertFalse(poi.city_belongs_to_county(p, 'نمونه'))

    def test_direct_lead_county_link_is_allowed(self):
        self.assertTrue(poi.city_belongs_to_county(page('در [[شهرستان نمونه]] است.'), 'نمونه'))


class PreservationTests(unittest.TestCase):
    def candidates(self):
        return poi.extract_candidates(page('== جاذبه‌ها ==\n[[غار نمونه]] [[بوستان نمونه]]'), 'county')

    def test_manual_verified_and_existing_auto_are_untouched(self):
        for old in ({'status': 'manual', 'value': ''},
                    {'status': 'verified', 'value': None},
                    {'status': 'auto', 'value': 'نام قبلی', 'source': 'derived'}):
            doc = {'fields': {'poi_nature': copy.deepcopy(old)}}
            poi.fill_empty_fields(doc, self.candidates(), '2026-10-02')
            self.assertEqual(doc['fields']['poi_nature'], old)

    def test_only_poi_fields_can_change(self):
        untouched = {'population': {'value': 51000, 'source': 'manual'},
                     'area': {'value': 1200}, 'neighbors': {'value': ['dena']}}
        doc = {'slug': 'sample', 'fields': copy.deepcopy(untouched)}
        added = poi.fill_empty_fields(doc, self.candidates(), '2026-10-02')
        self.assertEqual(set(added), {'poi_nature', 'poi_recreation'})
        self.assertEqual({k: v for k, v in doc['fields'].items() if not k.startswith('poi_')}, untouched)
        self.assertEqual(doc['fields']['poi_nature']['status'], 'draft')
        self.assertEqual(doc['fields']['poi_nature']['entries'][0]['revision_id'], 456)

    def test_refresh_only_corrects_own_unverified_drafts(self):
        old = {'status': 'draft', 'source': 'wikipedia-poi', 'value': 'نام نامناسب'}
        doc = {'fields': {'poi_nature': old, 'poi_heritage': {
            'status': 'auto', 'source': 'derived', 'value': 'قلعه قبلی'}}}
        poi.fill_empty_fields(doc, [], '2026-10-02', refresh_drafts=True)
        self.assertNotIn('poi_nature', doc['fields'])
        self.assertEqual(doc['fields']['poi_heritage']['value'], 'قلعه قبلی')

    def test_refresh_never_overwrites_manual_or_verified_own_draft(self):
        for status in ('manual', 'verified'):
            old = {'status': status, 'source': 'wikipedia-poi', 'value': 'نام تأییدشده'}
            doc = {'fields': {'poi_nature': copy.deepcopy(old)}}
            poi.fill_empty_fields(doc, [], '2026-10-02', refresh_drafts=True)
            self.assertEqual(doc['fields']['poi_nature'], old)

    def test_repeat_is_idempotent(self):
        doc = {'fields': {}}
        poi.fill_empty_fields(doc, self.candidates(), '2026-10-02')
        previous = copy.deepcopy(doc)
        self.assertEqual(poi.fill_empty_fields(doc, self.candidates(), '2026-10-03'), {})
        self.assertEqual(doc, previous)

    def test_all_reads_finish_before_any_writes_on_network_failure(self):
        with tempfile.TemporaryDirectory() as root:
            facts = pathlib.Path(root, 'facts')
            facts.mkdir()
            original = {'slug': 'sample', 'fields': {'center': {
                'value': 'شهر نمونه', 'url': 'https://www.wikidata.org/wiki/Q1', 'source': 'wikidata'}}}
            f = facts / 'sample.json'
            f.write_text(json.dumps(original, ensure_ascii=False), encoding='utf-8')
            rows = [{'slug': 'sample', 'name': 'نمونه', 'province': 'test'}]
            with mock.patch.object(poi.registry, 'FACTS_DIR', str(facts)), \
                 mock.patch.object(poi.registry, 'HARVEST_DIR', str(pathlib.Path(root, 'harvest'))), \
                 mock.patch.object(poi.registry, 'ROOT', root), \
                 mock.patch.object(poi, 'fetch_pages', side_effect=[
                     {'شهرستان نمونه': page('== جاذبه‌ها ==\n[[غار نمونه]]')}, RuntimeError('offline')]):
                with self.assertRaises(RuntimeError):
                    poi.harvest(rows, sleep=0)
            self.assertEqual(json.loads(f.read_text(encoding='utf-8')), original)
            self.assertFalse(pathlib.Path(root, 'harvest').exists())

    def test_success_writes_reports_and_provenance(self):
        with tempfile.TemporaryDirectory() as root:
            facts = pathlib.Path(root, 'facts')
            facts.mkdir()
            pathlib.Path(root, 'content', 'data').mkdir(parents=True)
            f = facts / 'sample.json'
            f.write_text('{"slug":"sample","fields":{"area":{"value":1200}}}', encoding='utf-8')
            rows = [{'slug': 'sample', 'name': 'نمونه', 'province': 'test'}]
            with mock.patch.object(poi.registry, 'FACTS_DIR', str(facts)), \
                 mock.patch.object(poi.registry, 'HARVEST_DIR', str(pathlib.Path(root, 'harvest'))), \
                 mock.patch.object(poi.registry, 'ROOT', root), \
                 mock.patch.object(poi, 'fetch_pages', side_effect=[
                     {'شهرستان نمونه': page('== جاذبه‌ها ==\n[[غار نمونه]]')}, {},
                     {'غار نمونه': page('غاری در شهرستان نمونه', 'غار نمونه')}]):
                result = poi.harvest(rows, sleep=0)
            self.assertIn('sample', result)
            updated = json.loads(f.read_text(encoding='utf-8'))
            self.assertEqual(updated['fields']['area'], {'value': 1200})
            self.assertEqual(updated['fields']['poi_nature']['value'], 'غار نمونه')
            self.assertTrue(pathlib.Path(root, 'content', 'data', 'COUNTY-POI-PASS4.md').exists())
            self.assertTrue(pathlib.Path(root, 'harvest', 'poi', 'test.json').exists())


if __name__ == '__main__':
    unittest.main()
