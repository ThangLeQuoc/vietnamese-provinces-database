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
TBD - Table relationship
### `administrative_regions` table


TBD: Meaning, column definition, sample data

### `administrative_units` table

TBD: Meaning, column definition, sample data

### `provinces` table

TBD: Meaning, column definition, sample data

### `districts` table

TBD: Meaning, column definition, sample data

### `wards` table

TBD: Meaning, column definition, sample data

## Sample Query

TBD