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
	vn_common.PersistExistingProvincesDataset() // @thangle: What the heck is the purpose?

	dumper.BeginDumpingDataWithDvhcvnDirectSource()
	//patch_writer.GenerateSQLPatch()

	dataset_writer.ReadAndGenerateSQLDatasets()

}
