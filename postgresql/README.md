# [Postgresql] - Vietnamese Provinces Database

This document will guide you how to restore the Vietnamese provinces dataset to your Postgres database

## Restore as a complete database

Create a new database in your Postgres instance

```sql
CREATE DATABASE vietnamese_administrative_units
```

Then use the `psql` command to dump the backup file `vietnamese_administrative_units_postgresql.sql` to the database `vietnamese_administrative_units`

```bash
psql -d vietnamese_administrative_units -f VietnameseProvincesDatabase/postgresql/CompleteDataset/vietnamese_administrative_units_postgresql.sql
```

## Restore and add provinces tables to your existing database

TBD