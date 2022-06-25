/*
* Vietnamese Provinces Database up-to-date status checker script
* 
* This is a handy script to check and verify the up-to-date status of your dataset. Simply execute the script
* against the database that contains the VietnameseProvinces dataset to check the status.
* If a patch is missing, please go to the patch folder section and apply the corresponding missing patch.
* 
* Decrees in check:
* - 469/NQ-UBTVQH15
*
* Example result:

* |nghidinh_469_nq_ubtvqh15|vietnamese_provinces_dataset_up_to_date|
* |------------------------|---------------------------------------|
* |true                    |true                                   |
*/


/*
 * Nghi dinh 469/NQ-UBTVQH15
 *  */
WITH decree_469_NQ_UBTVQH15 AS (
	SELECT '469/NQ-UBTVQH15' as decree,
	CASE 
		WHEN 
			-- Phổ Yên (172) from District-level town (Thị xã - 6) to provincial city (Thành phố thuộc tỉnh - 4) 
			(d.administrative_unit_id = 4 AND d.full_name = CONCAT('Thành phố ', d.name) AND d.full_name_en = CONCAT(d.name_en, ' City')) 
			AND
			-- Hồng Tiến, Đắc Sơn, Tiên Phong, Nam Tiến, Tân Hương, Đông Cao, Trung Thành, Tân Phú, Thuận Thành from commune (Xã - 10) to ward (Phường - 8)
			w.administrative_unit_id = 8 AND w.full_name = CONCAT('Phường ', w.name) AND w.full_name_en = CONCAT(w.name_en, ' Ward')  
			THEN TRUE
		ELSE 
			FALSE 
	END as up_to_date
	FROM districts d
	INNER JOIN wards w  
	ON d.code = w.district_code 
	WHERE 
	-- Phổ Yên (172)
	d.code = '172' AND 
	-- Hồng Tiến, Đắc Sơn, Tiên Phong, Nam Tiến, Tân Hương, Đông Cao, Trung Thành, Tân Phú, Thuận Thành
	w.code IN ('05869', '05875', '05884', '05890', '05893', '05896', '05899', '05902', '05905')
	GROUP BY 1, 2
	) 
SELECT decree_469_NQ_UBTVQH15.up_to_date AS nghidinh_469_NQ_UBTVQH15,
CASE
	WHEN decree_469_NQ_UBTVQH15.up_to_date THEN TRUE
	ELSE FALSE
END AS vietnamese_provinces_dataset_up_to_date
FROM decree_469_NQ_UBTVQH15;
