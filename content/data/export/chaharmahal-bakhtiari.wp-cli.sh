#!/usr/bin/env bash
set -euo pipefail

# اردل
ID=$(wp post list --post_type=city --name=ardal --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اردل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "48880"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1800"

# بروجن
ID=$(wp post list --post_type=city --name=borujen --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بروجن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "122483"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2257"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.2"

# بن
ID=$(wp post list --post_type=city --name=ben --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "28326"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "823"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "3105"

# سامان
ID=$(wp post list --post_type=city --name=saman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "34616"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "479"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.4498"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.91379"

# شهرکرد
ID=$(wp post list --post_type=city --name=shahrekord --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهرکرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "315980"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2006"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.8"

# فارسان
ID=$(wp post list --post_type=city --name=farsan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فارسان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "95286"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "38"

# فرخ‌شهر
ID=$(wp post list --post_type=city --name=farrokhshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "37068"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "583"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.18667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.05556"

# فلارد
ID=$(wp post list --post_type=city --name=falard --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "33023"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "579"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.2"

# لردگان
ID=$(wp post list --post_type=city --name=lordegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لردگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "209681"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1828"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.83333"

# کوهرنگ
ID=$(wp post list --post_type=city --name=kuhrang --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چلگرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "41535"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3712"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2350"

# کیار
ID=$(wp post list --post_type=city --name=kiar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شلمزار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "50976"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1408"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.04614"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.81684"

# خانمیرزا
ID=$(wp post list --post_type=city --name=khanmirza --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36360"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "936"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1880"

