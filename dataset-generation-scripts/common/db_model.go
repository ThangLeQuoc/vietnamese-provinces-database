package common

import (
	"github.com/uptrace/bun"
)

type Province struct {
	bun.BaseModel `bun:"table:provinces,alias:p"`
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
	bun.BaseModel `bun:"table:districts,alias:d"`
	Code string `bun:"code,notnull"`
	Name string `bun:"name,notnull"`
	NameEn string `bun:"name_en,notnull"`
	FullName string `bun:"full_name,notnull"`
	FullNameEn string `bun:"full_name_en"`
	CodeName string `bun:"code_name"`
	ProvinceCode string `bun:"province_code"`
	AdministrativeUnitId int `bun:"administrative_unit_id"`
}
