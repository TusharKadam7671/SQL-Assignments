Problems and solutions to the queries-

--> 1. Select the names of all the products in the store.
select name from Products;

--> 2. Select the names and the prices of all the products in the store.
select name,price from Products;

--> 3. Select the name of the products with a price less than or equal to $200.
select name from Products where price <= 200;

--> 4. Select all the products with a price between $60 and $120.
select * from Products where price >= 60 and price <= 120;
  or
select * from Products where price BETWEEN 60 and 120;

--> 5. Select the name and price in cents (i.e., the price must be multiplied by 100).
select name, price*100 from Products;

--> 6. Compute the average price of all the products.
select avg(price) from Products;

--> 7. Compute the average price of all products with manufacturer code equal to 2.
select avg(price) from Products where manufacturer = 2;

--> 8. Compute the number of products with a price larger than or equal to $180.
select count(code) from Products where price >= 180;
  or
select count(*) from Products where price >= 180;

--> 9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in 	descending order), and then by name (in ascending order).
select name,price from Products where price >= 180 order by price DESC, name ASC;

--> 10. Select all the data from the products, including all the data for each product's manufacturer.
select p.* , m.* from Products p inner join Manufacturers m on p.manufacturer = m.Code;

--> 11. Select the product name, price, and manufacturer name of all the products.
select p.name, p.price, m.name from Products p inner join Manufacturers m on p.manufacturer = m.Code;

--> 12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
select avg(price),manufacturer from Products GROUP by manufacturer;

--> 13. Select the average price of each manufacturer's products, showing the manufacturer's name.
select avg(p.price), m.name from Products p INNER join Manufacturers m on p.manufacturer = m.code GROUP by m.name;

--> 14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
select avg(p.price), m.name from Manufacturers m INNER JOIN Products p ON m.code = p.manufacturer GROUP by m.name having avg(p.price) >= 150 ; 

--> 15. Select the name and price of the cheapest product.
SELECT name, price from Products order by price LIMIT 1;
or
select name, price from Products where price = ( select min(price) from products);

--> 16. Select the name of each manufacturer along with the name and price of its most expensive product.
Not solved.


----------------------------------------------------------------------------

Schema-


CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
);

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
