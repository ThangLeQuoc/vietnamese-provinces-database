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
-- Name: administrative_units; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrative_units (
    id integer NOT NULL,
    full_name character varying(255),
    full_name_en character varying(255),
    short_name character varying(255),
    short_name_en character varying(255),
    code_name character varying(255),
    code_name_en character varying(255)
);


--
-- Data for Name: administrative_units; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.administrative_units (id, full_name, full_name_en, short_name, short_name_en, code_name, code_name_en) FROM stdin;
1	Thành phố trực thuộc trung ương	Municipality	Thành phố	City	thanh_pho_truc_thuoc_trung_uong	municipality
2	Tỉnh	Province	Tỉnh	Province	tinh	province
3	Thành phố thuộc thành phố trực thuộc trung ương	Municipal city	Thành phố	City	thanh_pho_thuoc_thanh_pho_truc_thuoc_trung_uong	municipal_city
4	Thành phố thuộc tỉnh	Provincial city	Thành phố	City	thanh_pho_thuoc_tinh	provincial_city
5	Quận	Urban district	Quận	District	quan	urban_district
6	Thị xã	District-level town	Thị xã	Town	thi_xa	district_level_town
7	Huyện	District	Huyện	District	huyen	district
8	Phường	Ward	Phường	Ward	phuong	ward
9	Thị trấn	Commune-level town	Thị trấn	Township	thi_tran	commune_level_town
10	Xã	Commune	Xã	Commune	xa	commune
\.


--
-- Name: administrative_units administrative_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrative_units
    ADD CONSTRAINT administrative_units_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

