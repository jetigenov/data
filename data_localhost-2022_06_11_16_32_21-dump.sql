--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: t_data; Type: TABLE; Schema: public; Owner: jetigenov
--

CREATE TABLE public.t_data (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    text_area character varying(1024) NOT NULL,
    bool_data boolean DEFAULT false NOT NULL,
    created_on timestamp without time zone NOT NULL
);


ALTER TABLE public.t_data OWNER TO jetigenov;

--
-- Name: t_data_id_seq; Type: SEQUENCE; Schema: public; Owner: jetigenov
--

CREATE SEQUENCE public.t_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_data_id_seq OWNER TO jetigenov;

--
-- Name: t_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jetigenov
--

ALTER SEQUENCE public.t_data_id_seq OWNED BY public.t_data.id;


--
-- Name: t_data id; Type: DEFAULT; Schema: public; Owner: jetigenov
--

ALTER TABLE ONLY public.t_data ALTER COLUMN id SET DEFAULT nextval('public.t_data_id_seq'::regclass);


--
-- Data for Name: t_data; Type: TABLE DATA; Schema: public; Owner: jetigenov
--

COPY public.t_data (id, title, text_area, bool_data, created_on) FROM stdin;
1	test	{tester}	f	2022-06-11 15:59:53.169569
2	test	{hello,world}	t	2022-06-11 16:00:32.034312
\.


--
-- Name: t_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jetigenov
--

SELECT pg_catalog.setval('public.t_data_id_seq', 14, true);


--
-- Name: t_data t_data_pkey; Type: CONSTRAINT; Schema: public; Owner: jetigenov
--

ALTER TABLE ONLY public.t_data
    ADD CONSTRAINT t_data_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

