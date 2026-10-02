#!/usr/bin/env bash
set -euo pipefail

# بانه
ID=$(wp post list --post_type=city --name=baneh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بانه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "158690"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.83333"

# بیجار
ID=$(wp post list --post_type=city --name=bijar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بیجار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "89162"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4350"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.6"

# دهگلان
ID=$(wp post list --post_type=city --name=dehgolan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهگلان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "64015"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2050"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.35"

# دیواندره
ID=$(wp post list --post_type=city --name=divandarreh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دیواندره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "80040"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3637"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47"

# سروآباد
ID=$(wp post list --post_type=city --name=sarvabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سروآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "44940"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1200"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.33333"

# سقز
ID=$(wp post list --post_type=city --name=saqqez --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سقز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "226451"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.33333"

# سنندج
ID=$(wp post list --post_type=city --name=sanandaj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سنندج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "501402"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.83333"

# قروه
ID=$(wp post list --post_type=city --name=qorveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قروه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "140192"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2900"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.66667"

# مریوان
ID=$(wp post list --post_type=city --name=marivan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مریوان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "195263"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.25"

# کامیاران
ID=$(wp post list --post_type=city --name=kamyaran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کامیاران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "102856"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.91667"

