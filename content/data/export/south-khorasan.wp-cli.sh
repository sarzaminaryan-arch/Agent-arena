#!/usr/bin/env bash
set -euo pipefail

# بشرویه
ID=$(wp post list --post_type=city --name=boshruyeh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بشرویه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "26064"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "880"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.86239"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.41893"

# بیرجند
ID=$(wp post list --post_type=city --name=birjand --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بیرجند"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "261324"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3949"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.07"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.255"

# خوسف
ID=$(wp post list --post_type=city --name=khusf --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خوسف"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "27600"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "16029"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.18333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.76667"

# درمیان
ID=$(wp post list --post_type=city --name=darmiyan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اسدیه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "53714"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5797"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.94889"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.12333"

# زیرکوه
ID=$(wp post list --post_type=city --name=zirkuh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "حاجیآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "44000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9185"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1330"

# سرایان
ID=$(wp post list --post_type=city --name=sarayan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرایان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "33312"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "9305"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2020"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.85884"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "58.52079"

# سربیشه
ID=$(wp post list --post_type=city --name=sarbisheh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سربیشه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "40959"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7928"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "32.4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60.08333"

# طبس
ID=$(wp post list --post_type=city --name=tabas --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "طبس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "76352"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "44138"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.66667"

# عشق‌آباد
ID=$(wp post list --post_type=city --name=eshqabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عشقآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "1"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "11221"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "34.42667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "56.72806"

# فردوس
ID=$(wp post list --post_type=city --name=ferdows --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فردوس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "61346"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "5100"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.95667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "57.97"

# قائنات
ID=$(wp post list --post_type=city --name=qayenat --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قائن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "116181"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "7601"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "33.72444"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "59.17222"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "9"

# نهبندان
ID=$(wp post list --post_type=city --name=nehbandan --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نهبندان"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51449"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "26094"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "31.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "60"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1100"

