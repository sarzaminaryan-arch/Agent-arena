#!/usr/bin/env bash
set -euo pipefail

# آبدانان
ID=$(wp post list --post_type=city --name=abdanan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آبدانان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47851"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "850"

# ایلام
ID=$(wp post list --post_type=city --name=ilam-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ایلام"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "235144"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.60528"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.42278"

# ایوان
ID=$(wp post list --post_type=city --name=eyvan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ایوانغرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "49491"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1200"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_climate "معتدل و نیمه مرطوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.18333"

# بدره
ID=$(wp post list --post_type=city --name=badreh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بدره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "15614"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.25"

# دره‌شهر
ID=$(wp post list --post_type=city --name=darreh-shahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "درهشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43708"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "903"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.36667"

# دهلران
ID=$(wp post list --post_type=city --name=dehloran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهلران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "65630"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6777"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "213"

# سیروان
ID=$(wp post list --post_type=city --name=sirvan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لومار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "14404"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.56667"

# ملکشاهی
ID=$(wp post list --post_type=city --name=malekshahi --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ارکواز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21138"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.6"

# مهران
ID=$(wp post list --post_type=city --name=mehran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "29797"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.25"

# هلیلان
ID=$(wp post list --post_type=city --name=halilan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "توحید"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "15276"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "736"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.71861"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.15833"

# چرداول
ID=$(wp post list --post_type=city --name=chardavol --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرابله"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "57381"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "805"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.56667"

# چوار
ID=$(wp post list --post_type=city --name=chavar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چوار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1168"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "17"

