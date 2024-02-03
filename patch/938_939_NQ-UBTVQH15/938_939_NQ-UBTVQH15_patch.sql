/*
* Decree: 938/NQ-UBTVQH15
* Decree: 939/NQ-UBTVQH15
*/

/*
 * Change Việt Yên (222) from district (Huyện - 7) to district level town (Thị xã - 6) 
 * */
UPDATE districts
SET full_name = CONCAT('Thị xã ', name), full_name_en  = CONCAT(name_en, ' Town'), administrative_unit_id = 6
WHERE code IN ('222');

/*
 * Change Tự Lạn, Bích Động, Hồng Thái, Tăng Tiến, Quảng Minh, Nếnh, Ninh Sơn, Vân Trung, Quang Châu to ward (Phường - 8)
 */
UPDATE wards
SET full_name = CONCAT('Phường ', name), full_name_en  = CONCAT(name_en, ' Ward'), administrative_unit_id = 8
WHERE code IN ('07774','07777','07783','07789','07792','07795','07798','07801','07807');

/*
* (Special) Merge Thiệu Phú commune(xã) (15790) to Thiệu Hóa township(thị trấn) (15772)
* Please update your existing record reference from 15790 to 15772
*/
DELETE FROM wards WHERE code = '15790';

/*
* Change Minh Tâm commune(xã) to Hậu Hiền township(thị trấn)
*/
UPDATE wards SET "name"='Hậu Hiền', name_en='Hau Hien', full_name='Thị trấn Hậu Hiền', full_name_en='Hau Hien Township', code_name='hau_hien', district_code='398', administrative_unit_id=9 WHERE code='15829';
