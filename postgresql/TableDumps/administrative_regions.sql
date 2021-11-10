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
-- Name: administrative_regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrative_regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    code_name character varying(255),
    code_name_en character varying(255)
);


--
-- Data for Name: administrative_regions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.administrative_regions (id, name, name_en, code_name, code_name_en) FROM stdin;
1	Đông Bắc Bộ	Northeast	dong_bac_bo	northest
2	Tây Bắc Bộ	Northwest	tay_bac_bo	northwest
3	Đồng bằng sông Hồng	Red River Delta	dong_bang_song_hong	red_river_delta
4	Bắc Trung Bộ	North Central Coast	bac_trung_bo	north_central_coast
5	Duyên hải Nam Trung Bộ	South Central Coast	duyen_hai_nam_trung_bo	south_central_coast
6	Tây Nguyên	Central Highlands	tay_nguyen	central_highlands
7	Đông Nam Bộ	Southeast	dong_nam_bo	southeast
8	Đồng bằng sông Cửu Long	Mekong River Delta	dong_bang_song_cuu_long	southwest
\.


--
-- Name: administrative_regions administrative_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrative_regions
    ADD CONSTRAINT administrative_regions_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

