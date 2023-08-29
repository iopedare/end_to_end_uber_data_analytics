--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

DROP DATABASE uber_data;
--
-- Name: uber_data; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE uber_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE uber_data OWNER TO postgres;

\connect uber_data

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
-- Name: date_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.date_dim (
    date_id integer NOT NULL,
    tpep_pickup_datetime date,
    pickup_hour integer,
    pickup_day integer,
    pickup_month integer,
    pickup_year integer,
    pickup_weekday integer,
    tpep_dropoff_datetime date,
    dropoff_hour integer,
    dropoff_day integer,
    dropoff_month integer,
    dropoff_year integer,
    dropoff_weekday integer
);


ALTER TABLE public.date_dim OWNER TO postgres;

--
-- Name: passenger_count_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger_count_dim (
    passenger_count_id integer NOT NULL,
    passenger_count integer NOT NULL
);


ALTER TABLE public.passenger_count_dim OWNER TO postgres;

--
-- Name: payment_type_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_type_dim (
    payment_type_id integer NOT NULL,
    payment_type integer NOT NULL,
    payment_type_name character varying(55) NOT NULL
);


ALTER TABLE public.payment_type_dim OWNER TO postgres;

--
-- Name: rate_code_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate_code_dim (
    rate_code_id integer NOT NULL,
    "RatecodeID" integer NOT NULL,
    rate_code_name character varying(50) NOT NULL
);


ALTER TABLE public.rate_code_dim OWNER TO postgres;

--
-- Name: trip_distance_dim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip_distance_dim (
    trip_distance_id integer NOT NULL,
    trip_distance integer NOT NULL
);


ALTER TABLE public.trip_distance_dim OWNER TO postgres;

--
-- Name: uber_fact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uber_fact (
    "VendorID" integer NOT NULL,
    date_id integer NOT NULL,
    passenger_count_id integer NOT NULL,
    trip_distance_id integer NOT NULL,
    "PULocationID" integer NOT NULL,
    "DOLocationID" integer NOT NULL,
    rate_code_id integer NOT NULL,
    payment_type_id integer NOT NULL,
    fare_amount numeric(9,2) NOT NULL,
    extra numeric(9,2) NOT NULL,
    mta_tax numeric(9,2) NOT NULL,
    tip_amount numeric(9,2) NOT NULL,
    tolls_amount numeric(9,2) NOT NULL,
    improvement_surcharge numeric(9,2) NOT NULL,
    total_amount numeric(9,2) NOT NULL,
    congestion_surcharge numeric(9,2) NOT NULL,
    airport_fee numeric(9,2) NOT NULL
);


ALTER TABLE public.uber_fact OWNER TO postgres;

--
-- Data for Name: date_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: passenger_count_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payment_type_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rate_code_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: trip_distance_dim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: uber_fact; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: date_dim date_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.date_dim
    ADD CONSTRAINT date_dim_pkey PRIMARY KEY (date_id);


--
-- Name: passenger_count_dim passenger_count_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_count_dim
    ADD CONSTRAINT passenger_count_dim_pkey PRIMARY KEY (passenger_count_id);


--
-- Name: payment_type_dim payment_type_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_type_dim
    ADD CONSTRAINT payment_type_dim_pkey PRIMARY KEY (payment_type_id);


--
-- Name: rate_code_dim rate_code_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_code_dim
    ADD CONSTRAINT rate_code_dim_pkey PRIMARY KEY (rate_code_id);


--
-- Name: trip_distance_dim trip_distance_dim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_distance_dim
    ADD CONSTRAINT trip_distance_dim_pkey PRIMARY KEY (trip_distance_id);


--
-- Name: uber_fact uber_fact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uber_fact
    ADD CONSTRAINT uber_fact_pkey PRIMARY KEY ("VendorID");


--
-- Name: uber_fact uber_fact_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uber_fact
    ADD CONSTRAINT uber_fact_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.date_dim(date_id) NOT VALID;


--
-- Name: uber_fact uber_fact_passenger_count_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uber_fact
    ADD CONSTRAINT uber_fact_passenger_count_id_fkey FOREIGN KEY (passenger_count_id) REFERENCES public.passenger_count_dim(passenger_count_id) NOT VALID;


--
-- Name: uber_fact uber_fact_payment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uber_fact
    ADD CONSTRAINT uber_fact_payment_type_id_fkey FOREIGN KEY (payment_type_id) REFERENCES public.payment_type_dim(payment_type_id) NOT VALID;


--
-- Name: uber_fact uber_fact_rate_code_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uber_fact
    ADD CONSTRAINT uber_fact_rate_code_id_fkey FOREIGN KEY (rate_code_id) REFERENCES public.rate_code_dim(rate_code_id) NOT VALID;


--
-- Name: uber_fact uber_fact_trip_distance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uber_fact
    ADD CONSTRAINT uber_fact_trip_distance_id_fkey FOREIGN KEY (trip_distance_id) REFERENCES public.trip_distance_dim(trip_distance_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

