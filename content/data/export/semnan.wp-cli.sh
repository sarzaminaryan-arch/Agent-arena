#!/usr/bin/env bash
set -euo pipefail

# آرادان
ID=$(wp post list --post_type=city --name=aradan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آرادان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "13884"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.51667"

# دامغان
ID=$(wp post list --post_type=city --name=damghan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دامغان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94190"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.33333"

# سرخه
ID=$(wp post list --post_type=city --name=sorkheh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرخه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "15523"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9222"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.45"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.2167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1100"

# سمنان
ID=$(wp post list --post_type=city --name=semnan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سمنان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "196521"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "22119"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1117"

# شاهرود
ID=$(wp post list --post_type=city --name=shahrud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شاهرود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "218628"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "43405"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.5"

# مهدی‌شهر
ID=$(wp post list --post_type=city --name=mehdishahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهدیشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47475"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.35"

# میامی
ID=$(wp post list --post_type=city --name=meyami --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میامی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38718"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.63333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56"

# گرمسار
ID=$(wp post list --post_type=city --name=garmsar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گرمسار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "77421"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.33333"

