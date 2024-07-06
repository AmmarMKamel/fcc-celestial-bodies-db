--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km numeric(7,2),
    is_potentially_hazardous boolean NOT NULL,
    discovery_year integer,
    composition text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteriods_asteriod_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteriods_asteriod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteriods_asteriod_id_seq OWNER TO freecodecamp;

--
-- Name: asteriods_asteriod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteriods_asteriod_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(30),
    age_in_billions_of_years numeric(5,2),
    diameter_in_light_years integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    planet_type character varying(30),
    diameter_km integer,
    has_atmosphere boolean NOT NULL,
    distance_from_star_au numeric(7,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    temperature_kelvin integer,
    is_binary boolean NOT NULL,
    mass_solar_masses numeric(8,2),
    color character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteriods_asteriod_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, false, 1801, 'Ceres is composed of an rocky core covered by an icy mantle. The surface is a mixture of water ice, carbonates, and various hydrated minerals such as clay and mica.');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, false, 1807, 'Vesta has a rocky composition similar to the Earth''s crust. It consists mainly of basaltic rock with a metallic iron-nickel core.');
INSERT INTO public.asteroid VALUES (3, 'Eros', 16.84, true, 1898, 'Eros is an S-type asteroid, meaning it''s composed mainly of silicate minerals and metals, including iron and magnesium silicates, aluminum, and some nickel-iron.');
INSERT INTO public.asteroid VALUES (4, 'Bennu', 0.49, true, 1999, 'Bennu is a B-type asteroid with a primitive composition. It''s rich in carbon-based materials including organic molecules and volatiles, as well as hydrated minerals suggesting the past presence of water.');
INSERT INTO public.asteroid VALUES (5, 'Psyche', 226.00, false, 1852, 'Psyche is believed to be the exposed core of an early planet. It''s composed almost entirely of iron and nickel, with small amounts of rock on its surface.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.61, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.01, 220000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10.00, 60000, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 13.27, 60000, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 0.40, 60000, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 13.25, 50000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 13, false, 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3642, true, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, true, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, true, 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, true, 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, true, 15.95);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 504, true, 1.37);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 396, true, 0.94);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 2707, true, 5.88);
INSERT INTO public.moon VALUES (12, 'Nereid', 6, 340, false, 360.14);
INSERT INTO public.moon VALUES (13, 'Charon', 8, 1212, true, 6.39);
INSERT INTO public.moon VALUES (14, 'Oberon', 8, 1523, true, 13.46);
INSERT INTO public.moon VALUES (15, 'Titania', 8, 1578, true, 8.71);
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 472, true, 1.41);
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 1158, true, 2.52);
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 1169, true, 4.14);
INSERT INTO public.moon VALUES (19, 'Juliet', 8, 94, false, 0.49);
INSERT INTO public.moon VALUES (20, 'Puck', 8, 162, false, 0.76);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 12742, true, 1.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 6779, true, 1.52);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 139820, true, 5.20);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 'Terrestrial', 12104, true, 0.72);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 'Gas Giant', 116460, true, 9.54);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Ice Giant', 49244, true, 30.07);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 'Terrestrial', 4879, false, 0.39);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 'Ice Giant', 50724, true, 19.22);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, 'Super-Earth', 11680, true, 0.40);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 3, 'Hot Jupiter', 94700, true, 0.05);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 2, 'Super-Earth', 12742, true, 0.05);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 4, 'Terrestrial', 9200, true, 0.03);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, false, 1.00, 'Yellow');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, false, 0.12, 'Red');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, true, 2.02, 'White');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, false, 11.60, 'Red');
INSERT INTO public.star VALUES (5, 'Andromeda A', 2, 6000, false, 1.50, 'Yellow-White');
INSERT INTO public.star VALUES (6, 'Triangulum X', 3, 8000, true, 3.20, 'Blue-White');


--
-- Name: asteriods_asteriod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteriods_asteriod_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteriods_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteriods_name_key UNIQUE (name);


--
-- Name: asteroid asteriods_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteriods_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

