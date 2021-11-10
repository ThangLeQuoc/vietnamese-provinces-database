--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    code character varying(20) NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255),
    full_name character varying(255),
    full_name_en character varying(255),
    code_name character varying(255),
    province_code character varying(20),
    administrative_unit_id integer
);


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.districts (code, name, name_en, full_name, full_name_en, code_name, province_code, administrative_unit_id) FROM stdin;
725	Thuận An	Thuan An	Thành phố Thuận An	Thuan An City	thuan_an	74	4
001	Ba Đình	Ba Dinh	Quận Ba Đình	Ba Dinh District	ba_dinh	01	5
002	Hoàn Kiếm	Hoan Kiem	Quận Hoàn Kiếm	Hoan Kiem District	hoan_kiem	01	5
003	Tây Hồ	Tay Ho	Quận Tây Hồ	Tay Ho District	tay_ho	01	5
004	Long Biên	Long Bien	Quận Long Biên	Long Bien District	long_bien	01	5
005	Cầu Giấy	Cau Giay	Quận Cầu Giấy	Cau Giay District	cau_giay	01	5
006	Đống Đa	Dong Da	Quận Đống Đa	Dong Da District	dong_da	01	5
007	Hai Bà Trưng	Hai Ba Trung	Quận Hai Bà Trưng	Hai Ba Trung District	hai_ba_trung	01	5
008	Hoàng Mai	Hoang Mai	Quận Hoàng Mai	Hoang Mai District	hoang_mai	01	5
009	Thanh Xuân	Thanh Xuan	Quận Thanh Xuân	Thanh Xuan District	thanh_xuan	01	5
016	Sóc Sơn	Soc Son	Huyện Sóc Sơn	Soc Son District	soc_son	01	7
017	Đông Anh	Dong Anh	Huyện Đông Anh	Dong Anh District	dong_anh	01	7
018	Gia Lâm	Gia Lam	Huyện Gia Lâm	Gia Lam District	gia_lam	01	7
019	Nam Từ Liêm	Nam Tu Liem	Quận Nam Từ Liêm	Nam Tu Liem District	nam_tu_liem	01	5
020	Thanh Trì	Thanh Tri	Huyện Thanh Trì	Thanh Tri District	thanh_tri	01	7
021	Bắc Từ Liêm	Bac Tu Liem	Quận Bắc Từ Liêm	Bac Tu Liem District	bac_tu_liem	01	5
250	Mê Linh	Me Linh	Huyện Mê Linh	Me Linh District	me_linh	01	7
268	Hà Đông	Ha Dong	Quận Hà Đông	Ha Dong District	ha_dong	01	5
269	Sơn Tây	Son Tay	Thị xã Sơn Tây	Son Tay Town	son_tay	01	6
271	Ba Vì	Ba Vi	Huyện Ba Vì	Ba Vi District	ba_vi	01	7
272	Phúc Thọ	Phuc Tho	Huyện Phúc Thọ	Phuc Tho District	phuc_tho	01	7
273	Đan Phượng	Dan Phuong	Huyện Đan Phượng	Dan Phuong District	dan_phuong	01	7
274	Hoài Đức	Hoai Duc	Huyện Hoài Đức	Hoai Duc District	hoai_duc	01	7
275	Quốc Oai	Quoc Oai	Huyện Quốc Oai	Quoc Oai District	quoc_oai	01	7
276	Thạch Thất	Thach That	Huyện Thạch Thất	Thach That District	thach_that	01	7
277	Chương Mỹ	Chuong My	Huyện Chương Mỹ	Chuong My District	chuong_my	01	7
278	Thanh Oai	Thanh Oai	Huyện Thanh Oai	Thanh Oai District	thanh_oai	01	7
279	Thường Tín	Thuong Tin	Huyện Thường Tín	Thuong Tin District	thuong_tin	01	7
280	Phú Xuyên	Phu Xuyen	Huyện Phú Xuyên	Phu Xuyen District	phu_xuyen	01	7
281	Ứng Hòa	Ung Hoa	Huyện Ứng Hòa	Ung Hoa District	ung_hoa	01	7
282	Mỹ Đức	My Duc	Huyện Mỹ Đức	My Duc District	my_duc	01	7
024	Hà Giang	Ha Giang	Thành phố Hà Giang	Ha Giang City	ha_giang	02	4
026	Đồng Văn	Dong Van	Huyện Đồng Văn	Dong Van District	dong_van	02	7
027	Mèo Vạc	Meo Vac	Huyện Mèo Vạc	Meo Vac District	meo_vac	02	7
028	Yên Minh	Yen Minh	Huyện Yên Minh	Yen Minh District	yen_minh	02	7
029	Quản Bạ	Quan Ba	Huyện Quản Bạ	Quan Ba District	quan_ba	02	7
030	Vị Xuyên	Vi Xuyen	Huyện Vị Xuyên	Vi Xuyen District	vi_xuyen	02	7
031	Bắc Mê	Bac Me	Huyện Bắc Mê	Bac Me District	bac_me	02	7
032	Hoàng Su Phì	Hoang Su Phi	Huyện Hoàng Su Phì	Hoang Su Phi District	hoang_su_phi	02	7
033	Xín Mần	Xin Man	Huyện Xín Mần	Xin Man District	xin_man	02	7
034	Bắc Quang	Bac Quang	Huyện Bắc Quang	Bac Quang District	bac_quang	02	7
035	Quang Bình	Quang Binh	Huyện Quang Bình	Quang Binh District	quang_binh	02	7
040	Cao Bằng	Cao Bang	Thành phố Cao Bằng	Cao Bang City	cao_bang	04	4
042	Bảo Lâm	Bao Lam	Huyện Bảo Lâm	Bao Lam District	bao_lam	04	7
043	Bảo Lạc	Bao Lac	Huyện Bảo Lạc	Bao Lac District	bao_lac	04	7
045	Hà Quảng	Ha Quang	Huyện Hà Quảng	Ha Quang District	ha_quang	04	7
047	Trùng Khánh	Trung Khanh	Huyện Trùng Khánh	Trung Khanh District	trung_khanh	04	7
048	Hạ Lang	Ha Lang	Huyện Hạ Lang	Ha Lang District	ha_lang	04	7
049	Quảng Hòa	Quang Hoa	Huyện Quảng Hòa	Quang Hoa District	quang_hoa	04	7
051	Hoà An	Hoa An	Huyện Hoà An	Hoa An District	hoa_an	04	7
052	Nguyên Bình	Nguyen Binh	Huyện Nguyên Bình	Nguyen Binh District	nguyen_binh	04	7
053	Thạch An	Thach An	Huyện Thạch An	Thach An District	thach_an	04	7
058	Bắc Kạn	Bac Kan	Thành phố Bắc Kạn	Bac Kan City	bac_kan	06	4
060	Pác Nặm	Pac Nam	Huyện Pác Nặm	Pac Nam District	pac_nam	06	7
061	Ba Bể	Ba Be	Huyện Ba Bể	Ba Be District	ba_be	06	7
062	Ngân Sơn	Ngan Son	Huyện Ngân Sơn	Ngan Son District	ngan_son	06	7
063	Bạch Thông	Bach Thong	Huyện Bạch Thông	Bach Thong District	bach_thong	06	7
064	Chợ Đồn	Cho Don	Huyện Chợ Đồn	Cho Don District	cho_don	06	7
065	Chợ Mới	Cho Moi	Huyện Chợ Mới	Cho Moi District	cho_moi	06	7
066	Na Rì	Na Ri	Huyện Na Rì	Na Ri District	na_ri	06	7
070	Tuyên Quang	Tuyen Quang	Thành phố Tuyên Quang	Tuyen Quang City	tuyen_quang	08	4
071	Lâm Bình	Lam Binh	Huyện Lâm Bình	Lam Binh District	lam_binh	08	7
072	Na Hang	Na Hang	Huyện Na Hang	Na Hang District	na_hang	08	7
073	Chiêm Hóa	Chiem Hoa	Huyện Chiêm Hóa	Chiem Hoa District	chiem_hoa	08	7
074	Hàm Yên	Ham Yen	Huyện Hàm Yên	Ham Yen District	ham_yen	08	7
075	Yên Sơn	Yen Son	Huyện Yên Sơn	Yen Son District	yen_son	08	7
076	Sơn Dương	Son Duong	Huyện Sơn Dương	Son Duong District	son_duong	08	7
080	Lào Cai	Lao Cai	Thành phố Lào Cai	Lao Cai City	lao_cai	10	4
082	Bát Xát	Bat Xat	Huyện Bát Xát	Bat Xat District	bat_xat	10	7
083	Mường Khương	Muong Khuong	Huyện Mường Khương	Muong Khuong District	muong_khuong	10	7
084	Si Ma Cai	Si Ma Cai	Huyện Si Ma Cai	Si Ma Cai District	si_ma_cai	10	7
085	Bắc Hà	Bac Ha	Huyện Bắc Hà	Bac Ha District	bac_ha	10	7
086	Bảo Thắng	Bao Thang	Huyện Bảo Thắng	Bao Thang District	bao_thang	10	7
087	Bảo Yên	Bao Yen	Huyện Bảo Yên	Bao Yen District	bao_yen	10	7
088	Sa Pa	Sa Pa	Thị xã Sa Pa	Sa Pa Town	sa_pa	10	6
089	Văn Bàn	Van Ban	Huyện Văn Bàn	Van Ban District	van_ban	10	7
094	Điện Biên Phủ	Dien Bien Phu	Thành phố Điện Biên Phủ	Dien Bien Phu City	dien_bien_phu	11	4
095	Mường Lay	Muong Lay	Thị xã Mường Lay	Muong Lay Town	muong_lay	11	6
096	Mường Nhé	Muong Nhe	Huyện Mường Nhé	Muong Nhe District	muong_nhe	11	7
097	Mường Chà	Muong Cha	Huyện Mường Chà	Muong Cha District	muong_cha	11	7
098	Tủa Chùa	Tua Chua	Huyện Tủa Chùa	Tua Chua District	tua_chua	11	7
099	Tuần Giáo	Tuan Giao	Huyện Tuần Giáo	Tuan Giao District	tuan_giao	11	7
100	Điện Biên	Dien Bien	Huyện Điện Biên	Dien Bien District	dien_bien	11	7
101	Điện Biên Đông	Dien Bien Dong	Huyện Điện Biên Đông	Dien Bien Dong District	dien_bien_dong	11	7
102	Mường Ảng	Muong Ang	Huyện Mường Ảng	Muong Ang District	muong_ang	11	7
103	Nậm Pồ	Nam Po	Huyện Nậm Pồ	Nam Po District	nam_po	11	7
105	Lai Châu	Lai Chau	Thành phố Lai Châu	Lai Chau City	lai_chau	12	4
106	Tam Đường	Tam Duong	Huyện Tam Đường	Tam Duong District	tam_duong	12	7
107	Mường Tè	Muong Te	Huyện Mường Tè	Muong Te District	muong_te	12	7
108	Sìn Hồ	Sin Ho	Huyện Sìn Hồ	Sin Ho District	sin_ho	12	7
109	Phong Thổ	Phong Tho	Huyện Phong Thổ	Phong Tho District	phong_tho	12	7
110	Than Uyên	Than Uyen	Huyện Than Uyên	Than Uyen District	than_uyen	12	7
111	Tân Uyên	Tan Uyen	Huyện Tân Uyên	Tan Uyen District	tan_uyen	12	7
112	Nậm Nhùn	Nam Nhun	Huyện Nậm Nhùn	Nam Nhun District	nam_nhun	12	7
116	Sơn La	Son La	Thành phố Sơn La	Son La City	son_la	14	4
118	Quỳnh Nhai	Quynh Nhai	Huyện Quỳnh Nhai	Quynh Nhai District	quynh_nhai	14	7
119	Thuận Châu	Thuan Chau	Huyện Thuận Châu	Thuan Chau District	thuan_chau	14	7
120	Mường La	Muong La	Huyện Mường La	Muong La District	muong_la	14	7
121	Bắc Yên	Bac Yen	Huyện Bắc Yên	Bac Yen District	bac_yen	14	7
122	Phù Yên	Phu Yen	Huyện Phù Yên	Phu Yen District	phu_yen	14	7
123	Mộc Châu	Moc Chau	Huyện Mộc Châu	Moc Chau District	moc_chau	14	7
124	Yên Châu	Yen Chau	Huyện Yên Châu	Yen Chau District	yen_chau	14	7
125	Mai Sơn	Mai Son	Huyện Mai Sơn	Mai Son District	mai_son	14	7
126	Sông Mã	Song Ma	Huyện Sông Mã	Song Ma District	song_ma	14	7
127	Sốp Cộp	Sop Cop	Huyện Sốp Cộp	Sop Cop District	sop_cop	14	7
128	Vân Hồ	Van Ho	Huyện Vân Hồ	Van Ho District	van_ho	14	7
132	Yên Bái	Yen Bai	Thành phố Yên Bái	Yen Bai City	yen_bai	15	4
133	Nghĩa Lộ	Nghia Lo	Thị xã Nghĩa Lộ	Nghia Lo Town	nghia_lo	15	6
135	Lục Yên	Luc Yen	Huyện Lục Yên	Luc Yen District	luc_yen	15	7
136	Văn Yên	Van Yen	Huyện Văn Yên	Van Yen District	van_yen	15	7
137	Mù Căng Chải	Mu Cang Chai	Huyện Mù Căng Chải	Mu Cang Chai District	mu_cang_chai	15	7
138	Trấn Yên	Tran Yen	Huyện Trấn Yên	Tran Yen District	tran_yen	15	7
139	Trạm Tấu	Tram Tau	Huyện Trạm Tấu	Tram Tau District	tram_tau	15	7
140	Văn Chấn	Van Chan	Huyện Văn Chấn	Van Chan District	van_chan	15	7
141	Yên Bình	Yen Binh	Huyện Yên Bình	Yen Binh District	yen_binh	15	7
148	Hòa Bình	Hoa Binh	Thành phố Hòa Bình	Hoa Binh City	hoa_binh	17	4
150	Đà Bắc	Da Bac	Huyện Đà Bắc	Da Bac District	da_bac	17	7
152	Lương Sơn	Luong Son	Huyện Lương Sơn	Luong Son District	luong_son	17	7
153	Kim Bôi	Kim Boi	Huyện Kim Bôi	Kim Boi District	kim_boi	17	7
154	Cao Phong	Cao Phong	Huyện Cao Phong	Cao Phong District	cao_phong	17	7
155	Tân Lạc	Tan Lac	Huyện Tân Lạc	Tan Lac District	tan_lac	17	7
156	Mai Châu	Mai Chau	Huyện Mai Châu	Mai Chau District	mai_chau	17	7
157	Lạc Sơn	Lac Son	Huyện Lạc Sơn	Lac Son District	lac_son	17	7
158	Yên Thủy	Yen Thuy	Huyện Yên Thủy	Yen Thuy District	yen_thuy	17	7
159	Lạc Thủy	Lac Thuy	Huyện Lạc Thủy	Lac Thuy District	lac_thuy	17	7
164	Thái Nguyên	Thai Nguyen	Thành phố Thái Nguyên	Thai Nguyen City	thai_nguyen	19	4
165	Sông Công	Song Cong	Thành phố Sông Công	Song Cong City	song_cong	19	4
167	Định Hóa	Dinh Hoa	Huyện Định Hóa	Dinh Hoa District	dinh_hoa	19	7
168	Phú Lương	Phu Luong	Huyện Phú Lương	Phu Luong District	phu_luong	19	7
169	Đồng Hỷ	Dong Hy	Huyện Đồng Hỷ	Dong Hy District	dong_hy	19	7
170	Võ Nhai	Vo Nhai	Huyện Võ Nhai	Vo Nhai District	vo_nhai	19	7
171	Đại Từ	Dai Tu	Huyện Đại Từ	Dai Tu District	dai_tu	19	7
172	Phổ Yên	Pho Yen	Thị xã Phổ Yên	Pho Yen Town	pho_yen	19	6
173	Phú Bình	Phu Binh	Huyện Phú Bình	Phu Binh District	phu_binh	19	7
178	Lạng Sơn	Lang Son	Thành phố Lạng Sơn	Lang Son City	lang_son	20	4
180	Tràng Định	Trang Dinh	Huyện Tràng Định	Trang Dinh District	trang_dinh	20	7
181	Bình Gia	Binh Gia	Huyện Bình Gia	Binh Gia District	binh_gia	20	7
182	Văn Lãng	Van Lang	Huyện Văn Lãng	Van Lang District	van_lang	20	7
183	Cao Lộc	Cao Loc	Huyện Cao Lộc	Cao Loc District	cao_loc	20	7
184	Văn Quan	Van Quan	Huyện Văn Quan	Van Quan District	van_quan	20	7
185	Bắc Sơn	Bac Son	Huyện Bắc Sơn	Bac Son District	bac_son	20	7
186	Hữu Lũng	Huu Lung	Huyện Hữu Lũng	Huu Lung District	huu_lung	20	7
187	Chi Lăng	Chi Lang	Huyện Chi Lăng	Chi Lang District	chi_lang	20	7
188	Lộc Bình	Loc Binh	Huyện Lộc Bình	Loc Binh District	loc_binh	20	7
189	Đình Lập	Dinh Lap	Huyện Đình Lập	Dinh Lap District	dinh_lap	20	7
193	Hạ Long	Ha Long	Thành phố Hạ Long	Ha Long City	ha_long	22	4
194	Móng Cái	Mong Cai	Thành phố Móng Cái	Mong Cai City	mong_cai	22	4
195	Cẩm Phả	Cam Pha	Thành phố Cẩm Phả	Cam Pha City	cam_pha	22	4
196	Uông Bí	Uong Bi	Thành phố Uông Bí	Uong Bi City	uong_bi	22	4
198	Bình Liêu	Binh Lieu	Huyện Bình Liêu	Binh Lieu District	binh_lieu	22	7
199	Tiên Yên	Tien Yen	Huyện Tiên Yên	Tien Yen District	tien_yen	22	7
200	Đầm Hà	Dam Ha	Huyện Đầm Hà	Dam Ha District	dam_ha	22	7
201	Hải Hà	Hai Ha	Huyện Hải Hà	Hai Ha District	hai_ha	22	7
202	Ba Chẽ	Ba Che	Huyện Ba Chẽ	Ba Che District	ba_che	22	7
203	Vân Đồn	Van Don	Huyện Vân Đồn	Van Don District	van_don	22	7
205	Đông Triều	Dong Trieu	Thị xã Đông Triều	Dong Trieu Town	dong_trieu	22	6
206	Quảng Yên	Quang Yen	Thị xã Quảng Yên	Quang Yen Town	quang_yen	22	6
207	Cô Tô	Co To	Huyện Cô Tô	Co To District	co_to	22	7
213	Bắc Giang	Bac Giang	Thành phố Bắc Giang	Bac Giang City	bac_giang	24	4
215	Yên Thế	Yen The	Huyện Yên Thế	Yen The District	yen_the	24	7
216	Tân Yên	Tan Yen	Huyện Tân Yên	Tan Yen District	tan_yen	24	7
217	Lạng Giang	Lang Giang	Huyện Lạng Giang	Lang Giang District	lang_giang	24	7
218	Lục Nam	Luc Nam	Huyện Lục Nam	Luc Nam District	luc_nam	24	7
219	Lục Ngạn	Luc Ngan	Huyện Lục Ngạn	Luc Ngan District	luc_ngan	24	7
220	Sơn Động	Son Dong	Huyện Sơn Động	Son Dong District	son_dong	24	7
221	Yên Dũng	Yen Dung	Huyện Yên Dũng	Yen Dung District	yen_dung	24	7
222	Việt Yên	Viet Yen	Huyện Việt Yên	Viet Yen District	viet_yen	24	7
223	Hiệp Hòa	Hiep Hoa	Huyện Hiệp Hòa	Hiep Hoa District	hiep_hoa	24	7
227	Việt Trì	Viet Tri	Thành phố Việt Trì	Viet Tri City	viet_tri	25	4
228	Phú Thọ	Phu Tho	Thị xã Phú Thọ	Phu Tho Town	phu_tho	25	6
230	Đoan Hùng	Doan Hung	Huyện Đoan Hùng	Doan Hung District	doan_hung	25	7
231	Hạ Hoà	Ha Hoa	Huyện Hạ Hoà	Ha Hoa District	ha_hoa	25	7
232	Thanh Ba	Thanh Ba	Huyện Thanh Ba	Thanh Ba District	thanh_ba	25	7
233	Phù Ninh	Phu Ninh	Huyện Phù Ninh	Phu Ninh District	phu_ninh	25	7
234	Yên Lập	Yen Lap	Huyện Yên Lập	Yen Lap District	yen_lap	25	7
235	Cẩm Khê	Cam Khe	Huyện Cẩm Khê	Cam Khe District	cam_khe	25	7
236	Tam Nông	Tam Nong	Huyện Tam Nông	Tam Nong District	tam_nong	25	7
237	Lâm Thao	Lam Thao	Huyện Lâm Thao	Lam Thao District	lam_thao	25	7
238	Thanh Sơn	Thanh Son	Huyện Thanh Sơn	Thanh Son District	thanh_son	25	7
239	Thanh Thuỷ	Thanh Thuy	Huyện Thanh Thuỷ	Thanh Thuy District	thanh_thuy	25	7
240	Tân Sơn	Tan Son	Huyện Tân Sơn	Tan Son District	tan_son	25	7
243	Vĩnh Yên	Vinh Yen	Thành phố Vĩnh Yên	Vinh Yen City	vinh_yen	26	4
244	Phúc Yên	Phuc Yen	Thành phố Phúc Yên	Phuc Yen City	phuc_yen	26	4
246	Lập Thạch	Lap Thach	Huyện Lập Thạch	Lap Thach District	lap_thach	26	7
247	Tam Dương	Tam Duong	Huyện Tam Dương	Tam Duong District	tam_duong	26	7
248	Tam Đảo	Tam Dao	Huyện Tam Đảo	Tam Dao District	tam_dao	26	7
249	Bình Xuyên	Binh Xuyen	Huyện Bình Xuyên	Binh Xuyen District	binh_xuyen	26	7
251	Yên Lạc	Yen Lac	Huyện Yên Lạc	Yen Lac District	yen_lac	26	7
252	Vĩnh Tường	Vinh Tuong	Huyện Vĩnh Tường	Vinh Tuong District	vinh_tuong	26	7
253	Sông Lô	Song Lo	Huyện Sông Lô	Song Lo District	song_lo	26	7
256	Bắc Ninh	Bac Ninh	Thành phố Bắc Ninh	Bac Ninh City	bac_ninh	27	4
258	Yên Phong	Yen Phong	Huyện Yên Phong	Yen Phong District	yen_phong	27	7
259	Quế Võ	Que Vo	Huyện Quế Võ	Que Vo District	que_vo	27	7
260	Tiên Du	Tien Du	Huyện Tiên Du	Tien Du District	tien_du	27	7
261	Từ Sơn	Tu Son	Thành phố Từ Sơn	Tu Son City	tu_son	27	4
262	Thuận Thành	Thuan Thanh	Huyện Thuận Thành	Thuan Thanh District	thuan_thanh	27	7
263	Gia Bình	Gia Binh	Huyện Gia Bình	Gia Binh District	gia_binh	27	7
264	Lương Tài	Luong Tai	Huyện Lương Tài	Luong Tai District	luong_tai	27	7
288	Hải Dương	Hai Duong	Thành phố Hải Dương	Hai Duong City	hai_duong	30	4
290	Chí Linh	Chi Linh	Thành phố Chí Linh	Chi Linh City	chi_linh	30	4
291	Nam Sách	Nam Sach	Huyện Nam Sách	Nam Sach District	nam_sach	30	7
292	Kinh Môn	Kinh Mon	Thị xã Kinh Môn	Kinh Mon Town	kinh_mon	30	6
293	Kim Thành	Kim Thanh	Huyện Kim Thành	Kim Thanh District	kim_thanh	30	7
294	Thanh Hà	Thanh Ha	Huyện Thanh Hà	Thanh Ha District	thanh_ha	30	7
295	Cẩm Giàng	Cam Giang	Huyện Cẩm Giàng	Cam Giang District	cam_giang	30	7
296	Bình Giang	Binh Giang	Huyện Bình Giang	Binh Giang District	binh_giang	30	7
297	Gia Lộc	Gia Loc	Huyện Gia Lộc	Gia Loc District	gia_loc	30	7
298	Tứ Kỳ	Tu Ky	Huyện Tứ Kỳ	Tu Ky District	tu_ky	30	7
299	Ninh Giang	Ninh Giang	Huyện Ninh Giang	Ninh Giang District	ninh_giang	30	7
300	Thanh Miện	Thanh Mien	Huyện Thanh Miện	Thanh Mien District	thanh_mien	30	7
303	Hồng Bàng	Hong Bang	Quận Hồng Bàng	Hong Bang District	hong_bang	31	5
304	Ngô Quyền	Ngo Quyen	Quận Ngô Quyền	Ngo Quyen District	ngo_quyen	31	5
305	Lê Chân	Le Chan	Quận Lê Chân	Le Chan District	le_chan	31	5
306	Hải An	Hai An	Quận Hải An	Hai An District	hai_an	31	5
307	Kiến An	Kien An	Quận Kiến An	Kien An District	kien_an	31	5
308	Đồ Sơn	Do Son	Quận Đồ Sơn	Do Son District	do_son	31	5
309	Dương Kinh	Duong Kinh	Quận Dương Kinh	Duong Kinh District	duong_kinh	31	5
311	Thuỷ Nguyên	Thuy Nguyen	Huyện Thuỷ Nguyên	Thuy Nguyen District	thuy_nguyen	31	7
312	An Dương	An Duong	Huyện An Dương	An Duong District	an_duong	31	7
313	An Lão	An Lao	Huyện An Lão	An Lao District	an_lao	31	7
314	Kiến Thuỵ	Kien Thuy	Huyện Kiến Thuỵ	Kien Thuy District	kien_thuy	31	7
315	Tiên Lãng	Tien Lang	Huyện Tiên Lãng	Tien Lang District	tien_lang	31	7
710	Gò Dầu	Go Dau	Huyện Gò Dầu	Go Dau District	go_dau	72	7
316	Vĩnh Bảo	Vinh Bao	Huyện Vĩnh Bảo	Vinh Bao District	vinh_bao	31	7
317	Cát Hải	Cat Hai	Huyện Cát Hải	Cat Hai District	cat_hai	31	7
318	Bạch Long Vĩ	Bach Long Vi	Huyện Bạch Long Vĩ	Bach Long Vi District	bach_long_vi	31	7
323	Hưng Yên	Hung Yen	Thành phố Hưng Yên	Hung Yen City	hung_yen	33	4
325	Văn Lâm	Van Lam	Huyện Văn Lâm	Van Lam District	van_lam	33	7
326	Văn Giang	Van Giang	Huyện Văn Giang	Van Giang District	van_giang	33	7
327	Yên Mỹ	Yen My	Huyện Yên Mỹ	Yen My District	yen_my	33	7
328	Mỹ Hào	My Hao	Thị xã Mỹ Hào	My Hao Town	my_hao	33	6
329	Ân Thi	An Thi	Huyện Ân Thi	An Thi District	an_thi	33	7
330	Khoái Châu	Khoai Chau	Huyện Khoái Châu	Khoai Chau District	khoai_chau	33	7
331	Kim Động	Kim Dong	Huyện Kim Động	Kim Dong District	kim_dong	33	7
332	Tiên Lữ	Tien Lu	Huyện Tiên Lữ	Tien Lu District	tien_lu	33	7
333	Phù Cừ	Phu Cu	Huyện Phù Cừ	Phu Cu District	phu_cu	33	7
336	Thái Bình	Thai Binh	Thành phố Thái Bình	Thai Binh City	thai_binh	34	4
338	Quỳnh Phụ	Quynh Phu	Huyện Quỳnh Phụ	Quynh Phu District	quynh_phu	34	7
339	Hưng Hà	Hung Ha	Huyện Hưng Hà	Hung Ha District	hung_ha	34	7
340	Đông Hưng	Dong Hung	Huyện Đông Hưng	Dong Hung District	dong_hung	34	7
341	Thái Thụy	Thai Thuy	Huyện Thái Thụy	Thai Thuy District	thai_thuy	34	7
342	Tiền Hải	Tien Hai	Huyện Tiền Hải	Tien Hai District	tien_hai	34	7
343	Kiến Xương	Kien Xuong	Huyện Kiến Xương	Kien Xuong District	kien_xuong	34	7
344	Vũ Thư	Vu Thu	Huyện Vũ Thư	Vu Thu District	vu_thu	34	7
347	Phủ Lý	Phu Ly	Thành phố Phủ Lý	Phu Ly City	phu_ly	35	4
349	Duy Tiên	Duy Tien	Thị xã Duy Tiên	Duy Tien Town	duy_tien	35	6
350	Kim Bảng	Kim Bang	Huyện Kim Bảng	Kim Bang District	kim_bang	35	7
351	Thanh Liêm	Thanh Liem	Huyện Thanh Liêm	Thanh Liem District	thanh_liem	35	7
352	Bình Lục	Binh Luc	Huyện Bình Lục	Binh Luc District	binh_luc	35	7
353	Lý Nhân	Ly Nhan	Huyện Lý Nhân	Ly Nhan District	ly_nhan	35	7
356	Nam Định	Nam Dinh	Thành phố Nam Định	Nam Dinh City	nam_dinh	36	4
358	Mỹ Lộc	My Loc	Huyện Mỹ Lộc	My Loc District	my_loc	36	7
359	Vụ Bản	Vu Ban	Huyện Vụ Bản	Vu Ban District	vu_ban	36	7
360	Ý Yên	Y Yen	Huyện Ý Yên	Y Yen District	y_yen	36	7
361	Nghĩa Hưng	Nghia Hung	Huyện Nghĩa Hưng	Nghia Hung District	nghia_hung	36	7
362	Nam Trực	Nam Truc	Huyện Nam Trực	Nam Truc District	nam_truc	36	7
363	Trực Ninh	Truc Ninh	Huyện Trực Ninh	Truc Ninh District	truc_ninh	36	7
364	Xuân Trường	Xuan Truong	Huyện Xuân Trường	Xuan Truong District	xuan_truong	36	7
365	Giao Thủy	Giao Thuy	Huyện Giao Thủy	Giao Thuy District	giao_thuy	36	7
366	Hải Hậu	Hai Hau	Huyện Hải Hậu	Hai Hau District	hai_hau	36	7
369	Ninh Bình	Ninh Binh	Thành phố Ninh Bình	Ninh Binh City	ninh_binh	37	4
370	Tam Điệp	Tam Diep	Thành phố Tam Điệp	Tam Diep City	tam_diep	37	4
372	Nho Quan	Nho Quan	Huyện Nho Quan	Nho Quan District	nho_quan	37	7
373	Gia Viễn	Gia Vien	Huyện Gia Viễn	Gia Vien District	gia_vien	37	7
374	Hoa Lư	Hoa Lu	Huyện Hoa Lư	Hoa Lu District	hoa_lu	37	7
375	Yên Khánh	Yen Khanh	Huyện Yên Khánh	Yen Khanh District	yen_khanh	37	7
376	Kim Sơn	Kim Son	Huyện Kim Sơn	Kim Son District	kim_son	37	7
377	Yên Mô	Yen Mo	Huyện Yên Mô	Yen Mo District	yen_mo	37	7
380	Thanh Hóa	Thanh Hoa	Thành phố Thanh Hóa	Thanh Hoa City	thanh_hoa	38	4
381	Bỉm Sơn	Bim Son	Thị xã Bỉm Sơn	Bim Son Town	bim_son	38	6
382	Sầm Sơn	Sam Son	Thành phố Sầm Sơn	Sam Son City	sam_son	38	4
384	Mường Lát	Muong Lat	Huyện Mường Lát	Muong Lat District	muong_lat	38	7
385	Quan Hóa	Quan Hoa	Huyện Quan Hóa	Quan Hoa District	quan_hoa	38	7
386	Bá Thước	Ba Thuoc	Huyện Bá Thước	Ba Thuoc District	ba_thuoc	38	7
387	Quan Sơn	Quan Son	Huyện Quan Sơn	Quan Son District	quan_son	38	7
388	Lang Chánh	Lang Chanh	Huyện Lang Chánh	Lang Chanh District	lang_chanh	38	7
389	Ngọc Lặc	Ngoc Lac	Huyện Ngọc Lặc	Ngoc Lac District	ngoc_lac	38	7
390	Cẩm Thủy	Cam Thuy	Huyện Cẩm Thủy	Cam Thuy District	cam_thuy	38	7
391	Thạch Thành	Thach Thanh	Huyện Thạch Thành	Thach Thanh District	thach_thanh	38	7
392	Hà Trung	Ha Trung	Huyện Hà Trung	Ha Trung District	ha_trung	38	7
393	Vĩnh Lộc	Vinh Loc	Huyện Vĩnh Lộc	Vinh Loc District	vinh_loc	38	7
394	Yên Định	Yen Dinh	Huyện Yên Định	Yen Dinh District	yen_dinh	38	7
395	Thọ Xuân	Tho Xuan	Huyện Thọ Xuân	Tho Xuan District	tho_xuan	38	7
396	Thường Xuân	Thuong Xuan	Huyện Thường Xuân	Thuong Xuan District	thuong_xuan	38	7
397	Triệu Sơn	Trieu Son	Huyện Triệu Sơn	Trieu Son District	trieu_son	38	7
398	Thiệu Hóa	Thieu Hoa	Huyện Thiệu Hóa	Thieu Hoa District	thieu_hoa	38	7
399	Hoằng Hóa	Hoang Hoa	Huyện Hoằng Hóa	Hoang Hoa District	hoang_hoa	38	7
400	Hậu Lộc	Hau Loc	Huyện Hậu Lộc	Hau Loc District	hau_loc	38	7
401	Nga Sơn	Nga Son	Huyện Nga Sơn	Nga Son District	nga_son	38	7
402	Như Xuân	Nhu Xuan	Huyện Như Xuân	Nhu Xuan District	nhu_xuan	38	7
403	Như Thanh	Nhu Thanh	Huyện Như Thanh	Nhu Thanh District	nhu_thanh	38	7
404	Nông Cống	Nong Cong	Huyện Nông Cống	Nong Cong District	nong_cong	38	7
405	Đông Sơn	Dong Son	Huyện Đông Sơn	Dong Son District	dong_son	38	7
406	Quảng Xương	Quang Xuong	Huyện Quảng Xương	Quang Xuong District	quang_xuong	38	7
407	Nghi Sơn	Nghi Son	Thị xã Nghi Sơn	Nghi Son Town	nghi_son	38	6
412	Vinh	Vinh	Thành phố Vinh	Vinh City	vinh	40	4
413	Cửa Lò	Cua Lo	Thị xã Cửa Lò	Cua Lo Town	cua_lo	40	6
414	Thái Hoà	Thai Hoa	Thị xã Thái Hoà	Thai Hoa Town	thai_hoa	40	6
415	Quế Phong	Que Phong	Huyện Quế Phong	Que Phong District	que_phong	40	7
416	Quỳ Châu	Quy Chau	Huyện Quỳ Châu	Quy Chau District	quy_chau	40	7
417	Kỳ Sơn	Ky Son	Huyện Kỳ Sơn	Ky Son District	ky_son	40	7
418	Tương Dương	Tuong Duong	Huyện Tương Dương	Tuong Duong District	tuong_duong	40	7
419	Nghĩa Đàn	Nghia Dan	Huyện Nghĩa Đàn	Nghia Dan District	nghia_dan	40	7
420	Quỳ Hợp	Quy Hop	Huyện Quỳ Hợp	Quy Hop District	quy_hop	40	7
421	Quỳnh Lưu	Quynh Luu	Huyện Quỳnh Lưu	Quynh Luu District	quynh_luu	40	7
422	Con Cuông	Con Cuong	Huyện Con Cuông	Con Cuong District	con_cuong	40	7
423	Tân Kỳ	Tan Ky	Huyện Tân Kỳ	Tan Ky District	tan_ky	40	7
424	Anh Sơn	Anh Son	Huyện Anh Sơn	Anh Son District	anh_son	40	7
425	Diễn Châu	Dien Chau	Huyện Diễn Châu	Dien Chau District	dien_chau	40	7
426	Yên Thành	Yen Thanh	Huyện Yên Thành	Yen Thanh District	yen_thanh	40	7
427	Đô Lương	Do Luong	Huyện Đô Lương	Do Luong District	do_luong	40	7
428	Thanh Chương	Thanh Chuong	Huyện Thanh Chương	Thanh Chuong District	thanh_chuong	40	7
429	Nghi Lộc	Nghi Loc	Huyện Nghi Lộc	Nghi Loc District	nghi_loc	40	7
430	Nam Đàn	Nam Dan	Huyện Nam Đàn	Nam Dan District	nam_dan	40	7
431	Hưng Nguyên	Hung Nguyen	Huyện Hưng Nguyên	Hung Nguyen District	hung_nguyen	40	7
432	Hoàng Mai	Hoang Mai	Thị xã Hoàng Mai	Hoang Mai Town	hoang_mai	40	6
436	Hà Tĩnh	Ha Tinh	Thành phố Hà Tĩnh	Ha Tinh City	ha_tinh	42	4
437	Hồng Lĩnh	Hong Linh	Thị xã Hồng Lĩnh	Hong Linh Town	hong_linh	42	6
439	Hương Sơn	Huong Son	Huyện Hương Sơn	Huong Son District	huong_son	42	7
440	Đức Thọ	Duc Tho	Huyện Đức Thọ	Duc Tho District	duc_tho	42	7
441	Vũ Quang	Vu Quang	Huyện Vũ Quang	Vu Quang District	vu_quang	42	7
442	Nghi Xuân	Nghi Xuan	Huyện Nghi Xuân	Nghi Xuan District	nghi_xuan	42	7
443	Can Lộc	Can Loc	Huyện Can Lộc	Can Loc District	can_loc	42	7
444	Hương Khê	Huong Khe	Huyện Hương Khê	Huong Khe District	huong_khe	42	7
445	Thạch Hà	Thach Ha	Huyện Thạch Hà	Thach Ha District	thach_ha	42	7
446	Cẩm Xuyên	Cam Xuyen	Huyện Cẩm Xuyên	Cam Xuyen District	cam_xuyen	42	7
447	Kỳ Anh	Ky Anh	Huyện Kỳ Anh	Ky Anh District	ky_anh	42	7
448	Lộc Hà	Loc Ha	Huyện Lộc Hà	Loc Ha District	loc_ha	42	7
449	Kỳ Anh	Ky Anh	Thị xã Kỳ Anh	Ky Anh Town	ky_anh	42	6
450	Đồng Hới	Dong Hoi	Thành phố Đồng Hới	Dong Hoi City	dong_hoi	44	4
452	Minh Hóa	Minh Hoa	Huyện Minh Hóa	Minh Hoa District	minh_hoa	44	7
453	Tuyên Hóa	Tuyen Hoa	Huyện Tuyên Hóa	Tuyen Hoa District	tuyen_hoa	44	7
454	Quảng Trạch	Quang Trach	Huyện Quảng Trạch	Quang Trach District	quang_trach	44	7
455	Bố Trạch	Bo Trach	Huyện Bố Trạch	Bo Trach District	bo_trach	44	7
456	Quảng Ninh	Quang Ninh	Huyện Quảng Ninh	Quang Ninh District	quang_ninh	44	7
457	Lệ Thủy	Le Thuy	Huyện Lệ Thủy	Le Thuy District	le_thuy	44	7
458	Ba Đồn	Ba Don	Thị xã Ba Đồn	Ba Don Town	ba_don	44	6
461	Đông Hà	Dong Ha	Thành phố Đông Hà	Dong Ha City	dong_ha	45	4
462	Quảng Trị	Quang Tri	Thị xã Quảng Trị	Quang Tri Town	quang_tri	45	6
464	Vĩnh Linh	Vinh Linh	Huyện Vĩnh Linh	Vinh Linh District	vinh_linh	45	7
465	Hướng Hóa	Huong Hoa	Huyện Hướng Hóa	Huong Hoa District	huong_hoa	45	7
466	Gio Linh	Gio Linh	Huyện Gio Linh	Gio Linh District	gio_linh	45	7
467	Đa Krông	Da Krong	Huyện Đa Krông	Da Krong District	da_krong	45	7
468	Cam Lộ	Cam Lo	Huyện Cam Lộ	Cam Lo District	cam_lo	45	7
469	Triệu Phong	Trieu Phong	Huyện Triệu Phong	Trieu Phong District	trieu_phong	45	7
470	Hải Lăng	Hai Lang	Huyện Hải Lăng	Hai Lang District	hai_lang	45	7
471	Cồn Cỏ	Con Co	Huyện Cồn Cỏ	Con Co District	con_co	45	7
474	Huế	Hue	Thành phố Huế	Hue City	hue	46	4
476	Phong Điền	Phong Dien	Huyện Phong Điền	Phong Dien District	phong_dien	46	7
477	Quảng Điền	Quang Dien	Huyện Quảng Điền	Quang Dien District	quang_dien	46	7
478	Phú Vang	Phu Vang	Huyện Phú Vang	Phu Vang District	phu_vang	46	7
479	Hương Thủy	Huong Thuy	Thị xã Hương Thủy	Huong Thuy Town	huong_thuy	46	6
480	Hương Trà	Huong Tra	Thị xã Hương Trà	Huong Tra Town	huong_tra	46	6
481	A Lưới	A Luoi	Huyện A Lưới	A Luoi District	a_luoi	46	7
482	Phú Lộc	Phu Loc	Huyện Phú Lộc	Phu Loc District	phu_loc	46	7
483	Nam Đông	Nam Dong	Huyện Nam Đông	Nam Dong District	nam_dong	46	7
490	Liên Chiểu	Lien Chieu	Quận Liên Chiểu	Lien Chieu District	lien_chieu	48	5
491	Thanh Khê	Thanh Khe	Quận Thanh Khê	Thanh Khe District	thanh_khe	48	5
492	Hải Châu	Hai Chau	Quận Hải Châu	Hai Chau District	hai_chau	48	5
493	Sơn Trà	Son Tra	Quận Sơn Trà	Son Tra District	son_tra	48	5
494	Ngũ Hành Sơn	Ngu Hanh Son	Quận Ngũ Hành Sơn	Ngu Hanh Son District	ngu_hanh_son	48	5
495	Cẩm Lệ	Cam Le	Quận Cẩm Lệ	Cam Le District	cam_le	48	5
497	Hòa Vang	Hoa Vang	Huyện Hòa Vang	Hoa Vang District	hoa_vang	48	7
498	Hoàng Sa	Hoang Sa	Huyện Hoàng Sa	Hoang Sa District	hoang_sa	48	7
502	Tam Kỳ	Tam Ky	Thành phố Tam Kỳ	Tam Ky City	tam_ky	49	4
503	Hội An	Hoi An	Thành phố Hội An	Hoi An City	hoi_an	49	4
504	Tây Giang	Tay Giang	Huyện Tây Giang	Tay Giang District	tay_giang	49	7
505	Đông Giang	Dong Giang	Huyện Đông Giang	Dong Giang District	dong_giang	49	7
506	Đại Lộc	Dai Loc	Huyện Đại Lộc	Dai Loc District	dai_loc	49	7
507	Điện Bàn	Dien Ban	Thị xã Điện Bàn	Dien Ban Town	dien_ban	49	6
508	Duy Xuyên	Duy Xuyen	Huyện Duy Xuyên	Duy Xuyen District	duy_xuyen	49	7
509	Quế Sơn	Que Son	Huyện Quế Sơn	Que Son District	que_son	49	7
510	Nam Giang	Nam Giang	Huyện Nam Giang	Nam Giang District	nam_giang	49	7
511	Phước Sơn	Phuoc Son	Huyện Phước Sơn	Phuoc Son District	phuoc_son	49	7
512	Hiệp Đức	Hiep Duc	Huyện Hiệp Đức	Hiep Duc District	hiep_duc	49	7
513	Thăng Bình	Thang Binh	Huyện Thăng Bình	Thang Binh District	thang_binh	49	7
514	Tiên Phước	Tien Phuoc	Huyện Tiên Phước	Tien Phuoc District	tien_phuoc	49	7
515	Bắc Trà My	Bac Tra My	Huyện Bắc Trà My	Bac Tra My District	bac_tra_my	49	7
516	Nam Trà My	Nam Tra My	Huyện Nam Trà My	Nam Tra My District	nam_tra_my	49	7
517	Núi Thành	Nui Thanh	Huyện Núi Thành	Nui Thanh District	nui_thanh	49	7
518	Phú Ninh	Phu Ninh	Huyện Phú Ninh	Phu Ninh District	phu_ninh	49	7
519	Nông Sơn	Nong Son	Huyện Nông Sơn	Nong Son District	nong_son	49	7
522	Quảng Ngãi	Quang Ngai	Thành phố Quảng Ngãi	Quang Ngai City	quang_ngai	51	4
524	Bình Sơn	Binh Son	Huyện Bình Sơn	Binh Son District	binh_son	51	7
525	Trà Bồng	Tra Bong	Huyện Trà Bồng	Tra Bong District	tra_bong	51	7
527	Sơn Tịnh	Son Tinh	Huyện Sơn Tịnh	Son Tinh District	son_tinh	51	7
528	Tư Nghĩa	Tu Nghia	Huyện Tư Nghĩa	Tu Nghia District	tu_nghia	51	7
529	Sơn Hà	Son Ha	Huyện Sơn Hà	Son Ha District	son_ha	51	7
530	Sơn Tây	Son Tay	Huyện Sơn Tây	Son Tay District	son_tay	51	7
531	Minh Long	Minh Long	Huyện Minh Long	Minh Long District	minh_long	51	7
532	Nghĩa Hành	Nghia Hanh	Huyện Nghĩa Hành	Nghia Hanh District	nghia_hanh	51	7
533	Mộ Đức	Mo Duc	Huyện Mộ Đức	Mo Duc District	mo_duc	51	7
534	Đức Phổ	Duc Pho	Thị xã Đức Phổ	Duc Pho Town	duc_pho	51	6
535	Ba Tơ	Ba To	Huyện Ba Tơ	Ba To District	ba_to	51	7
536	Lý Sơn	Ly Son	Huyện Lý Sơn	Ly Son District	ly_son	51	7
540	Quy Nhơn	Quy Nhon	Thành phố Quy Nhơn	Quy Nhon City	quy_nhon	52	4
542	An Lão	An Lao	Huyện An Lão	An Lao District	an_lao	52	7
543	Hoài Nhơn	Hoai Nhon	Thị xã Hoài Nhơn	Hoai Nhon Town	hoai_nhon	52	6
544	Hoài Ân	Hoai An	Huyện Hoài Ân	Hoai An District	hoai_an	52	7
545	Phù Mỹ	Phu My	Huyện Phù Mỹ	Phu My District	phu_my	52	7
546	Vĩnh Thạnh	Vinh Thanh	Huyện Vĩnh Thạnh	Vinh Thanh District	vinh_thanh	52	7
547	Tây Sơn	Tay Son	Huyện Tây Sơn	Tay Son District	tay_son	52	7
548	Phù Cát	Phu Cat	Huyện Phù Cát	Phu Cat District	phu_cat	52	7
549	An Nhơn	An Nhon	Thị xã An Nhơn	An Nhon Town	an_nhon	52	6
550	Tuy Phước	Tuy Phuoc	Huyện Tuy Phước	Tuy Phuoc District	tuy_phuoc	52	7
551	Vân Canh	Van Canh	Huyện Vân Canh	Van Canh District	van_canh	52	7
555	Tuy Hoà	Tuy Hoa	Thành phố Tuy Hoà	Tuy Hoa City	tuy_hoa	54	4
557	Sông Cầu	Song Cau	Thị xã Sông Cầu	Song Cau Town	song_cau	54	6
558	Đồng Xuân	Dong Xuan	Huyện Đồng Xuân	Dong Xuan District	dong_xuan	54	7
559	Tuy An	Tuy An	Huyện Tuy An	Tuy An District	tuy_an	54	7
560	Sơn Hòa	Son Hoa	Huyện Sơn Hòa	Son Hoa District	son_hoa	54	7
561	Sông Hinh	Song Hinh	Huyện Sông Hinh	Song Hinh District	song_hinh	54	7
562	Tây Hoà	Tay Hoa	Huyện Tây Hoà	Tay Hoa District	tay_hoa	54	7
563	Phú Hoà	Phu Hoa	Huyện Phú Hoà	Phu Hoa District	phu_hoa	54	7
564	Đông Hòa	Dong Hoa	Thị xã Đông Hòa	Dong Hoa Town	dong_hoa	54	6
568	Nha Trang	Nha Trang	Thành phố Nha Trang	Nha Trang City	nha_trang	56	4
569	Cam Ranh	Cam Ranh	Thành phố Cam Ranh	Cam Ranh City	cam_ranh	56	4
570	Cam Lâm	Cam Lam	Huyện Cam Lâm	Cam Lam District	cam_lam	56	7
571	Vạn Ninh	Van Ninh	Huyện Vạn Ninh	Van Ninh District	van_ninh	56	7
572	Ninh Hòa	Ninh Hoa	Thị xã Ninh Hòa	Ninh Hoa Town	ninh_hoa	56	6
573	Khánh Vĩnh	Khanh Vinh	Huyện Khánh Vĩnh	Khanh Vinh District	khanh_vinh	56	7
574	Diên Khánh	Dien Khanh	Huyện Diên Khánh	Dien Khanh District	dien_khanh	56	7
575	Khánh Sơn	Khanh Son	Huyện Khánh Sơn	Khanh Son District	khanh_son	56	7
576	Trường Sa	Truong Sa	Huyện Trường Sa	Truong Sa District	truong_sa	56	7
582	Phan Rang-Tháp Chàm	Phan Rang-Thap Cham	Thành phố Phan Rang-Tháp Chàm	Phan Rang-Thap Cham City	phan_rang-thap_cham	58	4
584	Bác Ái	Bac Ai	Huyện Bác Ái	Bac Ai District	bac_ai	58	7
585	Ninh Sơn	Ninh Son	Huyện Ninh Sơn	Ninh Son District	ninh_son	58	7
586	Ninh Hải	Ninh Hai	Huyện Ninh Hải	Ninh Hai District	ninh_hai	58	7
587	Ninh Phước	Ninh Phuoc	Huyện Ninh Phước	Ninh Phuoc District	ninh_phuoc	58	7
588	Thuận Bắc	Thuan Bac	Huyện Thuận Bắc	Thuan Bac District	thuan_bac	58	7
589	Thuận Nam	Thuan Nam	Huyện Thuận Nam	Thuan Nam District	thuan_nam	58	7
593	Phan Thiết	Phan Thiet	Thành phố Phan Thiết	Phan Thiet City	phan_thiet	60	4
594	La Gi	La Gi	Thị xã La Gi	La Gi Town	la_gi	60	6
595	Tuy Phong	Tuy Phong	Huyện Tuy Phong	Tuy Phong District	tuy_phong	60	7
596	Bắc Bình	Bac Binh	Huyện Bắc Bình	Bac Binh District	bac_binh	60	7
597	Hàm Thuận Bắc	Ham Thuan Bac	Huyện Hàm Thuận Bắc	Ham Thuan Bac District	ham_thuan_bac	60	7
598	Hàm Thuận Nam	Ham Thuan Nam	Huyện Hàm Thuận Nam	Ham Thuan Nam District	ham_thuan_nam	60	7
599	Tánh Linh	Tanh Linh	Huyện Tánh Linh	Tanh Linh District	tanh_linh	60	7
600	Đức Linh	Duc Linh	Huyện Đức Linh	Duc Linh District	duc_linh	60	7
601	Hàm Tân	Ham Tan	Huyện Hàm Tân	Ham Tan District	ham_tan	60	7
602	Phú Quí	Phu Qui	Huyện Phú Quí	Phu Qui District	phu_qui	60	7
608	Kon Tum	Kon Tum	Thành phố Kon Tum	Kon Tum City	kon_tum	62	4
610	Đắk Glei	Dak Glei	Huyện Đắk Glei	Dak Glei District	dak_glei	62	7
611	Ngọc Hồi	Ngoc Hoi	Huyện Ngọc Hồi	Ngoc Hoi District	ngoc_hoi	62	7
612	Đắk Tô	Dak To	Huyện Đắk Tô	Dak To District	dak_to	62	7
613	Kon Plông	Kon Plong	Huyện Kon Plông	Kon Plong District	kon_plong	62	7
614	Kon Rẫy	Kon Ray	Huyện Kon Rẫy	Kon Ray District	kon_ray	62	7
615	Đắk Hà	Dak Ha	Huyện Đắk Hà	Dak Ha District	dak_ha	62	7
616	Sa Thầy	Sa Thay	Huyện Sa Thầy	Sa Thay District	sa_thay	62	7
617	Tu Mơ Rông	Tu Mo Rong	Huyện Tu Mơ Rông	Tu Mo Rong District	tu_mo_rong	62	7
618	Ia H' Drai	Ia H' Drai	Huyện Ia H' Drai	Ia H' Drai District	ia_h'_drai	62	7
622	Pleiku	Pleiku	Thành phố Pleiku	Pleiku City	pleiku	64	4
623	An Khê	An Khe	Thị xã An Khê	An Khe Town	an_khe	64	6
624	Ayun Pa	Ayun Pa	Thị xã Ayun Pa	Ayun Pa Town	ayun_pa	64	6
625	KBang	KBang	Huyện KBang	KBang District	kbang	64	7
626	Đăk Đoa	Dak Doa	Huyện Đăk Đoa	Dak Doa District	dak_doa	64	7
627	Chư Păh	Chu Pah	Huyện Chư Păh	Chu Pah District	chu_pah	64	7
628	Ia Grai	Ia Grai	Huyện Ia Grai	Ia Grai District	ia_grai	64	7
629	Mang Yang	Mang Yang	Huyện Mang Yang	Mang Yang District	mang_yang	64	7
630	Kông Chro	Kong Chro	Huyện Kông Chro	Kong Chro District	kong_chro	64	7
631	Đức Cơ	Duc Co	Huyện Đức Cơ	Duc Co District	duc_co	64	7
632	Chư Prông	Chu Prong	Huyện Chư Prông	Chu Prong District	chu_prong	64	7
633	Chư Sê	Chu Se	Huyện Chư Sê	Chu Se District	chu_se	64	7
634	Đăk Pơ	Dak Po	Huyện Đăk Pơ	Dak Po District	dak_po	64	7
635	Ia Pa	Ia Pa	Huyện Ia Pa	Ia Pa District	ia_pa	64	7
637	Krông Pa	Krong Pa	Huyện Krông Pa	Krong Pa District	krong_pa	64	7
638	Phú Thiện	Phu Thien	Huyện Phú Thiện	Phu Thien District	phu_thien	64	7
639	Chư Pưh	Chu Puh	Huyện Chư Pưh	Chu Puh District	chu_puh	64	7
643	Buôn Ma Thuột	Buon Ma Thuot	Thành phố Buôn Ma Thuột	Buon Ma Thuot City	buon_ma_thuot	66	4
644	Buôn Hồ	Buon Ho	Thị xã Buôn Hồ	Buon Ho Town	buon_ho	66	6
645	Ea H'leo	Ea H'leo	Huyện Ea H'leo	Ea H'leo District	ea_h'leo	66	7
646	Ea Súp	Ea Sup	Huyện Ea Súp	Ea Sup District	ea_sup	66	7
647	Buôn Đôn	Buon Don	Huyện Buôn Đôn	Buon Don District	buon_don	66	7
648	Cư M'gar	Cu M'gar	Huyện Cư M'gar	Cu M'gar District	cu_m'gar	66	7
649	Krông Búk	Krong Buk	Huyện Krông Búk	Krong Buk District	krong_buk	66	7
650	Krông Năng	Krong Nang	Huyện Krông Năng	Krong Nang District	krong_nang	66	7
651	Ea Kar	Ea Kar	Huyện Ea Kar	Ea Kar District	ea_kar	66	7
652	M'Đrắk	M'Drak	Huyện M'Đrắk	M'Drak District	m'drak	66	7
653	Krông Bông	Krong Bong	Huyện Krông Bông	Krong Bong District	krong_bong	66	7
654	Krông Pắc	Krong Pac	Huyện Krông Pắc	Krong Pac District	krong_pac	66	7
655	Krông A Na	Krong A Na	Huyện Krông A Na	Krong A Na District	krong_a_na	66	7
656	Lắk	Lak	Huyện Lắk	Lak District	lak	66	7
657	Cư Kuin	Cu Kuin	Huyện Cư Kuin	Cu Kuin District	cu_kuin	66	7
660	Gia Nghĩa	Gia Nghia	Thành phố Gia Nghĩa	Gia Nghia City	gia_nghia	67	4
661	Đăk Glong	Dak Glong	Huyện Đăk Glong	Dak Glong District	dak_glong	67	7
662	Cư Jút	Cu Jut	Huyện Cư Jút	Cu Jut District	cu_jut	67	7
663	Đắk Mil	Dak Mil	Huyện Đắk Mil	Dak Mil District	dak_mil	67	7
664	Krông Nô	Krong No	Huyện Krông Nô	Krong No District	krong_no	67	7
665	Đắk Song	Dak Song	Huyện Đắk Song	Dak Song District	dak_song	67	7
666	Đắk R'Lấp	Dak R'Lap	Huyện Đắk R'Lấp	Dak R'Lap District	dak_r'lap	67	7
667	Tuy Đức	Tuy Duc	Huyện Tuy Đức	Tuy Duc District	tuy_duc	67	7
672	Đà Lạt	Da Lat	Thành phố Đà Lạt	Da Lat City	da_lat	68	4
673	Bảo Lộc	Bao Loc	Thành phố Bảo Lộc	Bao Loc City	bao_loc	68	4
674	Đam Rông	Dam Rong	Huyện Đam Rông	Dam Rong District	dam_rong	68	7
675	Lạc Dương	Lac Duong	Huyện Lạc Dương	Lac Duong District	lac_duong	68	7
676	Lâm Hà	Lam Ha	Huyện Lâm Hà	Lam Ha District	lam_ha	68	7
677	Đơn Dương	Don Duong	Huyện Đơn Dương	Don Duong District	don_duong	68	7
678	Đức Trọng	Duc Trong	Huyện Đức Trọng	Duc Trong District	duc_trong	68	7
679	Di Linh	Di Linh	Huyện Di Linh	Di Linh District	di_linh	68	7
680	Bảo Lâm	Bao Lam	Huyện Bảo Lâm	Bao Lam District	bao_lam	68	7
681	Đạ Huoai	Da Huoai	Huyện Đạ Huoai	Da Huoai District	da_huoai	68	7
682	Đạ Tẻh	Da Teh	Huyện Đạ Tẻh	Da Teh District	da_teh	68	7
683	Cát Tiên	Cat Tien	Huyện Cát Tiên	Cat Tien District	cat_tien	68	7
688	Phước Long	Phuoc Long	Thị xã Phước Long	Phuoc Long Town	phuoc_long	70	6
689	Đồng Xoài	Dong Xoai	Thành phố Đồng Xoài	Dong Xoai City	dong_xoai	70	4
690	Bình Long	Binh Long	Thị xã Bình Long	Binh Long Town	binh_long	70	6
691	Bù Gia Mập	Bu Gia Map	Huyện Bù Gia Mập	Bu Gia Map District	bu_gia_map	70	7
692	Lộc Ninh	Loc Ninh	Huyện Lộc Ninh	Loc Ninh District	loc_ninh	70	7
693	Bù Đốp	Bu Dop	Huyện Bù Đốp	Bu Dop District	bu_dop	70	7
694	Hớn Quản	Hon Quan	Huyện Hớn Quản	Hon Quan District	hon_quan	70	7
695	Đồng Phú	Dong Phu	Huyện Đồng Phú	Dong Phu District	dong_phu	70	7
696	Bù Đăng	Bu Dang	Huyện Bù Đăng	Bu Dang District	bu_dang	70	7
697	Chơn Thành	Chon Thanh	Huyện Chơn Thành	Chon Thanh District	chon_thanh	70	7
698	Phú Riềng	Phu Rieng	Huyện Phú Riềng	Phu Rieng District	phu_rieng	70	7
703	Tây Ninh	Tay Ninh	Thành phố Tây Ninh	Tay Ninh City	tay_ninh	72	4
705	Tân Biên	Tan Bien	Huyện Tân Biên	Tan Bien District	tan_bien	72	7
706	Tân Châu	Tan Chau	Huyện Tân Châu	Tan Chau District	tan_chau	72	7
707	Dương Minh Châu	Duong Minh Chau	Huyện Dương Minh Châu	Duong Minh Chau District	duong_minh_chau	72	7
708	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	72	7
709	Hòa Thành	Hoa Thanh	Thị xã Hòa Thành	Hoa Thanh Town	hoa_thanh	72	6
711	Bến Cầu	Ben Cau	Huyện Bến Cầu	Ben Cau District	ben_cau	72	7
712	Trảng Bàng	Trang Bang	Thị xã Trảng Bàng	Trang Bang Town	trang_bang	72	6
718	Thủ Dầu Một	Thu Dau Mot	Thành phố Thủ Dầu Một	Thu Dau Mot City	thu_dau_mot	74	4
719	Bàu Bàng	Bau Bang	Huyện Bàu Bàng	Bau Bang District	bau_bang	74	7
720	Dầu Tiếng	Dau Tieng	Huyện Dầu Tiếng	Dau Tieng District	dau_tieng	74	7
721	Bến Cát	Ben Cat	Thị xã Bến Cát	Ben Cat Town	ben_cat	74	6
722	Phú Giáo	Phu Giao	Huyện Phú Giáo	Phu Giao District	phu_giao	74	7
723	Tân Uyên	Tan Uyen	Thị xã Tân Uyên	Tan Uyen Town	tan_uyen	74	6
724	Dĩ An	Di An	Thành phố Dĩ An	Di An City	di_an	74	4
726	Bắc Tân Uyên	Bac Tan Uyen	Huyện Bắc Tân Uyên	Bac Tan Uyen District	bac_tan_uyen	74	7
731	Biên Hòa	Bien Hoa	Thành phố Biên Hòa	Bien Hoa City	bien_hoa	75	4
732	Long Khánh	Long Khanh	Thành phố Long Khánh	Long Khanh City	long_khanh	75	4
734	Tân Phú	Tan Phu	Huyện Tân Phú	Tan Phu District	tan_phu	75	7
735	Vĩnh Cửu	Vinh Cuu	Huyện Vĩnh Cửu	Vinh Cuu District	vinh_cuu	75	7
736	Định Quán	Dinh Quan	Huyện Định Quán	Dinh Quan District	dinh_quan	75	7
737	Trảng Bom	Trang Bom	Huyện Trảng Bom	Trang Bom District	trang_bom	75	7
738	Thống Nhất	Thong Nhat	Huyện Thống Nhất	Thong Nhat District	thong_nhat	75	7
739	Cẩm Mỹ	Cam My	Huyện Cẩm Mỹ	Cam My District	cam_my	75	7
740	Long Thành	Long Thanh	Huyện Long Thành	Long Thanh District	long_thanh	75	7
741	Xuân Lộc	Xuan Loc	Huyện Xuân Lộc	Xuan Loc District	xuan_loc	75	7
742	Nhơn Trạch	Nhon Trach	Huyện Nhơn Trạch	Nhon Trach District	nhon_trach	75	7
747	Vũng Tàu	Vung Tau	Thành phố Vũng Tàu	Vung Tau City	vung_tau	77	4
748	Bà Rịa	Ba Ria	Thành phố Bà Rịa	Ba Ria City	ba_ria	77	4
750	Châu Đức	Chau Duc	Huyện Châu Đức	Chau Duc District	chau_duc	77	7
751	Xuyên Mộc	Xuyen Moc	Huyện Xuyên Mộc	Xuyen Moc District	xuyen_moc	77	7
752	Long Điền	Long Dien	Huyện Long Điền	Long Dien District	long_dien	77	7
753	Đất Đỏ	Dat Do	Huyện Đất Đỏ	Dat Do District	dat_do	77	7
754	Phú Mỹ	Phu My	Thị xã Phú Mỹ	Phu My Town	phu_my	77	6
755	Côn Đảo	Con Dao	Huyện Côn Đảo	Con Dao District	con_dao	77	7
760	1	1	Quận 1	1 District	1	79	5
761	12	12	Quận 12	12 District	12	79	5
764	Gò Vấp	Go Vap	Quận Gò Vấp	Go Vap District	go_vap	79	5
765	Bình Thạnh	Binh Thanh	Quận Bình Thạnh	Binh Thanh District	binh_thanh	79	5
766	Tân Bình	Tan Binh	Quận Tân Bình	Tan Binh District	tan_binh	79	5
767	Tân Phú	Tan Phu	Quận Tân Phú	Tan Phu District	tan_phu	79	5
768	Phú Nhuận	Phu Nhuan	Quận Phú Nhuận	Phu Nhuan District	phu_nhuan	79	5
770	3	3	Quận 3	3 District	3	79	5
771	10	10	Quận 10	10 District	10	79	5
772	11	11	Quận 11	11 District	11	79	5
773	4	4	Quận 4	4 District	4	79	5
774	5	5	Quận 5	5 District	5	79	5
775	6	6	Quận 6	6 District	6	79	5
776	8	8	Quận 8	8 District	8	79	5
777	Bình Tân	Binh Tan	Quận Bình Tân	Binh Tan District	binh_tan	79	5
778	7	7	Quận 7	7 District	7	79	5
783	Củ Chi	Cu Chi	Huyện Củ Chi	Cu Chi District	cu_chi	79	7
784	Hóc Môn	Hoc Mon	Huyện Hóc Môn	Hoc Mon District	hoc_mon	79	7
785	Bình Chánh	Binh Chanh	Huyện Bình Chánh	Binh Chanh District	binh_chanh	79	7
786	Nhà Bè	Nha Be	Huyện Nhà Bè	Nha Be District	nha_be	79	7
787	Cần Giờ	Can Gio	Huyện Cần Giờ	Can Gio District	can_gio	79	7
794	Tân An	Tan An	Thành phố Tân An	Tan An City	tan_an	80	4
795	Kiến Tường	Kien Tuong	Thị xã Kiến Tường	Kien Tuong Town	kien_tuong	80	6
796	Tân Hưng	Tan Hung	Huyện Tân Hưng	Tan Hung District	tan_hung	80	7
797	Vĩnh Hưng	Vinh Hung	Huyện Vĩnh Hưng	Vinh Hung District	vinh_hung	80	7
798	Mộc Hóa	Moc Hoa	Huyện Mộc Hóa	Moc Hoa District	moc_hoa	80	7
799	Tân Thạnh	Tan Thanh	Huyện Tân Thạnh	Tan Thanh District	tan_thanh	80	7
800	Thạnh Hóa	Thanh Hoa	Huyện Thạnh Hóa	Thanh Hoa District	thanh_hoa	80	7
801	Đức Huệ	Duc Hue	Huyện Đức Huệ	Duc Hue District	duc_hue	80	7
802	Đức Hòa	Duc Hoa	Huyện Đức Hòa	Duc Hoa District	duc_hoa	80	7
803	Bến Lức	Ben Luc	Huyện Bến Lức	Ben Luc District	ben_luc	80	7
804	Thủ Thừa	Thu Thua	Huyện Thủ Thừa	Thu Thua District	thu_thua	80	7
805	Tân Trụ	Tan Tru	Huyện Tân Trụ	Tan Tru District	tan_tru	80	7
806	Cần Đước	Can Duoc	Huyện Cần Đước	Can Duoc District	can_duoc	80	7
807	Cần Giuộc	Can Giuoc	Huyện Cần Giuộc	Can Giuoc District	can_giuoc	80	7
808	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	80	7
815	Mỹ Tho	My Tho	Thành phố Mỹ Tho	My Tho City	my_tho	82	4
816	Gò Công	Go Cong	Thị xã Gò Công	Go Cong Town	go_cong	82	6
817	Cai Lậy	Cai Lay	Thị xã Cai Lậy	Cai Lay Town	cai_lay	82	6
818	Tân Phước	Tan Phuoc	Huyện Tân Phước	Tan Phuoc District	tan_phuoc	82	7
819	Cái Bè	Cai Be	Huyện Cái Bè	Cai Be District	cai_be	82	7
820	Cai Lậy	Cai Lay	Huyện Cai Lậy	Cai Lay District	cai_lay	82	7
821	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	82	7
822	Chợ Gạo	Cho Gao	Huyện Chợ Gạo	Cho Gao District	cho_gao	82	7
823	Gò Công Tây	Go Cong Tay	Huyện Gò Công Tây	Go Cong Tay District	go_cong_tay	82	7
824	Gò Công Đông	Go Cong Dong	Huyện Gò Công Đông	Go Cong Dong District	go_cong_dong	82	7
825	Tân Phú Đông	Tan Phu Dong	Huyện Tân Phú Đông	Tan Phu Dong District	tan_phu_dong	82	7
829	Bến Tre	Ben Tre	Thành phố Bến Tre	Ben Tre City	ben_tre	83	4
831	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	83	7
832	Chợ Lách	Cho Lach	Huyện Chợ Lách	Cho Lach District	cho_lach	83	7
833	Mỏ Cày Nam	Mo Cay Nam	Huyện Mỏ Cày Nam	Mo Cay Nam District	mo_cay_nam	83	7
834	Giồng Trôm	Giong Trom	Huyện Giồng Trôm	Giong Trom District	giong_trom	83	7
835	Bình Đại	Binh Dai	Huyện Bình Đại	Binh Dai District	binh_dai	83	7
836	Ba Tri	Ba Tri	Huyện Ba Tri	Ba Tri District	ba_tri	83	7
837	Thạnh Phú	Thanh Phu	Huyện Thạnh Phú	Thanh Phu District	thanh_phu	83	7
838	Mỏ Cày Bắc	Mo Cay Bac	Huyện Mỏ Cày Bắc	Mo Cay Bac District	mo_cay_bac	83	7
842	Trà Vinh	Tra Vinh	Thành phố Trà Vinh	Tra Vinh City	tra_vinh	84	4
844	Càng Long	Cang Long	Huyện Càng Long	Cang Long District	cang_long	84	7
845	Cầu Kè	Cau Ke	Huyện Cầu Kè	Cau Ke District	cau_ke	84	7
846	Tiểu Cần	Tieu Can	Huyện Tiểu Cần	Tieu Can District	tieu_can	84	7
847	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	84	7
848	Cầu Ngang	Cau Ngang	Huyện Cầu Ngang	Cau Ngang District	cau_ngang	84	7
849	Trà Cú	Tra Cu	Huyện Trà Cú	Tra Cu District	tra_cu	84	7
850	Duyên Hải	Duyen Hai	Huyện Duyên Hải	Duyen Hai District	duyen_hai	84	7
851	Duyên Hải	Duyen Hai	Thị xã Duyên Hải	Duyen Hai Town	duyen_hai	84	6
855	Vĩnh Long	Vinh Long	Thành phố Vĩnh Long	Vinh Long City	vinh_long	86	4
857	Long Hồ	Long Ho	Huyện Long Hồ	Long Ho District	long_ho	86	7
858	Mang Thít	Mang Thit	Huyện Mang Thít	Mang Thit District	mang_thit	86	7
859	Vũng Liêm	Vung Liem	Huyện Vũng Liêm	Vung Liem District	vung_liem	86	7
860	Tam Bình	Tam Binh	Huyện Tam Bình	Tam Binh District	tam_binh	86	7
861	Bình Minh	Binh Minh	Thị xã Bình Minh	Binh Minh Town	binh_minh	86	6
862	Trà Ôn	Tra On	Huyện Trà Ôn	Tra On District	tra_on	86	7
863	Bình Tân	Binh Tan	Huyện Bình Tân	Binh Tan District	binh_tan	86	7
866	Cao Lãnh	Cao Lanh	Thành phố Cao Lãnh	Cao Lanh City	cao_lanh	87	4
867	Sa Đéc	Sa Dec	Thành phố Sa Đéc	Sa Dec City	sa_dec	87	4
868	Hồng Ngự	Hong Ngu	Thành phố Hồng Ngự	Hong Ngu City	hong_ngu	87	4
869	Tân Hồng	Tan Hong	Huyện Tân Hồng	Tan Hong District	tan_hong	87	7
870	Hồng Ngự	Hong Ngu	Huyện Hồng Ngự	Hong Ngu District	hong_ngu	87	7
871	Tam Nông	Tam Nong	Huyện Tam Nông	Tam Nong District	tam_nong	87	7
872	Tháp Mười	Thap Muoi	Huyện Tháp Mười	Thap Muoi District	thap_muoi	87	7
873	Cao Lãnh	Cao Lanh	Huyện Cao Lãnh	Cao Lanh District	cao_lanh	87	7
874	Thanh Bình	Thanh Binh	Huyện Thanh Bình	Thanh Binh District	thanh_binh	87	7
875	Lấp Vò	Lap Vo	Huyện Lấp Vò	Lap Vo District	lap_vo	87	7
876	Lai Vung	Lai Vung	Huyện Lai Vung	Lai Vung District	lai_vung	87	7
877	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	87	7
883	Long Xuyên	Long Xuyen	Thành phố Long Xuyên	Long Xuyen City	long_xuyen	89	4
884	Châu Đốc	Chau Doc	Thành phố Châu Đốc	Chau Doc City	chau_doc	89	4
886	An Phú	An Phu	Huyện An Phú	An Phu District	an_phu	89	7
887	Tân Châu	Tan Chau	Thị xã Tân Châu	Tan Chau Town	tan_chau	89	6
888	Phú Tân	Phu Tan	Huyện Phú Tân	Phu Tan District	phu_tan	89	7
889	Châu Phú	Chau Phu	Huyện Châu Phú	Chau Phu District	chau_phu	89	7
890	Tịnh Biên	Tinh Bien	Huyện Tịnh Biên	Tinh Bien District	tinh_bien	89	7
891	Tri Tôn	Tri Ton	Huyện Tri Tôn	Tri Ton District	tri_ton	89	7
892	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	89	7
893	Chợ Mới	Cho Moi	Huyện Chợ Mới	Cho Moi District	cho_moi	89	7
894	Thoại Sơn	Thoai Son	Huyện Thoại Sơn	Thoai Son District	thoai_son	89	7
899	Rạch Giá	Rach Gia	Thành phố Rạch Giá	Rach Gia City	rach_gia	91	4
900	Hà Tiên	Ha Tien	Thành phố Hà Tiên	Ha Tien City	ha_tien	91	4
902	Kiên Lương	Kien Luong	Huyện Kiên Lương	Kien Luong District	kien_luong	91	7
903	Hòn Đất	Hon Dat	Huyện Hòn Đất	Hon Dat District	hon_dat	91	7
904	Tân Hiệp	Tan Hiep	Huyện Tân Hiệp	Tan Hiep District	tan_hiep	91	7
905	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	91	7
906	Giồng Riềng	Giong Rieng	Huyện Giồng Riềng	Giong Rieng District	giong_rieng	91	7
907	Gò Quao	Go Quao	Huyện Gò Quao	Go Quao District	go_quao	91	7
908	An Biên	An Bien	Huyện An Biên	An Bien District	an_bien	91	7
909	An Minh	An Minh	Huyện An Minh	An Minh District	an_minh	91	7
910	Vĩnh Thuận	Vinh Thuan	Huyện Vĩnh Thuận	Vinh Thuan District	vinh_thuan	91	7
911	Phú Quốc	Phu Quoc	Thành phố Phú Quốc	Phu Quoc City	phu_quoc	91	4
912	Kiên Hải	Kien Hai	Huyện Kiên Hải	Kien Hai District	kien_hai	91	7
913	U Minh Thượng	U Minh Thuong	Huyện U Minh Thượng	U Minh Thuong District	u_minh_thuong	91	7
914	Giang Thành	Giang Thanh	Huyện Giang Thành	Giang Thanh District	giang_thanh	91	7
916	Ninh Kiều	Ninh Kieu	Quận Ninh Kiều	Ninh Kieu District	ninh_kieu	92	5
917	Ô Môn	O Mon	Quận Ô Môn	O Mon District	o_mon	92	5
918	Bình Thuỷ	Binh Thuy	Quận Bình Thuỷ	Binh Thuy District	binh_thuy	92	5
919	Cái Răng	Cai Rang	Quận Cái Răng	Cai Rang District	cai_rang	92	5
923	Thốt Nốt	Thot Not	Quận Thốt Nốt	Thot Not District	thot_not	92	5
924	Vĩnh Thạnh	Vinh Thanh	Huyện Vĩnh Thạnh	Vinh Thanh District	vinh_thanh	92	7
925	Cờ Đỏ	Co Do	Huyện Cờ Đỏ	Co Do District	co_do	92	7
926	Phong Điền	Phong Dien	Huyện Phong Điền	Phong Dien District	phong_dien	92	7
927	Thới Lai	Thoi Lai	Huyện Thới Lai	Thoi Lai District	thoi_lai	92	7
930	Vị Thanh	Vi Thanh	Thành phố Vị Thanh	Vi Thanh City	vi_thanh	93	4
931	Ngã Bảy	Nga Bay	Thành phố Ngã Bảy	Nga Bay City	nga_bay	93	4
932	Châu Thành A	Chau Thanh A	Huyện Châu Thành A	Chau Thanh A District	chau_thanh_a	93	7
933	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	93	7
934	Phụng Hiệp	Phung Hiep	Huyện Phụng Hiệp	Phung Hiep District	phung_hiep	93	7
935	Vị Thuỷ	Vi Thuy	Huyện Vị Thuỷ	Vi Thuy District	vi_thuy	93	7
936	Long Mỹ	Long My	Huyện Long Mỹ	Long My District	long_my	93	7
937	Long Mỹ	Long My	Thị xã Long Mỹ	Long My Town	long_my	93	6
941	Sóc Trăng	Soc Trang	Thành phố Sóc Trăng	Soc Trang City	soc_trang	94	4
942	Châu Thành	Chau Thanh	Huyện Châu Thành	Chau Thanh District	chau_thanh	94	7
943	Kế Sách	Ke Sach	Huyện Kế Sách	Ke Sach District	ke_sach	94	7
944	Mỹ Tú	My Tu	Huyện Mỹ Tú	My Tu District	my_tu	94	7
945	Cù Lao Dung	Cu Lao Dung	Huyện Cù Lao Dung	Cu Lao Dung District	cu_lao_dung	94	7
946	Long Phú	Long Phu	Huyện Long Phú	Long Phu District	long_phu	94	7
947	Mỹ Xuyên	My Xuyen	Huyện Mỹ Xuyên	My Xuyen District	my_xuyen	94	7
948	Ngã Năm	Nga Nam	Thị xã Ngã Năm	Nga Nam Town	nga_nam	94	6
949	Thạnh Trị	Thanh Tri	Huyện Thạnh Trị	Thanh Tri District	thanh_tri	94	7
950	Vĩnh Châu	Vinh Chau	Thị xã Vĩnh Châu	Vinh Chau Town	vinh_chau	94	6
951	Trần Đề	Tran De	Huyện Trần Đề	Tran De District	tran_de	94	7
954	Bạc Liêu	Bac Lieu	Thành phố Bạc Liêu	Bac Lieu City	bac_lieu	95	4
956	Hồng Dân	Hong Dan	Huyện Hồng Dân	Hong Dan District	hong_dan	95	7
957	Phước Long	Phuoc Long	Huyện Phước Long	Phuoc Long District	phuoc_long	95	7
958	Vĩnh Lợi	Vinh Loi	Huyện Vĩnh Lợi	Vinh Loi District	vinh_loi	95	7
959	Giá Rai	Gia Rai	Thị xã Giá Rai	Gia Rai Town	gia_rai	95	6
960	Đông Hải	Dong Hai	Huyện Đông Hải	Dong Hai District	dong_hai	95	7
961	Hoà Bình	Hoa Binh	Huyện Hoà Bình	Hoa Binh District	hoa_binh	95	7
964	Cà Mau	Ca Mau	Thành phố Cà Mau	Ca Mau City	ca_mau	96	4
966	U Minh	U Minh	Huyện U Minh	U Minh District	u_minh	96	7
967	Thới Bình	Thoi Binh	Huyện Thới Bình	Thoi Binh District	thoi_binh	96	7
968	Trần Văn Thời	Tran Van Thoi	Huyện Trần Văn Thời	Tran Van Thoi District	tran_van_thoi	96	7
969	Cái Nước	Cai Nuoc	Huyện Cái Nước	Cai Nuoc District	cai_nuoc	96	7
970	Đầm Dơi	Dam Doi	Huyện Đầm Dơi	Dam Doi District	dam_doi	96	7
971	Năm Căn	Nam Can	Huyện Năm Căn	Nam Can District	nam_can	96	7
972	Phú Tân	Phu Tan	Huyện Phú Tân	Phu Tan District	phu_tan	96	7
973	Ngọc Hiển	Ngoc Hien	Huyện Ngọc Hiển	Ngoc Hien District	ngoc_hien	96	7
769	Thủ Đức	Thu Duc	Thành phố Thủ Đức	Thu Duc City	thu_duc	79	3
\.


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (code);


--
-- Name: districts districts_administrative_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_administrative_unit_id_fkey FOREIGN KEY (administrative_unit_id) REFERENCES public.administrative_units(id);


--
-- Name: districts districts_province_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_province_code_fkey FOREIGN KEY (province_code) REFERENCES public.provinces(code);


--
-- PostgreSQL database dump complete
--

