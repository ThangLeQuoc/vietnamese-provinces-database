package common

import (
	"github.com/uptrace/bun"
)

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
