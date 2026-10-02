#!/usr/bin/env bash
set -euo pipefail

# اسفراین
ID=$(wp post list --post_type=city --name=esfarayen --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسفراین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "120513"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5019"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "68"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "jovein - جنوب\nbam-safiabad - جنوب‌شرق\nfaruj - شمال‌شرق\nraz-jargalan - شمال\nshirvan - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "پستانداران\nمنطقه حفاظت شده\nاستان خراسان\nمناطق حفاظت شده"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.55"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "8"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.0,57.55"

# بام و صفی‌آباد
ID=$(wp post list --post_type=city --name=bam-safiabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صفیآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "16887"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1606"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "102"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "esfarayen - شمال‌غرب\nkhoshab - جنوب\njovein - غرب\nfaruj - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "شهر زیرزمینی جهان بام"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "رباط (کاروانسرای) راونیز"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.805"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.93611"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.805,57.93611"

# بجنورد
ID=$(wp post list --post_type=city --name=bojnord --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بجنورد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "324083"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "raz-jargalan - جنوب‌شرق\nmaneh-samalqan - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "گردشگاه باباامان\nبش قارداش\nاسفیدان\nحمید"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.58333,57.33333"

# جاجرم
ID=$(wp post list --post_type=city --name=jajarm --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جاجرم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36673"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3500"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "98"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "garmeh - غرب\njoghatai - جنوب‌شرق\nmaneh-samalqan - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "استان خراسان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "مسجد جامع جاجرم\nتپه پهلوان"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1000"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.0,56.5"

# راز و جرگلان
ID=$(wp post list --post_type=city --name=raz-jargalan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "راز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "59210"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2538"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "bojnord - شمال‌غرب\nshirvan - شرق\nesfarayen - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.56667,57.35"

# شیروان
ID=$(wp post list --post_type=city --name=shirvan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شیروان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "146140"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3789"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "50"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "faruj - جنوب‌شرق\nraz-jargalan - غرب\nesfarayen - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "کوهستان پارک شیرکوه\nآبشار استرخی\nکوه شاهجهان از رشته کوه آلاداغ\nکوه کپه داغ\nغار کافر قلعه\nغار پوستین دوز\nکوه‌های آلخاص\nترناو (چشمه‌ای دائمی با آب بسیار گوارا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "چهارطاقی تیموری\nFile:Fajrabad.jpg\nالله‌آباد علیا\nبهشت گمشده\nییلاق گلیان\nمنطقه حفاظت شده گلول وسرانی\nزوارم\nسدهای بارزو و شورک\nچلو\nییلاق اوغاز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "حمام روستای پیرشهید\nمقبره حضرت زکریا\nامامزاده حمزه رضا\nامام زاده محمدرضا مشهد طرقی\nامامزاده قاسم الحسینی روستای خادمی\nتپه کمرک\nتپه برزل‌آباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.53333,57.9"

# فاروج
ID=$(wp post list --post_type=city --name=faruj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فاروج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "49271"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1615"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "87"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shirvan - شمال‌غرب\nbam-safiabad - جنوب‌غرب\nesfarayen - جنوب‌غرب\ndargaz - شرق\nchenaran - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.22829"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.21542"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1280"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.22829,58.21542"

# مانه
ID=$(wp post list --post_type=city --name=maneh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پیشقلعه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "26082"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "58"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "maneh-samalqan - جنوب\nmaraveh-tappeh - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.88"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.79"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.88,56.79"

# مانه و سملقان
ID=$(wp post list --post_type=city --name=maneh-samalqan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آشخانه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "101727"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "8"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "36"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "bojnord - شرق\nmaneh - شمال\njajarm - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "چشمه آبگرم و دره کفترخانه مهمانک\nروستای تفریحی جنگلی درکش\nجنگل‌های هاور\nرودخانه شیرآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "جاذبه‌های گردشگری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "تپه‌های شهرآوا\nقلعه خان\nآتشکده اسپاخو\nامامزاده سلطان محمدابراهیم کشانک\nتپه تاریخی ریوی آشخانه در روستا نجف\nجاده پارک رضوان آشخانه\nآرامگاه استاد سهراب محمدی در امامزاده صالح آشخانه"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.55939"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.9213"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=37.55939,56.9213"

# گرمه
ID=$(wp post list --post_type=city --name=garmeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گرمه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "25475"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2407"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "9"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "114"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "jajarm - شرق\nmeyami - جنوب‌غرب\ngalikesh - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "جنگل گلستان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "جاذبه‌های گردشگری\nرباط عشق\nنارنج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "قلعه خداوردی درق\nمنجاق تپه\nتپه رباط عشق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.28333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2118"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.98333,56.28333"

