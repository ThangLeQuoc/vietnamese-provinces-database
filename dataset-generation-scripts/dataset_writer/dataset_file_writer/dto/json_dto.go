package dto

type JsonProvinceModel struct {
	Type string
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string

	// Administrative Region props 
	AdministrativeRegionId int
	AdministrativeRegionName string
	AdministrativeRegionNameEn string

	// Administrative Unit props
	AdministrativeUnitId int
	AdministrativeUnitShortName string
	AdministrativeUnitFullName string
	AdministrativeUnitShortNameEn string
	AdministrativeUnitFullNameEn string

	District []JsonDistrictModel
}

type JsonDistrictModel struct {
	Type string
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	ProvinceCode string

	// Administrative Unit props
	AdministrativeUnitId int
	AdministrativeUnitShortName string
	AdministrativeUnitFullName string
	AdministrativeUnitShortNameEn string
	AdministrativeUnitFullNameEn string

	Ward []JsonWardModel
}

type JsonWardModel struct {
	Type string
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	DistrictCode string
	
	// Administrative Unit props
	AdministrativeUnitId int
	AdministrativeUnitShortName string
	AdministrativeUnitFullName string
	AdministrativeUnitShortNameEn string
	AdministrativeUnitFullNameEn string
}

// JSON Simplified version
type JsonProvinceSimplifiedModel struct {
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	District []JsonDistrictSimplifiedModel
}

type JsonDistrictSimplifiedModel struct {
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	ProvinceCode string

	Ward []JsonWardSimplifiedModel
}

type JsonWardSimplifiedModel struct {
	Code string
	Name string
	NameEn string
	FullName string
	FullNameEn string
	CodeName string
	DistrictCode string
}

// VN only Simplified version
type JsonProvinceVNSimplifiedModel struct {
	Code string
	FullName string
	District []JsonDistrictVNSimplifiedModel
}

type JsonDistrictVNSimplifiedModel struct {
	Code string
	FullName string
	ProvinceCode string

	Ward []JsonWardVNSimplifiedModel
}

type JsonWardVNSimplifiedModel struct {
	Code string
	FullName string
	DistrictCode string
}
