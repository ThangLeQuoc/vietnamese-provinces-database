package main

import (
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	dataset_writer "github.com/thanglequoc-vn-provinces/v2/dataset_writer"
	dumper "github.com/thanglequoc-vn-provinces/v2/dumper"
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

	// provinces := vn_common.GetAllProvinces()
	// for i, p := range provinces {
	// 	data, _ := json.MarshalIndent(p, "", " ")
	// 	fmt.Println(string(data))

	// 	if (i >= 5) {
	// 		break
	// 	}
	// }

}
