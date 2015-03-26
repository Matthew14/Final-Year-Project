--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: fypuser; Tablespace: 
--

CREATE TABLE users (
    username character varying(50) NOT NULL,
    password_hash character varying(64),
    first_name character varying(100),
    surname character varying(100),
    email character varying(100),
    analysis_in_progress boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO fypuser;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fypuser
--

COPY users (username, password_hash, first_name, surname, email, analysis_in_progress) FROM stdin;
matt	d0806b9e26ae96ce3d612f15677166407ae13aac89b8ff5aacb1dda7e45b64c1	Matthew	O'Neill	matthew@matthewoneill.com	f
matt13873106	d0806b9e26ae96ce3d612f15677166407ae13aac89b8ff5aacb1dda7e45b64c1	\N	\N	m@outlook.com	f
matt20	d0806b9e26ae96ce3d612f15677166407ae13aac89b8ff5aacb1dda7e45b64c1	\N	\N	Hello@hotmail.com	f
\.


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: fypuser; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

