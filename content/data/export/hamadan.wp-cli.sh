#!/usr/bin/env bash
set -euo pipefail

# اسدآباد
ID=$(wp post list --post_type=city --name=asadabad-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسدآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "107008"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.15"

# بهار
ID=$(wp post list --post_type=city --name=bahar-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بهار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "119082"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.35"

# تویسرکان
ID=$(wp post list --post_type=city --name=tuyserkan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تویسرکان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "105738"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1556"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1784"

# درگزین
ID=$(wp post list --post_type=city --name=dargazin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36999"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.25"

# رزن
ID=$(wp post list --post_type=city --name=razan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رزن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70588"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1887"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49"

# فامنین
ID=$(wp post list --post_type=city --name=famenin-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فامنین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39359"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1036"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.11667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.16667"

# ملایر
ID=$(wp post list --post_type=city --name=malayer-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ملایر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "288685"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4310"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "8"

# نهاوند
ID=$(wp post list --post_type=city --name=nahavand-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نهاوند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "174279"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1535"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1644"

# همدان
ID=$(wp post list --post_type=city --name=hamadan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "همدان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1"

# کبودرآهنگ
ID=$(wp post list --post_type=city --name=kabudarahang-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کبودرآهنگ"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "126062"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.36667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.36667"

