package dvchvn_data_downloader

import (
	"fmt"
	"io/ioutil"
	"net/http"
	// "regexp"
	"strings"

	"github.com/dlclark/regexp2"
)

const DVHCVN_URL = "https://danhmuchanhchinh.gso.gov.vn/DMDVHC.asmx"

func GetData() {

	httpRequestBody := `<?xml version="1.0" encoding="utf-8"?>
	<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<soap:Body>
			<DanhMucPhuongXa xmlns="http://tempuri.org/">
				<DenNgay>30/05/2001</DenNgay>
			</DanhMucPhuongXa>
		</soap:Body>
	</soap:Envelope>
	`

	res, err := http.Post(DVHCVN_URL, "text/xml", strings.NewReader(httpRequestBody))
	if (err != nil) {
		fmt.Println("Exception occured while making the request")
	}

	body, err := ioutil.ReadAll(res.Body)
	bodyString := string(body)
	// fmt.Println(string(bodyString))
	findAllMatch(bodyString)
}

func findAllMatch(res string) {
	regexPattern := regexp2.MustCompile(`(?<=<TABLE\b[^>]*>)([\s\S\n]*?)(?=<\/TABLE>)`, 0)

	result := regexp2FindAllString(regexPattern, res)
	for _, res := range result {
		fmt.Println(res)
	}
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
