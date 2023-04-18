/*
* Decree: 721/NQ-UBTVQH15
*/
-- Change Tịnh Biên (890) from district (Huyện - 7) to town (Thị xã - 6) 
UPDATE districts
SET full_name = CONCAT('Thị xã ', name), full_name_en  = CONCAT(name_en, ' Town'), administrative_unit_id = 6
WHERE code IN ('890');

-- Change Tịnh Biên, Nhà Bàng, Chi Lăng, An Phú, Nhơn Hưng, Núi Voi, Thới Sơn to ward (Phường - 8) 
-- Tịnh Biên: 30520
-- Nhà Bàng: 30502
-- Chi Lăng: 30505
-- An Phú: 30514
-- Nhơn Hưng: 30511
-- Núi Voi: 30508
-- Thới Sơn: 30517
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('30520','30502','30505','30514', '30511', '30508', '30517');

-- Change Đa Phước, Hội An to township (Thị trấn - 9)
-- Đa Phước - 30373
-- Hội An - 30673
UPDATE wards
SET full_name = CONCAT('Thị trấn ', name), full_name_en  = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('30373', '30673');

-- ------------------------------------
/*
* Decree: 722/NQ-UBTVQH15
*/
-- Change Vân Tùng (01954) -> Thị trấn/Township 9
UPDATE wards
SET full_name = CONCAT('Thị trấn ', name), full_name_en  = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('01954');
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 723/NQ-UBTVQH15
*/
-- Change Thuận Thành (262) -> Thị xã/Town 6
-- Change Quế Võ (259) -> Thị xã/Town (6)
UPDATE districts
SET full_name = CONCAT('Thị xã ', name), full_name_en  = CONCAT(name_en, ' Town'), administrative_unit_id = 6
WHERE code IN ('262', '259');


-- Hồ (09400) -> Phường / Ward (8)
-- An Bình (09418) -> Phường / Ward (8)
-- Song Hồ (09412) -> Phường / Ward (8)
-- Gia Đông (09424) -> Phường / Ward (8)
-- Thanh Khương (09427) -> Phường / Ward (8)
-- Hà Mãn (09436) -> Phường / Ward (8)
-- Trạm Lộ (09430) -> Phường / Ward (8)
-- Trí Quả (09421) -> Phường / Ward (8)
-- Xuân Lâm (09433) -> Phường / Ward (8)
-- Ninh Xá (09445) -> Phường / Ward (8)
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('09400','09418','09412','09424','09427','09436','09430','09421','09433','09445');

-- Phố Mới (09247) -> Phường / Ward (8)
-- Việt Hùng (09283) -> Phường / Ward (8)
-- Bằng An (09262) -> Phường / Ward (8)
-- Phượng Mao (09280) -> Phường / Ward (8)
-- Phương Liễu (09265) -> Phường / Ward (8)
-- Đại Xuân (09253) -> Phường / Ward (8)
-- Nhân Hoà (09259) -> Phường / Ward (8)
-- Quế Tân (09268) -> Phường / Ward (8)
-- Phù Lương (09274) -> Phường / Ward (8)
-- Bồng Lai (09295) -> Phường / Ward (8)
-- Cách Bi (09298) -> Phường / Ward (8)
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('09247','09283','09262','09280','09265','09253','09259','09268','09274','09295','09298');
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 724/NQ-UBTVQH15
*/

-- Tiên Thủy (28861) -> Thị trấn/Township (9)
-- Phước Mỹ Trung (28915) -> Thị trấn/Township (9)
UPDATE wards
SET full_name = CONCAT('Thị trấn ', name), full_name_en  = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('28861', '28915');

-- Tiệm Tôm (29179) from An Thủy -> Thị trấn/Township (9)
UPDATE wards
SET name = 'Tiệm Tôm', full_name = 'Thị trấn Tiệm Tôm', name_en = 'Tiem Tom', full_name_en = 'Tiem Tom Township', code_name = 'tiem_tom', administrative_unit_id = 9
WHERE code = '29179';
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 725/NQ-UBTVQH15
*/

-- Tân Uyên (723) -> Thành phố trực thuộc tỉnh/City (4)
UPDATE districts
SET full_name = CONCAT('Thành phố ', name), full_name_en  = CONCAT(name_en, ' City'), administrative_unit_id = 4
WHERE code IN ('723');
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 726/NQ-UBTVQH15
*/
-- Pơng Drang (24316) -> Thị trấn/Township (9)
UPDATE wards
SET full_name = CONCAT('Thị trấn ', name), full_name_en  = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('24316');
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 727/NQ-UBTVQH15
*/
-- Điện Thắng Bắc (20560) -> Phường / Ward (8)
-- Điện Thắng Trung (20561) -> Phường / Ward (8)
-- Điện Thắng Nam (20562) -> Phường / Ward (8)
-- Điện Minh (20593) -> Phường / Ward (8)
-- Điện Phương (20596) -> Phường / Ward (8)
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('20560','20561','20562','20593','20596');

-- Quế Trung (20656) -> Trung Phước -> Thị trấn/ Township (9)
UPDATE wards
SET name = 'Trung Phước', full_name = 'Thị trấn Trung Phước', name_en = 'Trung Phuoc', full_name_en = 'Trung Phuoc Township', code_name = 'trung_phuoc', administrative_unit_id = 9
WHERE code = '20656';
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 729/NQ-UBTVQH15
*/
-- Hoá Thượng (05692) -> Thị trấn / Township (9)
-- Quân Chu (05851) -> Thị trấn / Township (9)
UPDATE wards
SET full_name = CONCAT('Thị trấn ', name), full_name_en  = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('05692', '05851');
-- ------------------------------------

-- ------------------------------------
/*
* Decree: 730/NQ-UBTVQH15
*/
-- Kim Long (08878) -> Thị trấn / Township (9)
-- Tam Hồng (09043) -> Thị trấn / Township (9)
UPDATE wards
SET full_name = CONCAT('Thị trấn ', name), full_name_en  = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('08878', '09043');

-- Định Trung (08725) -> Phường / Ward (8)
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('08725');
