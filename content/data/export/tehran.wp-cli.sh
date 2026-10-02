#!/usr/bin/env bash
set -euo pipefail

# اسلامشهر
ID=$(wp post list --post_type=city --name=eslamshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسلامشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "548620"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "193"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.23333"

# بهارستان
ID=$(wp post list --post_type=city --name=baharestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نسیمشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "536329"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "97.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.52528"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.16278"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1047"

# تهران
ID=$(wp post list --post_type=city --name=tehran-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تهران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1300.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.4"

# دماوند
ID=$(wp post list --post_type=city --name=damavand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دماوند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "125480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1932"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.615"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2300"

# رباط‌کریم
ID=$(wp post list --post_type=city --name=robat-karim --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رباطکریم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "291516"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "329"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.05"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1075"

# ری
ID=$(wp post list --post_type=city --name=rey --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهر ری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "349700"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2205.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "10"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.33333"

# شمیرانات
ID=$(wp post list --post_type=city --name=shemiranat --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شمیران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47279"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1600"

# شهریار
ID=$(wp post list --post_type=city --name=shahriar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهریار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "744210"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "335.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.65907"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.05953"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1140"

# فیروزکوه
ID=$(wp post list --post_type=city --name=firuzkuh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فیروزکوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "33558"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2386"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.75"

# قدس
ID=$(wp post list --post_type=city --name=qods --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قدس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "316636"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "81.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.71667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.06667"

# قرچک
ID=$(wp post list --post_type=city --name=qarchak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قرچک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "269138"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "90.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "15"

# ملارد
ID=$(wp post list --post_type=city --name=malard --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ملارد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "377292"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "930.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.61"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.69667"

# ورامین
ID=$(wp post list --post_type=city --name=varamin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ورامین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "283742"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1541"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.7"

# پاکدشت
ID=$(wp post list --post_type=city --name=pakdasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پاکدشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "350966"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "610"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.46667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1013"

# پردیس
ID=$(wp post list --post_type=city --name=pardis --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پردیس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "169060"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "299"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.74167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.77694"

# پیشوا
ID=$(wp post list --post_type=city --name=pishva --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پیشوا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "86601"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.73333"

