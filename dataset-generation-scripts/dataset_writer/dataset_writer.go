package dataset_writer

import (
	"fmt"
	dataset_file_writer "github.com/thanglequoc-vn-provinces/v2/dataset_writer/dataset_file_writer"
	"log"
	"os"
)

/*
@thanglequoc: Add comment for this method
*/
func ReadAndGenerateSQLDatasets() {

	// Clean up the output folder
	os.RemoveAll("./output")
	os.MkdirAll("./output", 0746)

	regions := getAllAdministrativeRegions()
	administrativeUnits := getAllAdministrativeUnits()
	provinces := getAllProvinces()
	districts := getAllDistricts()
	wards := getAllWards()

	// Postgresql & MySQL
	postgresMySQLDatasetFileWriter := dataset_file_writer.PostgresMySQLDatasetFileWriter{
		OutputFilePath: "./output/postgresql_mysql_generated_ImportData_vn_units_%s.sql",
	}
	_, err := postgresMySQLDatasetFileWriter.WriteToFile(regions, administrativeUnits, provinces, districts, wards)
	if err != nil {
		log.Fatal("Unable to generate Postgresql-MySQL Dataset", err)
	} else {
		fmt.Println("Postgresql-MySQL Dataset successfully generated")
	}

	// Mssql
	mssqlDatasetFileWriter := dataset_file_writer.MssqlDatasetFileWriter{
		OutputFilePath: "./output/mssql_generated_ImportData_vn_units_%s.sql",
	}
	_, err = mssqlDatasetFileWriter.WriteToFile(regions, administrativeUnits, provinces, districts, wards)
	if err != nil {
		log.Fatal("Unable to generate Mssql Dataset", err)
	} else {
		fmt.Println("Mssql Dataset successfully generated")
	}

	// Oracle
	oracleDatasetFileWriter := dataset_file_writer.OracleDatasetFileWriter{
		OutputFilePath: "./output/oracle_generated_ImportData_vn_units_%s.sql",
	}
	_, err = oracleDatasetFileWriter.WriteToFile(regions, administrativeUnits, provinces, districts, wards)
	if err != nil {
		log.Fatal("Unable to generate Oracle Dataset", err)
	} else {
		fmt.Println("Oracle Dataset successfully generated")
	}
}
