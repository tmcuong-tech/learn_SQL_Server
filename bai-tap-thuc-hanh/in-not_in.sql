-- hay loc ra tat ca cac don hang voi dieu kien:
-- a. don hang duoc giao den Germany, UK, Brazil
-- b. don hang duoc giao den cac quoc gia khac Germany, UK, Brazil

-- a
select *
from Orders
where ShipCountry='Germany' or 
		ShipCountry='UK' or 
		ShipCountry='Brazil';

select *
from Orders
where ShipCountry in ('Germany', 'UK', 'Brazil');

-- b
select *
from Orders
where ShipCountry not in ('Germany', 'UK', 'Brazil');


-- lay ra cac san pham co ma the loai khc voi 2, 3 va 4
select *
from Products
where CategoryID not in (2, 3, 4);

-- hay liet ke cac nhan vien khong phai la nu tu bang nhan vien
-- hay liet ke cac nhan vien la nu tu bang nhan vien

-- liet ke khong phai nu
select *
from Employees
where TitleOfCourtesy not in ('Ms.', 'Mrs.');

-- liet ke nhan vien nu
select *
from Employees
where TitleOfCourtesy in ('Ms.', 'Mrs.');

-- bai tap 1 --
-- hay liet ke tat ca cac khach hang den tu cac thanh pho sau day:
-- Berlin
-- Longdon
-- Warszawa
select *
from Customers
where City in ('Berlin', 'London', 'Warszawa');