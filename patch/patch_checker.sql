/*
* Vietnamese Provinces Database up-to-date status checker script
* 
* This is a handy script to check and verify the up-to-date status of your dataset. Simply execute the script
* against the database that contains the VietnameseProvinces dataset to check the status.
* If a patch is missing, please go to the patch folder section and apply the corresponding missing patch.
* 
* The earliest version of this dataset already met the 387/NQ-UBTVQH15
* Decrees in check:
* - 469/NQ-UBTVQH15
* - 510/NQ-UBTVQH15
* - 569/NQ-UBTVQH15
* - 570/NQ-UBTVQH15
* - 721/NQ-UBTVQH15 to 730/NQ-UBTVQH15
* - 938/NQ-UBTVQH15 to 939/NQ-UBTVQH15
*
* Example result:

* |nghidinh_469_nq_ubtvqh15|vietnamese_provinces_dataset_up_to_date|
* |------------------------|---------------------------------------|
* |true                    |true                                   |
*/


WITH 
	/*
	 * Nghi dinh 469/NQ-UBTVQH15
	 *  */
	decree_469_NQ_UBTVQH15 AS (
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
	),
	/*
	 * Nghi dinh 510/NQ-UBTVQH15
	 *  */
	decree_510_NQ_UBTVQH15 AS (
		SELECT '510/NQ-UBTVQH15' as decree,
		CASE
			WHEN w.administrative_unit_id = 9 AND w.full_name = CONCAT('Thị trấn ', w.name) AND w.full_name_en = CONCAT(name_en, ' Township') THEN TRUE ELSE FALSE END as up_to_date
		FROM wards w 
		-- Phương Sơn (07477), Bắc Lý (07870)
		WHERE w.code IN('07477', '07870')
		GROUP BY 1, 2
	),
	decree_569_NQ_UBTVQH15 AS (
		SELECT '569/NQ-UBTVQH15' as decree,
		CASE WHEN w.administrative_unit_id = 9 AND w.full_name = CONCAT('Thị trấn ', w."name") AND w.full_name_en = CONCAT(name_en, ' Township') THEN TRUE ELSE FALSE END AS up_to_date
		FROM wards w
		-- Bình Phú (28471) from commune (Xã - 10) to township (Thị trấn - 9) 
		WHERE w.code = '28471'
		GROUP BY 1, 2
	),
	decree_570_NQ_UBTVQH15 AS (
		SELECT '570/NQ-UBTVQH15' as decree,
		CASE 
			WHEN 
			-- Change Chơn Thành district (697) from Huyện to Thị xã
			(d.administrative_unit_id = 6 AND d.full_name = CONCAT('Thị xã ', d.name) AND d.full_name_en = CONCAT(d.name_en, ' Town')) 
			AND 
			-- Chơn Thành township (25432) to Hưng Long Ward (Phường - 8)
			-- Thành Tâm, Minh Hưng, Minh Long, Minh Thành from commune (Xã - 10) to ward (Phường - 8) 
			(
				w.administrative_unit_id = 8 AND 
				(
					(
						(w.code = '25432' AND w."name" = 'Hưng Long' AND w.name_en = 'Hung Long' AND w.full_name = 'Phường Hưng Long' AND w.full_name_en = 'Hung Long Ward')
						OR w.code IN ('25433','25441','25444','25447')
					) AND w.full_name = CONCAT('Phường ', w.name) AND w.full_name_en = CONCAT(w.name_en, ' Ward')
				)
			) THEN TRUE ELSE FALSE
		END as up_to_date
		FROM wards w
		INNER JOIN districts d ON 
		w.district_code = d.code 
		-- Chơn Thành township (25432) to Hưng Long Ward (Phường - 8)
		-- Thành Tâm, Minh Hưng, Minh Long, Minh Thành from commune (Xã - 10) to ward (Phường - 8) 
		WHERE d.code = '697' AND w.code IN ('25432','25433','25441','25444','25447')
		GROUP BY 1, 2
	),
	decree_721to730_NQ_UBTVQH15 AS (
		SELECT '712~>730/NQ-UBTVQH15' as decree,
		CASE WHEN w.administrative_unit_id <> 9 THEN FALSE 
			ELSE TRUE 
		END as up_to_date
		FROM wards w
		-- Use the decree 730 as the milestone for the sake of simplicity. Since the patch 721_to_730_NQ-UBTVQH15 should cover all decree from 721 to 730/NQ-UBTVQH15
		WHERE w.code IN ('08878', '09043')
		GROUP BY 1,2
	),
	decree_938to939_NQ_UBTVQH15 AS (
		SELECT '938~>939/NQ-UBTVQH15' as decree,
		CASE WHEN w.name_en = 'Minh Tam' THEN FALSE 
			ELSE TRUE 
		END as up_to_date
		FROM wards w
		-- Use the decree 730 as the milestone for the sake of simplicity. Since the patch 721_to_730_NQ-UBTVQH15 should cover all decree from 721 to 730/NQ-UBTVQH15
		WHERE w.code = '15829'
		GROUP BY 1,2
	),
	decree_1012_1013_NQ_UBTVQH15 AS (
		SELECT '1012-1013/NQ-UBTVQH15' as decree,
		CASE WHEN d.administrative_unit_id = 6 THEN FALSE 
			ELSE TRUE 
		END as up_to_date
		FROM districts d
		-- Check if Go Cong has changed to City 
		WHERE d.code = '816'
		GROUP BY 1,2
	)
SELECT 
decree_469_NQ_UBTVQH15.up_to_date AS nghidinh_469_NQ_UBTVQH15,
decree_510_NQ_UBTVQH15.up_to_date AS nghidinh_510_NQ_UBTVQH15,
decree_569_NQ_UBTVQH15.up_to_date AS nghidinh_569_NQ_UBTVQH15,
decree_570_NQ_UBTVQH15.up_to_date AS nghidinh_570_NQ_UBTVQH15,
decree_721to730_NQ_UBTVQH15.up_to_date AS nghidinh_721_730_NQ_UBTVQH15,
decree_938to939_NQ_UBTVQH15.up_to_date AS nghidinh_938_939_NQ_UBTVQH15,
decree_1012_1013_NQ_UBTVQH15.up_to_date AS nghidinh_1012_1013_NQ_UBTVQH15,
CASE
	WHEN 
		decree_469_NQ_UBTVQH15.up_to_date 
		AND decree_510_NQ_UBTVQH15.up_to_date 
		AND decree_569_NQ_UBTVQH15.up_to_date 
		AND decree_570_NQ_UBTVQH15.up_to_date
		AND decree_721to730_NQ_UBTVQH15.up_to_date
		AND decree_938to939_NQ_UBTVQH15.up_to_date
		AND decree_1012_1013_NQ_UBTVQH15.up_to_date
		THEN TRUE
	ELSE FALSE
END AS vietnamese_provinces_dataset_up_to_date
FROM 
decree_469_NQ_UBTVQH15, 
decree_510_NQ_UBTVQH15,
decree_569_NQ_UBTVQH15,
decree_570_NQ_UBTVQH15,
decree_721to730_NQ_UBTVQH15,
decree_938to939_NQ_UBTVQH15,
decree_1012_1013_NQ_UBTVQH15;
