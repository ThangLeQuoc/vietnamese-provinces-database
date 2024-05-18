package dvhcvn_data_downloader

import (
	"regexp"
	"github.com/dlclark/regexp2"
	"strings"
)

/*
Create the DvhcvnModel from the dvhcvn response object.
Input should be the dvhcvn content within the <TABLE> tag
E.g: <MaTinh>68</MaTinh><TenTinh>Tỉnh Lâm Đồng</TenTinh><MaQuanHuyen>675</MaQuanHuyen><TenQuanHuyen>Huyện Lạc Dương</TenQuanHuyen><MaPhuongXa>24846</MaPhuongXa><TenPhuongXa>Thị trấn Lạc Dương</TenPhuongXa><LoaiHinh>Thị trấn</LoaiHinh>
*/
// TODO @thangle #Test: Add test for this one
func toDvhcvnModel(s string) DvhcvnModel {
	maTinhRegex := regexp.MustCompile("<MaTinh>(.+)<\\/MaTinh>")
	maTinh := sanitizeString(maTinhRegex.FindStringSubmatch(s)[1])

	tenTinhRegex := regexp.MustCompile("<TenTinh>(.+)<\\/TenTinh>")
	tenTinh := sanitizeString(tenTinhRegex.FindStringSubmatch(s)[1])

	maQuanHuyenRegex := regexp.MustCompile("<MaQuanHuyen>(.+)<\\/MaQuanHuyen>")
	maQuanHuyen := sanitizeString(maQuanHuyenRegex.FindStringSubmatch(s)[1])

	tenQuanHuyenRegex := regexp.MustCompile("<TenQuanHuyen>(.+)<\\/TenQuanHuyen>")
	tenQuanHuyen := sanitizeString(tenQuanHuyenRegex.FindStringSubmatch(s)[1])

	maPhuongXaRegex := regexp.MustCompile("<MaPhuongXa>(.+)<\\/MaPhuongXa>")
	maPhuongXa := sanitizeString(maPhuongXaRegex.FindStringSubmatch(s)[1])

	tenPhuongXaRegex := regexp.MustCompile("<TenPhuongXa>(.+)<\\/TenPhuongXa>")
	tenPhuongXa := sanitizeString(tenPhuongXaRegex.FindStringSubmatch(s)[1])

	loaiHinhRegex := regexp.MustCompile("<LoaiHinh>(.+)<\\/LoaiHinh>")
	loaiHinh := sanitizeString(loaiHinhRegex.FindStringSubmatch(s)[1])

	return DvhcvnModel{
		MaTinh:       maTinh,
		TenTinh:      convertStandardUnitName(tenTinh),
		MaQuanHuyen:  maQuanHuyen,
		TenQuanHuyen: convertStandardUnitName(tenQuanHuyen),
		MaPhuongXa:   maPhuongXa,
		TenPhuongXa:  convertStandardUnitName(tenPhuongXa),
		LoaiHinh:     loaiHinh,
	}
}

/*
Standardize Adminstrative Unit name to follow correct Vietnamese typography
E.g: Thành phố, instead of Thành Phố
This method is put to use because some district/ward result from DVHCVN API does not follow the unify typography pattern
*/
// TODO @thangle #Test : Add unit test for this one
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
// TODO @thanglequoc: Add test
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

// TODO @thanglequoc: Add test
func sanitizeString(s string) string {
	return strings.Trim(
		strings.ReplaceAll(s, "  ", " "), " ")
}
