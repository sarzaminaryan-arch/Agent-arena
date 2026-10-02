#!/usr/bin/env bash
set -euo pipefail

# آبادان
ID=$(wp post list --post_type=city --name=abadan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آبادان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "298090"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2267"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.56667"

# آغاجاری
ID=$(wp post list --post_type=city --name=aghajari --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آغاجاری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "17654"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1418"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.70056"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.83139"

# امیدیه
ID=$(wp post list --post_type=city --name=omidiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "امیدیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "92335"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.7"

# اندیمشک
ID=$(wp post list --post_type=city --name=andimeshk --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اندیمشک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "291412"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "176"

# اندیکا
ID=$(wp post list --post_type=city --name=andika --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قلعه خواجه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47629"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2369"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.20639"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.44361"

# اهواز
ID=$(wp post list --post_type=city --name=ahvaz-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اهواز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1302591"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.3275"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.69389"

# ایذه
ID=$(wp post list --post_type=city --name=izeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ایذه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "72"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2504"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.98333"

# باغملک
ID=$(wp post list --post_type=city --name=bagh-e-malek --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "باغملک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "83138"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1821"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "917"

# باوی
ID=$(wp post list --post_type=city --name=bavi --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ملاثانی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "96484"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1377"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.95"

# بهبهان
ID=$(wp post list --post_type=city --name=behbahan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بهبهان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "180593"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.25"

# حمیدیه
ID=$(wp post list --post_type=city --name=hamidiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "حمیدیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "53762"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.46667"

# خرمشهر
ID=$(wp post list --post_type=city --name=khorramshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خرمشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "170976"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.18333"

# دزفول
ID=$(wp post list --post_type=city --name=dezful --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دزفول"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "443971"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4762"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "12"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.76667"

# دزپارت
ID=$(wp post list --post_type=city --name=dezpart --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهدز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "19341"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.23333"

# دشت آزادگان
ID=$(wp post list --post_type=city --name=dasht-azadegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سوسنگرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "107989"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1973"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.06667"

# رامشیر
ID=$(wp post list --post_type=city --name=ramshir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رامشیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54004"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1587"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.4"

# رامهرمز
ID=$(wp post list --post_type=city --name=ramhormoz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رامهرمز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "113776"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1818"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.65"

# شادگان
ID=$(wp post list --post_type=city --name=shadegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شادگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "138480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3598"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.66667"

# شوش
ID=$(wp post list --post_type=city --name=shush --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شوش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "136389"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2169"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.03333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.21667"

# شوشتر
ID=$(wp post list --post_type=city --name=shushtar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شوشتر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "192028"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.83333"

# لالی
ID=$(wp post list --post_type=city --name=lali --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لالی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70963"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.2"

# ماهشهر
ID=$(wp post list --post_type=city --name=mahshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر ماهشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "296271"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2956"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49"

# مسجدسلیمان
ID=$(wp post list --post_type=city --name=masjed-soleyman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مسجدسلیمان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "113419"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2184"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.26667"

# هفتکل
ID=$(wp post list --post_type=city --name=haftkel --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هفتکل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "22119"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1420"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.4"

# هندیجان
ID=$(wp post list --post_type=city --name=hendijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هندیجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38762"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.66667"

# هویزه
ID=$(wp post list --post_type=city --name=hoveyzeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هویزه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38886"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2714"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.4623"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.07396"

# کارون
ID=$(wp post list --post_type=city --name=karun --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوت عبدالله"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "105872"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1198"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.56667"

# کرخه
ID=$(wp post list --post_type=city --name=karkheh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "الوان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "69331"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1498"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.4"

# گتوند
ID=$(wp post list --post_type=city --name=gotvand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گتوند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "65468"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.24543"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.81416"

