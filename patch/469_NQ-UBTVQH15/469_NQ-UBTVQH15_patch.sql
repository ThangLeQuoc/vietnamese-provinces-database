/*
* Decree: 469/NQ-UBTVQH15
*/

/*
 * Change Phổ Yên (172) from District-level town (Thị xã - 6) to provincial city (Thành phố thuộc tỉnh - 4)
 *  */
UPDATE districts
SET full_name = 'Thành phố Phổ Yên', full_name_en = 'Pho Yen City', administrative_unit_id = 4
WHERE code = '172' AND administrative_unit_id = 6;

/*
 * Change Hồng Tiến, Đắc Sơn, Tiên Phong, Nam Tiến, Tân Hương, Đông Cao, Trung Thành, Tân Phú, Thuận Thành from commune (Xã - 10) to ward (Phường - 8) 
 * */
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('05869', '05875', '05884', '05890', '05893', '05896', '05899', '05902', '05905') AND administrative_unit_id  = 10;
