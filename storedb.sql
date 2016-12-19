DROP DATABASE IF EXISTS storedb;

CREATE DATABASE storedb;

USE storedb;
 
CREATE TABLE sess_cart (
    session_id varchar(40) NOT NULL DEFAULT '0',
    ip_address varchar(16)  NOT NULL DEFAULT '0',
    user_agent varchar(120)  DEFAULT NULL,
    last_activity int(10)  NOT NULL DEFAULT '0',
    user_data text  NOT NULL,
    PRIMARY KEY (session_id),
    KEY last_activity_idx (last_activity)
);

CREATE TABLE products (
    product_id int(11) NOT NULL AUTO_INCREMENT,
    product_name varchar(255) NOT NULL,
    product_code int(11) NOT NULL,
    product_description varchar(255) NOT NULL,
    category_id int(11) NOT NULL,
    product_price int(11) NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE customer (  
    cust_id int(11) NOT NULL AUTO_INCREMENT,  
    cust_first_name varchar(125) NOT NULL,  
    cust_last_name varchar(125) NOT NULL,  
    cust_email varchar(255) NOT NULL,  
    cust_created_at int(11) NOT NULL,  
    cust_address text NOT NULL,  
    PRIMARY KEY (cust_id) 
);

CREATE TABLE orders (
    order_id int(11) NOT NULL AUTO_INCREMENT,  
    cust_id int(11) NOT NULL,  
    order_details text NOT NULL,  
    order_created_at int(11) NOT NULL,  
    order_closed int(1) NOT NULL,
    order_fulfilment_code varchar(255) NOT NULL,  
    order_delivery_address text NOT NULL,  
    PRIMARY KEY (order_id) 
);

INSERT INTO products (product_id, product_name,
product_code, product_description, category_id,
product_price) VALUES
(1, 'Engineering Books', 423423, 'Introduction to Electrical Engineering', 2, 50),
(2, 'laptop and Tablets', 34234, 'Lenovo T540', 1, 25);

CREATE TABLE categories (
    cat_id int(11) NOT NULL AUTO_INCREMENT,
    cat_name varchar(50) NOT NULL,
    PRIMARY KEY (cat_id)
);

INSERT INTO categories (cat_id, cat_name) VALUES
(1, 'Books'),
(2, 'Computers');

GRANT SELECT, INSERT, DELETE, UPDATE
ON storedb.*
TO admin@localhost
IDENTIFIED BY 'pass@word';

