#!/usr/bin/env bash
set -euo pipefail

# آشتیان
ID=$(wp post list --post_type=city --name=ashtian --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آشتیان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "16357"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1240"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.06667"

# اراک
ID=$(wp post list --post_type=city --name=arak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اراک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "591737"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.8"

# تفرش
ID=$(wp post list --post_type=city --name=tafresh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تفرش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "24913"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.88333"

# خمین
ID=$(wp post list --post_type=city --name=khomeyn --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خمین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "105017"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "12"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1830"

# خنداب
ID=$(wp post list --post_type=city --name=khondab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خنداب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54018"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.38"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.18972"

# دلیجان
ID=$(wp post list --post_type=city --name=delijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دلیجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51621"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2500"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.03333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1530"

# زرندیه
ID=$(wp post list --post_type=city --name=zarandieh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مأمونیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "63907"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4116"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.36667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1256"

# ساوه
ID=$(wp post list --post_type=city --name=saveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ساوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "283538"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.98333"

# شازند
ID=$(wp post list --post_type=city --name=shazand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شازند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "117571"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2745"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.3"

# فراهان
ID=$(wp post list --post_type=city --name=farahan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فرمهین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "28994"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.63333"

# محلات
ID=$(wp post list --post_type=city --name=mahallat --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "محلات"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "56342"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "37"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.41667"

# کمیجان
ID=$(wp post list --post_type=city --name=komijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کمیجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36441"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.33333"

