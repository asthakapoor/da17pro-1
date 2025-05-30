--Table 1

create table laptops(
id bigint,
brand varchar,
model varchar,
processor varchar,
ram bigint
)

insert into laptops (id,brand,model, processor,ram) values
(1, 'Apple', 'MacBook Air', 'Apple M1', 8),
(2, 'Apple', 'MacBook Pro', 'Apple M1', 8),
(3, 'Dell', 'XPS 13', 'Intel Core i7', 16),
(4, 'Dell', 'Inspiron 15', 'Intel Core i5', 8),
(5, 'HP', 'Spectre x360', 'Intel Core i7', 16),
(6, 'HP', 'Pavilion 15', 'AMD Ryzen 5', 8),
(7, 'Lenovo', 'ThinkPad X1 Carbon', 'Intel Core i7', 16),
(8, 'Lenovo', 'IdeaPad 3', 'AMD Ryzen 5', 8),
(9, 'Asus', 'ZenBook 14', 'Intel Core i7', 16),
(10, 'Asus', 'VivoBook 15', 'Intel Core i5', 8),
(11, 'Acer', 'Swift 3', 'Intel Core i7', 16),
(12, 'Acer', 'Aspire 5', 'AMD Ryzen 5', 8),
(13, 'Microsoft', 'Surface Laptop 4', 'Intel Core i5', 8),
(14, 'Microsoft', 'Surface Book 3', 'Intel Core i7', 16),
(15, 'Razer', 'Blade Stealth 13', 'Intel Core i7', 16),
(16, 'Razer', 'Blade 15', 'Intel Core i7', 32),
(17, 'Samsung', 'Galaxy Book Pro', 'Intel Core i5', 8),
(18, 'Samsung', 'Galaxy Book Flex', 'Intel Core i7', 16),
(19, 'Toshiba', 'Dynabook Tecra', 'Intel Core i5', 16),
(20, 'LG', 'Gram 14', 'Intel Core i7', 16),
(21, 'Huawei', 'MateBook X Pro', 'Intel Core i7', 16),
(22, 'Huawei', 'MateBook D 15', 'AMD Ryzen 5', 8),
(23, 'MSI', 'Stealth 15', 'Intel Core i7', 32),
(24, 'MSI', 'GF65 Thin', 'Intel Core i5', 16),
(25, 'Gigabyte', 'Aero 15', 'Intel Core i7', 16),
(26, 'Gigabyte', 'G5', 'Intel Core i5', 8),
(27, 'Alienware', 'X17', 'Intel Core i7', 32),
(28, 'Alienware', 'M15', 'Intel Core i7', 16),
(29, 'Vaio', 'SX14', 'Intel Core i7', 16),
(30, 'Vaio', 'Z', 'Intel Core i5', 8),
(31, 'Chuwi', 'HeroBook Pro', 'Intel Celeron', 8),
(32, 'Xiaomi', 'Mi Notebook Pro', 'Intel Core i5', 16),
(33, 'Omen', '15', 'Intel Core i7', 16),
(34, 'Omen', '17', 'Intel Core i7', 32),
(35, 'Lenovo', 'Legion 5', 'AMD Ryzen 7', 16),
(36, 'Dell', 'G5 15', 'Intel Core i5', 8),
(37, 'HP', 'Omen 15', 'Intel Core i7', 16),
(38, 'Asus', 'ROG Zephyrus', 'AMD Ryzen 9', 32),
(39, 'Acer', 'Predator Helios', 'Intel Core i7', 16),
(40, 'Apple', 'MacBook Pro 16', 'Apple M1 Pro', 16)

select * from laptops

--update
UPDATE laptops
SET brand = 'Dell', model = 'XPS 15', processor = 'Intel Core i9',ram = 32
WHERE  id = 1; 


--alter
ALTER TABLE laptops
ADD COLUMN storage_gb INT;


--drop
DROP TABLE laptops;

ALTER TABLE laptops
ADD CONSTRAINT UQ_laptops_model UNIQUE (model);

ALTER TABLE laptops
ADD CONSTRAINT CK_laptops_ram_positive CHECK (ram > 0);

ALTER TABLE laptops
DROP CONSTRAINT UQ_laptops_model;


--View
CREATE VIEW intel_laptops AS
SELECT id, brand, model,ram
FROM laptops
WHERE processor LIKE 'Intel%';

SELECT * FROM intel_laptops;


