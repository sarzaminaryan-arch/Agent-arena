#!/usr/bin/env bash
set -euo pipefail

# اردبیل
ID=$(wp post list --post_type=city --name=ardabil-city --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "اردبیل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "605992"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "10"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "7"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.25"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.3"

# اصلاندوز
ID=$(wp post list --post_type=city --name=aslanduz --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "32506"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "592"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.6"

# انگوت
ID=$(wp post list --post_type=city --name=angut --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "انگوت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "20428"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1048"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"

# بیله‌سوار
ID=$(wp post list --post_type=city --name=bileh-savar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بیلهسوار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "51307"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1742"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.36667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.96667"

# خلخال
ID=$(wp post list --post_type=city --name=khalkhal --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "خلخال"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "86731"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.61667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1843"

# سرعین
ID=$(wp post list --post_type=city --name=sarein --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سرعین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "20000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.15013"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.07396"

# مشگین‌شهر
ID=$(wp post list --post_type=city --name=meshgin-shahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "مشگینشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "181156"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3500"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.75"

# نمین
ID=$(wp post list --post_type=city --name=namin --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نمین"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "66782"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38.38333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.51667"

# نیر
ID=$(wp post list --post_type=city --name=nir --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نیر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "20864"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "38"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.08333"

# پارس‌آباد
ID=$(wp post list --post_type=city --name=parsabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پارسآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "145192"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "814"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.91667"

# کوثر
ID=$(wp post list --post_type=city --name=givi --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گیوی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "26"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "37.72142"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "48.26985"

# گرمی
ID=$(wp post list --post_type=city --name=germi --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گرمی"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "76473"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2793"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "39"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "47.95"

