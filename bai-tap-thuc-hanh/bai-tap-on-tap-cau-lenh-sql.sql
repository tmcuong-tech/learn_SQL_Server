-- bai tap 1 --
-- hay cho biet nhung khach hang nao da dat nhieu hon 20 hon hang
-- sap xep tho thu tu tong so don hang giam dan
select o.CustomerID,
		count(o.OrderID) as TotalOrder
from Orders as o
group by o.CustomerID
having count(o.OrderID) > 20
order by count(o.OrderID) desc;

-- bai tap 2 --
-- hay loc ra cac nhan vien (employeeID) co tong so don hang lon hon hoac bang 100
-- sap xep theo tong so don hang giam dan
select o.EmployeeID,
		count(o.OrderID) as TotalOrder
from Orders as o
group by o.EmployeeID
having count(o.OrderID) >= 100
order by count(o.OrderID) desc;

-- bai tap 3 --
-- hay cho biet nhung the laoi nao (CategoryID) co so san pham kahc nhau lon hon 11
select p.CategoryID, count(p.ProductID)
from Products as p
group by p.CategoryID
having count(p.ProductID) > 11;

-- bai tap 4 --
-- hay cho biet nhung the loai nao (CategoryID) co so tong so luong san pham trong kho (UnitsInStock) lon hon 350
select p.CategoryID, sum(p.UnitsInStock) as TotalUnitsInStock
from Products as p
group by p.CategoryID
having sum(p.UnitsInStock) > 350;

-- bai tap 5 -- 
-- hay cho biet nhung quoc gia co nhieu hon 7 khach hang
select o.ShipCountry, count(o.CustomerID) as TotalCustomer
from Orders as o
group by o.ShipCountry
having count(o.CustomerID) > 7;

-- bai tap 6 -- 
-- hay cho biet nhung ngay nao co nhieu hon 5 don hang duoc giao
-- sap xep tang dan theo ngay giao
select o.ShippedDate, count(o.OrderID) as TotalOrder
from Orders as o
group by o.ShippedDate
having count(o.OrderID) > 5
order by day(o.ShippedDate) asc;

-- bai tap 7 --
-- hay cho biet nhung quoc gia bat dau bang chu 'A' hoac 'G'
-- va co so luong don hang lon hon 29
select o.ShipCountry, count(o.OrderID)
from Orders as o
where o.ShipCountry like 'A%' or o.ShipCountry like 'G%'
group by o.ShipCountry
having count(o.OrderID) > 29;

-- bai tap 8 --
-- hay cho biet nhung thanh pho nao co so luong do hang duoc giao la khac 1 va 2
-- ngay dat hang tu ngay '1997-04-01' den ngay '1997-08-31'
select ShipCity, count(OrderID) as TotalOrder
from Orders
where ShippedDate between '1997-04-01' and '1997-08-31'
group by ShipCity
having count(OrderID) <> 1 and count(OrderID) <> 2
order by count(OrderID) asc;