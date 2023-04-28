package patch_writer

import (
	"context"
	"log"
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
)

func GetAllAdministrativeUnits() []vn_common.AdministrativeUnit {
	db := vn_common.GetPostgresDBConnection()
	var result []vn_common.AdministrativeUnit
	ctx := context.Background()
	db.NewSelect().Model(&result).Scan(ctx)
	return result
}

func GetAllAdministrativeRegions() []vn_common.AdministrativeRegion {
	db := vn_common.GetPostgresDBConnection()
	var result []vn_common.AdministrativeRegion
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if (err != nil) {
		log.Fatal("Unable to query administrative regions", err)
		panic(err)
	}
	return result
}

func getAllProvinces() []vn_common.Province {
	db := vn_common.GetPostgresDBConnection()
	var result []vn_common.Province
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if (err != nil) {
		log.Fatal("Unable to query provinces", err)
		panic(err)
	}
	return result
}


// method to get all districts
func getAllDistricts() []vn_common.District {
	db := vn_common.GetPostgresDBConnection()
	var result []vn_common.District
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if (err != nil) {
		log.Fatal("Unable to query districts", err)
		panic(err)
	}
	return result
}

// method to get all wards
func getAllWards() []vn_common.Ward {
	db := vn_common.GetPostgresDBConnection()
	var result []vn_common.Ward
	ctx := context.Background()
	err := db.NewSelect().Model(&result).Scan(ctx)
	if (err != nil) {
		log.Fatal("Unable to query wards", err)
		panic(err)
	}
	return result
}
