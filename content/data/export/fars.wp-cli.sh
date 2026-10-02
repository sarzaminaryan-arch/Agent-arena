#!/usr/bin/env bash
set -euo pipefail

# آباده
ID=$(wp post list --post_type=city --name=abadeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آباده"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "100831"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6670"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.5"

# ارسنجان
ID=$(wp post list --post_type=city --name=arsanjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ارسنجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "42725"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.41667"

# استهبان
ID=$(wp post list --post_type=city --name=estahban --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "استهبان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "68850"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2652"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.11667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1767"

# اقلید
ID=$(wp post list --post_type=city --name=eqlid --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اقلید"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "93763"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7054"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2300"

# اوز
ID=$(wp post list --post_type=city --name=evaz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "40731"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.88333"

# بختگان
ID=$(wp post list --post_type=city --name=bakhtegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آباده طشک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "32224"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.63333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.86667"

# بوانات
ID=$(wp post list --post_type=city --name=bavanat --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بوانات"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "50418"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.66667"

# بیضا
ID=$(wp post list --post_type=city --name=beyza --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بیضا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39883"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.41667"

# جهرم
ID=$(wp post list --post_type=city --name=jahrom --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جهرم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "228532"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3925"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.64167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.55833"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1050"

# جویم
ID=$(wp post list --post_type=city --name=jooyom --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جویم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "25081"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1875"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.28"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.99722"

# خرامه
ID=$(wp post list --post_type=city --name=kharameh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خرامه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54864"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1500"

# خرم‌بید
ID=$(wp post list --post_type=city --name=khorrambid --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صفاشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "50522"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.08333"

# خفر
ID=$(wp post list --post_type=city --name=khafr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "باب انار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "42263"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1815"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1300"

# خنج
ID=$(wp post list --post_type=city --name=khonj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خنج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "41359"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4420"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.08333"

# داراب
ID=$(wp post list --post_type=city --name=darab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "داراب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "201489"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6592"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1170"

# رستم
ID=$(wp post list --post_type=city --name=rostam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مصیری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "44386"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1054"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "920"

# زرقان
ID=$(wp post list --post_type=city --name=zarghan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرقان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "56104"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "827"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.86667"

# زرین‌دشت
ID=$(wp post list --post_type=city --name=zarrin-dasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "حاجیآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "73199"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4569"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1021"

# سروستان
ID=$(wp post list --post_type=city --name=sarvestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سروستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38114"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.2749"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.21967"

# سرچهان
ID=$(wp post list --post_type=city --name=sarchahan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرهای"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23129"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2103"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2450"

# سپیدان
ID=$(wp post list --post_type=city --name=sepidan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اردکان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "91049"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1935"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.1"

# شیراز
ID=$(wp post list --post_type=city --name=shiraz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شیراز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1869001"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5283"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.61"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.53"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1585"

# فراشبند
ID=$(wp post list --post_type=city --name=farashband --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فراشبند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "45459"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2500"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "850"

# فسا
ID=$(wp post list --post_type=city --name=fasa --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فسا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "205187"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4309"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.96667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1456"

# فیروزآباد
ID=$(wp post list --post_type=city --name=firuzabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فیروزآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "121417"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3579"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.56667"

# قیر و کارزین
ID=$(wp post list --post_type=city --name=qir-va-karzin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "71203"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "250"

# لارستان
ID=$(wp post list --post_type=city --name=larestan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "213920"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "10740"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "950"

# لامرد
ID=$(wp post list --post_type=city --name=lamerd --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لامرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "91782"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.45"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "52"

# مرودشت
ID=$(wp post list --post_type=city --name=marvdasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مرودشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "323434"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3687"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "8"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.66667"

# ممسنی
ID=$(wp post list --post_type=city --name=mamasani --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نورآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "117527"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.4"

# مهر
ID=$(wp post list --post_type=city --name=mehr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "64827"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.78333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1738"

# نی‌ریز
ID=$(wp post list --post_type=city --name=neyriz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نیریز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "113291"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7328"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1595"

# پاسارگاد
ID=$(wp post list --post_type=city --name=pasargad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سعادتشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "30118"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.15"

# چنارشاهیجان
ID=$(wp post list --post_type=city --name=chenar-shahijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قائمیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "45638"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.7"

# کازرون
ID=$(wp post list --post_type=city --name=kazerun --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کازرون"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "211341"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2062"

# کوار
ID=$(wp post list --post_type=city --name=kavar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "83883"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1589"

# گراش
ID=$(wp post list --post_type=city --name=gerash --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گراش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "53907"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.65"

