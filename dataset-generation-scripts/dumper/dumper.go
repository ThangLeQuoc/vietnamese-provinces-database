package dumper

import (
	"context"
	"fmt"
	"os"
	"regexp"
	"strings"
	"time"
	"unicode"
	"bufio"

	vn_common "github.com/thanglequoc-vn-provinces/v2/common"
	"golang.org/x/text/runes"
	"golang.org/x/text/transform"
	"golang.org/x/text/unicode/norm"

	data_downloader "github.com/thanglequoc-vn-provinces/v2/dvhcvn_data_downloader"
)


func BeginDumpingDataWithDvhcvnDirectSource() {
	fmt.Print("(Optional) Please specify the data date (dd/MM/YYYY). Leave empty to go with default option: ")

	reader := bufio.NewReader(os.Stdin)	

	userInput, _ := reader.ReadString('\n')
	userInput = strings.TrimSpace(userInput)
	fmt.Println("Selected date: ", userInput)

	var dataSetTime time.Time
	if (len(strings.TrimSpace(userInput)) == 0) {
		fmt.Println("No input is recorded, using tomorrow as the default day...")
		dataSetTime = time.Now().Add(time.Hour * 24)
	} else {
		dataSetTime, _ = time.Parse("02/01/2006", userInput) // dd/MM/yyyy
	}

	dvhcvnUnits := data_downloader.FetchDvhcvnData(dataSetTime)


	insertToProvinces(dvhcvnUnits)
	insertToDistricts(dvhcvnUnits)
	insertToWards(dvhcvnUnits)
	fmt.Println("📥 Dumper operation finished")
}

