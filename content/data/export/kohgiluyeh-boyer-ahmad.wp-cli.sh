#!/usr/bin/env bash
set -euo pipefail

# باشت
ID=$(wp post list --post_type=city --name=basht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "باشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21690"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1055"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.45"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.11667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "763"

# بهمئی
ID=$(wp post list --post_type=city --name=bahmai --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لیکک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38136"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1317"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.05"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1500"

# بویراحمد
ID=$(wp post list --post_type=city --name=boyer-ahmad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "یاسوج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "280009"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3239"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.11667"

# دنا
ID=$(wp post list --post_type=city --name=dena --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیسخت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "42539"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1101"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.28333"

# لنده
ID=$(wp post list --post_type=city --name=landeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لنده"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21812"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "544"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.98167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.42333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "29"

# مارگون
ID=$(wp post list --post_type=city --name=margoun --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "19876"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1018"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.9"

# چرام
ID=$(wp post list --post_type=city --name=choram --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چرام"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "33543"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.85"

# کهگیلویه
ID=$(wp post list --post_type=city --name=kohgiluyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهدشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "131351"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2805"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.96667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.55"

# گچساران
ID=$(wp post list --post_type=city --name=gachsaran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دوگنبدان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "123370"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4683"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "726"

