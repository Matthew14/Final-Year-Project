--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tracks; Type: TABLE; Schema: public; Owner: dev; Tablespace:
--

CREATE TABLE tracks (
    id integer NOT NULL,
    artist character varying(200),
    title character varying(200),
    file_path character varying(100),
    positivity numeric,
    excitedness numeric,
    album_art_url varying(100)
);


ALTER TABLE public.tracks OWNER TO dev;

--
-- Name: userhastrack; Type: TABLE; Schema: public; Owner: dev; Tablespace:
--

CREATE TABLE userhastrack (
    trackid integer,
    username character varying(50)
);


ALTER TABLE public.userhastrack OWNER TO dev;

--
-- Name: users; Type: TABLE; Schema: public; Owner: dev; Tablespace:
--

CREATE TABLE users (
    username character varying(50) NOT NULL,
    passwordhash character varying(64) NOT NULL,
    firstname character varying(100),
    email character varying(100),
    surname character varying(100)
);


ALTER TABLE public.users OWNER TO dev;

--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY tracks (id, artist, title, file_path, positivity, excitedness) FROM stdin;
\.


--
-- Data for Name: userhastrack; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY userhastrack (trackid, username) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY users (username, passwordhash, firstname, surname) FROM stdin;
matt	5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8	Matt	O'Neill
matt2	92b59f95a982ccd960e21748e35fbbe0b93c2a4ca9302536eeb47bc7be35f06c	\N	\N
\.


--
-- Name: tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace:
--

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: userhastrack_trackid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY userhastrack
    ADD CONSTRAINT userhastrack_trackid_fkey FOREIGN KEY (trackid) REFERENCES tracks(id);


--
-- Name: userhastrack_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY userhastrack
    ADD CONSTRAINT userhastrack_username_fkey FOREIGN KEY (username) REFERENCES users(username);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

