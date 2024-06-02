package dataset_writer

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"time"

	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
)

type PostgresMySQLDatasetFileWriter struct {
	OutputFilePath string
}

// region insert statement
const insertAdministrativeRegionTemplate string = "INSERT INTO administrative_regions(id,name,name_en,code_name,code_name_en) VALUES(%d,'%s','%s','%s','%s');"

// administrative_unit insert_statement
const insertAdministrativeUnitTemplate string = "INSERT INTO administrative_units(id,full_name,full_name_en,short_name,short_name_en,code_name,code_name_en) VALUES(%d,'%s','%s','%s','%s','%s','%s');"

// province insert statement
const insertProvinceTemplate string = "INSERT INTO provinces(code,name,name_en,full_name,full_name_en,code_name,administrative_unit_id,administrative_region_id) VALUES"
const insertProvinceValueTemplate string = "('%s','%s','%s','%s','%s','%s',%d,%d)"

// district insert statement
const insertDistrictTemplate string = "INSERT INTO districts(code,name,name_en,full_name,full_name_en,code_name,province_code,administrative_unit_id) VALUES"

// ward insert statement
const insertWardTemplate string = "INSERT INTO wards(code,name,name_en,full_name,full_name_en,code_name,district_code,administrative_unit_id) VALUES"
const insertDistrictWardValueTemplate string = "('%s','%s','%s','%s','%s','%s','%s',%d)"

const batchInsertItemSize int = 50

func (w *PostgresMySQLDatasetFileWriter) WriteToFile(
	regions []vn_common.AdministrativeRegion,
	administrativeUnits []vn_common.AdministrativeUnit,
	provinces []vn_common.Province,
	districts []vn_common.District,
	wards []vn_common.Ward) error {

	fileTimeSuffix := getFileTimeSuffix()
	outputFilePath := fmt.Sprintf(w.OutputFilePath, fileTimeSuffix)
	file, err := os.OpenFile(outputFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatal("Unable to write to file", err)
		panic(err)
	}

	dataWriter := bufio.NewWriter(file)
	dataWriter.WriteString("/* === Vietnamese Provinces Database Dataset for PostgreSQL/MySQL === */\n")
	dataWriter.WriteString(fmt.Sprintf("/* Created at:  %s */\n", time.Now().Format(time.RFC1123Z)))
	dataWriter.WriteString("/* Reference: https://github.com/ThangLeQuoc/vietnamese-provinces-database */\n")
	dataWriter.WriteString("/* =============================================== */\n\n")

	dataWriter.WriteString("-- DATA for administrative_regions --\n")
	for _, r := range regions {
		insertLine := fmt.Sprintf(insertAdministrativeRegionTemplate,
			r.Id, r.Name, r.NameEn, r.CodeName, r.CodeNameEn)
		dataWriter.WriteString(insertLine + "\n")
	}
	dataWriter.WriteString("------------------------------------\n\n")

	dataWriter.WriteString("-- DATA for administrative_units --\n")

	// Write for administrativeUnits
	for _, u := range administrativeUnits {
		insertLine := fmt.Sprintf(insertAdministrativeUnitTemplate,
			u.Id, u.FullName, u.FullNameEn, u.ShortName, u.ShortNameEn, u.CodeName, u.CodeNameEn)
		dataWriter.WriteString(insertLine + "\n")
	}
	dataWriter.WriteString("------------------------------------\n\n")

	// variable to generate batch insert statement
	counter := 0
	isAppending := false

	dataWriter.WriteString("-- DATA for provinces --\n")
	for i, p := range provinces {
		if !isAppending {
			dataWriter.WriteString(insertProvinceTemplate + "\n")
		}
		dataWriter.WriteString(
			fmt.Sprintf(insertProvinceValueTemplate, p.Code, escapeSingleQuote(p.Name), escapeSingleQuote(p.NameEn), escapeSingleQuote(p.FullName),
				escapeSingleQuote(p.FullNameEn), p.CodeName, p.AdministrativeUnitId, p.AdministrativeRegionId))
		counter++

		// the batch insert statement batch reach limit, break and create a new batch insert statement
		if counter == batchInsertItemSize || i == len(provinces)-1 {
			isAppending = false
			dataWriter.WriteString(";\n\n")
			counter = 0 // reset counter
		} else {
			dataWriter.WriteString(",\n")
			isAppending = true
		}
	}
	dataWriter.WriteString("-- ----------------------------------\n\n")

	dataWriter.WriteString("-- DATA for districts --\n")
	counter = 0
	isAppending = false

	for i, d := range districts {
		if !isAppending {
			dataWriter.WriteString(insertDistrictTemplate + "\n")
		}
		dataWriter.WriteString(
			fmt.Sprintf(insertDistrictWardValueTemplate, d.Code, escapeSingleQuote(d.Name), escapeSingleQuote(d.NameEn), escapeSingleQuote(d.FullName),
				escapeSingleQuote(d.FullNameEn), d.CodeName, d.ProvinceCode, d.AdministrativeUnitId))
		counter++

		// the batch insert statement batch reach limit, break and create a new batch insert statement
		if counter == batchInsertItemSize || i == len(districts)-1 {
			isAppending = false
			dataWriter.WriteString(";\n\n")
			counter = 0 // reset counter
		} else {
			dataWriter.WriteString(",\n")
			isAppending = true
		}
	}
	dataWriter.WriteString("-- ----------------------------------\n\n")

	dataWriter.WriteString("-- DATA for wards --\n")
	counter = 0
	isAppending = false

	for i, w := range wards {
		if !isAppending {
			dataWriter.WriteString(insertWardTemplate + "\n")
		}
		dataWriter.WriteString(
			fmt.Sprintf(insertDistrictWardValueTemplate, w.Code, escapeSingleQuote(w.Name), escapeSingleQuote(w.NameEn), escapeSingleQuote(w.FullName),
				escapeSingleQuote(w.FullNameEn), w.CodeName, w.DistrictCode, w.AdministrativeUnitId))
		counter++

		// the batch insert statement batch reach limit, break and create a new batch insert statement
		if counter == batchInsertItemSize || i == len(wards)-1 {
			isAppending = false
			dataWriter.WriteString(";\n\n")
			counter = 0 // reset counter
		} else {
			dataWriter.WriteString(",\n")
			isAppending = true
		}
	}
	dataWriter.WriteString("-- ----------------------------------\n")
	dataWriter.WriteString("-- END OF SCRIPT FILE --\n")

	dataWriter.Flush()
	file.Close()
	return nil
}
