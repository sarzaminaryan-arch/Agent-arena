#!/usr/bin/env bash
set -euo pipefail

# ابرکوه
ID=$(wp post list --post_type=city --name=abarkuh-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ابرکوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51552"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5381"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.41667"

# اردکان
ID=$(wp post list --post_type=city --name=ardakan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اردکان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "97960"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "23880"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54"

# اشکذر
ID=$(wp post list --post_type=city --name=ashkezar-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اشکذر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "32556"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1813"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.66667"

# بافق
ID=$(wp post list --post_type=city --name=bafq-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بافق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51073"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "8596"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.65"

# بهاباد
ID=$(wp post list --post_type=city --name=behabad-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بهاباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "16993"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6646"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.01667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1390"

# تفت
ID=$(wp post list --post_type=city --name=taft-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تفت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43893"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5846"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.83333"

# خاتم
ID=$(wp post list --post_type=city --name=khatam-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هرات"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3087"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.33333"

# زارچ
ID=$(wp post list --post_type=city --name=zarch-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زارچ"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "20786"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "905"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.07611"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.51361"

# مروست
ID=$(wp post list --post_type=city --name=marvast-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مروست"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "15150"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5242"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1541"

# مهریز
ID=$(wp post list --post_type=city --name=mehriz-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهریز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51733"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6687"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.5"

# میبد
ID=$(wp post list --post_type=city --name=meybod-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میبد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "99727"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5054"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.83333"

# یزد
ID=$(wp post list --post_type=city --name=yazd-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "یزد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "635687"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1617"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.45"

