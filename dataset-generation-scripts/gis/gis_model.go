package gis

type LatLng struct {
	Latitude float64
	Longitude float64
}

type ProvinceGIS struct {
	LevelId string `json:"level1_id"`
	Name string `json:"name"`

	Districts []DistrictGIS `json:"level2s"`
	BBox BBox `json:"bbox"`
	Type string `json:"type"`
}

type DistrictGIS struct {

}

type BBox struct {
	TopLeft float64
	TopRight float64
	BottomLeft float64
	BottomRight float64
}



/*
- level_id
- name
- coordinates
- bbox
- type

*/