# demoProject

create table slam_cart (
c_id integer references slam_customers(cust_id),
    p_id integer references productsData(id)
)

drop table slam_customers; 
drop table slam_cart;
drop table slam_wishlist;
CREATE TABLE Slam_Customers (
    Cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(100),
    cust_mobile VARCHAR,
    cust_regdate TIMESTAMP,
    cust_location VARCHAR,
    cust_email VARCHAR,
    cust_address VARCHAR(200),
    cust_pincode VARCHAR,
    cust_saddress VARCHAR(200),
    cust_spincode VARCHAR,
    cust_status CHAR(2),
    cust_lastlogindate TIMESTAMP,
    cust_password VARCHAR(1000)
);



CREATE TABLE slam_ProductCategories (
    prct_id SERIAL PRIMARY KEY,
    prct_title VARCHAR,
    prct_desc TEXT
);

DROP TABLE SLAM_HSN_CODE;
CREATE Table slam_HSN_Code(
HSN_CODE INT PRIMARY KEY,
GST NUMERIC(5,2)
);
DROP TABLE SLAM_PRODUCTS;
CREATE TABLE slam_Products (
    Prod_id SERIAL PRIMARY KEY,
    prod_title VARCHAR(50),
    prod_prct_id INT references slam_ProductCategories(prct_id),
    prod_gstc_id  int REFERENCES slam_HSN_Code (HSN_CODE),
    prod_brand VARCHAR(50),
	image_url varchar(200),
	prod_desc TEXT,
	reorderLevel int
);

drop table slam_Productstock;
CREATE TABLE slam_ProductStock (
    prod_id INT REFERENCES slam_Products (Prod_id),
    prod_batchno int,
    prod_price NUMERIC(5, 2),
    prod_stock INT
);

CREATE TABLE slam_AdminUsers (
    ausr_id SERIAL PRIMARY KEY,
    ausr_title VARCHAR,
    ausr_desg VARCHAR,
    ausr_email VARCHAR,
    ausr_pwd VARCHAR(500)
);

CREATE TABLE slam_Orders (
    Ordr_id SERIAL PRIMARY KEY,
    ordr_cust_id INT REFERENCES slam_Customers (Cust_id),
    ordr_billno SERIAL,
    ordr_odate TIMESTAMP,
    ordr_total NUMERIC(5, 2),
    ordr_gst NUMERIC(5, 2),
    ordr_payreference INT,
    ordr_paymode CHAR(4),
    ordr_paystatus CHAR(2),
    ordr_saddress VARCHAR(200),
    ordr_sPincode INT,
    ordr_shipment_status CHAR(2),
    ordr_shipment_date TIMESTAMP,
    ordr_processedby INT REFERENCES slam_AdminUsers (ausr_id)
);

OrderProducts gst using joins we can retrieve

CREATE TABLE slam_OrderProducts (
    Ordr_id INT REFERENCES slam_Orders (Ordr_id),
    prod_id INT REFERENCES slam_Products (Prod_id),
    orpr_batchno int,
    orpr_qty INT,
    orpr_price NUMERIC(5, 2),
    orpr_gst  numeric(5,2)
);


drop table slam_wishlist;
create table slam_wishList (
c_id integer references slam_customers(Cust_id),
    p_id integer references slam_products(Prod_id)
)

create table slam_cart(
 p_id integer references slam_products(Prod_id)
)
