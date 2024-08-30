--liquibase formatted sql

--changeset dbadmin:1.0.0 context:public

CREATE TABLE public.product (
	id bigserial NOT NULL,
	name varchar(50) DEFAULT 'NULL'::character varying NULL,
	sku varchar(50) DEFAULT 'NULL'::character varying NULL,
	description varchar(100) NOT NULL,
	price int4 NOT NULL,
	stock int4 NOT NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id)
);


--rollback drop table public.product;