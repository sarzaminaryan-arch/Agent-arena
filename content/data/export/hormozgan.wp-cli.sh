#!/usr/bin/env bash
set -euo pipefail

# ابوموسی
ID=$(wp post list --post_type=city --name=abumusa --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ابوموسی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "7402"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.05474"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.16243"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "9"

# بستک
ID=$(wp post list --post_type=city --name=bastak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بستک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "80492"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5593"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.36667"

# بشاگرد
ID=$(wp post list --post_type=city --name=bashagard --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35085"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "8750"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.44004"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.14973"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2320"

# بندرعباس
ID=$(wp post list --post_type=city --name=bandar-abbas --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندرعباس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "686257"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "10118"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "68"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.53722"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.22417"

# جاسک
ID=$(wp post list --post_type=city --name=jask --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جاسک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "58884"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "10701"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "25.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2"

# حاجی‌آباد
ID=$(wp post list --post_type=city --name=hajiabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "حاجیآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "64897"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9520"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "947"

# خمیر
ID=$(wp post list --post_type=city --name=khamir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر خمیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "56148"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.27306"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.48167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "15"

# رودان
ID=$(wp post list --post_type=city --name=rudan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهبارز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "124522"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.5935"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.1262"

# سیریک
ID=$(wp post list --post_type=city --name=sirik --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیریک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "45723"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3351"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.48056"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.2375"

# قشم
ID=$(wp post list --post_type=city --name=qeshm --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قشم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "143102"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1760"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.81167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.87778"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "30"

# لنگه
ID=$(wp post list --post_type=city --name=bandar-lengeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر لنگه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "159358"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7701"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.78333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.65"

# میناب
ID=$(wp post list --post_type=city --name=minab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میناب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "259221"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5393"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.94152"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.32685"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "16"

# پارسیان
ID=$(wp post list --post_type=city --name=parsian --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پارسیان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "50596"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1664"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.1251"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.1505"

