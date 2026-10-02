#!/usr/bin/env bash
set -euo pipefail

# باخرز
ID=$(wp post list --post_type=city --name=bakharz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "باخرز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54615"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1889"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.005"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.33361"

# بجستان
ID=$(wp post list --post_type=city --name=bajestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بجستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "31207"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5476"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.51627"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.18332"

# تایباد
ID=$(wp post list --post_type=city --name=taybad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تایباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "117564"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2929"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "810"

# تربت حیدریه
ID=$(wp post list --post_type=city --name=torbat-heydarieh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تربت حیدریه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "224626"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3681"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "14"

# جغتای
ID=$(wp post list --post_type=city --name=joghatai --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جغتای"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "49175"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1716"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.63566"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.07351"

# جوین
ID=$(wp post list --post_type=city --name=jovein --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نقاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54488"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1653"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.70523"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.41732"

# خلیل‌آباد
ID=$(wp post list --post_type=city --name=khalilabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خلیلآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51701"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.21667"

# خواف
ID=$(wp post list --post_type=city --name=khaf --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خواف"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "138972"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9827"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60"

# خوشاب
ID=$(wp post list --post_type=city --name=khoshab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سلطانآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "37181"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1869"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.06667"

# داورزن
ID=$(wp post list --post_type=city --name=davarzan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "داورزن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21911"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "1"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.08333"

# درگز
ID=$(wp post list --post_type=city --name=dargaz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "درگز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "72355"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3777"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.08333"

# رشتخوار
ID=$(wp post list --post_type=city --name=roshtkhar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رشتخوار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60689"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3598"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.36667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1150"

# زاوه
ID=$(wp post list --post_type=city --name=zaveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دولتآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67695"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2575"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.2825"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.5215"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1750"

# سرخس
ID=$(wp post list --post_type=city --name=sarakhs --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرخس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "97519"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5397"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "1"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.81667"

# ششتمد
ID=$(wp post list --post_type=city --name=sheshtamad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ششتمد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "24261"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2937"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.93333"

# صالح‌آباد
ID=$(wp post list --post_type=city --name=saleh-abad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صالحآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43426"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3183"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.68806"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "61.09556"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "3"

# فریمان
ID=$(wp post list --post_type=city --name=fariman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فریمان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "99001"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3356"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.83333"

# فیروزه
ID=$(wp post list --post_type=city --name=firuzeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فیروزه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "37539"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1600"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.28583"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.58611"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1200"

# مه‌ولات
ID=$(wp post list --post_type=city --name=mahvelat --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فیضآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51409"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3317"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.01814"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.78916"

# میان‌جلگه
ID=$(wp post list --post_type=city --name=mian-jolgeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عشقآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39288"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2911"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "15"

# چناران
ID=$(wp post list --post_type=city --name=chenaran --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چناران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "155013"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2073"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.15"

# کاشمر
ID=$(wp post list --post_type=city --name=kashmar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کاشمر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "168664"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1151"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.23833"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.46556"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1060"

# کلات
ID=$(wp post list --post_type=city --name=kalat --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کلات"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36237"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3503"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.9"

# کوهسرخ
ID=$(wp post list --post_type=city --name=kuhsorkh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ریوش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "25014"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2198"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35.46667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.45"

# گلبهار
ID=$(wp post list --post_type=city --name=golbahar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گلبهار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1007"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.49722"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.19444"

# گناباد
ID=$(wp post list --post_type=city --name=gonabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گناباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "88753"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5789"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1105"

# بردسکن
ID=$(wp post list --post_type=city --name=bardaskan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7126"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"

# مشهد
ID=$(wp post list --post_type=city --name=mashhad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9169"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"

# نیشابور
ID=$(wp post list --post_type=city --name=neyshabur --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"

# سبزوار
ID=$(wp post list --post_type=city --name=sabzevar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7217"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"

# قوچان
ID=$(wp post list --post_type=city --name=quchan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"

# تربت جام
ID=$(wp post list --post_type=city --name=torbatjam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4967"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "5"

# بینالود
ID=$(wp post list --post_type=city --name=binalud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1158"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "32"

# زبرخان
ID=$(wp post list --post_type=city --name=zebarkhan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1102"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1250"

