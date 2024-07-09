create database Phone

drop database Phone

use Phone

CREATE TABLE CustomerAccount (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Role int,
    Name VARCHAR(100) NOT NULL,
    Phonenumber VARCHAR(20) NOT NULL,
    Address VARCHAR(255) NOT NULL,
);

CREATE TABLE PhoneList (
    PhoneID INT PRIMARY KEY IDENTITY(1,1),
    Model VARCHAR(50) NOT NULL,
    Ram VARCHAR(50),  -- Thay đổi kiểu dữ liệu của các cột từ TEXT sang VARCHAR
	Rom VARCHAR(50),
	Chip VARCHAR(50),
	Battery VARCHAR(50),
	Camera VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
	Img Text
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    PhoneID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES CustomerAccount(UserID),  -- Sửa tên khóa ngoại
    FOREIGN KEY (PhoneID) REFERENCES PhoneList(PhoneID)
);

CREATE TABLE SuccessfulOrders (
    BoughtID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    PhoneID INT NOT NULL,
	Price float NOT NULL,
    Processed INT NOT NULL,
	FOREIGN KEY (UserID) REFERENCES CustomerAccount(UserID),  -- Sửa tên khóa ngoại
    FOREIGN KEY (PhoneID) REFERENCES PhoneList(PhoneID)
);

--- 1 la admin, 2 la client

INSERT INTO CustomerAccount (Username, Password, Role, Name, Phonenumber, Address) VALUES
('client', 'pass1234',2,'Nguyen Dang', '1234567890', 'Nam Cat, Nam Dan, Nghe An'),
('admin','pass1234',1,'Dang Duc', '9998887777', 'Hoa Lac, Thach That, Ha Noi');


INSERT INTO PhoneList (Model, Ram, Rom, Chip, Battery, Camera, Price, Img)
VALUES ('Samsung Galaxy S22 Ultra', '8GB', '1TB', 'Snapdragon 8 Gen 1', '5000mAh', 'Quad (108MP + 12MP + 10MP + 10MP) + 40MP Front', 1299.99,'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg'),
       ('Apple iPhone 13 Pro Max', '6GB', '1TB', 'A15 Bionic', '4352mAh', 'Triple (12MP + 12MP + 12MP) + 12MP TrueDepth Front', 1199.99,'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-xanh-la-thumb-600x600.jpg'),
       ('Google Pixel 6 Pro', '12GB', '256GB', 'Google Tensor', '5000mAh', 'Dual (50MP + 12MP) + 8MP Front', 899.99,'https://cdn.tgdd.vn/Products/Images/42/240166/google-pixel-6-pro-1-600x600.jpg'),
       ('Xiaomi 12 Pro', '8GB', '256GB', 'Snapdragon 8 Gen 1', '4600mAh', 'Triple (50MP + 50MP + 50MP) + 32MP Front', 799.99,'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRVHAPlA4nN66PeeRTCQ-QjIOmce-701pUgsAdUFQTfHmFyxx886UXFGc_00wniQwfBNCilUM4AbTQ-e32Ai6DtqbJ7nHX-ysnHKYzZV_3GiLJrARcIQgUt&usqp=CAE'),
       ('OPPO Find X5 Pro', '12GB', '256GB', 'Snapdragon 8 Gen 1', '5000mAh', 'Dual (50MP + 50MP) + 32MP Front', 999.99,'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSf8G1h_fO9k6ls-PiFRi_8Xpr0CHi4soQufJJeiloIlx5BCENlo7kTkeN-pcPfKJipkYMeaz5vDqQzIbTRU9nIZbXSV2Ri8UFESPd52d6BGGFwxXhVvxx5&usqp=CAE'),
       ('Motorola Edge+', '8GB', '256GB', 'Snapdragon 870', '5000mAh', 'Triple (108MP + 16MP + 8MP) + 32MP Front', 699.99,'https://cdn.tgdd.vn/Products/Images/42/218356/600-motorola-edge-plus-600x600.jpg'),
       ('Nokia G21', '4GB', '128GB', 'Unisoc T606', '5050mAh', 'Triple (50MP + 2MP + 2MP) + 8MP Front', 199.99,'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQdKvuyaYxUjkFBihAZqpg9IHH2Xi8n2xQDY3mjMft_SSxjDKa82D9H942kqtukOmg3CwNWg5q8v24IXk6FCH18WDby9KGoGg&usqp=CAE'),
       ('OnePlus Nord 2T', '8GB', '128GB', 'MediaTek Dimensity 1300', '4500mAh', 'Triple (50MP + 8MP + 2MP) + 32MP Front', 499.99,'https://product.hstatic.net/1000238589/product/dien_thoai_oneplus_nord_2t_5g_fcf52194ac0e498980e50421791101aa.jpg'),
       ('ASUS ROG Phone 6', '16GB', '512GB', 'Snapdragon 8 Gen 1+', '6000mAh', 'Triple (64MP + 50MP + 13MP) + 24MP Front', 1499.99,'https://img.websosanh.vn/v2/users/root_product/images/dien-thoai-asus-rog-phone-6-12/h42frihcxzudn.jpg'),
       ('Realme GT Neo3', '12GB', '256GB', 'MediaTek Dimensity 8100', '5000mAh', 'Triple (50MP + 8MP + 2MP) + 16MP Front', 599.99,'https://dienthoaihay.vn/images/products/2022/04/20/original/gtneo3trang_1650506849.tneo3trang.tneo3trang'),
