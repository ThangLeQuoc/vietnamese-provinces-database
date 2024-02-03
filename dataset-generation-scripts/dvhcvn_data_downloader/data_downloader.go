package dvhcvn_data_downloader

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"regexp"
	"strings"

	"github.com/dlclark/regexp2"
)

const DVHCVN_URL = "https://danhmuchanhchinh.gso.gov.vn/DMDVHC.asmx"

func FetchDvhcvnData() []DvhcvnModel {
	// TODO @thangle: Dynamically populate tomorrow date at the time the script run
	fmt.Printf("Downloading provinces data patch from %s\n", DVHCVN_URL)
	httpRequestBody := `<?xml version="1.0" encoding="utf-8"?>
	<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<soap:Body>
			<DanhMucPhuongXa xmlns="http://tempuri.org/">
				<DenNgay>30/02/2024</DenNgay>
			</DanhMucPhuongXa>
		</soap:Body>
	</soap:Envelope>
	`
	res, err := http.Post(DVHCVN_URL, "text/xml", strings.NewReader(httpRequestBody))
	if err != nil {
		fmt.Println("Exception occured while making the request")
	}

	body, err := ioutil.ReadAll(res.Body)
	bodyString := string(body)

	return extractDvhcvnUnits(bodyString)
}

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

/*
Create the DvhcvnModel from the dvhcvn response object.
Input should be the dvhcvn content within the <TABLE> tag
E.g: <MaTinh>68</MaTinh><TenTinh>Tỉnh Lâm Đồng</TenTinh><MaQuanHuyen>675</MaQuanHuyen><TenQuanHuyen>Huyện Lạc Dương</TenQuanHuyen><MaPhuongXa>24846</MaPhuongXa><TenPhuongXa>Thị trấn Lạc Dương</TenPhuongXa><LoaiHinh>Thị trấn</LoaiHinh>
*/
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

func sanitizeString(s string) string {
	return strings.Trim(
		strings.ReplaceAll(s, "  ", " "), " ")
}

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
