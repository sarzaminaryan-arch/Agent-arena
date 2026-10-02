#!/usr/bin/env bash
set -euo pipefail

# ارزوئیه
ID=$(wp post list --post_type=city --name=arzuiyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ارزوئیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "38510"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4980"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.3728"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1044"

# انار
ID=$(wp post list --post_type=city --name=anar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "انار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "36897"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2140"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.85"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.35"

# بافت
ID=$(wp post list --post_type=city --name=baft --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بافت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "84103"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6465"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.51667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2300"

# بردسیر
ID=$(wp post list --post_type=city --name=bardsir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بردسیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "81983"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "6139"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2047"

# بم
ID=$(wp post list --post_type=city --name=bam --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بم"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "228241"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.06667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.23333"

# جازموریان
ID=$(wp post list --post_type=city --name=jazmourian --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زهکلوت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43867"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5040"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.56667"

# جیرفت
ID=$(wp post list --post_type=city --name=jiroft --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جیرفت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "308858"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9654"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.83333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.58333"

# رابر
ID=$(wp post list --post_type=city --name=rabor --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رابر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "35362"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1854"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2343"

# راور
ID=$(wp post list --post_type=city --name=ravar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "راور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43198"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "11535"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.15"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1181"

# رفسنجان
ID=$(wp post list --post_type=city --name=rafsanjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رفسنجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "402300"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7678"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1469"

# رودبار جنوب
ID=$(wp post list --post_type=city --name=rudbar-e-jonub --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رودبار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "62125"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1816"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.57511"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.93533"

# ریگان
ID=$(wp post list --post_type=city --name=rigan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "محمدآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "62487"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5641"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "9"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.66889"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.07333"

# زرند
ID=$(wp post list --post_type=city --name=zarand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "زرند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "138133"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5477"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.85"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1650"

# سیرجان
ID=$(wp post list --post_type=city --name=sirjan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سیرجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "324103"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "55.5"

# شهربابک
ID=$(wp post list --post_type=city --name=shahr-e-babak --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "شهربابک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "103975"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "14096"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "54.91667"

# عنبرآباد
ID=$(wp post list --post_type=city --name=anbarabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عنبرآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "82438"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3409"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.98333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "3"

# فاریاب
ID=$(wp post list --post_type=city --name=faryab --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فاریاب"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "34000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2427"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "28.2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "600"

# فهرج
ID=$(wp post list --post_type=city --name=fahraj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فهرج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "66791"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4550"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.13333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.21667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "30"

# قلعه‌گنج
ID=$(wp post list --post_type=city --name=qaleh-ganj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قلعهگنج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "77249"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "10190"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.52417"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.87833"

# منوجان
ID=$(wp post list --post_type=city --name=manujan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "منوجان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "64971"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3422"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "342"

# نرماشیر
ID=$(wp post list --post_type=city --name=narmashir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نرماشیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "53983"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "671"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "29.26667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.73333"

# کرمان
ID=$(wp post list --post_type=city --name=kerman --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کرمان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "738724"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "41581"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "11"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "30.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1756"

# کهنوج
ID=$(wp post list --post_type=city --name=kahnoj --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کهنوج"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "95848"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2109"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "27.95"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "35"

# کوهبنان
ID=$(wp post list --post_type=city --name=kuhbanan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کوهبنان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "21205"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2236"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.33639"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.27278"

# گنبکی
ID=$(wp post list --post_type=city --name=gonbaki --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "26227"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2292"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"

