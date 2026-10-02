#!/usr/bin/env bash
set -euo pipefail

# ایرانشهر
ID=$(wp post list --post_type=city --name=iranshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ایرانشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "193757"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.76806"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.03361"

# بمپور
ID=$(wp post list --post_type=city --name=bampur --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بمپور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60577"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3483"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.2"

# تفتان
ID=$(wp post list --post_type=city --name=taftan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نوکآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "44176"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4736"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.54"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.759"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "20"

# خاش
ID=$(wp post list --post_type=city --name=khash --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خاش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "128408"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "14640"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1410"

# دشتیاری
ID=$(wp post list --post_type=city --name=dashtiari --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نگور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "79911"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5271"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "25.61667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "28"

# دلگان
ID=$(wp post list --post_type=city --name=dalgan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گلمورتی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67857"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "11534"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.4854"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.4451"

# راسک
ID=$(wp post list --post_type=city --name=rask --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "راسک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94891"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.75"

# زابل
ID=$(wp post list --post_type=city --name=zabol --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زابل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "166448"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "344"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.03333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "475"

# زاهدان
ID=$(wp post list --post_type=city --name=zahedan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زاهدان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "770800"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "36581"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.48333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "88"

# زرآباد
ID=$(wp post list --post_type=city --name=zarabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "20344"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3140"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "25.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.4"

# زهک
ID=$(wp post list --post_type=city --name=zehak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زهک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "74114"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "802"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.8936"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.6795"

# سراوان
ID=$(wp post list --post_type=city --name=saravan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سراوان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "250000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "54"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.32333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "62.31778"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1365"

# سرباز
ID=$(wp post list --post_type=city --name=sarbaz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرباز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "91274"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5405"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.73833"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.18444"

# سیب و سوران
ID=$(wp post list --post_type=city --name=sib-va-suran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سوران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "85095"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7157"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.28463"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.99998"

# فنوج
ID=$(wp post list --post_type=city --name=fanuj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فنوج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47827"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4084"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.78333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "185"

# قصرقند
ID=$(wp post list --post_type=city --name=qasr-e-qand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قصرقند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "61442"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.11667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "541"

# لاشار
ID=$(wp post list --post_type=city --name=lashar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسپکه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35307"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2707"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.16667"

# مهرستان
ID=$(wp post list --post_type=city --name=mehrestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهرستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70579"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6101"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.12637"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.6737"

# میرجاوه
ID=$(wp post list --post_type=city --name=mirjaveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "میرجاوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "45357"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6054"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.02583"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.45611"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "837"

# نیمروز
ID=$(wp post list --post_type=city --name=nimruz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ادیمی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "48471"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9714"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.10333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.41601"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "488"

# نیک‌شهر
ID=$(wp post list --post_type=city --name=nik-shahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نیکشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "141894"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "10823"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "26.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "19"

# هامون
ID=$(wp post list --post_type=city --name=hamun --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "محمدآباد (سیستان و بلوچستان)"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "41017"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4987"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "476"

# هیرمند
ID=$(wp post list --post_type=city --name=hirmand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دوستمحمد(شهر)"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "63979"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1012"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.1449"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.791"

# چابهار
ID=$(wp post list --post_type=city --name=chabahar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چابهار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "203293"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2475"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "25.50167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.80556"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "8"

# کنارک
ID=$(wp post list --post_type=city --name=konarak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کنارک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "77818"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "25.35806"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.39806"

# گلشن
ID=$(wp post list --post_type=city --name=golshan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جالق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "29056"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5300"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "62.46667"

