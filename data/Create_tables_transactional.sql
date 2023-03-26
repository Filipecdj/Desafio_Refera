DROP TABLE IF EXISTS public.actor;
CREATE TABLE public.actor (
	actor_id serial4 NOT NULL,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT actor_pkey PRIMARY KEY (actor_id)
);

DROP TABLE IF EXISTS public.address;
CREATE TABLE public."address" (
	address_id serial4 NOT NULL,
	address varchar(50) NOT NULL,
	address2 varchar(50) NULL,
	district varchar(20) NOT NULL,
	city_id int2 NOT NULL,
	postal_code varchar(10) NULL,
	phone varchar(20) NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT address_pkey PRIMARY KEY (address_id)
);

DROP TABLE IF EXISTS public.category;
CREATE TABLE public.category (
	category_id serial4 NOT NULL,
	"name" varchar(25) NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT category_pkey PRIMARY KEY (category_id)
);

DROP TABLE IF EXISTS public.city;
CREATE TABLE public.city (
	city_id serial4 NOT NULL,
	city varchar(50) NOT NULL,
	country_id int2 NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT city_pkey PRIMARY KEY (city_id)
);

DROP TABLE IF EXISTS public.country;
CREATE TABLE public.country (
	country_id serial4 NOT NULL,
	country varchar(50) NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT country_pkey PRIMARY KEY (country_id)
);

DROP TABLE IF EXISTS public.customer;
CREATE TABLE public.customer (
	customer_id serial4 NOT NULL,
	store_id int2 NOT NULL,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
	email varchar(50) NULL,
	address_id int2 NOT NULL,
	activebool bool NOT NULL DEFAULT true,
	create_date date NOT NULL DEFAULT 'now'::text::date,
	last_update timestamp NULL DEFAULT now(),
	active int4 NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);

DROP TABLE IF EXISTS public.film;
CREATE TABLE public.film (
	film_id serial4 NOT NULL,
	title varchar(255) NOT NULL,
	description text NULL,
	release_year int2 NULL,
	language_id int2 NOT NULL,
	rental_duration int2 NOT NULL DEFAULT 3,
	rental_rate numeric(4, 2) NOT NULL DEFAULT 4.99,
	length int2 NULL,
	replacement_cost numeric(5, 2) NOT NULL DEFAULT 19.99,
	rating varchar(255) NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	special_features _text NULL,
	fulltext tsvector NOT NULL,
	CONSTRAINT film_pkey PRIMARY KEY (film_id)
);

DROP TABLE IF EXISTS public.film_actor;
CREATE TABLE public.film_actor (
	actor_id int2 NOT NULL,
	film_id int2 NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id)
);

DROP TABLE IF EXISTS public.film_category;
CREATE TABLE public.film_category (
	film_id int2 NOT NULL,
	category_id int2 NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id)
);

DROP TABLE IF EXISTS public.inventory;
CREATE TABLE public.inventory (
	inventory_id serial4 NOT NULL,
	film_id int2 NOT NULL,
	store_id int2 NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id)
);

DROP TABLE IF EXISTS public."language";
CREATE TABLE public."language" (
	language_id serial4 NOT NULL,
	"name" bpchar(20) NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT language_pkey PRIMARY KEY (language_id)
);

DROP TABLE IF EXISTS public.payment;
CREATE TABLE public.payment (
	payment_id serial4 NOT NULL,
	customer_id int2 NOT NULL,
	staff_id int2 NOT NULL,
	rental_id int4 NOT NULL,
	amount numeric(5, 2) NOT NULL,
	payment_date timestamp NOT NULL,
	CONSTRAINT payment_pkey PRIMARY KEY (payment_id)
);

DROP TABLE IF EXISTS public.rental;
CREATE TABLE public.rental (
	rental_id serial4 NOT NULL,
	rental_date timestamp NOT NULL,
	inventory_id int4 NOT NULL,
	customer_id int2 NOT NULL,
	return_date timestamp NULL,
	staff_id int2 NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT rental_pkey PRIMARY KEY (rental_id)
);

DROP TABLE IF EXISTS public.staff;
CREATE TABLE public.staff (
	staff_id serial4 NOT NULL,
	first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
	address_id int2 NOT NULL,
	email varchar(50) NULL,
	store_id int2 NOT NULL,
	active bool NOT NULL DEFAULT true,
	username varchar(16) NOT NULL,
	"password" varchar(40) NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	picture bytea NULL,
	CONSTRAINT staff_pkey PRIMARY KEY (staff_id)
);

DROP TABLE IF EXISTS public.store;
CREATE TABLE public.store (
	store_id serial4 NOT NULL,
	manager_staff_id int2 NOT NULL,
	address_id int2 NOT NULL,
	last_update timestamp NOT NULL DEFAULT now(),
	CONSTRAINT store_pkey PRIMARY KEY (store_id)
);