---Table 2

create table vehicles (
id bigint,
make varchar,
model varchar,
year bigint,
type varchar
)

insert into vehicles (id,make,model,year,type) values
(1, 'Toyota', 'Camry', 2021, 'Sedan'),
(2, 'Honda', 'Civic', 2020, 'Sedan'),
(3, 'Ford', 'F-150', 2022, 'Truck'),
(4, 'Chevrolet', 'Silverado', 2021, 'Truck'),
(5, 'Nissan', 'Altima', 2020, 'Sedan'),
(6, 'Hyundai', 'Elantra', 2021, 'Sedan'),
(7, 'Kia', 'Optima', 2020, 'Sedan'),
(8, 'Volkswagen', 'Jetta', 2021, 'Sedan'),
(9, 'Subaru', 'Outback', 2022, 'SUV'),
(10, 'Jeep', 'Wrangler', 2021, 'SUV'),
(11, 'Mazda', 'CX-5', 2020, 'SUV'),
(12, 'BMW', '3 Series', 2021, 'Sedan'),
(13, 'Mercedes-Benz', 'C-Class', 2020, 'Sedan'),
(14, 'Audi', 'A4', 2021, 'Sedan'),
(15, 'Lexus', 'ES', 2021, 'Sedan'),
(16, 'Tesla', 'Model 3', 2022, 'Sedan'),
(17, 'Porsche', 'Macan', 2021, 'SUV'),
(18, 'Land Rover', 'Range Rover', 2020, 'SUV'),
(19, 'Volvo', 'XC60', 2021, 'SUV'),
(20, 'Chrysler', 'Pacifica', 2021, 'Minivan'),
(21, 'Dodge', 'Caravan', 2020, 'Minivan'),
(22, 'Honda', 'Odyssey', 2021, 'Minivan'),
(23, 'Toyota', 'Sienna', 2022, 'Minivan'),
(24, 'Ford', 'Explorer', 2021, 'SUV'),
(25, 'Chevrolet', 'Tahoe', 2021, 'SUV'),
(26, 'GMC', 'Yukon', 2021, 'SUV'),
(27, 'Nissan', 'Rogue', 2021, 'SUV'),
(28, 'Hyundai', 'Tucson', 2021, 'SUV'),
(29, 'Kia', 'Sportage', 2021, 'SUV'),
(30, 'Subaru', 'Forester', 2021, 'SUV'),
(31, 'Toyota', 'Highlander', 2021, 'SUV'),
(32, 'Honda', 'CR-V', 2021, 'SUV'),
(33, 'Mazda', 'CX-30', 2021, 'SUV'),
(34, 'Volkswagen', 'Tiguan', 2021, 'SUV'),
(35, 'Jeep', 'Cherokee', 2021, 'SUV'),
(36, 'Ford', 'Mustang', 2021, 'Coupe'),
(37, 'Chevrolet', 'Camaro', 2021, 'Coupe'),
(38, 'Dodge', 'Challenger', 2021, 'Coupe'),
(39, 'Nissan', '370Z', 2020, 'Coupe'),
(40, 'Toyota','Supra',2021,'Coupe')

select * from vehicles


--update
UPDATE vehicles
SET model = 'Civic', year = 2023
WHERE id = 101;

--alter
ALTER TABLE vehicles
ADD COLUMN color VARCHAR(50);


--drop
ALTER TABLE vehicles
DROP COLUMN type;

--CONSTRAINT
ALTER TABLE vehicles
ADD CONSTRAINT unique_vehicle_combo UNIQUE (make, model, year);

ALTER TABLE vehicles
ADD CONSTRAINT check_year CHECK (year >= 1900 AND year <= EXTRACT(YEAR FROM CURRENT_DATE) + 1);


--View
CREATE VIEW modern_vehicles AS
SELECT id, make, model, year, type
FROM vehicles
WHERE year > 2020;

SELECT * FROM modern_vehicles;


--Table 3

create table Apps(
id bigint,
name varchar,
category varchar,
platform varchar,
rating decimal
)

