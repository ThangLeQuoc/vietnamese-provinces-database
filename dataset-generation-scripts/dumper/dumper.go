package dumper

import (
	"context"
	"encoding/csv"
	"fmt"
	"log"
	"os"
	"strings"
	"unicode"

	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	"golang.org/x/text/runes"
	"golang.org/x/text/transform"
	"golang.org/x/text/unicode/norm"
)

var csv_file_path = "./vn_provinces_ds __15_04_2023.csv"

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

	fmt.Println("Dumper operation finished")
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
		fmt.Println(code + "-" + provincesMap[code])

		fmt.Println("Let's do the magic of inserting record here")
		
		provinceFullName := provincesMap[code]
		administrativeUnitLevel := getAdministrativeUnit_ProvinceLevel(provinceFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		provinceShortName := strings.Trim(strings.Replace(provinceFullName, unitName, "", 1), " ")
		codeName := toCodeName(provinceShortName)
		provinceShortNameEn := normalizeString(provinceShortName)
		provinceFullNameEn := provinceShortNameEn + " " + unitName_en

		provinceModel := &vn_common.Province {
			Code: code,
			Name: provinceShortName,
			NameEn: provinceShortNameEn,
			FullName: provinceFullName,
			FullNameEn: provinceFullNameEn,
			CodeName: codeName,
			AdministrativeUnitId: administrativeUnitLevel,
		}

		fmt.Println(*provinceModel)
		fmt.Println("---")
		
		_, err := db.NewInsert().Model(provinceModel).ExcludeColumn("administrative_region_id").Exec(ctx)

		if (err != nil) {
			fmt.Println(err)
			panic("Exception happens while inserting into provinces table")
		}
		ctx.Done()
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

func normalizeString(source string) string {
	trans := transform.Chain(norm.NFD, runes.Remove(runes.In(unicode.Mn)), norm.NFC)
	result, _, _ := transform.String(trans, source)
	result = strings.ReplaceAll(result, "đ", "d")
	result = strings.ReplaceAll(result, "Đ", "D")
	return result
}

func toCodeName(shortName string) string {
	shortName = strings.ReplaceAll(shortName, " - ", " ")
	return strings.ToLower(strings.ReplaceAll(normalizeString(shortName), " ", "_"))
}