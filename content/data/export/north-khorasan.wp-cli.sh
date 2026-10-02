#!/usr/bin/env bash
set -euo pipefail

# اسفراین
ID=$(wp post list --post_type=city --name=esfarayen --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسفراین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "120513"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5019"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "8"

# بام و صفی‌آباد
ID=$(wp post list --post_type=city --name=bam-safiabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صفیآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "16887"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1606"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.805"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.93611"

# بجنورد
ID=$(wp post list --post_type=city --name=bojnord --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بجنورد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "324083"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.33333"

# جاجرم
ID=$(wp post list --post_type=city --name=jajarm --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جاجرم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36673"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3500"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1000"

# راز و جرگلان
ID=$(wp post list --post_type=city --name=raz-jargalan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "راز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "59210"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2538"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.35"

# شیروان
ID=$(wp post list --post_type=city --name=shirvan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شیروان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "146140"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3789"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.9"

# فاروج
ID=$(wp post list --post_type=city --name=faruj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فاروج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "49271"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1615"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.22829"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.21542"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1280"

# مانه
ID=$(wp post list --post_type=city --name=maneh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پیشقلعه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "26082"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.88"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.79"

# مانه و سملقان
ID=$(wp post list --post_type=city --name=maneh-samalqan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آشخانه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "101727"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.55939"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.9213"

# گرمه
ID=$(wp post list --post_type=city --name=garmeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گرمه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "25475"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2407"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "9"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.28333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2118"

