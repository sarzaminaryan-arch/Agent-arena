#!/usr/bin/env bash
set -euo pipefail

# اسلام‌آباد غرب
ID=$(wp post list --post_type=city --name=eslamabad-e-gharb --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسلامآباد غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "140876"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2125"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "44"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "chardavol - جنوب\nkarun - جنوب\nsirvan - جنوب\nkermanshah - شمال‌شرق\ndalahu - شمال‌غرب\neyvan - غرب\nhalilan - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.05"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.05,46.66667"

# ثلاث باباجانی
ID=$(wp post list --post_type=city --name=salasa-babajani --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تازهآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35219"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "107"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "sarpol-e-zahab - جنوب‌غرب\njavanrud - شرق\npaveh - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.81667,45.98333"

# جوانرود
ID=$(wp post list --post_type=city --name=javanrud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جوانرود"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "75169"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "777"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "79"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "paveh - شمال\nsalasa-babajani - غرب\nravansar - شرق\ndalahu - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.76667,46.31667"

# دالاهو
ID=$(wp post list --post_type=city --name=dalahu --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرند غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35987"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1914"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "71"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "gilangharb - جنوب‌غرب\neyvan - جنوب\neslamabad-e-gharb - جنوب‌شرق\nsarpol-e-zahab - شمال‌غرب\njavanrud - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "سراب کرند\nکوه قلعه قاضی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "یارسان\nریجاب\nحریر\nزمکان\nدالاهو\nمحمد\nاحد\nابوبکر"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.26667,46.23333"

# روانسر
ID=$(wp post list --post_type=city --name=ravansar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "روانسر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47657"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "55"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kamyaran - شمال‌شرق\njavanrud - غرب\nkermanshah - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "سراب روانسر\nسراب جاوری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "باستان‌شناسی\nپارینه سنگی\nدوران یخبندان\nدخمه روانسر\nماد\nاهورامزدا\nخط کوفی\nآشور\nنیکور\nیزدگرد سوم\nخط پهلوی"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.75,46.68333"

# سرپل ذهاب
ID=$(wp post list --post_type=city --name=sarpol-e-zahab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرپل ذهاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "85342"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1211"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "111"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "salasa-babajani - شمال‌شرق\nqasr-e-shirin - جنوب‌غرب\ngilangharb - جنوب\ndalahu - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "550"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.58333,45.83333"

# سنقر
ID=$(wp post list --post_type=city --name=sonqor --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سنقر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "81661"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2308"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "72"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "sahneh - جنوب‌شرق\nqorveh - شمال\nkamyaran - غرب\nasadabad-city - شرق\nkermanshah - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "سلجوقیان\nایران قاجاری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "آرامگاه مالک"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1681"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.83333,47.5"

# صحنه
ID=$(wp post list --post_type=city --name=sahneh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "صحنه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "70757"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "65"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kangavar - شرق\nharsin - جنوب‌غرب\nsonqor - شمال‌غرب\ndelfan - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.47861"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.6889"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1380"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.47861,47.6889"

# قصر شیرین
ID=$(wp post list --post_type=city --name=qasr-e-shirin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قصر شیرین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23929"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "126"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "gilangharb - شرق\nsarpol-e-zahab - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "چهارقاپی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "کاخ خسرو\nکاروانسرای عباسی قصر شیرین\nبان‌قلعه"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "45.63333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.2,45.63333"

# هرسین
ID=$(wp post list --post_type=city --name=harsin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هرسین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "78350"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "46"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "sahneh - شمال‌شرق\nkermanshah - غرب\ndelfan - جنوب‌شرق\nhalilan - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "تپه گنج‌دره\nسراب بیستون\nغار شکارچیان\nغار مرآفتاب\nغار چشمه‌سراب\nسراب هرسین\nچشمه گرماب هرسین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "گوردخمه اسحاق‌وند\nمجسمه هرکول\nحوض سنگی\nطاق سنگی\nپلکان سنگی\nفرهاد تراش\nفرهاد تراش\nسنگ‌نبشته بیستون\nسنگ بلاش\nگوردخمه‌های اسحاق‌وند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "کتیبه بیستون\nقلعه هرسین\nتپه قلعه دزد بر هرسین\nپل خسرو"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1582"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.33333,47.5"

# پاوه
ID=$(wp post list --post_type=city --name=paveh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پاوه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60431"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "802"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "98"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "javanrud - جنوب\nsarvabad - شمال\nsalasa-babajani - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "سد داریان\nغار سنگی حسین کوهکن\nکوه شاهو\nغار قوری‌قلعه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "نوسمه\nشمشیر\nخانقاه\nحجیج بزرگ\nپاوه\nنودشه\nمنطقه گردشگری میگوره\nکیمنه\nبیدرواز\nهانی‌گرمله\nداریان\nگلال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=35.0,46.3"

# کرمانشاه
ID=$(wp post list --post_type=city --name=kermanshah --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرمانشاه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1083833"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "eslamabad-e-gharb - جنوب‌غرب\nharsin - شرق\nravansar - شمال‌غرب\nhalilan - جنوب\nsonqor - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.33333,47.0"

# کنگاور
ID=$(wp post list --post_type=city --name=kangavar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کنگاور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "76216"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "930"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "87"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "sahneh - غرب\nnahavand-city - جنوب‌شرق\ntuyserkan-city - شرق\nasadabad-city - شمال‌شرق\ndelfan - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.48333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.93333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1456"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.48333,47.93333"

# گیلانغرب
ID=$(wp post list --post_type=city --name=gilangharb --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گیلانغرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "57007"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "94"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "dalahu - شمال‌شرق\nqasr-e-shirin - غرب\neyvan - جنوب‌شرق\nsarpol-e-zahab - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.16667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2586"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=34.16667,46.0"

