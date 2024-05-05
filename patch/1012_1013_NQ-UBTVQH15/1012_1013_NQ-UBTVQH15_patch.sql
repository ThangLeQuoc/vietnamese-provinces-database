/*
* Decree: 1012/NQ-UBTVQH15
* Decree: 1013/NQ-UBTVQH15
*/

/* Change Bến Cát (721) and Gò Công (816) to City */
UPDATE districts
SET full_name = CONCAT('Thành phố ', name), full_name_en  = CONCAT(name_en, ' City'), administrative_unit_id = 4
WHERE code IN ('721', '816');

/* Change An Điền (25840) and An Tây (25843), Long Hưng (28309), Long Thuận (28312), Long Chánh (28315), Long Hoà (28318) to ward */
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('25840','25843','28309','28312','28315','28318');


/*
* (Special) Merge Gò Công (816) wards:
* Merge Ward 4 (28300) to Ward 1 (28303)
* Merge Ward 3 (28294) to Ward 2 (28297)
* Please update your existing record reference of Gò Công City Ward 4 (28300) to Ward 1 (28303), and Ward 3 (28294) to Ward 2 (28297)
*/
DELETE FROM wards WHERE code IN ('28300', '28294');
