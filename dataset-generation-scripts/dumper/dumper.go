package dumper

import (
	"context"
	"encoding/csv"
	"fmt"
	"log"
	"os"
	"regexp"
	"strings"
	"unicode"

	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	"golang.org/x/text/runes"
	"golang.org/x/text/transform"
	"golang.org/x/text/unicode/norm"
)

var csv_file_path = "./resources/vn_provinces_ds__15_04_2023.csv"

func CleanUpCSVFileBeforeRun() {
	// TODO @thanglequoc: Clean up and replace "Thị Xã", "Thị Trấn", "Thành Phố" to the standard form before proceed
	// Maybe replace double spaces and pre-trimming as well?
}

func BeginDumpingData() {
	records := readCSVAdministrativeRecords(csv_file_path)
	/*
	   Thing to do:
	   - insert to provinces table
	   - insert to districts table
	   - insert to wards table
	   -
	*/
	insertToProvinces(records)
	insertToDistricts(records)
	insertToWards(records)

	fmt.Println("Dumper operation finished")
}

func insertToWards(administrativeRecordModels []CsvAdministrativeRow) {
	db := vn_common.GetPostgresDBConnection()
	ctx := context.Background()
	totalWard := 0

	for _, a := range administrativeRecordModels {
		if a.WardName == "" {
			fmt.Println("Unable to determine ward for record ")
			fmt.Printf("%+v\n", a)
			continue
		}

		wardFullName := removeWhiteSpaces(a.WardName)
		administrativeUnitLevel := getAdministrativeUnit_WardLevel(wardFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		wardShortName := strings.Trim(strings.Replace(wardFullName, unitName, "", 1), " ")
		codeName := toCodeName(wardShortName)
		wardShortNameEn := normalizeString(wardShortName)

		// Case when district name is a number
		isNumber, _ := regexp.MatchString("[0-9]+", wardShortName)
		var wardFullNameEn string
		if isNumber {
			wardFullNameEn = unitName_en + " " + wardShortNameEn
		} else {
			wardFullNameEn = wardShortNameEn + " " + unitName_en
		}

		wardModel := &vn_common.Ward{
			Code:                 a.WardCode,
			Name:                 wardShortName,
			NameEn:               wardShortNameEn,
			FullName:             wardFullName,
			FullNameEn:           wardFullNameEn,
			CodeName:             codeName,
			AdministrativeUnitId: administrativeUnitLevel,
			DistrictCode:         a.DistrictCode,
		}

		_, err := db.NewInsert().Model(wardModel).Exec(ctx)
		totalWard++
		if err != nil {
			fmt.Println(err)
			panic("Exception happens while inserting into wards table")
		}
	}

	fmt.Printf("Inserted %d wards to tables\n", totalWard)
}

func insertToDistricts(administrativeRecordModels []CsvAdministrativeRow) {
	districtsMap := make(map[string]string)
	districtProvinceMap := make(map[string]string)
	var districtsMapKey []string

	for _, a := range administrativeRecordModels {
		if _, exists := districtsMap[a.DistrictCode]; !exists {
			districtsMapKey = append(districtsMapKey, a.DistrictCode)
		}
		districtsMap[a.DistrictCode] = a.DistrictName
		districtProvinceMap[a.DistrictCode] = a.ProvinceCode
	}

	db := vn_common.GetPostgresDBConnection()
	ctx := context.Background()

	for _, code := range districtsMapKey {
		districtFullName := removeWhiteSpaces(districtsMap[code])
		administrativeUnitLevel := getAdministrativeUnit_DistrictLevel(districtFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		districtShortName := strings.Trim(strings.Replace(districtFullName, unitName, "", 1), " ")
		codeName := toCodeName(districtShortName)
		districtShortNameEn := normalizeString(districtShortName)

		// Case when district name is a number
		isNumber, _ := regexp.MatchString("[0-9]+", districtShortName)
		var districtFullNameEn string
		if isNumber {
			districtFullNameEn = unitName_en + " " + districtShortNameEn
		} else {
			districtFullNameEn = districtShortNameEn + " " + unitName_en
		}

		districtModel := &vn_common.District{
			Code:                 code,
			Name:                 districtShortName,
			NameEn:               districtShortNameEn,
			FullName:             districtFullName,
			FullNameEn:           districtFullNameEn,
			CodeName:             codeName,
			AdministrativeUnitId: administrativeUnitLevel,
			ProvinceCode:         districtProvinceMap[code],
		}

		_, err := db.NewInsert().Model(districtModel).Exec(ctx)
		if err != nil {
			fmt.Println(err)
			panic("Exception happens while inserting into districts table")
		}
	}

	fmt.Printf("Inserted %d districts to tables\n", len(districtsMapKey))
}

func insertToProvinces(administrativeRecordModels []CsvAdministrativeRow) {

	provincesMap := make(map[string]string)
	var provincesMapKey []string

	for _, a := range administrativeRecordModels {
		if _, exists := provincesMap[a.ProvinceCode]; !exists {
			provincesMapKey = append(provincesMapKey, a.ProvinceCode)
		}
		provincesMap[a.ProvinceCode] = a.ProvinceName
	}

	db := vn_common.GetPostgresDBConnection()
	ctx := context.Background()
	for _, code := range provincesMapKey {
		provinceFullName := removeWhiteSpaces(provincesMap[code])
		administrativeUnitLevel := getAdministrativeUnit_ProvinceLevel(provinceFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		provinceShortName := strings.Trim(strings.Replace(provinceFullName, unitName, "", 1), " ")
		codeName := toCodeName(provinceShortName)
		provinceShortNameEn := normalizeString(provinceShortName)
		provinceFullNameEn := provinceShortNameEn + " " + unitName_en
		regionId := ProvinceRegionMap[code]

		provinceModel := &vn_common.Province{
			Code:                   code,
			Name:                   provinceShortName,
			NameEn:                 provinceShortNameEn,
			FullName:               provinceFullName,
			FullNameEn:             provinceFullNameEn,
			CodeName:               codeName,
			AdministrativeUnitId:   administrativeUnitLevel,
			AdministrativeRegionId: regionId,
		}

		_, err := db.NewInsert().Model(provinceModel).Exec(ctx)
		if err != nil {
			fmt.Println(err)
			panic("Exception happens while inserting into provinces table")
		}
	}

	fmt.Printf("Inserted %d provinces to tables\n", len(provincesMapKey))
}

/*
Read from the csv and parse to an array of CsvAdministrativeRow
*/
func readCSVAdministrativeRecords(csvFilePath string) []CsvAdministrativeRow {
	csvRows := readCsvFile(csvFilePath)
	var administrativeRecords []CsvAdministrativeRow

	// we skip the first row, which is the csv column header
	for _, row := range csvRows[1:] {
		administrativeRecords = append(administrativeRecords,
			CsvAdministrativeRow{
				ProvinceName: row[0],
				ProvinceCode: row[1],
				DistrictName: row[2],
				DistrictCode: row[3],
				WardName:     row[4],
				WardCode:     row[5],
				WardUnitName: row[6],
				EnglishName:  row[7],
			})
	}
	return administrativeRecords
}

func readCsvFile(filePath string) [][]string {
	var file *os.File
	var err error

	file, err = os.Open(filePath)
	if err != nil {
		log.Fatal("Unable to read csv file", err)
	}
	defer file.Close()

	csvReader := csv.NewReader(file)
	records, err := csvReader.ReadAll()
	if err != nil {
		log.Fatal("Unable to read csv records", err)
	}
	return records
}

func getAdministrativeUnit_ProvinceLevel(provinceFullName string) int {
	if strings.Contains(provinceFullName, "Thành phố") {
		return 1
	}
	if strings.Contains(provinceFullName, "Tỉnh") {
		return 2
	}
	panic("Unable to determine administrative unit name from province: " + provinceFullName)
}

func getAdministrativeUnit_DistrictLevel(districtFullName string) int {
	if strings.Contains(districtFullName, "Thành phố") {
		if strings.Contains(districtFullName, "Thủ Đức") { // handle a special case, only Thủ Đức is the municipal city
			return 3
		}
		return 4
	}
	if strings.Contains(districtFullName, "Quận") {
		return 5
	}
	if strings.Contains(districtFullName, "Thị xã") {
		return 6
	}
	if strings.Contains(districtFullName, "Huyện") {
		return 7
	}
	panic("Unable to determine administrative unit name from district: " + districtFullName)
}

func getAdministrativeUnit_WardLevel(wardFullName string) int {
	if strings.Contains(wardFullName, "Phường") {
		return 8
	}
	if strings.Contains(wardFullName, "Thị trấn") {
		return 9
	}
	if strings.Contains(wardFullName, "Xã") {
		return 10
	}
	panic("Unable to determine administrative unit name from ward: " + wardFullName)
}

func normalizeString(source string) string {
	trans := transform.Chain(norm.NFD, runes.Remove(runes.In(unicode.Mn)), norm.NFC)
	result, _, _ := transform.String(trans, source)
	result = strings.ReplaceAll(result, "đ", "d")
	result = strings.ReplaceAll(result, "Đ", "D")
	return result
}

func toCodeName(shortName string) string {
	shortName = strings.ReplaceAll(shortName, " - ", " ")
	shortName = strings.ReplaceAll(shortName, "'", "") // to handle special name with single quote
	return strings.ToLower(strings.ReplaceAll(normalizeString(shortName), " ", "_"))
}

func removeWhiteSpaces(name string) string {
	return strings.Trim(strings.ReplaceAll(name, "  ", " "), " ")
}