('Samsung Galaxy A52', '6GB', '128GB', 'Snapdragon 720G', '4500mAh', 'Quad (64MP + 12MP + 5MP + 5MP) + 32MP Front', 349.99,'https://cdn.tgdd.vn/Products/Images/42/228967/samsung-galaxy-a52-8gb-256gb-thumb-violet-600x600-200x200.jpg'),
('Samsung Galaxy M32', '6GB', '128GB', 'MediaTek Helio G80', '6000mAh', 'Quad (64MP + 8MP + 2MP + 2MP) + 20MP Front', 249.99,'https://cdn.tgdd.vn/Products/Images/42/237634/samsung-galaxy-m32-1-600x600.jpg'),
('Apple iPhone SE (2022)', '4GB', '64GB', 'A15 Bionic', '1821mAh', 'Single 12MP Rear + 7MP Front', 429.99,'https://cdn.tgdd.vn/Products/Images/42/274158/iphone-se-red-600x600.jpg'),
('Apple iPhone 12 Mini', '4GB', '64GB', 'A14 Bionic', '2227mAh', 'Dual (12MP + 12MP) + 12MP Front', 699.99,'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-trang-13-600x600.jpg'),
('Google Pixel 5a', '6GB', '128GB', 'Snapdragon 765G', '4680mAh', 'Dual (12.2MP + 16MP) + 8MP Front', 449.99,'https://cdn.tgdd.vn/Products/Images/42/233254/google-pixel-5a-040921-051453-600x600.jpg'),
('Google Pixel 4a 5G', '6GB', '128GB', 'Snapdragon 765G', '3885mAh', 'Dual (12.2MP + 16MP) + 8MP Front', 499.99,'https://cdn.tgdd.vn/Products/Images/42/226666/google-pixel-4a-5g-600jpg-600x600.jpg'),
('Xiaomi Redmi Note 11', '4GB', '128GB', 'MediaTek Helio G88', '5000mAh', 'Triple (50MP + 8MP + 2MP) + 13MP Front', 199.99,'https://cdn.tgdd.vn/Products/Images/42/245261/Xiaomi-redmi-note-11-blue-600x600.jpg'),
('Xiaomi Redmi 10', '4GB', '64GB', 'MediaTek Helio G88', '6000mAh', 'Quad (50MP + 8MP + 2MP + 2MP) + 8MP Front', 179.99,'https://cdn.tgdd.vn/Products/Images/42/246200/redmi-10-gray-600x600.jpg'),
('OPPO Reno6', '8GB', '128GB', 'MediaTek Dimensity 900', '4300mAh', 'Triple (64MP + 8MP + 2MP) + 32MP Front', 449.99,'https://cdn.tgdd.vn/Products/Images/42/236186/oppo-reno6-5g-aurora-600x600.jpg'),
('OPPO A16', '3GB', '32GB', 'MediaTek Helio G35', '5000mAh', 'Triple (13MP + 2MP + 2MP) + 8MP Front', 149.99,'https://cdn.tgdd.vn/Products/Images/42/240631/oppo-a16-silver-8-600x600.jpg'),
('Motorola Moto G Power (2022)', '4GB', '64GB', 'Snapdragon 662', '5000mAh', 'Triple (50MP + 8MP + 2MP) + 8MP Front', 199.99,'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/c/sc_f_7_.jpg'),
('Nokia X100', '6GB', '128GB', 'Snapdragon 480 5G', '4470mAh', 'Triple (48MP + 5MP + 2MP) + 8MP Front', 249.99,'https://cdn.tgdd.vn/Products/Images/42/248281/nokia-x100-1-600x600.jpg'),
('Nokia C21', '3GB', '32GB', 'Unisoc SC9863A', '3000mAh', 'Dual (5MP + 2MP) + 5MP Front', 99.99,'https://cdn.tgdd.vn/Products/Images/42/274083/nokia-c21-2-600x600.jpg'),
('OnePlus 9RT', '8GB', '128GB', 'Snapdragon 888', '4500mAh', 'Triple (50MP + 16MP + 2MP) + 16MP Front', 569.99,'https://cdn.tgdd.vn/Products/Images/42/249272/oneplus-9rt-1-600x600.jpg'),
('OnePlus Nord CE 2', '6GB', '128GB', 'MediaTek Dimensity 900', '4500mAh', 'Triple (50MP + 8MP + 2MP) + 16MP Front', 399.99,'https://cdn.tgdd.vn/Products/Images/42/264523/oneplus-nord-2-ce-240222-115059-600x600.jpg'),
('ASUS Zenfone 8 Flip', '8GB', '128GB', 'Snapdragon 888', '5000mAh', 'Triple (64MP + 12MP + 8MP) + Motorized pop-up 12MP', 799.99,'https://cdn.tgdd.vn/Products/Images/42/236182/asus-zenfone-8-flip-600x600.jpg'),
('ASUS Zenfone 8', '8GB', '128GB', 'Snapdragon 888', '4000mAh', 'Dual (64MP + 12MP) + 12MP Front', 699.99,'https://cdn.tgdd.vn/Products/Images/42/236139/asus-zenfone-8-600x600.jpg'),
('Realme GT 2 Pro', '8GB', '128GB', 'Snapdragon 888', '5000mAh', 'Triple (50MP + 8MP + 2MP) + 16MP Front', 599.99,'https://cdn.tgdd.vn/Products/Images/42/258167/realme-gt-2-pro-050122-080902-600x600.jpg'),
('Realme 9 Pro+', '8GB', '128GB', 'Snapdragon 750G', '5000mAh', 'Triple (108MP + 8MP + 2MP) + 32MP Front', 349.99,'https://cdn.tgdd.vn/Products/Images/42/255513/realme-9-pro-plus-5g-green-thumbnew-600x600.jpg');



