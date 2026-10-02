#!/usr/bin/env bash
set -euo pipefail

# ارزوئیه
ID=$(wp post list --post_type=city --name=arzuiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ارزوئیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38510"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4980"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "209"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "baft - شرق\nbardsir - شمال\nsirjan - شمال‌غرب\nhajiabad - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.3728"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1044"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.1,56.3728"

# انار
ID=$(wp post list --post_type=city --name=anar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "انار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36897"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2140"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "260"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "rafsanjan - جنوب‌شرق\nshahr-e-babak - جنوب‌غرب\nmehriz-city - شمال‌غرب\nkuhbanan - شمال‌شرق\nmarvast-city - غرب\nbafq-city - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.85"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.85,55.35"

# بافت
ID=$(wp post list --post_type=city --name=baft --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بافت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "84103"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6465"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "198"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "arzuiyeh - غرب\nrabor - شرق\nbardsir - شمال\nfaryab - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "File:کوه شاه کیسکان.jpg\nکوه شاه\nغار جفریز\nآبشار سه کاسه\nسد بافت\nآبشار بنگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "File:Baft-castle.jpg\nگوغر\nمنطقه حفاظت شده انجرک\nبزنجان\nخافکوییه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_recreation "پارک ملی خبر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "File:قلعه قنجعلی خان.jpg\nقلعه غنجعلیخان افشار"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2300"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.1,56.51667"

# بردسیر
ID=$(wp post list --post_type=city --name=bardsir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بردسیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "81983"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6139"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "147"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "rabor - جنوب‌شرق\nbaft - جنوب\narzuiyeh - جنوب\nrafsanjan - شمال‌غرب\nsirjan - غرب\nzarand - شمال\nkerman - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2047"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.83333,56.58333"

# بم
ID=$(wp post list --post_type=city --name=bam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "228241"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "143"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "narmashir - شمال‌شرق\njiroft - غرب\nanbarabad - جنوب\nrigan - جنوب‌شرق\nkerman - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.06667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.06667,58.23333"

# جازموریان
ID=$(wp post list --post_type=city --name=jazmourian --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زهکلوت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43867"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5040"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "271"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "rudbar-e-jonub - جنوب‌شرق\nanbarabad - شمال‌غرب\nqaleh-ganj - جنوب‌غرب\nkahnoj - غرب\nrigan - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=27.95,58.56667"

# جیرفت
ID=$(wp post list --post_type=city --name=jiroft --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جیرفت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "308858"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9654"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "172"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "anbarabad - جنوب‌شرق\nbam - شرق\nrabor - شمال‌غرب\nfaryab - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=28.83333,57.58333"

# رابر
ID=$(wp post list --post_type=city --name=rabor --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رابر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35362"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1854"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "155"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "baft - غرب\njiroft - جنوب‌شرق\nbardsir - شمال‌غرب\nkerman - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2343"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.25,56.98333"

# راور
ID=$(wp post list --post_type=city --name=ravar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "راور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43198"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "11535"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "135"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kuhbanan - غرب\nzarand - جنوب‌غرب\nkerman - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "گندم بریان"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1181"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.3,57.15"

# رفسنجان
ID=$(wp post list --post_type=city --name=rafsanjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رفسنجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "311214"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7678"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "198"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "zarand - شمال‌شرق\nanar - شمال‌غرب\nbardsir - جنوب‌شرق\nshahr-e-babak - غرب\nsirjan - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1469"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.53333,55.95"

# رودبار جنوب
ID=$(wp post list --post_type=city --name=rudbar-e-jonub --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رودبار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "105992"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1816"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "320"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "dalgan - شرق\njazmourian - شمال‌غرب\nbashagard - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.57511"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.93533"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=27.57511,58.93533"

# ریگان
ID=$(wp post list --post_type=city --name=rigan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "محمدآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "88410"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5641"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "9"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "212"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "fahraj - شمال\nbam - شمال‌غرب\njazmourian - جنوب‌غرب\nanbarabad - غرب\niranshahr - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.66889"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.07333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=28.66889,59.07333"

# زرند
ID=$(wp post list --post_type=city --name=zarand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "138133"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5477"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "162"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kuhbanan - شمال\nrafsanjan - جنوب‌غرب\nravar - شمال‌شرق\nbardsir - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.85"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1650"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.85,56.41667"

# سیرجان
ID=$(wp post list --post_type=city --name=sirjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیرجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "324103"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "258"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "arzuiyeh - جنوب‌شرق\nshahr-e-babak - شمال‌غرب\nbardsir - شرق\nneyriz - غرب\ndarab - جنوب‌غرب\nrafsanjan - شمال\nhajiabad - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.5,55.5"

# شهربابک
ID=$(wp post list --post_type=city --name=shahr-e-babak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهربابک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "103975"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "14096"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "296"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "khatam-city - غرب\nanar - شمال‌شرق\nsirjan - جنوب‌شرق\nrafsanjan - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "غار ایوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "میمند\nریواس\nبخش دهج\nجوزم\nمسینان\nمدوار\nیونسکو"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "عمارت موسی خانی\nپاقلعه"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.25,54.91667"

# عنبرآباد
ID=$(wp post list --post_type=city --name=anbarabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عنبرآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "82438"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3409"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "215"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kahnoj - جنوب‌غرب\njiroft - شمال‌غرب\njazmourian - جنوب‌شرق\nbam - شمال\nfaryab - غرب\nrigan - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=28.4,57.98333"

# فاریاب
ID=$(wp post list --post_type=city --name=faryab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فاریاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "34000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2427"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "249"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kahnoj - جنوب‌شرق\nrudan - جنوب\nanbarabad - شرق\njiroft - شمال‌شرق\nbaft - شمال‌غرب\nhajiabad - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "600"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=28.2,57.21667"

# فهرج
ID=$(wp post list --post_type=city --name=fahraj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فهرج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67096"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4550"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "178"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "narmashir - غرب\nrigan - جنوب\nzahedan - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "میل نادری\nدودمان سلجوق\nافشاریان\nشاهنشاهی ساسانی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "برج معاذ"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "30"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.13333,59.21667"

# قلعه‌گنج
ID=$(wp post list --post_type=city --name=qaleh-ganj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قلعهگنج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "76495"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "10190"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "313"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "manujan - غرب\nkahnoj - شمال\njazmourian - شمال‌شرق\nbashagard - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.52417"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.87833"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=27.52417,57.87833"

# منوجان
ID=$(wp post list --post_type=city --name=manujan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "منوجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "65705"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3422"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "315"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "qaleh-ganj - شرق\nrudan - غرب\nkahnoj - شمال‌شرق\nminab - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "342"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=27.53333,57.5"

# نرماشیر
ID=$(wp post list --post_type=city --name=narmashir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نرماشیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54228"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "671"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "138"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "fahraj - شرق\nbam - جنوب‌غرب\nkerman - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "قلعه پیرماه شاه\nقلعه شهید نرماشیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.73333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=29.26667,58.73333"

# کرمان
ID=$(wp post list --post_type=city --name=kerman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرمان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "738724"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "41581"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "11"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ravar - شمال‌غرب\nnarmashir - جنوب‌شرق\nbam - جنوب\nbardsir - غرب\nrabor - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1756"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.33333,58.0"

# کهنوج
ID=$(wp post list --post_type=city --name=kahnoj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کهنوج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "95848"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2109"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "267"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "manujan - جنوب‌غرب\nqaleh-ganj - جنوب\nfaryab - شمال‌غرب\nanbarabad - شمال‌شرق\njazmourian - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "35"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=27.95,57.7"

# کوهبنان
ID=$(wp post list --post_type=city --name=kuhbanan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوهبنان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21205"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2236"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "199"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "zarand - جنوب\nbehabad-city - شمال\nravar - شرق\nanar - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.33639"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.27278"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.33639,56.27278"

# گنبکی
ID=$(wp post list --post_type=city --name=gonbaki --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2292"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"