insert into Apps (id,name,category,platform,rating) values
(1, 'WhatsApp', 'Messaging', 'iOS, Android', 4.7),
(2, 'Facebook', 'Social Media', 'iOS, Android', 4.2),
(3, 'Instagram', 'Social Media', 'iOS, Android', 4.5),
(4, 'Twitter', 'Social Media', 'iOS, Android', 4.1),
(5, 'Snapchat', 'Messaging', 'iOS, Android', 4.3),
(6, 'TikTok', 'Entertainment', 'iOS, Android', 4.8),
(7, 'YouTube', 'Video', 'iOS, Android', 4.6),
(8, 'Spotify', 'Music', 'iOS, Android', 4.8),
(9, 'Netflix', 'Entertainment', 'iOS, Android', 4.7),
(10, 'Zoom', 'Communication', 'iOS, Android, Desktop', 4.6),
(11, 'Google Maps', 'Navigation', 'iOS, Android', 4.7),
(12, 'Uber', 'Transportation', 'iOS, Android', 4.6),
(13, 'Lyft', 'Transportation', 'iOS, Android', 4.5),
(14, 'Amazon', 'Shopping', 'iOS, Android', 4.4),
(15, 'eBay', 'Shopping', 'iOS, Android', 4.3),
(16, 'Pinterest', 'Social Media', 'iOS, Android', 4.5),
(17, 'LinkedIn', 'Professional', 'iOS, Android', 4.2),
(18, 'Slack', 'Productivity', 'iOS, Android, Desktop', 4.5),
(19, 'Microsoft Teams', 'Productivity', 'iOS, Android, Desktop', 4.4),
(20, 'Google Drive', 'Productivity', 'iOS, Android, Desktop', 4.6),
(21, 'Dropbox', 'Productivity', 'iOS, Android, Desktop', 4.5),
(22, 'Evernote', 'Productivity', 'iOS, Android, Desktop', 4.4),
(23, 'Trello', 'Productivity', 'iOS, Android, Desktop', 4.5),
(24, 'Asana', 'Productivity', 'iOS, Android, Desktop', 4.4),
(25, 'Adobe Photoshop Express', 'Photography', 'iOS, Android', 4.3),
(26, 'Canva', 'Design', 'iOS, Android, Desktop', 4.8),
(27, 'Microsoft Word', 'Productivity', 'iOS, Android, Desktop', 4.6),
(28, 'Microsoft Excel', 'Productivity', 'iOS, Android, Desktop', 4.5),
(29, 'Google Chrome', 'Browser', 'iOS, Android, Desktop', 4.7),
(30, 'Mozilla Firefox', 'Browser', 'iOS, Android, Desktop', 4.6),
(31, 'Safari', 'Browser', 'iOS, Desktop', 4.5),
(32, 'Viber', 'Messaging', 'iOS, Android', 4.4),
(33, 'Telegram', 'Messaging', 'iOS, Android', 4.5),
(34, 'Signal', 'Messaging', 'iOS, Android', 4.6),
(35, 'Duolingo', 'Education', 'iOS, Android', 4.8),
(36, 'Khan Academy', 'Education', 'iOS, Android', 4.7),
(37, 'Coursera', 'Education', 'iOS, Android', 4.6),
(38, 'Headspace', 'Health & Fitness', 'iOS, Android', 4.8),
(39, 'MyFitnessPal', 'Health & Fitness', 'iOS, Android', 4.5),
(40, 'Fitbit','Health & Fitness', 'iOS, Android',4.4)

select * from Apps


--update
UPDATE Apps
SET category = 'Productivity'
WHERE platform = 'iOS';


--alter
ALTER TABLE Apps
ALTER COLUMN name TYPE VARCHAR(500);


--drop
DROP TABLE Apps;


--CONSTRAINT--

ALTER TABLE Apps
ADD CONSTRAINT uq_app_name_platform UNIQUE (name, platform);

ALTER TABLE Apps
ADD CONSTRAINT chk_rating CHECK (rating >= 0 AND rating <= 5);


--View
CREATE VIEW HighRatedApps AS
SELECT id, name, category, platform, rating
FROM Apps
WHERE rating > 4.0;

select * from HighRatedApps

--Table 4

create table singers(
id bigint,
name varchar,
genre varchar,
country varchar,
year bigint
)

