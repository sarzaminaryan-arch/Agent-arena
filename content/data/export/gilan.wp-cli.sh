#!/usr/bin/env bash
set -euo pipefail

# آستارا
ID=$(wp post list --post_type=city --name=astara --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آستارا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "91257"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "344"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "144"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "namin - غرب\ntalesh - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "جنگل فندقلو\nساحل صدف\nبازار بزرگ ساحلی آستارا\nتالاب استیل\nآبشار لاتون\nپارک جنگلی بی‌بی یانلو\nکوه اسپیناس\nچشمه آب گرم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "حیران\nکوته کومه\nگیلده\nپناهگاه حیات وحش لوندویل\nایرنا\nآستاراچای\nدوره ایلخانی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_recreation "تله کابین حیران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "باغ پرندگان آستارا"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=38.33333,48.76667"

# آستانه اشرفیه
ID=$(wp post list --post_type=city --name=astaneh-ye-ashrafiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آستانه اشرفیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "108130"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "426"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "24"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "lahijan - جنوب‌شرق\nrasht - غرب\nkhomam - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.96667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "-2"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.31667,49.96667"

# املش
ID=$(wp post list --post_type=city --name=amlash --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "املش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43225"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "51"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "langarud - شمال\nsiahkal - غرب\nrudsar - جنوب‌شرق\nramsar - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "شیردره\nرانکوه\nباباجان دره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "بیلی لنگه\nتابستان نشین\nهالیدشت\nهلودشت\nخصیل دشت\nورکوره\nشلیشه\nبلوردکان\nامام\nسرتربت\nکجید\nدهستان سمام"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.98333,50.15"

# انزلی
ID=$(wp post list --post_type=city --name=bandar-e-anzali --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر انزلی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "139016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "315"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "36"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "someh-sara - جنوب\nkhomam - شرق\nrezvanshahr - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "شهرهای ایران"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.4719"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.3889"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.4719,49.3889"

# تالش
ID=$(wp post list --post_type=city --name=talesh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هشتپر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "200649"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2373"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "92"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "rezvanshahr - جنوب\nkhalkhal - جنوب‌غرب\nastara - شمال\nardabil-city - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "آبشار چارگو\nآبشار نیلرود جوکندان\nتالاب جوکندان\nپارک جنگلی\nآبشار زمرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "سیاهداران\nسورتمه تالش\nقروق\nتازه‌آباد\nمریان\nریک\nییلاق\nسوئتون\nلیسار\nسلسال\nآسبومار\nجوکندان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "کاخ سردار امجد"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.80142"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.90669"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.80142,48.90669"

# خمام
ID=$(wp post list --post_type=city --name=khomam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خمام"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "160"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "17"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "rasht - جنوب\nbandar-e-anzali - غرب\nastaneh-ye-ashrafiyeh - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.41667,49.68333"

# رشت
ID=$(wp post list --post_type=city --name=rasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "956971"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "khomam - شمال\nastaneh-ye-ashrafiyeh - شرق\nsomeh-sara - غرب\nshaft - جنوب‌غرب\nfuman - غرب\nsiahkal - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "میرزا کوچک خان جنگلی\nتالاب عینک\nپارک جنگلی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "دریای کاسپین\nتقاطع غیرهمسطح"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_recreation "پارک شهر\nپارک مفاخر رشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "موزه میراث روستایی گیلان\nامامزاده هاشم\nمسجد حاج صمد خان\nمسجد صفی\nموزه رشت\nمیدان شهرداری"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.26667,49.7"

# رضوانشهر
ID=$(wp post list --post_type=city --name=rezvanshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهرستان رضوانشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "69865"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "748"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "73"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "masal - جنوب\ntalesh - شمال\nkhalkhal - غرب\nbandar-e-anzali - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.53333,48.95"

# رودبار
ID=$(wp post list --post_type=city --name=rudbar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رودبار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "94720"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2574"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "51"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "siahkal - شمال‌شرق\nshaft - شمال‌غرب\nqazvin-city - جنوب‌شرق\nkharadere - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1050"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.81667,49.58333"

# رودسر
ID=$(wp post list --post_type=city --name=rudsar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رودسر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "147399"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1310"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "83"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ramsar - شمال‌شرق\namlash - شمال‌غرب\nqazvin-city - جنوب‌غرب\nalborz-qazvin - جنوب\nabyek - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "کیانیان\nشمال ایران"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "گنبدپیرمحله"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "19"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.7,50.3"

# سیاهکل
ID=$(wp post list --post_type=city --name=siahkal --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیاهکل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "46975"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "41"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "amlash - شرق\nrudbar - جنوب‌غرب\nrasht - شمال‌غرب\nqazvin-city - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.93333,49.9"

# شفت
ID=$(wp post list --post_type=city --name=shaft --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شفت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54226"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "586"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "33"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "fuman - شمال‌غرب\nrasht - شمال‌شرق\nrudbar - جنوب‌شرق\ntarom - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "آبشار دودوزن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "سقالکسار\nکلاچ خندان\nدهستان جیرده\nگیلده\nچوبر\nایران قاجاری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "امامزاده‌اسحق\nامامزاده ابراهیم\nبقعه متبرکه شاه درویشان\nپل لیشاوندان"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "15"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.08333,49.4"

# صومعه‌سرا
ID=$(wp post list --post_type=city --name=someh-sara --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صومعهسرا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "125074"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "633"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "33"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "fuman - جنوب\nbandar-e-anzali - شمال\nmasal - غرب\nrasht - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.33333,49.33333"

# فومن
ID=$(wp post list --post_type=city --name=fuman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فومن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "92310"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1002"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "34"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "someh-sara - شمال\nshaft - جنوب‌شرق\nrasht - شرق\ntarom - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "ماسوله\nفومن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "قلعه رودخان"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.21667,49.31667"

# لاهیجان
ID=$(wp post list --post_type=city --name=lahijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لاهیجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "167544"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "407"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "30"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "astaneh-ye-ashrafiyeh - شمال‌غرب\nlangarud - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.03333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.23333,50.03333"

# لنگرود
ID=$(wp post list --post_type=city --name=langarud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لنگرود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "140686"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "41"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "lahijan - شمال‌غرب\namlash - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.15,50.13333"

# ماسال
ID=$(wp post list --post_type=city --name=masal --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ماسال"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "52649"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "622"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "63"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "rezvanshahr - شمال\nsomeh-sara - شرق\ntarom - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "84"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.38333,49.0"

