Problem 1 : Group data at the Sector level. Then find the average EPS for each sector and 
assign the alias AvgEPSPerSector. Display sectors with AvgEPSPerSector above 10 
and sort the result by the AvgEPSPerSector column in descending order.
-->
select sector,avg(eps) as AvgEPSPerSector 
from Stock 
group by sector 
having AvgEPSPerSector > 10 
order by AvgEPSPerSector desc;




Schema-

DROP TABLE IF EXISTS Stock;

CREATE TABLE Stock (
	Id         INTEGER PRIMARY KEY,
	Ticker     TEXT    NOT NULL,
	FullName   TEXT    NOT NULL,
	TradingDay TEXT    NOT NULL,
	Price      REAL    NOT NULL CHECK (Price > 0),
	Sector     TEXT    NOT NULL,
	EPS        REAL
);

INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (1, 'AAPL', 'APPLE INC.', '2021-02-03', 134.99, 'Electronic Technology', 3.74);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (2, 'MSFT', 'MICROSOFT CORP.', '2021-02-03', 240.7, 'Technology Services', 6.78);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (3, 'AMZN', 'AMAZON COM INC', '2021-02-03', 3380.29, 'Retail Trade', 42.60);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (4, 'GOOGL', 'ALPHABET INC (GOOGLE) CLASS A', '2021-02-03', 2040.09, 'Technology Services', 59.26);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (5, 'FB', 'FACEBOOK INC', '2021-02-03', 264.88, 'Technology Services', 10.23);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (6, 'TSLA', 'TESLA INC', '2021-02-03', 864.75, 'Consumer Durables', 0.57);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (7, 'BABA', 'ALIBABA GROUP HOLDINGS LTD.', '2021-02-03', 264.70, 'Retail Trade', 8.63);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (8, 'V', 'VISA INC', '2021-02-03', 202.83, 'Finance', 4.85);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (9, 'PYPL', 'PAYPAL HOLDINGS INC', '2021-02-03', 251.93, 'Technology Services', 2.68);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (10, 'ORCL', 'ORACLE CORP', '2021-02-03', 62.26, 'Technology Services', 3.37);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (11, 'JNJ', 'JOHNSON & JOHNSON', '2021-02-03', 160.5, 'Health Technology', NULL);
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS) 
VALUES (12, 'CMCSA', 'COMCAST CORP', '2021-02-03', 50.47, 'Consumer Services', NULL);


------------------------------------------------------------------------------------------------


Problem 2 : The following query is given:

SELECT
  job_id,
  AVG(salary) AS avg_salary
FROM
  employee
GROUP BY
  job_id
ORDER BY
  avg_salary DESC;

Modify this query to display those job_id values for which the average salary 
is greater than 10,000.
-->

SELECT
  job_id,
  AVG(salary) AS avg_salary
FROM
  employee
GROUP BY
  job_id 
having avg_salary > 10000
ORDER BY
  avg_salary DESC;





Problem 3 : The following query is given:

SELECT
  job_id,
  AVG(salary) AS avg_salary
FROM
  employee
GROUP BY
  job_id
ORDER BY
  avg_salary DESC;

Modify this query to display those job_id values for which the average salary 
is in the range [10,000, 20,000].
-->

SELECT
  job_id,
  AVG(salary) AS avg_salary
FROM
  employee
GROUP BY
  job_id
having avg_salary BETWEEN 10000 and 20000
ORDER BY
  avg_salary DESC;



Schema-

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS job;

CREATE TABLE country (
	country_id   TEXT    NOT NULL,
	country_name TEXT    NOT NULL,
	PRIMARY KEY (country_id)
);