INSERT INTO Orders (UserID, PhoneID) VALUES(1, 1),
(2, 2);

INSERT INTO SuccessfulOrders (UserID ,PhoneID, Price, Processed)
VALUES
    (1, 1,599.99, 1);

UPDATE SuccessfulOrders SET Processed = 2 WHERE BoughtID = 1

select * from CustomerAccount
select * from PhoneList
select * from Orders
select * from SuccessfulOrders








INSERT INTO SuccessfulOrders (OrderID,  UserID, PhoneID,Price, Processed)
VALUES (O.OrderID,O.UserID, O.PhoneID,599.99,0)
SELECT O.UserID, O.PhoneID
FROM Orders O
WHERE O.OrderID = 2

INSERT INTO SuccessfulOrders (OrderID, UserID, PhoneID,Price ,Processed)
SELECT O.UserID, O.PhoneID, O.Price
FROM Orders O
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

UPDATE Orders
SET UserID = 6
WHERE UserID = 1;


Select * from PhoneList where PhoneID like 2
select * from CustomerAccount where Username like 'admin' and Password like 'password1';

Select * from PhoneList where PhoneID like 1

Select * from PhoneList where PhoneID like 1

Select * from PhoneList where Model like '%Samsung%'

drop table PhoneList

DELETE FROM CustomerAccount WHERE UserID = 

select CustomerID, PhoneID From CustomerInfo CI 

select * from 

select * from CustomerAccount where Username = 'admin'

DROP TABLE CustomerAccount
DROP TABLE Reviews


SELECT O.OrderID, CI.Name, PL.Model FROM Orders O JOIN CustomerInfo CI ON O.UserID = CI.UserID JOIN PhoneList PL ON O.PhoneID = PL.PhoneID Where O.UserID = 1 And O.PhoneID = 1

DELETE FROM CustomerAccount WHERE UserID = 9

DELETE FROM Orders WHERE PhoneID = 2; 
DELETE FROM Reviews WHERE PhoneID = 2;
DELETE FROM PhoneList WHERE PhoneID = 2;

select * from CustomerInfo where Phone = '123456789'

SELECT O.OrderID, PL.Model ,PL.Price FROM Orders O JOIN CustomerAccount CA ON O.UserID = CA.UserID JOIN PhoneList PL ON O.PhoneID = PL.PhoneID Where O.UserID = 1

SELECT O.OrderID, PL.Price, PL.Model FROM Orders O JOIN CustomerAccount CA ON O.UserID = CA.UserID JOIN PhoneList PL ON O.PhoneID = PL.PhoneID Where O.UserID = 1

select * from CustomerAccount where Phonenumber = '0987654322'


SELECT *
FROM CustomerAccount
WHERE EXISTS (SELECT * FROM CustomerAccount WHERE Phonenumber = '0987654322');

drop database Phone

use Human


DELETE Orders, PhoneList 
FROM Orders 
LEFT JOIN PhoneList ON Orders.PhoneID = PhoneList.PhoneID 
WHERE Orders.PhoneID = 33;



INSERT INTO SuccessfulOrders (OrderID,  UserID, PhoneID,Price, Processed)
VALUES (2,O.UserID, O.PhoneID, 699.99 ,0)
SELECT O.UserID, O.PhoneID, O.Price
FROM Orders O
WHERE O.OrderID = ?;