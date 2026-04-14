-- tu bang Products va Categoriess, hay in ra cac thong tin sau
-- ma the loai
-- ten the loai
-- ma san pham
-- ten san pham
select p.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as p, Categories as c
where c.CategoryID = p.CategoryID;

-- tu abng Employees va Orders, hay in ra cac thong tin sau day:
-- ma nhan vien
-- ten nhan vien
-- so luong don hang ma nhan vien da ban duoc
select o.EmployeeID, e.LastName, e.FirstName , count(o.OrderID) as TotalOrders
from Employees as e, Orders as o
where e.EmployeeID = o.EmployeeID
group by o.EmployeeID, e.LastName, e.FirstName;

-- tu bang Customers va Orders, hay in ra cac thong tin sau day
-- ma so khach hang
-- ten cong ty
-- ten lien he
-- so luong don hang da mua
-- voi dieu kien: quoc gia cua khach hang la UK
select c.CustomerID, c.CompanyName, c.ContactName, count(o.OrderID) as TotalOrders
from Customers as c, Orders as o
where c.CustomerID = o.CustomerID and c.Country='UK'
group by c.CustomerID, c.CompanyName, c.ContactName;

-- tu bang Orders va Shippers, hay in ra cac thong tin sau day
-- ma nha van chuyen
-- ten cong ty van chuyen
-- tong so tien duoc van chuyen (Sum Frieght)
-- va in ra man hinh theo thu tu sap xep tong so tien van chuyen giam dan
select s.ShipperID, s.CompanyName, sum(o.Freight) as TotalFreight
from Orders as o, Shippers as s
where o.ShipVia = s.ShipperID
group by s.ShipperID, s.CompanyName
order by sum(o.Freight) desc;

-- tu bang Products va Suppliers, hay in ra cac thong tin sau day
-- ma nha cung cap
-- ten cong ty
-- tong so cac san pham khac nhau da cung cap
-- va chi in ra man hinh duy nhat 1 nha cung cap co so luong san pham khac nhau nhat
select top 1 s.SupplierID, s.CompanyName, count(p.ProductName) as TotalProducts
from Suppliers as s, Products as p
where s.SupplierID = p.SupplierID
group by s.SupplierID, s.CompanyName
order by count(p.ProductID) desc;

-- tu bang Orders va Orders Details hay in ra cac thong tin sau day
-- ma don hang
-- tong so tien san pham cua don hang do
select o.OrderID, o.CustomerID , sum(od.UnitPrice*od.Quantity) as TotalFreight
from Orders as o, [Order Details] as od
where o.OrderID = od.OrderID
group by o.OrderID, o.CustomerID;

-- tun 3 bang [Order Detais], Orders va Employees, hay in ra cac thong tin sau day:
-- ma don hang
-- ten nhan vien
-- thong so tien san pham cua don hang
select o.OrderID, e.LastName, e.FirstName, sum(od.UnitPrice*od.Quantity) as TotalOrders
from [Order Details] as od, Orders as o, Employees as e
where o.EmployeeID = e.EmployeeID and o.OrderID = od.OrderID
group by o.OrderID, e.LastName, e.FirstName;

-- bai tap 1 --
-- tu 3 bang CUstomers, Orders, Shippers, hay in ra cac thong tin sau
-- ma don hang
-- ten khach hang
-- ten cong ty van chuyen
-- va chi in ra cac don hang duoc giao den 'UK' trong nam 1997
select o.OrderID, c.ContactName, s.CompanyName
from Customers as c, Orders as o, Shippers as s
where o.ShipCountry = 'UK' and year(o.ShippedDate) = 1997 
		and c.CustomerID = o.CustomerID
		and o.ShipVia = s.ShipperID
group by o.OrderID, c.ContactName, s.CompanyName;