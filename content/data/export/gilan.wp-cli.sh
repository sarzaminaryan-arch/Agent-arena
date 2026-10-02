#!/usr/bin/env bash
set -euo pipefail

# آستارا
ID=$(wp post list --post_type=city --name=astara --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آستارا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94200"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "344"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.76667"

# آستانه اشرفیه
ID=$(wp post list --post_type=city --name=astaneh-ye-ashrafiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آستانه اشرفیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "426"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.96667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "-2"

# املش
ID=$(wp post list --post_type=city --name=amlash --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "املش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43225"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.15"

# انزلی
ID=$(wp post list --post_type=city --name=bandar-e-anzali --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر انزلی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "505"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "315"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.4719"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.3889"

# تالش
ID=$(wp post list --post_type=city --name=talesh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هشتپر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "200649"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2373"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.80142"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.90669"

# خمام
ID=$(wp post list --post_type=city --name=khomam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خمام"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54860"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "160"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.68333"

# رشت
ID=$(wp post list --post_type=city --name=rasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "998000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.7"

# رضوانشهر
ID=$(wp post list --post_type=city --name=rezvanshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهرستان رضوانشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "106909"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "748"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.95"

# رودبار
ID=$(wp post list --post_type=city --name=rudbar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رودبار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "95000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2574"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1050"

# رودسر
ID=$(wp post list --post_type=city --name=rudsar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رودسر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "147399"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1310"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "19"

# سیاهکل
ID=$(wp post list --post_type=city --name=siahkal --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیاهکل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "46975"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.9"

# شفت
ID=$(wp post list --post_type=city --name=shaft --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شفت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54226"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "586"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "15"

# صومعه‌سرا
ID=$(wp post list --post_type=city --name=someh-sara --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صومعهسرا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "145074"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "633"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.33333"

# فومن
ID=$(wp post list --post_type=city --name=fuman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فومن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "104000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1002"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.31667"

# لاهیجان
ID=$(wp post list --post_type=city --name=lahijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لاهیجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "167544"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "407"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.03333"

# لنگرود
ID=$(wp post list --post_type=city --name=langarud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لنگرود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "140686"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.13333"

# ماسال
ID=$(wp post list --post_type=city --name=masal --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ماسال"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "52649"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "622"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "84"

