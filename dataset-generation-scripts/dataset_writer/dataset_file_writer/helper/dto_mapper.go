package helper

import (
	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	dataset_file_writer_dto "github.com/thanglequoc-vn-provinces/v2/dataset_writer/dataset_file_writer/dto"
)

func ConvertToMongoProvinceModel(provinces []vn_common.Province) []dataset_file_writer_dto.MongoProvinceModel {
	var result []dataset_file_writer_dto.MongoProvinceModel
	for _, province := range provinces {
		p := dataset_file_writer_dto.MongoProvinceModel {
			Type: "province",
			Code: province.Code,
			Name: province.Name,
			NameEn: province.NameEn,
			FullName: province.FullName,
			FullNameEn: province.FullNameEn,
			CodeName: province.CodeName,
			AdministrativeUnitId: province.AdministrativeUnitId,
			AdministrativeRegionId: province.AdministrativeRegionId,
		}

		if (len(province.District) != 0) {
			districts := make([]vn_common.District, len(province.District))
			for i, d := range province.District {
				districts[i] = *d
			}
			p.District = ConvertToMongoDistrictModel(districts)
		}
		result = append(result, p)
	}

	return result
}

func ConvertToMongoDistrictModel(districts []vn_common.District) []dataset_file_writer_dto.MongoDistrictModel {
	var result []dataset_file_writer_dto.MongoDistrictModel

	for _, district := range districts {
		d := dataset_file_writer_dto.MongoDistrictModel {
			Type: "district",
			Code: district.Code,
			Name: district.Name,
			NameEn: district.NameEn,
			FullName: district.FullName,
			FullNameEn: district.FullNameEn,
			CodeName: district.CodeName,
			ProvinceCode: district.ProvinceCode,
			AdministrativeUnitId: district.AdministrativeUnitId,
		}

		if (len(district.Ward) != 0) {
			wards := make([]vn_common.Ward, len(district.Ward))
			for i, w := range district.Ward {
				wards[i] = *w
			}
			d.Ward = ConvertToMongoWardModel(wards)
		}
		result = append(result, d)
	}
	return result
}

func ConvertToMongoWardModel(wards []vn_common.Ward) []dataset_file_writer_dto.MongoWardModel {
	var result []dataset_file_writer_dto.MongoWardModel

	for _, ward := range wards {
		w := dataset_file_writer_dto.MongoWardModel {
			Type: "ward",
			Code: ward.Code,
			Name: ward.Name,
			NameEn: ward.NameEn,
			FullName: ward.FullName,
			FullNameEn: ward.FullNameEn,
			CodeName: ward.CodeName,
			DistrictCode: ward.DistrictCode,
			AdministrativeUnitId: ward.AdministrativeUnitId,
		}
		result = append(result, w)
	}
	
	return result
}
