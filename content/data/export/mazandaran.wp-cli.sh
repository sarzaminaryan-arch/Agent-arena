#!/usr/bin/env bash
set -euo pipefail

# آمل
ID=$(wp post list --post_type=city --name=amol --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "آمل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "401639"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "4374"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.46667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.35"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "40"

# بابل
ID=$(wp post list --post_type=city --name=babol --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بابل"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "531930"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1578.1"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.58333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "2"

# بابلسر
ID=$(wp post list --post_type=city --name=babolsar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بابلسر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "150223"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "345.7"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.66667"

# بهشهر
ID=$(wp post list --post_type=city --name=behshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "بهشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "168769"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1416.27"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.65111"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.58833"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "20"

# تنکابن
ID=$(wp post list --post_type=city --name=tonekabon --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "تنکابن"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "166"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1740"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.63333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.81667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "20"

# جویبار
ID=$(wp post list --post_type=city --name=joybar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "جویبار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "83988"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "285.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.66667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.9"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "20"

# رامسر
ID=$(wp post list --post_type=city --name=ramsar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "رامسر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "74179"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "729.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.78333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "50.53333"

# ساری
ID=$(wp post list --post_type=city --name=sari --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "ساری"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "504"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "3685.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "6"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.11667"

# سوادکوه
ID=$(wp post list --post_type=city --name=savadkuh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "پل سفید"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "43913"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2078"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "4"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "3"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.08333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.91667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "1700"

# سوادکوه شمالی
ID=$(wp post list --post_type=city --name=savadkuh-shomali --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "24834"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"

# سیمرغ
ID=$(wp post list --post_type=city --name=simorgh --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کیاکلا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "19"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "1"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.56667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.8"

# عباس‌آباد
ID=$(wp post list --post_type=city --name=abbasabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "عباسآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "52832"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.72778"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.10583"

# فریدونکنار
ID=$(wp post list --post_type=city --name=freydunkenar --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "فریدونکنار"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "67000"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "13"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.68564"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.5288"

# قائم‌شهر
ID=$(wp post list --post_type=city --name=qaemshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "قائمشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "319199"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "458.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.46667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.86667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "51"

# محمودآباد
ID=$(wp post list --post_type=city --name=mahmudabad --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "محمودآباد"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "130054"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "262.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_rural_districts "5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.61667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52.33333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "17"

# میاندورود
ID=$(wp post list --post_type=city --name=miandorud --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "سورک"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "61111"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_cities "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.595"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.2075"

# نور
ID=$(wp post list --post_type=city --name=nur --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نور"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "121531"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "2675"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.31667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "52"

# نوشهر
ID=$(wp post list --post_type=city --name=nowshahr --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نوشهر"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "142990"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1716.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.43333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.6"

# نکا
ID=$(wp post list --post_type=city --name=neka --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "نکا"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "60991"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1358.8"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.5"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.53333"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_elevation "49"

# چالوس
ID=$(wp post list --post_type=city --name=chalus --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "چالوس"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "116542"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "1597.3"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.40056"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.24417"

# کلاردشت
ID=$(wp post list --post_type=city --name=kelardasht --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "کلاردشت"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "23648"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.41667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "51.08333"

# گلوگاه
ID=$(wp post list --post_type=city --name=gologah --field=ID | head -1)
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_center "گلوگاه"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_population "88"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_census_year "2016"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_area "451"
[ -n "$ID" ] && wp post meta update "$ID" sa_cty_districts "2"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_latitude "36.71667"
[ -n "$ID" ] && wp post meta update "$ID" sa_city_longitude "53.8"

