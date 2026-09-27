-- create database swiggy_instamartDB;

-- show databases;

-- use swiggy_instamartDB;

-- select * from swiggy_instamart_messy_5000_rows;

-- select count(*) as total_rows from swiggy_instamart_messy_5000_rows;

-- rename table swiggy_instamart_messy_5000_rows TO swiggy_instamart;

-- select count(*) as total_rows from  swiggy_instamart;

-- describe  swiggy_instamart;

-- select * from swiggy_instamart limit 20;

-- select * from swiggy_instamart where Customer_Name is null;

-- select sum(Order_ID is null) as order_id_missing,
-- 	sum(Customer_ID is null) as Customer_ID_missing ,
--     sum(Order_Date is null) as Order_Date_missing,
--     sum(Customer_Name is null) as Customer_Name_missing,
--     sum(City is  null) as City_misssing,
--     sum(State is null ) as State_missing,
--     sum(Product_ID is null ) as Product_ID_missing,
--     sum(Product_Name is null ) as Product_Name_mising,
--     SUM(Category IS NULL) AS Category_missing,
--     SUM(Quantity IS NULL) AS Quantity_missing,
--     SUM(Unit_Price IS NULL) AS Unit_Price_missing,
--     SUM(Discount IS NULL) AS Discount_missing,
--     SUM(Order_Value IS NULL) AS Order_Value_missing,
--     SUM(Payment_Mode IS NULL) AS Payment_Mode_missing,
--     SUM(Order_Status IS NULL) AS Order_Status_missing,
--     SUM(Delivery_Time_Min IS NULL) AS Delivery_Time_missing,
--     SUM(Customer_Rating IS NULL) AS Rating_missing,
--     SUM(Delivery_Partner IS NULL) AS Partner_missing,
--     SUM(Customer_Phone IS NULL) AS Phone_missing
-- FROM swiggy_instamart;-- 


-- select sum(Customer_Name is null) as null_count,
-- sum(trim(Customer_Name)='')as blank_count
-- from swiggy_instamart;

-- SELECT
--     SUM(Order_ID IS NULL OR TRIM(Order_ID) = '') AS Order_ID_missing,
--     SUM(Customer_ID IS NULL OR TRIM(Customer_ID) = '') AS Customer_ID_missing,
--     SUM(Customer_Name IS NULL OR TRIM(Customer_Name) = '') AS Customer_Name_missing,
--     SUM(City IS NULL OR TRIM(City) = '') AS City_missing,
--     SUM(State IS NULL OR TRIM(State) = '') AS State_missing,
--     SUM(Product_ID IS NULL OR TRIM(Product_ID) = '') AS Product_ID_missing,
--     SUM(Product_Name IS NULL OR TRIM(Product_Name) = '') AS Product_Name_missing,
--     SUM(Category IS NULL OR TRIM(Category) = '') AS Category_missing,
--     SUM(Quantity IS NULL OR TRIM(Quantity) = '') AS Quantity_missing,
--     SUM(Unit_Price IS NULL OR TRIM(Unit_Price) = '') AS Unit_Price_missing,
--     SUM(Discount IS NULL OR TRIM(Discount) = '') AS Discount_missing,
--     SUM(Order_Value IS NULL OR TRIM(Order_Value) = '') AS Order_Value_missing,
--     SUM(Payment_Mode IS NULL OR TRIM(Payment_Mode) = '') AS Payment_Mode_missing,
--     SUM(Order_Status IS NULL OR TRIM(Order_Status) = '') AS Order_Status_missing,
--     SUM(Delivery_Time_Min IS NULL OR TRIM(Delivery_Time_Min) = '') AS Delivery_Time_missing,
--     SUM(Customer_Rating IS NULL OR TRIM(Customer_Rating) = '') AS Rating_missing,
--     SUM(Delivery_Partner IS NULL OR TRIM(Delivery_Partner) = '') AS Partner_missing,
--     SUM(Customer_Phone IS NULL OR TRIM(Customer_Phone) = '') AS Phone_missing
-- FROM swiggy_instamart;

-- # Duplicate Order_ID check

-- select order_id,count(order_id) as duplicate_count from swiggy_instamart
-- group by order_id
-- having count(*) >1;

-- SELECT COUNT(*) ,COUNT(distinct Order_ID) AS duplicate_rows
-- FROM swiggy_instamart;

-- ***********************************************************************
-- SELECT *
-- FROM swiggy_instamart
-- WHERE Order_ID IN (
--     SELECT Order_ID
--     FROM swiggy_instamart
--     GROUP BY Order_ID
--     HAVING COUNT(*) > 1
-- );


-- use swiggy_instamartDB;


-- select * from swiggy_instamart;

-- SELECT 
--     COUNT(*) - COUNT(DISTINCT Order_ID) AS duplicate_rows
-- FROM swiggy_instamart;


-- SELECT Order_ID, COUNT(Order_ID) AS cnt
-- FROM swiggy_instamart
-- GROUP BY Order_ID
-- HAVING COUNT(Order_ID) > 1;

-- select* from(
-- select *,
-- 	row_number() 
-- 	over(partition by Order_ID
-- 		order by Order_ID)  as a 
--         from swiggy_instamart) as s
--         where a>1;
--         
-- create table swiggy_instamart_backup as 
-- select * from swiggy_instamart;

-- select * from swiggy_instamart_backup;


-- create table if not exists swiggy_instamart_clean as 
-- select Order_ID ,
-- Customer_ID,
-- Order_Date ,
-- Customer_Name, 
-- City ,
-- State ,
-- Product_ID, 
-- Product_Name,  
-- Category ,
-- Quantity ,
-- Unit_Price, 
-- Discount  ,
-- Order_Value,  
-- Payment_Mode,  
-- Order_Status , 
-- Delivery_Time_Min,
-- Customer_Rating ,
-- Delivery_Partner,
-- Customer_Phone
-- from(select *,row_number()over(partition by Order_ID order by Order_ID) as a
-- from swiggy_instamart) as s
-- where a=1;

-- select count(*) as total_rows
-- from swiggy_instamart_clean;

-- select count(*) as total_rows
-- from swiggy_instamart;

SELECT COUNT(*) AS raw_rows
FROM swiggy_instamart;

SELECT COUNT(DISTINCT Order_ID) AS unique_orders
FROM swiggy_instamart;

