-- Persist the region & administrative records, since this data does not comes from DVHCVN API

-- DATA for administrative_regions
INSERT INTO administrative_regions (id,"name",name_en,code_name,code_name_en) VALUES
	 (1,'Đông Bắc Bộ','Northeast','dong_bac_bo','northest'),
	 (2,'Tây Bắc Bộ','Northwest','tay_bac_bo','northwest'),
	 (3,'Đồng bằng sông Hồng','Red River Delta','dong_bang_song_hong','red_river_delta'),
	 (4,'Bắc Trung Bộ','North Central Coast','bac_trung_bo','north_central_coast'),
	 (5,'Duyên hải Nam Trung Bộ','South Central Coast','duyen_hai_nam_trung_bo','south_central_coast'),
	 (6,'Tây Nguyên','Central Highlands','tay_nguyen','central_highlands'),
	 (7,'Đông Nam Bộ','Southeast','dong_nam_bo','southeast'),
	 (8,'Đồng bằng sông Cửu Long','Mekong River Delta','dong_bang_song_cuu_long','southwest');

-- DATA for administrative_units
INSERT INTO administrative_units (id,full_name,full_name_en,short_name,short_name_en,code_name,code_name_en) VALUES
	 (1,'Thành phố trực thuộc trung ương','Municipality','Thành phố','City','thanh_pho_truc_thuoc_trung_uong','municipality'),
	 (2,'Tỉnh','Province','Tỉnh','Province','tinh','province'),
	 (3,'Thành phố thuộc thành phố trực thuộc trung ương','Municipal city','Thành phố','City','thanh_pho_thuoc_thanh_pho_truc_thuoc_trung_uong','municipal_city'),
	 (4,'Thành phố thuộc tỉnh','Provincial city','Thành phố','City','thanh_pho_thuoc_tinh','provincial_city'),
	 (5,'Quận','Urban district','Quận','District','quan','urban_district'),
	 (6,'Thị xã','District-level town','Thị xã','Town','thi_xa','district_level_town'),
	 (7,'Huyện','District','Huyện','District','huyen','district'),
	 (8,'Phường','Ward','Phường','Ward','phuong','ward'),
	 (9,'Thị trấn','Commune-level town','Thị trấn','Township','thi_tran','commune_level_town'),
	 (10,'Xã','Commune','Xã','Commune','xa','commune');
