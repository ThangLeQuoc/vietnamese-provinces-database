package dto

type MongoProvinceModel struct {
	Type string
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	AdministrativeUnitId int
	AdministrativeRegionId int

	District []MongoDistrictModel
}

type MongoDistrictModel struct {
	Type string
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	ProvinceCode string
	AdministrativeUnitId int

	Ward []MongoWardModel
}

type MongoWardModel struct {
	Type string
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	DistrictCode string
	AdministrativeUnitId int
}
