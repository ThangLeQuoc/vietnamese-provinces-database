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
