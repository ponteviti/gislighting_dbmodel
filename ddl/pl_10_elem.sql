
SET search_path = SCHEMA_NAME, public, pg_catalog;


CREATE TABLE element_type (
id varchar(30) NOT NULL,
active boolean,
code_autofill boolean,
descript text,
link_path varchar(254),
CONSTRAINT element_type_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_mat_element (
id varchar(30),
descript varchar(512),
link varchar(512),
CONSTRAINT cat_mat_element_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_element (
id varchar(30)   NOT NULL,
elementtype_id varchar(30),
matcat_id varchar(30),
geometry varchar(30),
descript varchar(512),
link varchar(512),
brand varchar(30),
type varchar(30),
model varchar(30),
svg varchar(50),
active boolean,
CONSTRAINT cat_element_pkey PRIMARY KEY (id)
);



CREATE TABLE element (
element_id varchar(16) PRIMARY KEY DEFAULT nextval('SCHEMA_NAME.urn_id_seq'::regclass),
code varchar(30),
elementcat_id varchar(30),
serial_number varchar(30),
num_elements integer,
state int2,
state_type int2,
observ character varying(254),
comment character varying(254),
category_type varchar(50),
location_type varchar(50),
workcat_id varchar(30), 
workcat_id_end varchar(30),
buildercat_id varchar(30),
builtdate date,
enddate date,
ownercat_id varchar(30),
rotation numeric (6,3),
link character varying(512),
verified varchar(20),
the_geom public.geometry (POINT, SRID_VALUE),
label_x character varying(30),
label_y character varying(30),
label_rotation numeric(6,3),
undelete boolean,
publish boolean,
inventory boolean,
expl_id integer,
feature_type varchar (16) DEFAULT 'ELEMENT',
tstamp timestamp DEFAULT now()
);


CREATE TABLE element_x_arc (
id serial NOT NULL PRIMARY KEY,
element_id varchar(16),
arc_id varchar(16)
);


CREATE TABLE element_x_node (
id serial NOT NULL PRIMARY KEY,
element_id varchar(16),
node_id varchar(16)
);

CREATE INDEX element_index ON element USING GIST (the_geom);