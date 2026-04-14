-- tu ban [Order Details] hay liet ke cac don dat hang co UnitPrice nam trong pham vi tu 100  den 200
-- I 22 dong
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200;

-- dua ra cac don hang co Quanitty bang 10 hoac 20
-- II 433 dong
select od.OrderID
from [Order Details] od
where od.Quantity in (10, 20);

-- tu ban [Order Details] hay liet ke cac don dat hang co UInitPrice ban trong pham vi tu 100 den 200
-- va don hang phai co Quanity bang 10 hoac 20
-- III = I and II; 7 dong
select od.OrderID
from [Order Details] od
where (od.UnitPrice between 100 and 200) and (od.Quantity in (10, 20));

-- tu ban [Order Details] hay liet ke cac don dat hang co UInitPrice ban trong pham vi tu 100 den 200
-- hoac don hang phai co Quanity bang 10 hoac 20
-- IV = I or II; 448 dong
select od.OrderID
from [Order Details] od
where (od.UnitPrice between 100 and 200) or (od.Quantity in (10, 20));

-- tu ban [Order Details] hay liet ke cac don dat hang co UInitPrice ban trong pham vi tu 100 den 200
-- hoac don hang phai co Quanity bang 10 hoac 20, co su dung distinct
-- V = IV + distinct; 360 dong
select distinct od.OrderID
from [Order Details] od
where (od.UnitPrice between 100 and 200) or (od.Quantity in (10, 20));

-- union
-- V = I + II = 360 dong
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
union
select od.OrderID
from [Order Details] od
where od.Quantity in (10, 20);

-- IV = I OR II = 455 dong
select od.OrderID
from [Order Details] as od
where od.UnitPrice between 100 and 200
union all
select od.OrderID
from [Order Details] od
where od.Quantity in (10, 20);

-- hay liet ke toan bo cac thanh pho va quoc gia ton tai trong 2 bang Suppliers va Customers
-- voi 2 tinh huong su dung union va union all

-- union = 93 rows
select distinct s.Country, s.City from Suppliers s
union
select distinct c.Country, c.City from Customers c

-- union all = 98 rows
select distinct s.Country, s.City from Suppliers s
union all
select distinct c.Country, c.City from Customers c

-- bai tap 1 --
-- hbay viet va thuc thi lai cau lenh truy van benh duoi
-- sau do hay giai thich y nghia cua cau lenh
select c.City, c.Country
from Customers c
where c.Country like 'U%'
Union
select s.City, s.Country
from Suppliers s
where s.City = 'London'
union
select o.ShipCity, o.ShipCountry
from Orders o
where o.ShipCountry = 'USA';