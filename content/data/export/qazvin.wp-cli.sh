#!/usr/bin/env bash
set -euo pipefail

# آبیک
ID=$(wp post list --post_type=city --name=abyek --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آبیک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94536"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "13990817000722"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1008"

# آوج
ID=$(wp post list --post_type=city --name=avaj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آوج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43798"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.57685"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.22241"

# البرز
ID=$(wp post list --post_type=city --name=alborz-qazvin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "الوند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "243868"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "406"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.05"

# بوئین‌زهرا
ID=$(wp post list --post_type=city --name=buin-zahra --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بوئینزهرا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "122994"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3022"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.61667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.7"

# تاکستان
ID=$(wp post list --post_type=city --name=takestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تاکستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "172636"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.55"

# قزوین
ID=$(wp post list --post_type=city --name=qazvin-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قزوین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "596932"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5572"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.81667"

