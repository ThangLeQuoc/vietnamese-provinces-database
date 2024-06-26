> ⚠️ **Heads-up!**  
This section is only useful for the repository maintainers. Feel free to ignore this section if you are just looking for the Vietnamese Database Dataset.

# Vietnames Provinces Database Dataset Automation Scripts

Vietnamese Government will gradually issue new decree to make change to the administrative units. The change is vary: promoting ward to a higher administrative unit, merging ward, etc...  
Therefore, it's challenging to keep the dataset up-to-date. Before the development of this automation scripts, I have to manually read the decree change and compare it with the new xls sheet (which is kind of dumb and counter-productive way 🙈)  
Then it finally come to the development of this autogenerated patch script to make this repository maintainers's life easy.

## How does it work
![image](https://user-images.githubusercontent.com/20574640/235334410-cb7aa96d-d8c3-41b9-9016-32a68ad6bdae.png)

The scripts are divided into two main phrases

- `dumper.go`: Read the administrative unit in CSV format, perform data transformation and insert the records into a temporary Postgres database  
- `patch_writer.go`: Read from the persisted temporary Postgres database, and generate insert records scripts for all 3 kinds of databases (MySQL/Postgres, SQL Server and Oracle)  
## How to run
### Prerequisite
You must have these thing installed on your machine
- Postgresql
- Go
### Setting thing up
#### Postgres temporary database 
You will need to create a temporary database in Postgres named `vn_provinces_tmp` in your local Postgres. And provide the access credential in the connection string in `common/postgres_connector.go`
```golang
func GetPostgresDBConnection() *bun.DB {
	dsn := "postgres://postgres:root@localhost:5432/vn_provinces_tmp?sslmode=disable"
	sqlDB := sql.OpenDB(pgdriver.NewConnector(pgdriver.WithDSN(dsn)))
	db := bun.NewDB(sqlDB, pgdialect.New())
	return db
}
```
#### Update the existing dataset patch
Update the `resources\db_table_existing_dataset_patch.sql` with the lastest dataset patch from the repository. This will be consider as the "existing latest dataset" to be compared with the new change from the CSV dataset  
#### CSV file
Download the excel sheet from the [General Statistics Office of Vietnam website](https://danhmuchanhchinh.gso.gov.vn/).  
By default it will come in `.xls` file format, convert this to a CSV file and put it in the `resources` folder.  
Perform some text replacement for correction, this includes: 
- Replace "Thị Xã" to "Thị xã"
- Replace "Thành Phố" to "Thành phố"
- Replace "Thị Trấn" to "Thị trấn"  

These manual text replacement text will [be included in the script execution](https://github.com/ThangLeQuoc/vietnamese-provinces-database/blob/master/dataset-generation-scripts/dumper/dumper.go#L21) in the future as well.  
Update the `csv_file_path` variable in `dumper.go`  

#### Executing
At the root of the `dataset-generation-scripts` folder, run
```shell
go run main.go
```
And check the result in the `output` folder. The final result is three SQL patches will be generated for three type of databases (due to their difference in syntax).

# Improvement item in the future
- Detect the change between the existing dataset and the newly produces dataset. And produce the SQL data patch for this change.


# Run testcase
> go test -v ./...