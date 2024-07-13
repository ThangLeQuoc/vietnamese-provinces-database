package dvhcvn_data_downloader

import (
	"fmt"
	"io"
	"net/http"
	"strings"
	"time"
	"log"
)

const DVHCVN_URL = "https://danhmuchanhchinh.gso.gov.vn/DMDVHC.asmx"

/*
Fetch the data from the public government API url
Required the selected data date
*/
func FetchDvhcvnData(publicDataDate time.Time) []DvhcvnModel {
	fmt.Printf("⬇️ Downloading provinces data patch from %s\n", DVHCVN_URL)
	dataAPIDateStr := publicDataDate.Format("02/01/2006") // dd/MM/YYYY

	httpRequestBody := fmt.Sprintf(`<?xml version="1.0" encoding="utf-8"?>
	<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
		<soap:Body>
			<DanhMucPhuongXa xmlns="http://tempuri.org/">
				<DenNgay>%s</DenNgay>
			</DanhMucPhuongXa>
		</soap:Body>
	</soap:Envelope>
	`, dataAPIDateStr)

	res, err := http.Post(DVHCVN_URL, "text/xml", strings.NewReader(httpRequestBody))
	if err != nil {
		fmt.Println("Exception occurred while making the request")
		log.Fatal(err)
	}

	body, _ := io.ReadAll(res.Body)
	bodyString := string(body)

	return extractDvhcvnUnits(bodyString)
}
