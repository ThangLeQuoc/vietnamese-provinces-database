/* Hotfix 26 April 2023 */
/* 
- Remove trailing space
- Phường Phường Đúc has incorrect shortname, should be "Phường Đúc", this is caused by improper administrative unit removal during the data creation
- Quân Chu (05764) to be removed since Quân Chu commune has been merged into Quân Chu township (05851). See: 729/NQ-UBTVQH15
- Cầu Đất ward code changes from 11353 to 11344
*/

-- Remove trailing space in ward name
UPDATE wards SET "name"='Cò Nòi', name_en='Co Noi', full_name='Xã Cò Nòi', full_name_en='Co Noi Commune', code_name='co_noi' WHERE code='04138';
UPDATE wards SET "name"='Hoàng Văn Thụ', name_en='Hoang Van Thu', full_name='Xã Hoàng Văn Thụ', full_name_en='Hoang Van Thu Commune', code_name='hoang_van_thu' WHERE code='06178';
UPDATE wards SET "name"='Dương Hồng Thủy', name_en='Duong Hong Thuy', full_name='Xã Dương Hồng Thủy', full_name_en='Duong Hong Thuy Commune', code_name='duong_hong_thuy' WHERE code='12916';
UPDATE wards SET "name"='Mỹ Lộc', name_en='My Loc', full_name='Xã Mỹ Lộc', full_name_en='My Loc Commune', code_name='my_loc' WHERE code='12949';
UPDATE wards SET "name"='Tây Sơn', name_en='Tay Son', full_name='Thị trấn Tây Sơn', full_name_en='Tay Son Township', code_name='tay_son' WHERE code='18136';
UPDATE wards SET "name"='Ngư Thủy', name_en='Ngu Thuy', full_name='Xã Ngư Thủy', full_name_en='Ngu Thuy Commune', code_name='ngu_thuy' WHERE code='19306';
UPDATE wards SET "name"='A Dơi', name_en='A Doi', full_name='Xã A Dơi', full_name_en='A Doi Commune', code_name='a_doi', district_code='465' WHERE code='19483';
UPDATE wards SET "name"='Hải Châu I', name_en='Hai Chau I', full_name='Phường Hải Châu I', full_name_en='Hai Chau I Ward', code_name='hai_chau_i' WHERE code='20236';
UPDATE wards SET "name"='Tư', name_en='Tu', full_name='Xã Tư', full_name_en='Tu Commune', code_name='tu' WHERE code='20482';
UPDATE wards SET "name"='Bình Thanh', name_en='Binh Thanh', full_name='Xã Bình Thanh', full_name_en='Binh Thanh Commune', code_name='binh_thanh' WHERE code='21091';
UPDATE wards SET "name"='Hành Tín Đông', name_en='Hanh Tin Dong', full_name='Xã Hành Tín Đông', full_name_en='Hanh Tin Dong Commune', code_name='hanh_tin_dong' WHERE code='21397';
UPDATE wards SET "name"='Đắk Lao', name_en='Dak Lao', full_name='Xã Đắk Lao', full_name_en='Dak Lao Commune', code_name='dak_lao' WHERE code='24667';
UPDATE wards SET "name"='Phước Cát', name_en='Phuoc Cat', full_name='Thị trấn Phước Cát', full_name_en='Phuoc Cat Township', code_name='phuoc_cat' WHERE code='25180';
UPDATE wards SET "name"='An Lạc', name_en='An Lac', full_name='Phường An Lạc', full_name_en='An Lac Ward', code_name='an_lac' WHERE code='27460';
UPDATE wards SET "name"='Bình Khánh', name_en='Binh Khanh', full_name='Xã Bình Khánh', full_name_en='Binh Khanh Commune', code_name='binh_khanh' WHERE code='28945';
UPDATE wards SET "name"='Tân Khánh Trung', name_en='Tan Khanh Trung', full_name='Xã Tân Khánh Trung', full_name_en='Tan Khanh Trung Commune', code_name='tan_khanh_trung' WHERE code='30181';
UPDATE wards SET "name"='Hòa Thuận', name_en='Hoa Thuan', full_name='Xã Hòa Thuận', full_name_en='Hoa Thuan Commune', code_name='hoa_thuan' WHERE code='30949';
UPDATE wards SET "name"='Đại Ân 2', name_en='Dai An 2', full_name='Xã Đại Ân 2', full_name_en='Dai An 2 Commune', code_name='dai_an_2' WHERE code='31672';
UPDATE wards SET "name"='Tạ An Khương Đông', name_en='Ta An Khuong Dong', full_name='Xã Tạ An Khương Đông', full_name_en='Ta An Khuong Dong Commune', code_name='ta_an_khuong_dong' WHERE code='32158';
UPDATE wards SET "name"='Tạ An Khương Nam', name_en='Ta An Khuong Nam', full_name='Xã Tạ An Khương Nam', full_name_en='Ta An Khuong Nam Commune', code_name='ta_an_khuong_nam' WHERE code='32170';

-- Remove Quân Chu (05764)
DELETE FROM wards WHERE code = '05764';

-- Update Phường Phường Đúc has incorrect shortname
UPDATE wards SET "name"='Phường Đúc', name_en='Phuong Duc', full_name='Phường Phường Đúc', full_name_en='Phuong Duc Ward', code_name='phuong_duc' WHERE code='19780';

-- Cầu Đất ward code changes from 11353 to 11344
UPDATE wards SET code = '11344' WHERE code = '11353';
