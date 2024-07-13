package dataset_writer

import (
	"bufio"
	"fmt"
	"os"
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
)

const hsetAdministrativeUnitTemplate string = "HSET administrativeUnit:%d id %d fullName \"%s\" fullNameEn \"%s\" shortName \"%s\" shortNameEn \"%s\" codeName \"%s\"\n"
const hsetRegionTemplate string = "HSET region:%d name \"%s\" nameEn \"%s\" codeName \"%s\" \n"

const hsetProvinceTemplate string = "HSET province:%s code \"%s\" name \"%s\" nameEn \"%s\" fullName \"%s\" fullNameEn \"%s\" codeName \"%s\" administrativeUnitId %d administrativeRegionId %d \n"
const saddRegionProvinceTemplate string = "SADD region:%d:provinces \"%s\" \n"
const hsetRegionProvinceVnTemplate string = "HSET region:%d:provinces:vn \"%s\" \"%s\" \n"
const hsetRegionProvinceEnTemplate string = "HSET region:%d:provinces:en \"%s\" \"%s\" \n"

const hsetDistrictTemplate string = "HSET district:%s code \"%s\" name \"%s\" nameEn \"%s\" fullName \"%s\" fullNameEn \"%s\" codeName \"%s\" administrativeUnitId %d provinceCode \"%s\" \n"
const saddProvinceDistrictTemplate string = "SADD province:%s:districts \"%s\" \n"
const hsetProvinceDistrictVnTemplate string = "HSET province:%s:districts:vn \"%s\" \"%s\" \n"
const hsetProvinceDistrictEnTemplate string = "HSET province:%s:districts:en \"%s\" \"%s\" \n"

const hsetWardTemplate string = "HSET ward:%s code \"%s\" name \"%s\" nameEn \"%s\" fullName \"%s\" fullNameEn \"%s\" codeName \"%s\" administrativeUnitId %d districtCode \"%s\" \n"
const saddDistrictWardTemplate string = "SADD district:%s:wards \"%s\" \n"
const hsetDistrictWardVnTemplate string = "HSET district:%s:wards:vn \"%s\" \"%s\" \n"
const hsetDistrictWardEnTemplate string = "HSET district:%s:wards:en \"%s\" \"%s\" \n"

type RedisDatasetFileWriter struct {
	OutputFolderPath string
}

func (w *RedisDatasetFileWriter) WriteToFile(
	regions []vn_common.AdministrativeRegion,
	administrativeUnits []vn_common.AdministrativeUnit,
	provinces []vn_common.Province,
	districts []vn_common.District,
	wards []vn_common.Ward) error {
	
	os.MkdirAll(w.OutputFolderPath, 0746)
	fileTimeSuffix := getFileTimeSuffix()
	
	redisDatasetFilePath := fmt.Sprintf("%s/redis_vn_provinces_dataset_%s.redis", w.OutputFolderPath, fileTimeSuffix)
	redisDatasetFile, err := os.OpenFile(redisDatasetFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if (err != nil) {
		return err
	}

	dataWriter := bufio.NewWriter(redisDatasetFile)
	
	for _, a := range administrativeUnits {
		dataWriter.WriteString(generateAdministrativeRecord(a))
	}

	for _, r := range regions {
		dataWriter.WriteString(generateRegionRecord(r))
	}
	
	for _, p := range provinces {
		dataWriter.WriteString(generateProvinceRecord(p))
		dataWriter.WriteString(generateRegionProvinceRecord(p))
	}
	for _, d := range districts {
		dataWriter.WriteString(generateDistrictRecord(d))
		dataWriter.WriteString(generateProvinceDistrictRelationship(d))
	}
	for _, w := range wards {
		dataWriter.WriteString(generateWardRecord(w))
		dataWriter.WriteString(generateDistrictWardRelationship(w))
	}

	dataWriter.Flush()
	redisDatasetFile.Close()

	return nil
}

func generateAdministrativeRecord(a vn_common.AdministrativeUnit) string {
	return fmt.Sprintf(hsetAdministrativeUnitTemplate, a.Id, a.Id, a.FullName, a.FullNameEn, a.ShortName, a.ShortNameEn, a.CodeName)
}

func generateRegionRecord(r vn_common.AdministrativeRegion) string {
	return fmt.Sprintf(hsetRegionTemplate, r.Id, r.Name, r.NameEn, r.CodeName)
}

func generateRegionProvinceRecord(p vn_common.Province) string {
	return fmt.Sprintf(saddRegionProvinceTemplate, p.AdministrativeRegionId, p.Code) + fmt.Sprintf(hsetRegionProvinceVnTemplate, p.AdministrativeRegionId, p.Code, p.FullName) + fmt.Sprintf(hsetRegionProvinceEnTemplate, p.AdministrativeRegionId, p.Code, p.FullNameEn)
}


func generateProvinceRecord(p vn_common.Province) string {
	return fmt.Sprintf(hsetProvinceTemplate, p.Code, p.Code, p.Name, p.NameEn, p.FullName, p.FullNameEn, p.CodeName, p.AdministrativeUnitId, p.AdministrativeRegionId)
}

func generateDistrictRecord(d vn_common.District) string {
	return fmt.Sprintf(hsetDistrictTemplate, d.Code, d.Code, d.Name, d.NameEn, d.FullName, d.FullNameEn, d.CodeName, d.AdministrativeUnitId, d.ProvinceCode)
}

func generateProvinceDistrictRelationship(d vn_common.District) string {
	return fmt.Sprintf(saddProvinceDistrictTemplate, d.ProvinceCode, d.Code) + fmt.Sprintf(hsetProvinceDistrictVnTemplate, d.ProvinceCode, d.Code, d.FullName) + fmt.Sprintf(hsetProvinceDistrictEnTemplate, d.ProvinceCode, d.Code, d.FullNameEn) 
}

func generateWardRecord(w vn_common.Ward) string {
	return fmt.Sprintf(hsetWardTemplate, w.Code, w.Code, w.Name, w.NameEn, w.FullName, w.FullNameEn, w.CodeName, w.AdministrativeUnitId, w.DistrictCode)
}

func generateDistrictWardRelationship(w vn_common.Ward) string {
	return fmt.Sprintf(saddDistrictWardTemplate, w.DistrictCode , w.Code) + fmt.Sprintf(hsetDistrictWardVnTemplate, w.DistrictCode, w.Code, w.FullName) + fmt.Sprintf(hsetDistrictWardEnTemplate, w.DistrictCode, w.Code, w.FullNameEn) 
}
