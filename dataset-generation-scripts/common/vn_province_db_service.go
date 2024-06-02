package common

import (
	"context"
	"fmt"
	"log"
)

const pathToTableInitFile = "./resources/db_table_init.sql"
const pathToRegionAdministrativeInitFile = "./resources/db_region_administrative_unit.sql"

/*
Bootstrap the Temporary Dataset Structure
@thangle: This function is the remnant of the past. From the previous version of the dataset-generation-script, data are get from CSV file and dump to database.
We may skip this this in the future
*/
func BootstrapTemporaryDatasetStructure() {
	err := ExecuteSQLScript(pathToTableInitFile)
	if err != nil {
		panic(err)
	}
	fmt.Println("Temporary Provinces tables created")

	err = ExecuteSQLScript(pathToRegionAdministrativeInitFile)
	if err != nil {
		panic(err)
	}
	fmt.Println("Data for regions & administrative unit persisted")
}

func GetAllAdministrativeUnits() []AdministrativeUnit {
	db := GetPostgresDBConnection()
	var result []AdministrativeUnit
	ctx := context.Background()
	db.NewSelect().Model(&result).Scan(ctx)
	return result
}

func GetAllAdministrativeRegions() []AdministrativeRegion {
	db := GetPostgresDBConnection()
	var result []AdministrativeRegion
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if err != nil {
		log.Fatal("Unable to query administrative regions", err)
		panic(err)
	}
	return result
}

func GetAllProvinces() []Province {
	db := GetPostgresDBConnection()
	var result []Province
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Relation("AdministrativeUnit").Relation("AdministrativeRegion").Relation("District").Relation("District.AdministrativeUnit").Relation("District.Ward").Relation("District.Ward.AdministrativeUnit").Scan(ctx)
	if err != nil {
		log.Fatal("Unable to query provinces", err)
		panic(err)
	}
	return result
}

// method to get all districts
func GetAllDistricts() []District {
	db := GetPostgresDBConnection()
	var result []District
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if err != nil {
		log.Fatal("Unable to query districts", err)
		panic(err)
	}
	return result
}

// method to get all wards
func GetAllWards() []Ward {
	db := GetPostgresDBConnection()
	var result []Ward
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if err != nil {
		log.Fatal("Unable to query wards", err)
		panic(err)
	}
	return result
}
