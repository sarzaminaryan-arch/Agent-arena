#!/usr/bin/env bash
set -euo pipefail

# آبادان
ID=$(wp post list --post_type=city --name=abadan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آبادان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "298090"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2267"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "119"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shadegan - شمال\nmahshahr - شمال‌شرق\nkhorramshahr - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.26667,48.56667"

# آغاجاری
ID=$(wp post list --post_type=city --name=aghajari --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آغاجاری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "17654"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1418"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "129"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "omidiyeh - شمال‌غرب\nbehbahan - شرق\nbahmai - شمال‌شرق\nhendijan - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "ساحل رودخانه مارون\nسد خاکی"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.70056"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.83139"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.70056,49.83139"

# امیدیه
ID=$(wp post list --post_type=city --name=omidiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "امیدیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "92335"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "115"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "aghajari - جنوب‌شرق\nramshir - شمال‌غرب\nramhormoz - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.75,49.7"

# اندیمشک
ID=$(wp post list --post_type=city --name=andimeshk --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اندیمشک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "171412"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "144"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "dezful - شرق\nshush - جنوب\npol-e-dokhtar - شمال‌غرب\nabdanan - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "176"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.58333,48.33333"

# اندیکا
ID=$(wp post list --post_type=city --name=andika --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قلعه خواجه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "47629"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2369"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "121"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "masjed-soleyman - جنوب‌غرب\nlali - شمال‌غرب\nkuhrang - شمال‌شرق\nizeh - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "جاذبه‌های گردشگری\nمجتبی گهستونی"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.20639"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.44361"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.20639,49.44361"

# اهواز
ID=$(wp post list --post_type=city --name=ahvaz-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اهواز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1302591"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "hamidiyeh - شمال‌غرب\nbavi - شمال‌شرق\nshadegan - جنوب\nramshir - جنوب‌شرق\nkhorramshahr - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.3275"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.69389"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.3275,48.69389"

# ایذه
ID=$(wp post list --post_type=city --name=izeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ایذه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "198871"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2504"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "139"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "dezpart - جنوب‌شرق\nardal - شرق\nbagh-e-malek - جنوب\nkuhrang - شمال\nandika - شمال‌غرب\nhaftkel - جنوب‌غرب\nmasjed-soleyman - غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.91667,49.98333"

# باغملک
ID=$(wp post list --post_type=city --name=bagh-e-malek --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "باغملک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "105384"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1821"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "118"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "dezpart - شمال‌شرق\nramhormoz - جنوب‌غرب\nizeh - شمال\nhaftkel - غرب\nbahmai - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "مال‌آقا\nلالب\nابوالعباس\nمنجنیق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "قلعه‌تل"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "917"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.5,49.91667"

# باوی
ID=$(wp post list --post_type=city --name=bavi --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ملاثانی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "96484"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1377"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "31"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ahvaz-city - جنوب‌غرب\nhaftkel - شرق\nshushtar - شمال\nmasjed-soleyman - شمال‌شرق\nramshir - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.5,48.95"

# بهبهان
ID=$(wp post list --post_type=city --name=behbahan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بهبهان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "180593"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "169"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "aghajari - غرب\nlandeh - شمال\nbahmai - شمال\ngachsaran - جنوب‌شرق\nchoram - شرق\ndeylam - جنوب\nhendijan - جنوب‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "تنگ‌تکاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "خداوند الموت\nبهبهان\nخاییز\nپادشاهان ساسانی\nمارون"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.6,50.25"

# حمیدیه
ID=$(wp post list --post_type=city --name=hamidiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "حمیدیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "53762"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "29"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ahvaz-city - جنوب‌شرق\nhoveyzeh - غرب\ndasht-azadegan - شمال‌غرب\nkarkheh - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.46667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.5,48.46667"

# خرمشهر
ID=$(wp post list --post_type=city --name=khorramshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خرمشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "170976"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "87"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shadegan - شرق\nabadan - جنوب‌شرق\nahvaz-city - شمال‌شرق\nhoveyzeh - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.68333,48.18333"

# دزفول
ID=$(wp post list --post_type=city --name=dezful --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دزفول"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "443971"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4762"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "12"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "138"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "gotvand - جنوب\nandimeshk - غرب\nlali - شرق\naligudarz - شمال‌شرق\ndorud - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "آبشار شوی\nآبشارهای ایران\nتفریحگاه ساحلی دز\nسالن کوه\nکوهنوردی\nسد دز\nدریاچه شهیون"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "استان خوزستان\nمیانرود\nگوزن زرد ایرانی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_recreation "پارک ملی دز\nپارک‌های ملی ایران"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.76667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.56667,48.76667"

# دزپارت
ID=$(wp post list --post_type=city --name=dezpart --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "دهدز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "151"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "ardal - شمال‌شرق\nizeh - شمال‌غرب\nbagh-e-malek - جنوب‌غرب\nlordegan - جنوب‌شرق\nlandeh - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "کوه منگشت\nکوه قارون\nسد کارون ۴\nسد کارون ۳"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "شیوند\nرکعت\nحاجی کمال\nده‌کهنه موزرم\nدهدز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "قلعه‌سرد بالا"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.68333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.23333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.68333,50.23333"

# دشت آزادگان
ID=$(wp post list --post_type=city --name=dasht-azadegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سوسنگرد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "107989"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1973"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "72"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "hoveyzeh - جنوب\nkarkheh - شمال‌شرق\nshush - شمال\nhamidiyeh - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.06667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.7,48.06667"

# رامشیر
ID=$(wp post list --post_type=city --name=ramshir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رامشیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "54004"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1587"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "83"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "omidiyeh - جنوب‌شرق\nramhormoz - شمال‌شرق\nmahshahr - جنوب‌غرب\nbavi - شمال‌غرب\nahvaz-city - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.88333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.88333,49.4"

# رامهرمز
ID=$(wp post list --post_type=city --name=ramhormoz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رامهرمز"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "113776"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1818"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "92"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "bagh-e-malek - شمال‌شرق\nramshir - جنوب‌غرب\nbahmai - جنوب‌شرق\nhaftkel - شمال‌غرب\nomidiyeh - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.65"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.21667,49.65"

# شادگان
ID=$(wp post list --post_type=city --name=shadegan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شادگان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "138480"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3598"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "74"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "mahshahr - شرق\nabadan - جنوب\nkhorramshahr - غرب\nahvaz-city - شمال"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.66667,48.66667"

# شوش
ID=$(wp post list --post_type=city --name=shush --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شوش"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "205720"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2169"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "91"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "karkheh - جنوب‌شرق\ndasht-azadegan - جنوب\nandimeshk - شمال\ndehloran - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.03333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.03333,48.21667"

# شوشتر
ID=$(wp post list --post_type=city --name=shushtar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شوشتر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "192028"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "76"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "gotvand - شمال\nmasjed-soleyman - شرق\nkarkheh - غرب\nbavi - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.0,48.83333"

# لالی
ID=$(wp post list --post_type=city --name=lali --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "لالی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "37963"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "132"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "andika - جنوب‌شرق\ngotvand - جنوب‌غرب\ndezful - غرب\naligudarz - شمال\nfereydunshahr - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_nature "آبشارهای آرپناه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "بهار\nتابستان\nزمستان\nفروردین\nاردیبهشت\nگردشگری\nکشور"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.43333,49.2"

# ماهشهر
ID=$(wp post list --post_type=city --name=mahshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بندر ماهشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "296271"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2956"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "88"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shadegan - غرب\nramshir - شمال‌شرق\nabadan - جنوب‌غرب\nhendijan - جنوب‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.58333,49.0"

# مسجدسلیمان
ID=$(wp post list --post_type=city --name=masjed-soleyman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مسجدسلیمان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "113419"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2184"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "91"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "andika - شمال‌شرق\nshushtar - غرب\nhaftkel - جنوب\nbavi - جنوب‌غرب\nizeh - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.98333,49.26667"

# هفتکل
ID=$(wp post list --post_type=city --name=haftkel --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هفتکل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "22119"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1420"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "72"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "bavi - غرب\nramhormoz - جنوب‌شرق\nmasjed-soleyman - شمال\nbagh-e-malek - شرق\nizeh - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.56667,49.4"

# هندیجان
ID=$(wp post list --post_type=city --name=hendijan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هندیجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38762"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "152"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "aghajari - شمال\nbehbahan - شمال‌شرق\ndeylam - شرق\nmahshahr - شمال‌غرب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "49.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=30.25,49.66667"

# هویزه
ID=$(wp post list --post_type=city --name=hoveyzeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "هویزه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38886"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2714"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "61"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "dasht-azadegan - شمال\nhamidiyeh - شرق\nkhorramshahr - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "گذرگاه مرزی شلمچه\nطلائیه\nهورالعظیم\nآثار جنگ تحمیلی\n[[گذرگاه مرزی شلمچه]]\n[[طلائیه]]\nقدمگاه ابراهیم الخلیل\n[[هورالعظیم]]"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "مزار شهدای هویزه\nمقبره ۴۰ عالم جلیل القدر\nپارک باغ وحش"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.4623"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.07396"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.4623,48.07396"

# کارون
ID=$(wp post list --post_type=city --name=karun --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوت عبدالله"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "105872"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1198"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "335"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "chardavol - شمال\nsirvan - شمال\nilam-city - جنوب‌غرب\neslamabad-e-gharb - شمال\neyvan - شمال‌غرب\nhalilan - شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.75"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "46.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=33.75,46.56667"

# کرخه
ID=$(wp post list --post_type=city --name=karkheh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "الوان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1498"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "69"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shush - شمال‌غرب\ndasht-azadegan - جنوب‌غرب\nshushtar - شرق\nhamidiyeh - جنوب"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=31.9,48.4"

# گتوند
ID=$(wp post list --post_type=city --name=gotvand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گتوند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "65468"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "1395"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_distance_center "103"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_neighbors "shushtar - جنوب\ndezful - شمال\nlali - شمال‌شرق"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_offbeat "جاذبه‌های گردشگری\nدهستان کیارس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_poi_heritage "تپه چغا"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.24543"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.81416"
[ -n "$ID" ] && wp post meta update "$ID" sa_google_map_url "https://www.google.com/maps/search/?api=1&query=32.24543,48.81416"

