package dataset_writer

import (
	"fmt"
	dataset_file_writer "github.com/thanglequoc-vn-provinces/v2/dataset_writer/dataset_file_writer"
	"log"
	"os"
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
)

/*
Generate the Vietnamese Provinces Dataset SQL files
*/
func ReadAndGenerateSQLDatasets() {

	// Clean up the output folder
	os.RemoveAll("./output")
	os.MkdirAll("./output", 0746)

	regions := vn_common.GetAllAdministrativeRegions()
	administrativeUnits := vn_common.GetAllAdministrativeUnits()
	provinces := vn_common.GetAllProvinces()
	districts := vn_common.GetAllDistricts()
	wards := vn_common.GetAllWards()

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

	// JSON
	jsonDatasetFileWriter := dataset_file_writer.JSONDatasetFileWriter{
		OutputFilePath: "./output/json_generated_data_vn_units_%s.sql",
	}
	_, err = jsonDatasetFileWriter.WriteToFile(regions, administrativeUnits, provinces, districts, wards)
	if err != nil {
		log.Fatal("Unable to generate JSON Dataset", err)
	} else {
		fmt.Println("JSON Dataset successfully generated")
	}
}
