#!/usr/bin/env bash
set -euo pipefail

# ابهر
ID=$(wp post list --post_type=city --name=abhar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ابهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "151528"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3362"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "80"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "kharadere - شرق\nsoltaniyeh - غرب\nkhodabandeh - جنوب‌غرب\ntarom - شمال\navaj - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.05"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.26667,49.05"

# ایجرود
ID=$(wp post list --post_type=city --name=ejrud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرینآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36641"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1755"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "28"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "soltaniyeh - شرق\nzanjan-city - شمال\nbijar - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.33333,48.25"

# خدابنده
ID=$(wp post list --post_type=city --name=khodabandeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قیدار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "164493"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5151"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "69"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "soltaniyeh - شمال\nabhar - شمال‌شرق\nkabudarahang-city - جنوب\nrazan-city - جنوب‌شرق\navaj - جنوب‌شرق\nbijar - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2050"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.0,48.5"

# خرمدره
ID=$(wp post list --post_type=city --name=kharadere --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خرمدره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67951"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "407"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "93"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "abhar - غرب\ntakestan - جنوب‌شرق\nqazvin-city - شرق\nrudbar - شمال‌شرق\ntarom - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "سد خلیفه لو خرم دره"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "گرمابه یان‌یان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "تپه باستانی خالصه"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.28333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1570"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.28333,49.21667"

# زنجان
ID=$(wp post list --post_type=city --name=zanjan-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زنجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "521302"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ejrud - جنوب\nmahneshan - غرب\ntarom - شمال‌شرق\nmianeh - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.58333,48.25"

# سلطانیه
ID=$(wp post list --post_type=city --name=soltaniyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سلطانیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "29480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1358.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "43"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ejrud - شمال‌غرب\nkhodabandeh - جنوب\nabhar - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "سلطان محمد خدابنده\nمعبد داش‌کسن\nویر\nبنای تاریخی چلبی اوغلی\nسلطانیه\nاسدآباد\nقره‌بلاغ\nحسن کاشی\nایلخانان\nمحمد خدابنده اولجایتو"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "گنبد سلطانیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.25,48.5"

# طارم
ID=$(wp post list --post_type=city --name=tarom --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آببر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "46641"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2235"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "71"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shaft - شرق\nfuman - شمال‌شرق\nmasal - شمال\nzanjan-city - جنوب‌غرب\nabhar - جنوب\nkharadere - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "400"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.95,48.9"

# ماهنشان
ID=$(wp post list --post_type=city --name=mahneshan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ماهنشان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "39425"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "68"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "takab - جنوب‌غرب\nzanjan-city - شرق\ncharoymaq - شمال‌غرب\nmianeh - شمال\nbijar - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=36.66667,47.5"

