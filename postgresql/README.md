# [Postgresql] - Vietnamese Provinces Database

Either use your existing database, or create a new one

```sql
CREATE DATABASE vietnamese_administrative_units;
```

Execute the `CreateTable_vn_units.sql` in this [postgresql directory](../postgresql) first in the target database to generate all the table structure.

Then follow up by executing the `ImportData_vn_units.sql` to import data to these generated tables.
