package dumper

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
)

var csv_file_path = "./vn_provinces_ds __15_04_2023.csv"

func BeginDumpingData() {
	records := readCSVAdministrativeRecords(csv_file_path)

	insertToProvinces(records)

	// numberOfRecordToRead := 30

	// for _, record := range records {
	// 	fmt.Println(record.ProvinceName + " " + record.ProvinceCode)
	// 	numberOfRecordToRead--
	// 	if numberOfRecordToRead == 0 {
	// 		break
	// 	}
	// }
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
	for _, code := range provincesMapKey {
		fmt.Println(code + "-" + provincesMap[code])
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
