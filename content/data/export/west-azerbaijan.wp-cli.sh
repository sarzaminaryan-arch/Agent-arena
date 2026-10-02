#!/usr/bin/env bash
set -euo pipefail

# ارومیه
ID=$(wp post list --post_type=city --name=urmia --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ارومیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1040565"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5251"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45"

# اشنویه
ID=$(wp post list --post_type=city --name=oshnavieh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اشنویه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "73886"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1187"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.04917"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.12278"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1"

# باروق
ID=$(wp post list --post_type=city --name=baruq --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "باروق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "22385"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "932"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.61667"

# بوکان
ID=$(wp post list --post_type=city --name=bukan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بوکان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "251409"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2541"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1300"

# تکاب
ID=$(wp post list --post_type=city --name=takab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تکاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "80556"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2187"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.53345"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.16669"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1840"

# خوی
ID=$(wp post list --post_type=city --name=khoy --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خوی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "348664"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5548"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "44.95"

# سردشت
ID=$(wp post list --post_type=city --name=sardasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سردشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "118849"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1411"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.2167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.4832"

# سلماس
ID=$(wp post list --post_type=city --name=salmas --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سلماس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "196546"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2544"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "44.73333"

# شاهین‌دژ
ID=$(wp post list --post_type=city --name=shahin-dezh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شاهیندژ"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "92456"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2144"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1352"

# شوط
ID=$(wp post list --post_type=city --name=showt --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شوط"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "55682"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "931"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "44.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1036"

# ماکو
ID=$(wp post list --post_type=city --name=maku --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهرستان ماکو"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94751"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1931"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.41669"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "44.58336"

# مهاباد
ID=$(wp post list --post_type=city --name=mahabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهاباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "236849"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2591"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.73333"

# میاندوآب
ID=$(wp post list --post_type=city --name=miandoab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میاندوآب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "225345"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "845"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.89999"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.20002"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1300"

# میرآباد
ID=$(wp post list --post_type=city --name=mirabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میرآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "22700"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.32028"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.40917"

# نقده
ID=$(wp post list --post_type=city --name=naqadeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نقده"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "127671"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1050"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.4"

# پلدشت
ID=$(wp post list --post_type=city --name=poldasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پلدشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "42170"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.06667"

# پیرانشهر
ID=$(wp post list --post_type=city --name=piranshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پیرانشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "138864"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2259"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1502"

# چالدران
ID=$(wp post list --post_type=city --name=chaldoran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیهچشمه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "45060"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.06667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "44.33333"

# چایپاره
ID=$(wp post list --post_type=city --name=chaypareh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قرهضیاءالدین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47292"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.16667"

# چهاربرج
ID=$(wp post list --post_type=city --name=chaharborj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چهاربرج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "26219"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "316"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.9"

