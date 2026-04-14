-- hay liet ke tat ca cac san pham co so luong trong kho (UnitsInStock)
-- thuoc khoang nho hon 50 hoac lon hon 100
select *
from Products
where UnitsInStock < 50 or UnitsInStock > 100;

-- hay liet ke tat ca cac don hang duoc giao den Brazil, 
-- da bi giao muon, biet rang ngay can phai giao la ReuiredDate
-- ngay giao thuc te la ShippedDate
select *
from Orders
where ShipCountry='Brazil' and (ShippedDate > RequiredDate);

-- lay ra tat ca cac san pham co gia duoi 100$ va ma the loai khac 1
-- luu y: khong dung NOT
select *
from Products
where UnitPrice < 100 and CategoryID <> 1;

select *
from Products
where not(UnitPrice >= 100 or CategoryID = 1);

-- bai tap 1 --
-- hay liet ke tat ca cac don hang co gia van chuyen Freight trong khoang [50,100] do la
select *
from Orders
where Freight >= 50 and Freight <= 100;

-- bai tap 2 --
-- ha liet ke cac san pham co so luong hang trong kho (UnitsInStock) > 20 
-- va so luong hang trong don UnitsOnOrder) < 20
select *
from Products
where UnitsInStock > 20 and UnitsOnOrder < 20;