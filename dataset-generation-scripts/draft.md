# Improvement plan

- Revise the script execution
- Introduce unit testing?
-

## Compare existing dataset and new dataset
- Compare strategy
- Pagination on the existing dataset, get a batch of n items.
- Query on the new dataset & compare the data.
- If the record does not found in the dataset -> unit has been remove (merge to another unit)
- There's a very rare chance that a new unit is introduced? How to prevent this?

## Integration Test?
https://www.ardanlabs.com/blog/2019/03/integration-testing-in-go-executing-tests-with-docker.html


GIS Data resource

Table
code - primary key, string
level - province/district, required string
bbox - required, polygon
gis_geom - multipolygon

Thing to do

- Generate bbox data first
- 

Format(Lat Long)
105.174641982 21.7004831250001 --> south west
105.292898491 21.8649141770001 --> north east


105.174641982 21.7004831250001
105.292898491 21.7004831250001
105.292898491 21.8649141770001
105.174641982 21.8649141770001
105.174641982 21.7004831250001 

To avoid ring not closed exception, first point must repeated
 
 https://gis.stackexchange.com/questions/321385/converting-multipolygon-field-stored-as-text-to-geometry-data-type-in-postgis-an

 https://dbschema.com/2023/07/16/sqlserver/spatial-data-types/


 Oracle database: https://hub.docker.com/r/gvenzl/oracle-free

 https://oralytics.com/23c/23c-free-on-docker/

 