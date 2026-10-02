#!/usr/bin/env bash
set -euo pipefail

# آران و بیدگل
ID=$(wp post list --post_type=city --name=aran-bidgol --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آران و بیدگل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "103517"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6051"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52"

# اردستان
ID=$(wp post list --post_type=city --name=ardestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اردستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "42105"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "11591"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.45"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.43333"

# اصفهان
ID=$(wp post list --post_type=city --name=isfahan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اصفهان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "2243249"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "15689"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.62167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.75972"

# برخوار
ID=$(wp post list --post_type=city --name=borkhar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دولتآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "122419"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1952"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.8134"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.7361"

# بوئین و میاندشت
ID=$(wp post list --post_type=city --name=buin-miandasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بوئین و میاندشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "24163"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.07361"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.165"

# تیران و کرون
ID=$(wp post list --post_type=city --name=tiran-karvan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تیران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "71575"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1698"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.91667"

# جرقویه
ID=$(wp post list --post_type=city --name=jarqavieh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نیکآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "37607"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "8061"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.29333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.17889"

# خمینی‌شهر
ID=$(wp post list --post_type=city --name=khomeyni-shahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خمینیشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "319727"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "138.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.53333"

# خوانسار
ID=$(wp post list --post_type=city --name=khansar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خوانسار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "33049"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "952"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2215"

# خور و بیابانک
ID=$(wp post list --post_type=city --name=khur-biabanak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "19761"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "20"

# دهاقان
ID=$(wp post list --post_type=city --name=dehaqan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهاقان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "34511"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.6"

# سمیرم
ID=$(wp post list --post_type=city --name=semirom --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سمیرم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "74109"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5224"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2577"

# شاهین‌شهر
ID=$(wp post list --post_type=city --name=shahin-shahr-meymeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شاهینشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "234667"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1595"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.28333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.2"

# شهرضا
ID=$(wp post list --post_type=city --name=shahreza --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهرضا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "159797"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2820"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1825"

# فریدن
ID=$(wp post list --post_type=city --name=fereydan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "داران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "49890"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2400"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.00278"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.42222"

# فریدونشهر
ID=$(wp post list --post_type=city --name=fereydunshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فریدونشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35654"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50"

# فلاورجان
ID=$(wp post list --post_type=city --name=falavarjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فلاورجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "249814"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "313"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1600"

# لنجان
ID=$(wp post list --post_type=city --name=lenjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرینشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "262912"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1700"

# مبارکه
ID=$(wp post list --post_type=city --name=mobarakeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مبارکه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "150441"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.51667"

# میمه و وزوان
ID=$(wp post list --post_type=city --name=meymeh-vazvan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میمه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23057"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.43111"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.17806"

# نایین
ID=$(wp post list --post_type=city --name=nain --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نائین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39261"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.85995"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.08677"

# نجف‌آباد
ID=$(wp post list --post_type=city --name=najafabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نجفآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "319205"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2860"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1600"

# نطنز
ID=$(wp post list --post_type=city --name=natanz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نطنز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43977"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3397"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1600"

# هرند
ID=$(wp post list --post_type=city --name=harand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هرند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23863"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1162"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.28333"

# ورزنه
ID=$(wp post list --post_type=city --name=varzaneh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ورزنه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "27102"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2300"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.41944"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.61389"

# چادگان
ID=$(wp post list --post_type=city --name=chadegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چادگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "32479"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.63333"

# کاشان
ID=$(wp post list --post_type=city --name=kashan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کاشان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "364482"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4398"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "970"

# کوهپایه
ID=$(wp post list --post_type=city --name=kuhpayeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوهپایه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23676"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3047"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.85"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.4"

# گلپایگان
ID=$(wp post list --post_type=city --name=golpayegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گلپایگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "90086"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2836"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.33333"

