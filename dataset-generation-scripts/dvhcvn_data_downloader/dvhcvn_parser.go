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

	proviceCode := extractRegexValue(`<MaTinh>(.+)</MaTinh>`, s)
	proviceName := extractRegexValue(`<TenTinh>(.+)</TenTinh>`, s)
	
	districtCode := extractRegexValue(`<MaQuanHuyen>(.+)</MaQuanHuyen>`, s)
	districtName := extractRegexValue(`<TenQuanHuyen>(.+)</TenQuanHuyen>`, s)

	wardCode := extractRegexValue(`<MaPhuongXa>(.+)</MaPhuongXa>`, s)
	wardName := extractRegexValue(`<TenPhuongXa>(.+)</TenPhuongXa>`, s)

	return DvhcvnModel{
		ProvinceCode: proviceCode,
		ProvinceName: convertStandardUnitName(proviceName),
		DistrictCode: districtCode,
		DistrictName: convertStandardUnitName(districtName),
		WardCode:     wardCode,
		WardName:     convertStandardUnitName(wardName),
		WardUnit:     "",
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

func extractRegexValue(pattern string, s string) string {
	regex := regexp.MustCompile(pattern)
	if match := regex.FindStringSubmatch(s); match != nil {
		return sanitizeString(match[1])
	}
	return ""
}
