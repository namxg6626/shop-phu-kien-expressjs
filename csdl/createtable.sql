go
create database shopnguyenxa_test
go
use shopnguyenxa_test

go
create table product (
	id int identity(1,1),
	product_no int,
	name nvarchar(255),
	brand nvarchar(255),
	material nvarchar(255),
	price int,
	compatibility nvarchar(255),
	mfgDate date,
	warranty int,
	linkImage varchar(512),
	PRIMARY KEY (id)
)

go
create table customer (
	id int identity(1,1),
	email varchar(255),
	password varchar(255),
	name nvarchar(255),
	phone_number varchar(50),
	address nvarchar(512),
	gender tinyint,
	primary key (id)
)

go
create table bill (
	id char(12),
	id_customer int,
	total real,
	create_at  date
	primary key (id),
	constraint fk_id_customer
	foreign key (id_customer)
	references customer(id)
)

go
create table bill_item (
	id int identity(1,1),
	id_bill char(12),
	id_product int,
	quantity int,
	unit_price real,

	primary key (id),

	constraint fk_id_bill
	foreign key (id_bill)
	references bill(id),

	constraint fk_id_product
	foreign key (id_product)
	references product(id)
)

go
create table ordered(
	id_customer int,
	id_bill char(12),
	constraint fk_ordered_id_customer
	foreign key (id_customer)
	references customer(id),
	constraint fk_ordered_id_bill
	foreign key (id_bill)
	references bill(id),
)
