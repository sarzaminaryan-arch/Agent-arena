#!/usr/bin/env bash
set -euo pipefail

# آزادشهر
ID=$(wp post list --post_type=city --name=azadshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آزادشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "96110"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.125"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.1"

# آق‌قلا
ID=$(wp post list --post_type=city --name=aq-qala --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آققلا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "132733"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.58333"

# ترکمن
ID=$(wp post list --post_type=city --name=bandar-e-torkaman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر ترکمن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "79978"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.2"

# رامیان
ID=$(wp post list --post_type=city --name=ramian --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رامیان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "86210"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.21667"

# علی‌آباد
ID=$(wp post list --post_type=city --name=aliabad-e-katul --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "علیآباد کتول"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "140709"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.83333"

# مراوه‌تپه
ID=$(wp post list --post_type=city --name=maraveh-tappeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مراوهتپه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60953"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "350"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.95"

# مینودشت
ID=$(wp post list --post_type=city --name=minudasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مینودشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "75483"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "662"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.5"

# کردکوی
ID=$(wp post list --post_type=city --name=kordkuy --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کردکوی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.69167"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.2"

# کلاله
ID=$(wp post list --post_type=city --name=kalaleh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کلاله"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "117319"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.71667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.81667"

# گالیکش
ID=$(wp post list --post_type=city --name=galikesh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گالیکش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "59975"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.65"

# گرگان
ID=$(wp post list --post_type=city --name=gorgan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گرگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "480541"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.5"

# گز
ID=$(wp post list --post_type=city --name=bandar-e-gaz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر گز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "46130"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.71667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.96667"

# گمیشان
ID=$(wp post list --post_type=city --name=gomishan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گمیشان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "68773"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.15"

# گنبد کاووس
ID=$(wp post list --post_type=city --name=gonbad-e-kavus --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گنبد کاووس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "348744"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5071"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55"

