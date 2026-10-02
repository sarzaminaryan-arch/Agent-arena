#!/usr/bin/env bash
set -euo pipefail

# آذرشهر
ID=$(wp post list --post_type=city --name=azarshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آذرشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "110311"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.86667"

# اسکو
ID=$(wp post list --post_type=city --name=osku --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسکو"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "158270"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1763"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.11667"

# اهر
ID=$(wp post list --post_type=city --name=ahar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "154530"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2120"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.28333"

# بستان‌آباد
ID=$(wp post list --post_type=city --name=bostanabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بستانآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94769"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2795"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.83333"

# بناب
ID=$(wp post list --post_type=city --name=bonab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بناب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "134892"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "778"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.05"

# تبریز
ID=$(wp post list --post_type=city --name=tabriz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تبریز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1773033"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1781"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.28333"

# ترکمانچای
ID=$(wp post list --post_type=city --name=torkamanchay --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ترکمانچای"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21387"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.41667"

# جلفا
ID=$(wp post list --post_type=city --name=jolfa --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جلفا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "61358"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1670"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.85"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.8"

# خداآفرین
ID=$(wp post list --post_type=city --name=khoda-afarin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خمارلو"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "32995"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1526"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.13751"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.96113"

# سراب
ID=$(wp post list --post_type=city --name=sarab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سراب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "125341"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.93982"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.53694"

# شبستر
ID=$(wp post list --post_type=city --name=shabestar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شبستر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "135421"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2750"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.73333"

# عجب‌شیر
ID=$(wp post list --post_type=city --name=ajabshir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عجبشیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70852"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "738"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.03333"

# مراغه
ID=$(wp post list --post_type=city --name=maragheh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مراغه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "262604"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2185"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.4"

# مرند
ID=$(wp post list --post_type=city --name=marand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مرند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "244971"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3286"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.48333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.71667"

# ملکان
ID=$(wp post list --post_type=city --name=malekan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ملکان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "111319"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "33"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.21667"

# میانه
ID=$(wp post list --post_type=city --name=mianeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میانه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "182848"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.7"

# هریس
ID=$(wp post list --post_type=city --name=heris --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هریس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "69093"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.23058"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.84011"

# هشترود
ID=$(wp post list --post_type=city --name=hashtrud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هشترود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "57199"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1990"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.4667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.9168"

# هوراند
ID=$(wp post list --post_type=city --name=hurand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هوراند"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.36667"

# ورزقان
ID=$(wp post list --post_type=city --name=varzaqan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ورزقان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "52650"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4570"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.50779"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.64607"

# چاراویماق
ID=$(wp post list --post_type=city --name=charoymaq --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قرهآغاج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "31071"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3208"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.16667"

# کلیبر
ID=$(wp post list --post_type=city --name=kaleybar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کلیبر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "46125"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2072"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.05"

