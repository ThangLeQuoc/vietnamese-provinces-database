/*
* Decree: 510/NQ-UBTVQH15
*/

/*
 * Change Phương Sơn (07477) and Bắc Lý (07870) from commune (Xã - 10) to township (Thị trấn - 9) 
 * */
UPDATE wards 
SET full_name = CONCAT('Thị trấn ', name), full_name_en = CONCAT(name_en, ' Township'), administrative_unit_id = 9
WHERE code IN ('07477', '07870');