insert into singers (id,name,genre,country,year) values
(1, 'Adele', 'Pop', 'UK', 2008),
(2, 'Ed Sheeran', 'Pop', 'UK', 2011),
(3, 'Beyoncé', 'R&B', 'USA', 1997),
(4, 'Drake', 'Hip-Hop', 'Canada', 2006),
(5, 'Taylor Swift', 'Country/Pop', 'USA', 2006),
(6, 'Bruno Mars', 'Pop', 'USA', 2010),
(7, 'Rihanna', 'Pop/R&B', 'Barbados', 2005),
(8, 'Katy Perry', 'Pop', 'USA', 2008),
(9, 'Justin Bieber', 'Pop', 'Canada', 2009),
(10, 'Lady Gaga', 'Pop', 'USA', 2008),
(11, 'Billie Eilish', 'Pop', 'USA', 2016),
(12, 'Sam Smith', 'Pop/Soul', 'UK', 2014),
(13, 'Shakira', 'Pop', 'Colombia', 1995),
(14, 'Post Malone', 'Hip-Hop', 'USA', 2015),
(15, 'Sia', 'Pop', 'Australia', 2014),
(16, 'The Weeknd', 'R&B', 'Canada', 2011),
(17, 'Dua Lipa', 'Pop', 'UK', 2017),
(18, 'Halsey', 'Pop', 'USA', 2015),
(19, 'Maroon 5', 'Pop/Rock', 'USA', 2002),
(20, 'Coldplay', 'Rock', 'UK', 1996),
(21, 'Ariana Grande', 'Pop', 'USA', 2013),
(22, 'Lil Nas X', 'Hip-Hop', 'USA', 2019),
(23, 'Camila Cabello', 'Pop', 'Cuba/USA', 2015),
(24, 'Travis Scott', 'Hip-Hop', 'USA', 2013),
(25, 'Miley Cyrus', 'Pop', 'USA', 2006),
(26, 'Kendrick Lamar', 'Hip-Hop', 'USA', 2011),
(27, 'Nicki Minaj', 'Hip-Hop', 'Trinidad and Tobago', 2010),
(28, 'P!nk', 'Pop/Rock', 'USA', 2000),
(29, 'John Legend', 'R&B', 'USA', 2004),
(30, 'Lizzo', 'Pop/Rap', 'USA', 2019),
(31, 'Tones and I', 'Pop', 'Australia', 2019),
(32, 'Charlie Puth', 'Pop', 'USA', 2015),
(33, 'Zayn Malik', 'Pop', 'UK', 2016),
(34, 'Kacey Musgraves', 'Country', 'USA', 2013),
(35, 'Bebe Rexha', 'Pop', 'USA', 2016),
(36, 'Jason Derulo', 'Pop/R&B', 'USA', 2009),
(37, 'Shawn Mendes', 'Pop', 'Canada', 2015),
(38, 'Alicia Keys', 'R&B', 'USA', 2001),
(39, 'Gwen Stefani', 'Pop/Rock', 'USA', 1992),
(40,'Rita Ora','Pop','UK',2012)

select * from singers


--update
UPDATE singers
SET country = 'USA'
WHERE genre = 'Rock';


--alter
ALTER TABLE singers
ADD COLUMN debut_album VARCHAR(255);


--drop 
DROP TABLE singers;


--CONSTRAINT
ALTER TABLE singers
ADD CONSTRAINT uq_singer_name_country UNIQUE (name, country);

ALTER TABLE singers
ADD CONSTRAINT chk_year CHECK (year >= 1900 AND year <= 2100);


--View
CREATE VIEW USASingers AS
SELECT id, name, genre, year
FROM singers
WHERE country = 'USA';

CREATE VIEW SingersByGenre AS
SELECT genre, COUNT(id) AS singer_count
FROM singers
GROUP BY genre;

select * from SingersByGenre


--JOINS--

SELECT
    l.id AS laptop_id,
    l.brand AS laptop_brand,
    l.model AS laptop_model,
    v.id AS vehicle_id,
    v.make AS vehicle_make,
    v.model AS vehicle_model
FROM
    laptops AS l
INNER JOIN
    vehicles AS v ON l.id = v.id;


SELECT
    v.id AS vehicle_id,
    v.make AS vehicle_make,
    v.model AS vehicle_model,
    a.id AS app_id,
    a.name AS app_name,
    a.platform AS app_platform
FROM
    vehicles AS v
RIGHT JOIN
    Apps AS a ON v.id = a.id;


SELECT
    l.id AS laptop_id, l.brand AS laptop_brand, l.model AS laptop_model,
    a.id AS app_id, a.name AS app_name, a.platform AS app_platform
FROM
    laptops AS l
RIGHT JOIN
    Apps AS a ON l.id = a.id;




