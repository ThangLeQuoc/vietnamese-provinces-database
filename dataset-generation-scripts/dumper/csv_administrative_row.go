package dumper

type CsvAdministrativeRow struct {
	ProvinceName string
	ProvinceCode string
	DistrictName string
	DistrictCode string
	WardName     string
	WardCode     string
	WardUnitName string
	EnglishName  string
}

var AdministrativeUnitNames [8]string = [...]string{
	"Thành phố",
	"Tỉnh",
	"Quận",
	"Thị xã",
	"Huyện",
	"Phường",
	"Thị trấn",
	"Xã",
}

var AdministrativeUnitNamesShortNameMap_vn = map[int]string {
	1: "Thành phố",
	2: "Tỉnh",
	3: "Thành phố",
	4: "Thành phố",
	5: "Quận",
	6: "Thị xã",
	7: "Huyện",
	8: "Phường",
	9: "Thị trấn",
	10: "Xã",
}

var AdministrativeUnitNamesShortNameMap_en = map[int]string {
	1: "City",
	2: "Province",
	3: "City",
	4: "City",
	5: "District",
	6: "Town",
	7: "District",
	8: "Ward",
	9: "Township",
	10: "Commune",
}

var ProvinceRegionMap = map[string]int {
	"01": 3,
	"26": 3,
	"27": 3,
	"30": 3,
	"31": 3,
	"33": 3,
	"34": 3,
	"35": 3,
	"96": 8,
	"02": 1,
	"04": 1,
	"06": 1,
	"08": 1,
	"19": 1,
	"20": 1,
	"22": 1,
	"24": 1,
	"25": 1,
	"10": 2,
	"11": 2,
	"12": 2,
	"14": 2,
	"15": 2,
	"17": 2,
	"70": 7,
	"72": 7,
	"74": 7,
	"75": 7,
	"79": 7,
	"77": 7,
	"36": 3,
	"37": 3,
	"38": 4,
	"40": 4,
	"42": 4,
	"44": 4,
	"45": 4,
	"46": 4,
	"48": 5,
	"49": 5,
	"51": 5,
	"52": 5,
	"54": 5,
	"56": 5,
	"58": 5,
	"60": 5,
	"62": 6,
	"64": 6,
	"66": 6,
	"67": 6,
	"68": 6,
	"80": 8,
	"82": 8,
	"83": 8,
	"84": 8,
	"86": 8,
	"87": 8,
	"89": 8,
	"91": 8,
	"92": 8,
	"93": 8,
	"94": 8,
	"95": 8,
}
