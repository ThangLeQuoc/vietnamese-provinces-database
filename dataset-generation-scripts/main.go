package main

import (
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	dumper "github.com/thanglequoc-vn-provinces/v2/dumper"
)

func main() {
	// pre-run

	// Refresh temporary dataset, import existing dataset
	vn_common.BootstrapTemporaryDatasetStructure()
	vn_common.PersistExistingProvincesDataset()

	dumper.BeginDumpingData()
}
