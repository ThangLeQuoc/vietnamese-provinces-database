package main

import (
	// vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	dataset_writer "github.com/thanglequoc-vn-provinces/v2/dataset_writer"
	// dumper "github.com/thanglequoc-vn-provinces/v2/dumper"
	vn_gis "github.com/thanglequoc-vn-provinces/v2/gis"
)

func main() {
	// pre-run
	// Refresh temporary dataset, import existing dataset
	// vn_common.BootstrapTemporaryDatasetStructure()
	// dumper.BeginDumpingDataWithDvhcvnDirectSource()
	
	gisData := vn_gis.ReadGISDataFiles()
	dataset_writer.ReadAndGenerateSQLDatasets(gisData)
}
