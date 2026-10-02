#!/usr/bin/env bash
set -euo pipefail

# بوشهر
ID=$(wp post list --post_type=city --name=bushehr-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر بوشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "298594"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "1386"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

# تنگستان
ID=$(wp post list --post_type=city --name=ahram --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اهرم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "76706"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1950"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

# جم
ID=$(wp post list --post_type=city --name=jam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70051"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1444"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "700"

# دشتستان
ID=$(wp post list --post_type=city --name=borazjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "برازجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "252047"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6327"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.28333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

# دشتی
ID=$(wp post list --post_type=city --name=khormoj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خورموج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94700"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.48333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.55"

# دیر
ID=$(wp post list --post_type=city --name=deyr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر دیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60612"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.04028"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.70222"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

# دیلم
ID=$(wp post list --post_type=city --name=deylam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر دیلم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "34828"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.02278"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.35583"

# عسلویه
ID=$(wp post list --post_type=city --name=asaluyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عسلویه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "106"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "698"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

# کنگان
ID=$(wp post list --post_type=city --name=kangan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر کنگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "57"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1889"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

# گناوه
ID=$(wp post list --post_type=city --name=ganaveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر گناوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "102484"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1877"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "77"

