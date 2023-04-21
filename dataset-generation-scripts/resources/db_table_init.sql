DROP TABLE IF EXISTS wards;
DROP TABLE IF EXISTS districts;
DROP TABLE IF EXISTS provinces;
DROP TABLE IF EXISTS administrative_units;
DROP TABLE IF EXISTS administrative_regions;

-- CREATE administrative_regions TABLE
CREATE TABLE administrative_regions (
	id integer NOT NULL,
	"name" varchar(255) NOT NULL,
	name_en varchar(255) NOT NULL,
	code_name varchar(255) NULL,
	code_name_en varchar(255) NULL,
	CONSTRAINT administrative_regions_pkey PRIMARY KEY (id)
);


-- CREATE administrative_units TABLE
CREATE TABLE administrative_units (
	id integer NOT NULL,
	full_name varchar(255) NULL,
	full_name_en varchar(255) NULL,
	short_name varchar(255) NULL,
	short_name_en varchar(255) NULL,
	code_name varchar(255) NULL,
	code_name_en varchar(255) NULL,
	CONSTRAINT administrative_units_pkey PRIMARY KEY (id)
);


-- CREATE provinces TABLE
CREATE TABLE provinces (
	code varchar(20) NOT NULL,
	"name" varchar(255) NOT NULL,
	name_en varchar(255) NULL,
	full_name varchar(255) NOT NULL,
	full_name_en varchar(255) NULL,
	code_name varchar(255) NULL,
	administrative_unit_id integer NULL,
	administrative_region_id integer NULL,
	CONSTRAINT provinces_pkey PRIMARY KEY (code)
);


-- provinces foreign keys

ALTER TABLE provinces ADD CONSTRAINT provinces_administrative_region_id_fkey FOREIGN KEY (administrative_region_id) REFERENCES administrative_regions(id);
ALTER TABLE provinces ADD CONSTRAINT provinces_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id);

CREATE INDEX idx_provinces_region ON provinces(administrative_region_id);
CREATE INDEX idx_provinces_unit ON provinces(administrative_unit_id);


-- CREATE districts TABLE
CREATE TABLE districts (
	code varchar(20) NOT NULL,
	"name" varchar(255) NOT NULL,
	name_en varchar(255) NULL,
	full_name varchar(255) NULL,
	full_name_en varchar(255) NULL,
	code_name varchar(255) NULL,
	province_code varchar(20) NULL,
	administrative_unit_id integer NULL,
	CONSTRAINT districts_pkey PRIMARY KEY (code)
);


-- districts foreign keys

ALTER TABLE districts ADD CONSTRAINT districts_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id);
ALTER TABLE districts ADD CONSTRAINT districts_province_code_fkey FOREIGN KEY (province_code) REFERENCES provinces(code);

CREATE INDEX idx_districts_province ON districts(province_code);
CREATE INDEX idx_districts_unit ON districts(administrative_unit_id);



-- CREATE wards TABLE
CREATE TABLE wards (
	code varchar(20) NOT NULL,
	"name" varchar(255) NOT NULL,
	name_en varchar(255) NULL,
	full_name varchar(255) NULL,
	full_name_en varchar(255) NULL,
	code_name varchar(255) NULL,
	district_code varchar(20) NULL,
	administrative_unit_id integer NULL,
	CONSTRAINT wards_pkey PRIMARY KEY (code)
);


-- wards foreign keys

ALTER TABLE wards ADD CONSTRAINT wards_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units(id);
ALTER TABLE wards ADD CONSTRAINT wards_district_code_fkey FOREIGN KEY (district_code) REFERENCES districts(code);

CREATE INDEX idx_wards_district ON wards(district_code);
CREATE INDEX idx_wards_unit ON wards(administrative_unit_id);


-- 
-- Common data
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
