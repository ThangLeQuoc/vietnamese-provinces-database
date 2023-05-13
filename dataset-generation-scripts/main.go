package main

import (
	// vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	// dumper "github.com/thanglequoc-vn-provinces/v2/dumper"
	// patch_writer "github.com/thanglequoc-vn-provinces/v2/patch_writer"

	data_downloader "github.com/thanglequoc-vn-provinces/v2/dvhcvn_data_downloader"
)

func main() {
	// pre-run
	// Refresh temporary dataset, import existing dataset
	// vn_common.BootstrapTemporaryDatasetStructure()
	// vn_common.PersistExistingProvincesDataset()

	// /* Before dumping data, you might need to go to dumper.go to adjust the csv filename for import */
	// dumper.BeginDumpingData()
	// patch_writer.GenerateSQLPatch()

	data_downloader.GetData()
}
