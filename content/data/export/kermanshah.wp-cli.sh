#!/usr/bin/env bash
set -euo pipefail

# اسلام‌آباد غرب
ID=$(wp post list --post_type=city --name=eslamabad-e-gharb --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسلامآباد غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "140876"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2125"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.05"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.66667"

# ثلاث باباجانی
ID=$(wp post list --post_type=city --name=salasa-babajani --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تازهآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35219"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.98333"

# جوانرود
ID=$(wp post list --post_type=city --name=javanrud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جوانرود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "75169"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "777"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.31667"

# دالاهو
ID=$(wp post list --post_type=city --name=dalahu --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرند غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35987"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1914"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.23333"

# روانسر
ID=$(wp post list --post_type=city --name=ravansar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "روانسر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47657"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.68333"

# سرپل ذهاب
ID=$(wp post list --post_type=city --name=sarpol-e-zahab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرپل ذهاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "85342"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1211"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "550"

# سنقر
ID=$(wp post list --post_type=city --name=sonqor --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سنقر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "81661"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2308"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1681"

# صحنه
ID=$(wp post list --post_type=city --name=sahneh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صحنه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70757"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.47861"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.6889"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1380"

# قصر شیرین
ID=$(wp post list --post_type=city --name=qasr-e-shirin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قصر شیرین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23929"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.63333"

# هرسین
ID=$(wp post list --post_type=city --name=harsin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هرسین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "78350"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1582"

# پاوه
ID=$(wp post list --post_type=city --name=paveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پاوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60431"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "802"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.3"

# کرمانشاه
ID=$(wp post list --post_type=city --name=kermanshah --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرمانشاه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1083833"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47"

# کنگاور
ID=$(wp post list --post_type=city --name=kangavar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کنگاور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "76216"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "930"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.48333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1456"

# گیلانغرب
ID=$(wp post list --post_type=city --name=gilangharb --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گیلانغرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "57007"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2586"

