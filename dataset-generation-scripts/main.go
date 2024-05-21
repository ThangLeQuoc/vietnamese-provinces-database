package main

import (
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	dumper "github.com/thanglequoc-vn-provinces/v2/dumper"
	dataset_writer "github.com/thanglequoc-vn-provinces/v2/dataset_writer"
)

func main() {
	// pre-run
	// Refresh temporary dataset, import existing dataset
	vn_common.BootstrapTemporaryDatasetStructure()
	dumper.BeginDumpingDataWithDvhcvnDirectSource()
	dataset_writer.ReadAndGenerateSQLDatasets()

	/* Thing to improve
	Get and generate record set directly, without step to write to temporary database.
	*/

}
