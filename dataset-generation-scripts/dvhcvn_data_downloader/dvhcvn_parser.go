package dvhcvn_data_downloader

import (
	"github.com/dlclark/regexp2"
	"regexp"
	"strings"
)

/*
Create the DvhcvnModel from the dvhcvn response object.
Input should be the dvhcvn content within the <TABLE> tag
E.g: <MaTinh>68</MaTinh><TenTinh>Tỉnh Lâm Đồng</TenTinh><MaQuanHuyen>675</MaQuanHuyen><TenQuanHuyen>Huyện Lạc Dương</TenQuanHuyen><MaPhuongXa>24846</MaPhuongXa><TenPhuongXa>Thị trấn Lạc Dương</TenPhuongXa><LoaiHinh>Thị trấn</LoaiHinh>
*/
func toDvhcvnModel(s string) DvhcvnModel {
	proviceCodeRegex := regexp.MustCompile(`<MaTinh>(.+)</MaTinh>`)
	proviceCode := sanitizeString(proviceCodeRegex.FindStringSubmatch(s)[1])

	proviceNameRegex := regexp.MustCompile(`<TenTinh>(.+)</TenTinh>`)
	proviceName := sanitizeString(proviceNameRegex.FindStringSubmatch(s)[1])

	districtCodeRegex := regexp.MustCompile(`<MaQuanHuyen>(.+)</MaQuanHuyen>`)
	districtCode := sanitizeString(districtCodeRegex.FindStringSubmatch(s)[1])

	districtNameRegex := regexp.MustCompile(`<TenQuanHuyen>(.+)</TenQuanHuyen>`)
	districtName := sanitizeString(districtNameRegex.FindStringSubmatch(s)[1])

	wardCodeRegex := regexp.MustCompile(`<MaPhuongXa>(.+)</MaPhuongXa>`)
	wardCode := sanitizeString(wardCodeRegex.FindStringSubmatch(s)[1])

	wardNameRegex := regexp.MustCompile(`<TenPhuongXa>(.+)</TenPhuongXa>`)
	wardName := sanitizeString(wardNameRegex.FindStringSubmatch(s)[1])

	wardUnitRegex := regexp.MustCompile(`<LoaiHinh>(.+)</LoaiHinh>`)
	wardUnit := sanitizeString(wardUnitRegex.FindStringSubmatch(s)[1])

	return DvhcvnModel{
		ProvinceCode: proviceCode,
		ProvinceName: convertStandardUnitName(proviceName),
		DistrictCode: districtCode,
		DistrictName: convertStandardUnitName(districtName),
		WardCode:     wardCode,
		WardName:     convertStandardUnitName(wardName),
		WardUnit:     wardUnit,
	}
}

/*
Standardize Adminstrative Unit name to follow correct Vietnamese typography
E.g: Thành phố, instead of Thành Phố
This method is put to use because some district/ward result from DVHCVN API does not follow the unify typography pattern
*/
func convertStandardUnitName(s string) string {
	if strings.HasPrefix(s, "Thành Phố") {
		return strings.Replace(s, "Thành Phố", "Thành phố", 1)
	}
	if strings.HasPrefix(s, "Thị Xã") {
		return strings.Replace(s, "Thị Xã", "Thị xã", 1)
	}
	if strings.HasPrefix(s, "Thị Trấn") {
		return strings.Replace(s, "Thị Trấn", "Thị trấn", 1)
	}
	return s
}

/*
Extract the XML response from DVHCVN api to DvhcvnModels
*/
func extractDvhcvnUnits(res string) []DvhcvnModel {
	regexPattern := regexp2.MustCompile(`(?<=<TABLE\b[^>]*>)([\s\S\n]*?)(?=<\/TABLE>)`, 0)
	dvhcvnUnitBlocks := regexp2FindAllString(regexPattern, res)

	var result []DvhcvnModel
	for _, unit := range dvhcvnUnitBlocks {
		result = append(result, toDvhcvnModel(unit))
	}
	return result
}

func regexp2FindAllString(re *regexp2.Regexp, s string) []string {
	var matches []string
	m, _ := re.FindStringMatch(s)
	for m != nil {
		matches = append(matches, m.String())
		m, _ = re.FindNextMatch(m)
	}
	return matches
}

func sanitizeString(s string) string {
	return strings.Trim(
		strings.ReplaceAll(s, "  ", " "), " ")
}
