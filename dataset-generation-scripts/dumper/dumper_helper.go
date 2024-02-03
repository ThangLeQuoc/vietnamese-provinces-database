package dumper

import (
	data_downloader "github.com/thanglequoc-vn-provinces/v2/dvhcvn_data_downloader"
) 

func ToCsvAdministrativeRows(dvhcvnUnits []data_downloader.DvhcvnModel) []CsvAdministrativeRow {
	var result []CsvAdministrativeRow
	for _, d := range dvhcvnUnits {
		result = append(result, CsvAdministrativeRow{
				ProvinceName: d.TenTinh,
				ProvinceCode: d.MaTinh,
				DistrictName: d.TenQuanHuyen,
				DistrictCode: d.MaQuanHuyen,
				WardName:     d.TenPhuongXa,
				WardCode:     d.MaPhuongXa,
				WardUnitName: d.LoaiHinh,
		})
	}
	return result
}
