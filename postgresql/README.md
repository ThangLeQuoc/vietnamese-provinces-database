# [Postgresql] - Vietnamese Provinces Database

This document will guide you how to restore the Vietnamese provinces dataset to your Postgres database.
Feel free to choose any approach listed below that you're comfortable with.

## Restore by standard SQL scripts

Either use your existing database, or create a new one

```sql
CREATE DATABASE vietnamese_administrative_units;
```

Execute the `CreateTable_vn_units.sql` in the [StandardSQLScripts directory](StandardSQLScripts) first in the target database to generate all the table structure.

Then follow up by executing the `ImportData_vn_units.sql` to import data to these generated tables.

## Restore with `PSQL`

### Restore as a complete database

To restore the Vietnamese Provinces dataset as a new standalone database, follow these steps:

Create a new database in your Postgres instance

```sql
CREATE DATABASE vietnamese_administrative_units;
```

Then use the `psql` command to dump the backup file `vietnamese_administrative_units_postgresql.sql` in the [CompleteDataset directory](CompleteDataset) to the database `vietnamese_administrative_units`

```bash
psql -h localhost -Upostgres -d vietnamese_administrative_units -f VietnameseProvincesDatabase/postgresql/CompleteDataset/vietnamese_administrative_units_postgresql.sql
```

## Restore and add provinces tables to your existing database

To restore and merge the tables of the Vietnamese Provinces dataset to your existing database, follow these steps:

Given the target database is `my_working_db`

Import by the `psql` command:

```bash
psql -h localhost -Upostgres -d my_working_db -f VietnameseProvincesDatabase/postgresql/TableDumps/administrative_regions.sql
```

You will need to import the SQL patches in the [TableDumps directory](TableDumps) with this order:  

1. `administrative_regions.sql`
2. `administrative_units.sql`
3. `provinces.sql`
4. `districts.sql`
5. `wards.sql`
