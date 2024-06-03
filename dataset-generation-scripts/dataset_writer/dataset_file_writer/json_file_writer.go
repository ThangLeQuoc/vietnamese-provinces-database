package dataset_writer

import (
	"bufio"
	"encoding/json"
	"fmt"
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	"os"

	file_writer_helper "github.com/thanglequoc-vn-provinces/v2/dataset_writer/dataset_file_writer/helper"
)

type JSONDatasetFileWriter struct {
	OutputFilePath string
}

func (w *JSONDatasetFileWriter) WriteToFile(
	regions []vn_common.AdministrativeRegion,
	administrativeUnits []vn_common.AdministrativeUnit,
	provinces []vn_common.Province,
	districts []vn_common.District,
	wards []vn_common.Ward) error {

	fileTimeSuffix := getFileTimeSuffix()
	outputFilePath := fmt.Sprintf(w.OutputFilePath, fileTimeSuffix)
	file, err := os.OpenFile(outputFilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)

	dataWriter := bufio.NewWriter(file)

	provinceData := file_writer_helper.ConvertToJsonProvinceModel(provinces)
	data, _ := json.MarshalIndent(provinceData, "", " ")
	dataWriter.Write(data)
	dataWriter.Flush()
	file.Close()
	return err
}
