#!/usr/bin/env bash
set -euo pipefail

# ازنا
ID=$(wp post list --post_type=city --name=azna --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ازنا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "74936"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1212"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.46667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.41667"

# الیگودرز
ID=$(wp post list --post_type=city --name=aligudarz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "الیگودرز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "137534"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5300"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "azna\ndorud\nkhorramabad"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.48333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2022"

# بروجرد
ID=$(wp post list --post_type=city --name=borujerd --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بروجرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "326452"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2642"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1570"

# خرم‌آباد
ID=$(wp post list --post_type=city --name=khorramabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خرمآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "506471"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4986"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1200"

# دلفان
ID=$(wp post list --post_type=city --name=delfan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نورآباد (دلفان)"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "143973"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2655"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.0551"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.8698"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2180"

# دورود
ID=$(wp post list --post_type=city --name=dorud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دورود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "174508"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1326"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.08333"

# رومشکان
ID=$(wp post list --post_type=city --name=rumeshkan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چقابل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39058"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "853"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.3667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.3667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1095"

# سلسله
ID=$(wp post list --post_type=city --name=selseleh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "الشتر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "75559"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1700"

# معمولان
ID=$(wp post list --post_type=city --name=mamulan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "معمولان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21372"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1440"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.35472"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.96333"

# پلدختر
ID=$(wp post list --post_type=city --name=pol-e-dokhtar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پل دختر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "73744"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48"

# چگنی
ID=$(wp post list --post_type=city --name=chegeni --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرابدوره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "41756"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.61667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.91667"

# کوهدشت
ID=$(wp post list --post_type=city --name=kuhdasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوهدشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "166658"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3904"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1195"

