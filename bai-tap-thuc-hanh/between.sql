-- lay danh sach cac san pham co gia ban trong khoan tu 10 den 20 do la
select *
from Products
where UnitPrice between 10 and 20;

select *
from Products
where UnitPrice >= 10 and UnitPrice <= 20;

-- lay danh sach cac don dat hang duoc dat trong khoang thoi gian tu ngay 1996-0701 den ngay 1996-07-31
select *
from Orders
where OrderDate between '1996-07-01' and '1996-07-31';

-- tinh tong so tien van chuyen (Freight) cua cac don dat hang duoc dat trong khoang thoi gian tu ngay 1996-0701 den ngay 1996-07-31
select sum(Freight) as TotalFreightJuly
from Orders
where OrderDate between '1996-07-01' and '1996-07-31';

-- bai tap 1 --
-- lay danh sach cac don dat hang co ngay dat hang trong khoang tu ngay 1/1/1997 den ngay 31/12/1997
-- va duoc van chuyen bang tau thuy (ShipVia=3)
select *
from Orders
where ShipVia=3 and OrderDate between '1997-01-01' and '1997-12-31';