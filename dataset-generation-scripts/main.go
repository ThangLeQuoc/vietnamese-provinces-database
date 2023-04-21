package main

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
)

func main() {
	fmt.Println("Hello world")




	filePath := "./vn_provinces_ds __15_04_2023.csv"
	records := readCsvFile(filePath)

	numberOfRecordToRead := 30
	for _, record := range records {
		fmt.Println(record[0] + " " + record[1])
		numberOfRecordToRead--
		if numberOfRecordToRead == 0 {
			break
		}
	}

	// Refresh temporary dataset
	vn_common.BootstrapTemporaryDatasetStructure()

	fmt.Println("Dumper operation finished")
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
