#!/usr/bin/env bash
set -euo pipefail

# اشتهارد
ID=$(wp post list --post_type=city --name=eshtehard --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اشتهارد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "37876"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.72806"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.41417"

# ساوجبلاغ
ID=$(wp post list --post_type=city --name=savojablogh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "259973"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.66667"

# طالقان
ID=$(wp post list --post_type=city --name=taleghan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "طالقان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "16815"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1200"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.20528"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.7761"

# فردیس
ID=$(wp post list --post_type=city --name=fardis --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فردیس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "271829"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.72306"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.97861"

# نظرآباد
ID=$(wp post list --post_type=city --name=nazarabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نظرآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "152437"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "587"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.51667"

# چهارباغ
ID=$(wp post list --post_type=city --name=chaharbagh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چهارباغ"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.83333"

# کرج
ID=$(wp post list --post_type=city --name=karaj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1956267"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51"

