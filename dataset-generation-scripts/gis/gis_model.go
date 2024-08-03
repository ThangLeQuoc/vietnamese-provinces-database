package gis

import (
	"encoding/json"
	"fmt"
)

type LatLng struct {
	Latitude float64
	Longitude float64
}

type ProvinceGIS struct {
	LevelId string `json:"level1_id"`
	Name string `json:"name"`
	Districts []DistrictGIS `json:"level2s"`
	Coordinates [][][][]float64 `json:"coordinates"`
	BBox BBox `json:"bbox"`
	Type string `json:"type"`
}

type DistrictGIS struct {
	LevelId string `json:"level2_id"`
	Name string `json:"name"`
	Coordinates [][][][]float64 `json:"coordinates"`
	BBox BBox `json:"bbox"`
	Type string `json:"type"`
}

type BBox struct {
	BottomLeftLat float64
	BottomLeftLng float64

	TopLeftLat float64
	TopLeftLng float64

	TopRightLat float64
	TopRightLng float64

	BottomRightLat float64
	BottomRightLng float64
}


// TODO @thangle: This is not correct
func (b *BBox) UnmarshalJSON(data []byte) error {
	var bboxArray [4]float64

	// @thangle: The bbox array format from daohoangson gis resource is 
	// 2 first digits: BottomLeft coordinate LatLng
	// 2 last digits: TopRight coordinate LatLng
	if err := json.Unmarshal(data, &bboxArray); err != nil {
			return err
	}

	b.BottomLeftLat = bboxArray[0]
	b.BottomLeftLng = bboxArray[1]

	b.TopLeftLat = bboxArray[2]
	b.TopLeftLng = bboxArray[1]
	
	b.TopRightLat = bboxArray[2]
	b.TopRightLng = bboxArray[3]

	b.BottomRightLat = bboxArray[0]
	b.BottomRightLng = bboxArray[3]
	return nil
}

func ToCoordinateStr(lat float64, lng float64) string {
	return fmt.Sprintf("%f %f", lat, lng) 
}
