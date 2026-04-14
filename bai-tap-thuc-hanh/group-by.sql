-- hay cho viet moi khach hang da dat bao nhieu don hang
select CustomerID, count(OrderID)
from Orders
Group by CustomerID;

-- hay tinh gia tri don gia trung binh theo moi nha cung cap
select SupplierID, avg(UnitPrice) as [AvgUnitPrice]
from Products
group by SupplierID;

-- hay cho biet moi the loai co tong so bao nhieu san pham trong kho (UnitsInStock)
select CategoryID, sum(UnitsInStock) as TitalUnitOnStock
from Products
group by CategoryID;

-- hay cho biet gia van chuyen thap va lon nhat trong cac don hang theo tung thanh pho va quoc gia khac nhau
select ShipCountry, ShipCity,
		min(Freight) as MinFreight, 
		max(Freight) as MaxFreight
from Orders
group by ShipCountry, ShipCity
order by shipCountry asc, ShipCity asc;

-- bai tap 1 --
-- hay thong ke so luong nhan vien theo tung quoc gia
select e.Country, count(e.EmployeeID) as TotalEmployeeOfCountry
from Employees as e
group by e.Country;