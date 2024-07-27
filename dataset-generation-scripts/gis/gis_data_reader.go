/* GIS Data Reader */

package gis

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
)

func ReadGISDataFiles() ProvinceGIS {
	jsonFile, err := os.Open("./resources/gis/01.json")
	if err != nil {
    fmt.Println(err)
	}


	var dvhcvnGIS ProvinceGIS
	byteValue, _ := io.ReadAll(jsonFile)
	json.Unmarshal(byteValue, &dvhcvnGIS)

	return dvhcvnGIS
}
