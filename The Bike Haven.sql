SELECT * FROM customer;

SELECT * FROM date;

SELECT * FROM geography;

SELECT * FROM internetsales;

SELECT * FROM product;

SELECT * FROM productcategory;

SELECT * FROM productsubcategory;

-- Cleaning the customer table

SELECT * FROM customer;


ALTER TABLE customer
DROP  customeralternatekey,
DROP title,
DROP middlename,
DROP namestyle,
DROP maritalstatus,
DROP suffix,
DROP emailaddress,
DROP yearlyincome,
DROP totalchildren,
DROP numberchildrenathome,
DROP englisheducation,
DROP spanisheducation,
DROP frencheducation,
DROP spanishoccupation,
DROP frenchoccupation,
DROP houseownerflag,
DROP numbercarsowned,
DROP addressline1,
DROP addressline2,
DROP phone,
DROP datefirstpurchase;

ALTER TABLE customer
RENAME englishoccupation TO occupation;

SELECT * FROM customer;

-- Cleaning Date Table

SELECT * FROM date;

ALTER TABLE date
DROP daynumberofweek,
DROP englishdaynameofweek,
DROP spanishdaynameofweek,
DROP frenchdaynameofweek,
DROP daynumberofyear,
DROP weeknumberofyear,
DROP spanishmonthname,
DROP frenchmonthname,
DROP monthnumberofyear,
DROP calendarsemester,
DROP fiscalquarter,
DROP fiscalyear,
DROP fiscalsemester;

ALTER TABLE date
DROP daynumberofmonth;

ALTER TABLE date
RENAME datekey TO date;

ALTER TABLE date
RENAME englishmonthname TO month;

ALTER TABLE date
RENAME calendarquarter TO quarter;

ALTER TABLE date
RENAME calendaryear TO year;

-- Cleaning Geography Table

SELECT * FROM geography;

ALTER TABLE geography
DROP stateprovincecode,
DROP countryregioncode,
DROP spanishcountryregionname,
DROP frenchcountryregionname,
DROP salesterritorykey,
DROP ipaddresslocator;

ALTER TABLE geography
RENAME stateprovincename TO state;

ALTER TABLE geography
RENAME englishcountryregionname TO country;

-- Cleaning Internetsales Table

SELECT * FROM internetsales;

ALTER TABLE internetsales
DROP duedatekey,
DROP promotionkey,
DROP currencykey,
DROP totalproductcost,
DROP orderdate,
DROP duedate,
DROP shipdate;

-- Cleaning Product Table

SELECT * FROM product;

ALTER TABLE product
DROP color,
DROP safetystocklevel,
DROP reorderpoint,
DROP size,
DROP daystomanufacture,
DROP productline,
DROP modelname,
DROP englishdescription,
DROP startdate,
DROP enddate,
DROP status;

ALTER TABLE product
RENAME englishproductname TO product;

--- Cleaning Product Category

SELECT * FROM productcategory;

ALTER TABLE productcategory
RENAME englishproductcategoryname TO category;

-- Cleaning Product Sub Category Table

SELECT * From productsubcategory;

ALTER TABLE productsubcategory
RENAME englishproductsubcategoryname TO subcategory;

-- Creating Table For Customers

CREATE TABLE customers AS
( SELECT customerkey,geographykey,firstname || ' ' || lastname AS name,
 birthdate,gender,occupation,commutedistance FROM customer);

-- Creating Customer With Geography Data

CREATE TABLE customer_geography_data AS
(SELECT a.*,b.city,b.state,b.country,b.postalcode
FROM customers AS a 
FULL JOIN geography AS b
ON a.geographykey = b.geographykey);

--- Creating Product Table

CREATE TABLE products AS (SELECT a.*,b.productsubcategoryalternatekey,
b.subcategory,b.productcategorykey,c.productcategoryalternatekey,c.category
FROM product AS a
FULL JOIN productsubcategory AS b
ON a.productsubcategorykey = b.productsubcategorykey
FULL JOIN productcategory AS c
ON c.productcategorykey = b.productcategorykey);

SELECT * FROM customer_geography_data;

SELECT * FROM internetsales;

SELECT * FROM date;

SELECT * FROM products;


