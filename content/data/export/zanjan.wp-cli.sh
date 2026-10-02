#!/usr/bin/env bash
set -euo pipefail

# ابهر
ID=$(wp post list --post_type=city --name=abhar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ابهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "151528"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3362"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.05"

# ایجرود
ID=$(wp post list --post_type=city --name=ejrud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرینآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36641"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1755"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.25"

# خدابنده
ID=$(wp post list --post_type=city --name=khodabandeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قیدار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "164493"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5151"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2050"

# خرمدره
ID=$(wp post list --post_type=city --name=kharadere --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خرمدره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67951"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "407"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.28333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1570"

# زنجان
ID=$(wp post list --post_type=city --name=zanjan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زنجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "521302"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.25"

# سلطانیه
ID=$(wp post list --post_type=city --name=soltaniyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سلطانیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "29480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1358.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.5"

# طارم
ID=$(wp post list --post_type=city --name=tarom --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آببر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "46641"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2235"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "400"

# ماهنشان
ID=$(wp post list --post_type=city --name=mahneshan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ماهنشان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39425"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"

