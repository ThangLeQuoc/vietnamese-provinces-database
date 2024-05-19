package dvhcvn_data_downloader

/*
Response model from the DVHCVN Soap API
Sample model response:

```

<TABLE diffgr:id="TABLE173" msdata:rowOrder="172">
	<MaTinh>01</MaTinh>
	<TenTinh>Thành phố Hà Nội</TenTinh>
	<MaQuanHuyen>017</MaQuanHuyen>
	<TenQuanHuyen>Huyện Đông Anh</TenQuanHuyen>
	<MaPhuongXa>00514</MaPhuongXa>
	<TenPhuongXa>Xã Võng La</TenPhuongXa>
	<LoaiHinh>Xã</LoaiHinh>
</TABLE>

```
*/
type DvhcvnModel struct {
	ProvinceCode string // <MaTinh>
	ProvinceName string // <TenTinh>
	DistrictCode string // <MaQuanHuyen>
	DistrictName string // <TenQuanHuyen>
	WardCode string // <MaPhuongXa>
	WardName string // <TenPhuongXa>
	WardUnit string // <LoaiHinh>
}
