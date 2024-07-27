package gis

import (
	"encoding/json"
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
	TopLeft float64
	TopRight float64
	BottomLeft float64
	BottomRight float64
}


func (b *BBox) UnmarshalJSON(data []byte) error {
	var bboxArray [4]float64
	if err := json.Unmarshal(data, &bboxArray); err != nil {
			return err
	}

	b.TopLeft = bboxArray[0]
	b.TopRight = bboxArray[1]
	b.BottomLeft = bboxArray[2]
	b.BottomRight = bboxArray[3]
	return nil
}
