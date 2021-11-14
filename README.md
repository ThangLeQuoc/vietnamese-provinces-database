# Vietnamese Provinces Database

A complete SQL database of Vietnamese administrative units, includes all **63 Vietnamese provinces** and associated districts, wards sub-divisions.

Data is updated as of 2021.

## Overview

The author(s) of this repository is not associated with the General Statistics Office of Vietnam, nor the Vietnamese government.  
The data of provinces, districts and wards are created base on the CSV file from the [General Statistics Office of Vietnam website](https://www.gso.gov.vn/phuong-phap-thong-ke/danh-muc/don-vi-hanh-chinh/).  
This dataset also include additional information Apart from the original provinces, districts and wards data from the CSV file. Please see section [Additional change make by this repository](#additional-change-make-by-this-repository)

### Additional change make by this repository

- Add `administrative_regions` table
- Add `administrative_units` table
- Define the administrative unit and associated region for province, district and ward data
- Generate the English name for the provinces, districts and wards, offer both full and short forms
- Generate the code name for the provinces, districts and wards

## Installation

### Posgresql

Either use your existing database, or create a new one:

```sql
CREATE DATABASE vietnamese_administrative_units;
```

Execute the `CreateTable_vn_units.sql` in the [postgresql directory](postgresql) first in the target database to generate all the table structure.

Then follow up by executing the `ImportData_vn_units.sql` to import data to these generated tables.


### MySQL - MariaDB

Either use your existing database, or create a new one:

```sql
CREATE DATABASE vietnamese_administrative_units;
```

Execute the `CreateTable_vn_units.sql` in the [mysql directory](mysql) first in the target database to generate all the table structure.

Then follow up by executing the `ImportData_vn_units.sql` to import data to these generated tables.


### Microsoft SQL Server

Either use your existing database, or create a new one:

```sql
CREATE DATABASE vietnamese_administrative_units;
```

Execute the `CreateTable_vn_units.sql` in the [sqlserver directory](sqlserver) first in the target database to generate all the table structure.

Then follow up by executing the `ImportData_vn_units.sql` to import data to these generated tables.

### Oracle

Either use your existing database, or create a new one

Execute the `CreateTable_vn_units.sql` in the [oracle directory](oracle) first in the target database to generate all the table structure.

Then follow up by executing the `ImportData_vn_units.sql` to import data to these generated tables.

## Tables Schema

![VN_administrative_units db](https://i.imgur.com/sa0k4rt.png)

### `administrative_regions` table

![VN Geographical Regions](https://i.imgur.com/CiyxQi0.png)  
The `administrative_regions` table contains the list of **8** Vietnamese geographical regions with the `id` increment following the region location from North to South.

#### Table definition

|Column|Data type|Meaning|Constraint|
|------|-----------|---------|------------|
|`id`|integer|id of the region|Primary Key|
|`name`|varchar(255)|Region name (in Vietnamese)||
|`name_en`|varchar(255)|Region name (in English)||
|`code_name`|varchar(255)|Code name, derived from Vietnamese name. Written in lowercase, underscored||
|`code_name_en`|varchar(255)|Code name, derived from English name. Written in lowercase, underscored||

#### Data preview

|id|name|name_en|code_name|code_name_en|
|--|----|-------|---------|------------|
|1|Đông Bắc Bộ|Northeast|dong_bac_bo|northest|
|2|Tây Bắc Bộ|Northwest|tay_bac_bo|northwest|
|3|Đồng bằng sông Hồng|Red River Delta|dong_bang_song_hong|red_river_delta|
|4|Bắc Trung Bộ|North Central Coast|bac_trung_bo|north_central_coast|
|5|Duyên hải Nam Trung Bộ|South Central Coast|duyen_hai_nam_trung_bo|south_central_coast|
|6|Tây Nguyên|Central Highlands|tay_nguyen|central_highlands|
|7|Đông Nam Bộ|Southeast|dong_nam_bo|southeast|
|8|Đồng bằng sông Cửu Long|Mekong River Delta|dong_bang_song_cuu_long|southwest|

### `administrative_units` table

![VN Units](https://i.imgur.com/j35ELsL.png)  

The `administrative_units` table contains a list of administrative units with `id` sorted by the tier level from biggest to the smallest unit.

#### Table definition

|Column|Data type|Meaning|Constraint|
|------|-----------|---------|------------|
|`id`|integer|id of the region|Primary Key|
|`full_name`|varchar(255)|Full name of the administrative unit in Vietnamese||
|`full_name_en`|varchar(255)|Full name of the administrative unit in English||
|`short_name`|varchar(255)|Short name of the administrative unit in Vietnamese||
|`short_name_en`|varchar(255)|Short name of the administrative unit in English||
|`code_name`|varchar(255)|Code name, derived from Vietnamese `full_name`. Written in lowercase, underscored||
|`code_name_en`|varchar(255)|Code name, derived from English `full_name`. Written in lowercase, underscored||

#### Data preview

|id|full_name|full_name_en|short_name|short_name_en|code_name|code_name_en|
|--|---------|------------|----------|-------------|---------|------------|
|1|Thành phố trực thuộc trung ương|Municipality|Thành phố|City|thanh_pho_truc_thuoc_trung_uong|municipality|
|2|Tỉnh|Province|Tỉnh|Province|tinh|province|
|3|Thành phố thuộc thành phố trực thuộc trung ương|Municipal city|Thành phố|City|thanh_pho_thuoc_thanh_pho_truc_thuoc_trung_uong|municipal_city|
|4|Thành phố thuộc tỉnh|Provincial city|Thành phố|City|thanh_pho_thuoc_tinh|provincial_city|
|5|Quận|Urban district|Quận|District|quan|urban_district|
|6|Thị xã|District-level town|Thị xã|Town|thi_xa|district_level_town|
|7|Huyện|District|Huyện|District|huyen|district|
|8|Phường|Ward|Phường|Ward|phuong|ward|
|9|Thị trấn|Commune-level town|Thị trấn|Township|thi_tran|commune_level_town|
|10|Xã|Commune|Xã|Commune|xa|commune|

### `provinces` table

TBD: Meaning, column definition, sample data

### `districts` table

TBD: Meaning, column definition, sample data

### `wards` table

TBD: Meaning, column definition, sample data

## Sample Query

TBD