CREATE TABLE location (
	location_id    INTEGER NOT NULL,
	street_address TEXT,
	postal_code    TEXT,
	city           TEXT    NOT NULL,
	state_province TEXT,
	country_id     INTEGER NOT NULL,
	PRIMARY KEY (location_id),
	FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE department (
	department_id   INTEGER NOT NULL,
	department_name TEXT    NOT NULL,
	location_id     INTEGER NOT NULL,
	PRIMARY KEY (department_id),
	FOREIGN KEY (location_id) REFERENCES location (location_id)
);

CREATE TABLE job (
	job_id     INTEGER NOT NULL,
	job_title  TEXT    NOT NULL,
	min_salary REAL    NOT NULL,
	max_salary REAL    NOT NULL,
	PRIMARY KEY (job_id)
);

CREATE TABLE employee (
	employee_id   INTEGER NOT NULL,
	first_name    TEXT,
	last_name     TEXT    NOT NULL,
	email         TEXT    NOT NULL,
	phone_number  TEXT,
	hire_date     TEXT    NOT NULL,
	job_id        INTEGER NOT NULL,
	salary        REAL    NOT NULL,
	department_id INTEGER NOT NULL,
	PRIMARY KEY (employee_id),
	FOREIGN KEY (job_id) REFERENCES job (job_id),
	FOREIGN KEY (department_id) REFERENCES department (department_id)
);

-- country
INSERT INTO country(country_id, country_name) VALUES ('AR', 'Argentina');
INSERT INTO country(country_id, country_name) VALUES ('AU', 'Australia');
INSERT INTO country(country_id, country_name) VALUES ('BE', 'Belgium');
INSERT INTO country(country_id, country_name) VALUES ('BR', 'Brazil');
INSERT INTO country(country_id, country_name) VALUES ('CA', 'Canada');
INSERT INTO country(country_id, country_name) VALUES ('CH', 'Switzerland');
INSERT INTO country(country_id, country_name) VALUES ('CN', 'China');
INSERT INTO country(country_id, country_name) VALUES ('DE', 'Germany');
INSERT INTO country(country_id, country_name) VALUES ('DK', 'Denmark');
INSERT INTO country(country_id, country_name) VALUES ('EG', 'Egypt');
INSERT INTO country(country_id, country_name) VALUES ('FR', 'France');
INSERT INTO country(country_id, country_name) VALUES ('HK', 'HongKong');
INSERT INTO country(country_id, country_name) VALUES ('IL', 'Israel');
INSERT INTO country(country_id, country_name) VALUES ('IN', 'India');
INSERT INTO country(country_id, country_name) VALUES ('IT', 'Italy');
INSERT INTO country(country_id, country_name) VALUES ('JP', 'Japan');
INSERT INTO country(country_id, country_name) VALUES ('KW', 'Kuwait');
INSERT INTO country(country_id, country_name) VALUES ('MX', 'Mexico');
INSERT INTO country(country_id, country_name) VALUES ('NG', 'Nigeria');
INSERT INTO country(country_id, country_name) VALUES ('NL', 'Netherlands');
INSERT INTO country(country_id, country_name) VALUES ('SG', 'Singapore');
INSERT INTO country(country_id, country_name) VALUES ('UK', 'United Kingdom');
INSERT INTO country(country_id, country_name) VALUES ('US', 'United States of America');
INSERT INTO country(country_id, country_name) VALUES ('ZM', 'Zambia');
INSERT INTO country(country_id, country_name) VALUES ('ZW', 'Zimbabwe');

-- location
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (2400, '8204 Arthur St', NULL, 'London', NULL, 'UK');
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (2500, 'Magdalen Centre,  The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
INSERT INTO location(location_id, street_address, postal_code, city, state_province, country_id) VALUES (2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');

-- job
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (1, 'Public Accountant', 4200.00, 9000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (2, 'Accounting Manager', 8200.00, 16000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (3, 'Administration Assistant', 3000.00, 6000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (4, 'President', 20000.00, 40000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (5, 'Administration Vice President', 15000.00, 30000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (6, 'Accountant', 4200.00, 9000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (7, 'Finance Manager', 8200.00, 16000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (8, 'Human Resources Representative', 4000.00, 9000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (9, 'Programmer', 4000.00, 10000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (10, 'Marketing Manager', 9000.00, 15000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (11, 'Marketing Representative', 4000.00, 9000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (12, 'Public Relations Representative', 4500.00, 10500.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (13, 'Purchasing Clerk', 2500.00, 5500.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (14, 'Purchasing Manager', 8000.00, 15000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (15, 'Sales Manager', 10000.00, 20000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (16, 'Sales Representative', 6000.00, 12000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (17, 'Shipping Clerk', 2500.00, 5500.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (18, 'Stock Clerk', 2000.00, 5000.00);
INSERT INTO job(job_id, job_title, min_salary, max_salary) VALUES (19, 'Stock Manager', 5500.00, 8500.00);

-- department
INSERT INTO department(department_id, department_name, location_id) VALUES (1, 'Administration', 1700);
INSERT INTO department(department_id, department_name, location_id) VALUES (2, 'Marketing', 1800);
INSERT INTO department(department_id, department_name, location_id) VALUES (3, 'Purchasing', 1700);
INSERT INTO department(department_id, department_name, location_id) VALUES (4, 'Human Resources', 2400);
INSERT INTO department(department_id, department_name, location_id) VALUES (5, 'Shipping', 1500);
INSERT INTO department(department_id, department_name, location_id) VALUES (6, 'IT', 1400);
INSERT INTO department(department_id, department_name, location_id) VALUES (7, 'Public Relations', 2700);
INSERT INTO department(department_id, department_name, location_id) VALUES (8, 'Sales', 2500);
INSERT INTO department(department_id, department_name, location_id) VALUES (9, 'Executive', 1700);
INSERT INTO department(department_id, department_name, location_id) VALUES (10, 'Finance', 1700);
INSERT INTO department(department_id, department_name, location_id) VALUES (11, 'Accounting', 1700);

-- employee
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (100, 'Steven', 'King', 'steven.king@esmartdata.org', '515.123.4567', '1987-06-17', 4, 24000.00, 9);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (101, 'Neena', 'Kochhar', 'neena.kochhar@esmartdata.org', '515.123.4568', '1989-09-21', 5, 17000.00, 9);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (102, 'Lex', 'De Haan', 'lex.de haan@esmartdata.org', '515.123.4569', '1993-01-13', 5, 17000.00, 9);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (103, 'Alexander', 'Hunold', 'alexander.hunold@esmartdata.org', '590.423.4567', '1990-01-03', 9, 9000.00, 6);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (104, 'Bruce', 'Ernst', 'bruce.ernst@esmartdata.org', '590.423.4568', '1991-05-21', 9, 6000.00, 6);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (105, 'David', 'Austin', 'david.austin@esmartdata.org', '590.423.4569', '1997-06-25', 9, 4800.00, 6);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (106, 'Valli', 'Pataballa', 'valli.pataballa@esmartdata.org', '590.423.4560', '1998-02-05', 9, 4800.00, 6);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (107, 'Diana', 'Lorentz', 'diana.lorentz@esmartdata.org', '590.423.5567', '1999-02-07', 9, 4200.00, 6);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (108, 'Nancy', 'Greenberg', 'nancy.greenberg@esmartdata.org', '515.124.4569', '1994-08-17', 7, 12000.00, 10);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (109, 'Daniel', 'Faviet', 'daniel.faviet@esmartdata.org', '515.124.4169', '1994-08-16', 6, 9000.00, 10);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (110, 'John', 'Chen', 'john.chen@esmartdata.org', '515.124.4269', '1997-09-28', 6, 8200.00, 10);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (111, 'Ismael', 'Sciarra', 'ismael.sciarra@esmartdata.org', '515.124.4369', '1997-09-30', 6, 7700.00, 10);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (112, 'Jose Manuel', 'Urman', 'jose manuel.urman@esmartdata.org', '515.124.4469', '1998-03-07', 6, 7800.00, 10);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (113, 'Luis', 'Popp', 'luis.popp@esmartdata.org', '515.124.4567', '1999-12-07', 6, 6900.00, 10);
INSERT INTO employee(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES (114, 'Den', 'Raphaely', 'den.raphaely@esmartdata.org', '515.127.4561', '1994-12-07', 14, 11000.00, 3);

--------------------------------------------------------------------------------------------------------------------------------------------

Problem 4 : Group the data in the sale table at product_id level. Calculate the number of 
orders for each product and assign it to a column named number_of_orders. Then,
 using the HAVING clause, extract products with a number of orders greater than
 one. Sort the result in descending order by number_of_orders.

-->

select product_id,count(product_id) as number_of_orders 
from sale 
group by product_id 
having number_of_orders > 1  
order by number_of_orders desc;


Schema -

DROP TABLE IF EXISTS sale;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS brand;

CREATE TABLE category (
	category_id   INTEGER NOT NULL,
	category_name TEXT    NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE brand (
	brand_id   INTEGER NOT NULL,
	brand_name TEXT    NOT NULL,
	PRIMARY KEY (brand_id)
);

CREATE TABLE product (
	product_id   INTEGER NOT NULL,
	product_name TEXT    NOT NULL,
	brand_id     INTEGER NOT NULL,
	category_id  INTEGER,
	model_year   INTEGER NOT NULL,
	list_price   REAL    NOT NULL,
	PRIMARY KEY (product_id),
	FOREIGN KEY (category_id) REFERENCES category (category_id),
	FOREIGN KEY (brand_id) REFERENCES brand (brand_id)
);

CREATE TABLE sale (
	order_id   INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	quantity   INTEGER NOT NULL,
	PRIMARY KEY (order_id),
	FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- category
INSERT INTO category (category_id, category_name) VALUES (1, 'Children Bicycles');
INSERT INTO category (category_id, category_name) VALUES (2, 'Comfort Bicycles');
INSERT INTO category (category_id, category_name) VALUES (3, 'Cruisers Bicycles');
INSERT INTO category (category_id, category_name) VALUES (4, 'Cyclocross Bicycles');
INSERT INTO category (category_id, category_name) VALUES (5, 'Electric Bikes');
INSERT INTO category (category_id, category_name) VALUES (6, 'Mountain Bikes');
INSERT INTO category (category_id, category_name) VALUES (7, 'Road Bikes');

-- brand 
INSERT INTO brand (brand_id, brand_name) VALUES (1, 'Electra');
INSERT INTO brand (brand_id, brand_name) VALUES (2, 'Haro');
INSERT INTO brand (brand_id, brand_name) VALUES (3, 'Heller');
INSERT INTO brand (brand_id, brand_name) VALUES (4, 'Pure Cycles');
INSERT INTO brand (brand_id, brand_name) VALUES (5, 'Ritchey');
INSERT INTO brand (brand_id, brand_name) VALUES (6, 'Strider');
INSERT INTO brand (brand_id, brand_name) VALUES (7, 'Sun Bicycles');
INSERT INTO brand (brand_id, brand_name) VALUES (8, 'Surly');
INSERT INTO brand (brand_id, brand_name) VALUES (9, 'Trek');

-- product
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (1, 'Trek 820 - 2021', 9, 6, 2021, 379.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (2, 'Ritchey Timberwolf Frameset - 2021', 5, 6, 2021, 749.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (3, 'Surly Wednesday Frameset - 2021', 8, 6, 2021, 999.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (4, 'Trek Fuel EX 8 29 - 2021', 9, 6, 2021, 2899.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (5, 'Heller Shagamaw Frame - 2021', 3, 6, 2021, 1320.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (6, 'Surly Ice Cream Truck Frameset - 2021', 8, 6, 2021, 469.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (7, 'Trek Slash 8 27.5 - 2021', 9, 6, 2021, 3999.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (8, 'Trek Remedy 29 Carbon Frameset - 2021', 9, 6, 2021, 1799.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (9, 'Trek Conduit+ - 2021', 9, 5, 2021, 2999.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (10, 'Surly Straggler - 2021', 8, 4, 2021, 1549);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (11, 'Surly Straggler 650b - 2021', 8, 4, 2021, 1680.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (12, 'Electra Townie Original 21D - 2021', 1, 3, 2021, 549.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (13, 'Electra Cruiser 1 (24-Inch) - 2021', 1, 3, 2021, 269.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (14, 'Electra Girl''s Hawaii 1 (16-inch) - 2020/2021', 1, 3, 2021, 269.99);
INSERT INTO product (product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (15, 'Electra Moto 1 - 2021', 1, 3, 2021, 529.99);

-- sale
INSERT INTO sale (order_id, product_id, quantity) VALUES (1, 3, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (2, 12, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (3, 1, 2);
INSERT INTO sale (order_id, product_id, quantity) VALUES (4, 4, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (5, 8, 3);
INSERT INTO sale (order_id, product_id, quantity) VALUES (6, 9, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (7, 5, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (8, 6, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (9, 10, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (10, 1, 2);
INSERT INTO sale (order_id, product_id, quantity) VALUES (11, 2, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (12, 7, 3);
INSERT INTO sale (order_id, product_id, quantity) VALUES (13, 8, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (14, 5, 2);
INSERT INTO sale (order_id, product_id, quantity) VALUES (15, 11, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (16, 4, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (17, 2, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (18, 8, 1);
INSERT INTO sale (order_id, product_id, quantity) VALUES (19, 10, 2);
INSERT INTO sale (order_id, product_id, quantity) VALUES (20, 11, 1);
