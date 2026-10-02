#!/usr/bin/env bash
set -euo pipefail

# جعفرآباد
ID=$(wp post list --post_type=city --name=jafarabady --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جعفریه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21963"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1105"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.7725"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.55889"

# قم
ID=$(wp post list --post_type=city --name=qom-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1292283"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.05"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "25"

# کهک
ID=$(wp post list --post_type=city --name=kahak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کهک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "20588"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.39444"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.90417"

