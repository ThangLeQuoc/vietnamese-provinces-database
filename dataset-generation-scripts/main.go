package main

import (
	"fmt"

	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	dumper "github.com/thanglequoc-vn-provinces/v2/dumper"
)

func main() {
	fmt.Println("Hello world")

	// Refresh temporary dataset
	vn_common.BootstrapTemporaryDatasetStructure()
	vn_common.PersistExistingProvincesDataset()
	dumper.BeginDumpingData()
}