func insertToWards(administrativeRecordModels []data_downloader.DvhcvnModel) {
	db := vn_common.GetPostgresDBConnection()
	ctx := context.Background()
	totalWard := 0

	for _, a := range administrativeRecordModels {
		if a.WardName == "" {
			fmt.Println("Unable to determine ward for record ")
			fmt.Printf("%+v\n", a)
			continue
		}

		wardFullName := removeWhiteSpaces(a.WardName)
		administrativeUnitLevel := getAdministrativeUnit_WardLevel(wardFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		wardShortName := strings.Trim(strings.Replace(wardFullName, unitName, "", 1), " ")
		codeName := toCodeName(wardShortName)
		wardShortNameEn := normalizeString(wardShortName)

		// Case when district name is a number
		isNumber, _ := regexp.MatchString("[0-9]+", wardShortName)
		var wardFullNameEn string
		if isNumber {
			wardFullNameEn = unitName_en + " " + wardShortNameEn
		} else {
			wardFullNameEn = wardShortNameEn + " " + unitName_en
		}

		wardModel := &vn_common.Ward{
			Code:                 a.WardCode,
			Name:                 wardShortName,
			NameEn:               wardShortNameEn,
			FullName:             wardFullName,
			FullNameEn:           wardFullNameEn,
			CodeName:             codeName,
			AdministrativeUnitId: administrativeUnitLevel,
			DistrictCode:         a.DistrictCode,
		}

		_, err := db.NewInsert().Model(wardModel).Exec(ctx)
		totalWard++
		if err != nil {
			fmt.Println(err)
			panic("Exception happens while inserting into wards table")
		}
	}

	fmt.Printf("Inserted %d wards to tables\n", totalWard)
}

func insertToDistricts(administrativeRecordModels []data_downloader.DvhcvnModel) {
	districtsMap := make(map[string]string)
	districtProvinceMap := make(map[string]string)
	var districtsMapKey []string

	for _, a := range administrativeRecordModels {
		if _, exists := districtsMap[a.DistrictCode]; !exists {
			districtsMapKey = append(districtsMapKey, a.DistrictCode)
		}
		districtsMap[a.DistrictCode] = a.DistrictName
		districtProvinceMap[a.DistrictCode] = a.ProvinceCode
	}

	db := vn_common.GetPostgresDBConnection()
	ctx := context.Background()

	for _, code := range districtsMapKey {
		districtFullName := removeWhiteSpaces(districtsMap[code])
		administrativeUnitLevel := getAdministrativeUnit_DistrictLevel(districtFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		districtShortName := strings.Trim(strings.Replace(districtFullName, unitName, "", 1), " ")
		codeName := toCodeName(districtShortName)
		districtShortNameEn := normalizeString(districtShortName)

		// Case when district name is a number
		isNumber, _ := regexp.MatchString("[0-9]+", districtShortName)
		var districtFullNameEn string
		if isNumber {
			districtFullNameEn = unitName_en + " " + districtShortNameEn
		} else {
			districtFullNameEn = districtShortNameEn + " " + unitName_en
		}

		districtModel := &vn_common.District{
			Code:                 code,
			Name:                 districtShortName,
			NameEn:               districtShortNameEn,
			FullName:             districtFullName,
			FullNameEn:           districtFullNameEn,
			CodeName:             codeName,
			AdministrativeUnitId: administrativeUnitLevel,
			ProvinceCode:         districtProvinceMap[code],
		}

		_, err := db.NewInsert().Model(districtModel).Exec(ctx)
		if err != nil {
			fmt.Println(err)
			panic("Exception happens while inserting into districts table")
		}
	}

	fmt.Printf("Inserted %d districts to tables\n", len(districtsMapKey))
}

func insertToProvinces(administrativeRecordModels []data_downloader.DvhcvnModel) {

	provincesMap := make(map[string]string)
	var provincesMapKey []string

	for _, a := range administrativeRecordModels {
		if _, exists := provincesMap[a.ProvinceCode]; !exists {
			provincesMapKey = append(provincesMapKey, a.ProvinceCode)
		}
		provincesMap[a.ProvinceCode] = a.ProvinceName
	}

	db := vn_common.GetPostgresDBConnection()
	ctx := context.Background()
	for _, code := range provincesMapKey {
		provinceFullName := removeWhiteSpaces(provincesMap[code])
		administrativeUnitLevel := getAdministrativeUnit_ProvinceLevel(provinceFullName)
		unitName := AdministrativeUnitNamesShortNameMap_vn[administrativeUnitLevel]
		unitName_en := AdministrativeUnitNamesShortNameMap_en[administrativeUnitLevel]
		provinceShortName := strings.Trim(strings.Replace(provinceFullName, unitName, "", 1), " ")
		codeName := toCodeName(provinceShortName)
		provinceShortNameEn := normalizeString(provinceShortName)
		provinceFullNameEn := provinceShortNameEn + " " + unitName_en
		regionId := ProvinceRegionMap[code]

		provinceModel := &vn_common.Province{
			Code:                   code,
			Name:                   provinceShortName,
			NameEn:                 provinceShortNameEn,
			FullName:               provinceFullName,
			FullNameEn:             provinceFullNameEn,
			CodeName:               codeName,
			AdministrativeUnitId:   administrativeUnitLevel,
			AdministrativeRegionId: regionId,
		}

		_, err := db.NewInsert().Model(provinceModel).Exec(ctx)
		if err != nil {
			fmt.Println(err)
			panic("Exception happens while inserting into provinces table")
		}
	}

	fmt.Printf("Inserted %d provinces to tables\n", len(provincesMapKey))
}

/*
Determine the province administrative unit id from its name
*/
func getAdministrativeUnit_ProvinceLevel(provinceFullName string) int {
	specialUnit, matchSpecialCase := SpecialAdministrativeUnitMap[provinceFullName]
	if (matchSpecialCase) {
		return specialUnit
	}

	if strings.HasPrefix(provinceFullName, "Thành phố") {
		return 1
	}
	if strings.HasPrefix(provinceFullName, "Tỉnh") {
		return 2
	}
	panic("Unable to determine administrative unit name from province: " + provinceFullName)
}

/*
Determine the district administrative unit id from its name
*/
func getAdministrativeUnit_DistrictLevel(districtFullName string) int {
	specialUnit, matchSpecialCase := SpecialAdministrativeUnitMap[districtFullName]
	if (matchSpecialCase) {
		return specialUnit
	}
	
	if strings.HasPrefix(districtFullName, "Thành phố") {
		return 4
	}
	if strings.HasPrefix(districtFullName, "Quận") {
		return 5
	}
	if strings.HasPrefix(districtFullName, "Thị xã") {
		return 6
	}
	if strings.HasPrefix(districtFullName, "Huyện") {
		return 7
	}
	panic("Unable to determine administrative unit name from district: " + districtFullName)
}

/*
Determine the ward administrative unit id from its name
*/
func getAdministrativeUnit_WardLevel(wardFullName string) int {
	specialUnit, matchSpecialCase := SpecialAdministrativeUnitMap[wardFullName]
	if (matchSpecialCase) {
		return specialUnit
	}

	if strings.HasPrefix(wardFullName, "Phường") {
		return 8
	}
	if strings.HasPrefix(wardFullName, "Thị trấn") {
		return 9
	}
	if strings.HasPrefix(wardFullName, "Xã") {
		return 10
	}
	panic("Unable to determine administrative unit name from ward: " + wardFullName)
}

/*
Normalize string to remove Vietnamese special character and sign
*/
func normalizeString(source string) string {
	trans := transform.Chain(norm.NFD, runes.Remove(runes.In(unicode.Mn)), norm.NFC)
	result, _, _ := transform.String(trans, source)
	result = strings.ReplaceAll(result, "đ", "d")
	result = strings.ReplaceAll(result, "Đ", "D")
	return result
}

/*
Generate code name from the name
*/
func toCodeName(shortName string) string {
	shortName = strings.ReplaceAll(shortName, " - ", " ")
	shortName = strings.ReplaceAll(shortName, "'", "") // to handle special name with single quote
	return strings.ToLower(strings.ReplaceAll(normalizeString(shortName), " ", "_"))
}

func removeWhiteSpaces(name string) string {
	return strings.Trim(strings.ReplaceAll(name, "  ", " "), " ")
}
