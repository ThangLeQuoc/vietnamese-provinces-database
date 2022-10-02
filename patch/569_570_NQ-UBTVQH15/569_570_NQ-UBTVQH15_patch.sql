/*
* Decree: 569/NQ-UBTVQH15
* Decree: 570/NQ-UBTVQH15
*/

/*
 * Change Bình Phú (28471) from commune (Xã - 10) to township (Thị trấn - 9) 
 * */
UPDATE wards 
SET full_name = CONCAT('Thị trấn ', name), full_name_en = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('28471');

/*
* Change Chơn Thành township (25432) to Hưng Long Ward (Phường - 8)
*/
UPDATE wards 
SET name = 'Hưng Long', 
name_en = 'Hung Long', full_name = 'Phường Hưng Long', full_name_en = 'Hung Long Ward', code_name = 'hung_long', administrative_unit_id = 8
WHERE code IN ('25432');

/*
 * Change Thành Tâm, Minh Hưng, Minh Long, Minh Thành from commune (Xã - 10) to ward (Phường - 8) 
 * */
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('25433','25441','25444','25447');

/*
* Change Chơn Thành district (697) from Huyện to Thị xã
*/
UPDATE districts
SET full_name = CONCAT('Thị xã ', name), full_name_en  = CONCAT(name_en, ' Town'), administrative_unit_id = 6
WHERE code IN ('697');
