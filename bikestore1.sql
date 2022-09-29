CREATE DATABASE BikeStore
USE BikeStore;
CREATE SCHEMA production;
GO
CREATE SCHEMA sales;
GO
CREATE TABLE production.categories(
	category_id int IDENTITY (1,1) PRIMARY KEY,
	category_name NVARCHAR (300) not NULL,
);
CREATE TABLE production.brand(
	brand_id int IDENTITY (1,1) PRIMARY KEY,
	brand_Name NVARCHAR (300) not NULL,
);
CREATE TABLE production.products(
	product_id INT IDENTITY (1,1) PRIMARY KEY,
	product_name VARCHAR (255) not NULL,
	brand_id INT not NULL,
	category_id INT not NULL,
	model_year SMALLINT not NULL,
	list_price DECIMAL (10,2) not NULL,
	FOREIGN KEY (category_id) REFERENCES production.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES production.brand (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE sales.customers(
	customer_id INT IDENTITY (1,1) PRIMARY KEY,
	first_name VARCHAR (255) not NULL,
	last_nmae VARCHAR (255) not NULL,
	phone VARCHAR (25),
	email VARCHAR (255) not NULL,
	street VARCHAR (255) ,
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);
CREATE TABLE sales.stores(
	store_id INT IDENTITY (1,1) PRIMARY KEY,
	store_name VARCHAR (255) not NULL,
	phone VARCHAR (25),
	email VARCHAR (255) not NULL,
	street VARCHAR (255) ,
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);
CREATE TABLE sales.staffs(
	staff_id INT IDENTITY (1,1) PRIMARY KEY,
	first_name VARCHAR (255) not NULL,
	last_nmae VARCHAR (255) not NULL,
	email VARCHAR (255) not NULL,
	phone VARCHAR (25),
	active tinyint not NULL,
	store_id INT,
	manager_id INT,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE sales.orders(
	order_id INT IDENTITY (1,1) PRIMARY KEY,
	customer_id INT,
	order_status tinyint not NULL,
	order_date DATE not NULL,
	required_date DATE not NULL,
	shipped_date DATE,
	store_id INT not NULL,
	staff_id INT not NULL,
	FOREIGN KEY (customer_id) REFERENCES sales.customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE sales.order_items(
	order_id INT,
	item_id INT,
	product_id INT not NULL,
	quantity INT not NULL,
	list_price DECIMAL (10,2) not NULL,
	discount DECIMAL (4,2) not NULL DEFAULT 0,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES sales.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE production.stocks(
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);