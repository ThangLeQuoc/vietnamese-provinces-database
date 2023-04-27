package common

import (
	"github.com/uptrace/bun"
)

type AdministrativeUnit struct {
	bun.BaseModel `bun:"table:administrative_units,alias:au"`
	Id int `bun:"id,notnull"`
	FullName string `bun:"full_name"`
	FullNameEn string `bun:"full_name_en"`
	ShortName string `bun:"short_name"`
	ShortNameEn string `bun:"short_name_en"`
	CodeName string `bun:"code_name"`
	CodeNameEn string `bun:"code_name_en"`
}

type AdministrativeRegion struct {
	bun.BaseModel `bun:"table:administrative_regions,alias:ar"`
	Id int `bun:"id,notnull"`
	Name string `bun:"name"`
	NameEn string `bun:"name_en"`
	CodeName string `bun:"code_name"`
	CodeNameEn string `bun:"code_name_en"`
}

type Province struct {
	bun.BaseModel `bun:"table:provinces_tmp,alias:p"`
	Code string `bun:"code,notnull"`
	Name string `bun:"name,notnull"`
	NameEn string `bun:"name_en,notnull"`
	FullName string `bun:"full_name,notnull"`
	FullNameEn string `bun:"full_name_en"`
	CodeName string `bun:"code_name"`
	AdministrativeUnitId int `bun:"administrative_unit_id"`
	AdministrativeRegionId int `bun:"administrative_region_id"`
}

type District struct {
	bun.BaseModel `bun:"table:districts_tmp,alias:d"`
	Code string `bun:"code,notnull"`
	Name string `bun:"name,notnull"`
	NameEn string `bun:"name_en,notnull"`
	FullName string `bun:"full_name,notnull"`
	FullNameEn string `bun:"full_name_en"`
	CodeName string `bun:"code_name"`
	ProvinceCode string `bun:"province_code"`
	AdministrativeUnitId int `bun:"administrative_unit_id"`
}

type Ward struct {
	bun.BaseModel `bun:"table:wards_tmp,alias:w"`
	Code string `bun:"code,notnull"`
	Name string `bun:"name,notnull"`
	NameEn string `bun:"name_en,notnull"`
	FullName string `bun:"full_name,notnull"`
	FullNameEn string `bun:"full_name_en"`
	CodeName string `bun:"code_name"`
	DistrictCode string `bun:"district_code"`
	AdministrativeUnitId int `bun:"administrative_unit_id"`
}
