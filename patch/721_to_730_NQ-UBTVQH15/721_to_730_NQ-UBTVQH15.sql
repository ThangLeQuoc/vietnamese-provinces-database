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
