-- tu bang Products va Categories, hay tim cac san pahm thuoc danh muc 'Seafood' in ra cac thong tin sau
-- ma the loai
-- ten the loai
-- ma san pham
-- ten san pham
select p.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Suppliers as s, Products as p, Categories as c
where c.CategoryID = p.CategoryID
	and c.CategoryName = 'Seafood'
group by p.CategoryID, c.CategoryName, p.ProductID, p.ProductName;


-- tu bang Products, Suppliers hay tim cac san pham thuoc duoc cung cap tu nuoc 'Germany'
-- ma nha cung cap
-- quoc gia
-- ma san pham
-- ten san pham
select s.SupplierID, s.Country, p.ProductID, p.ProductName
from Products as p, Suppliers as s
where s.SupplierID = p.SupplierID and s.Country = 'Germany'
group by s.SupplierID, s.Country, p.ProductID, p.ProductName;


-- tu 3 bang Customers, Orders, Shippers, hay in ra cac thong tin sau
-- ma don hang
-- ten khach hang
-- ten cong ty van chuyen
-- va chi in ra cac don hang cua cac khach hang den tu 'London'
select o.OrderID, c.ContactName, s.CompanyName
from Customers as c, Orders as o, Shippers as s
where c.CustomerID = o.CustomerID 
	and o.ShipVia = s.ShipperID
	and c.City = 'London'
group by o.OrderID, c.ContactName, s.CompanyName;

-- tu 3 bang Customers, Orders, Shippers, hay in ra cac thong tin sau
-- ma don hang
-- ten khach hang
-- ten cong ty van chuyen
-- ngay yeu cau chuyen hang
-- ngay giao
-- va chi i ra cac don hang bi giao muon hon quy dinh
select o.OrderID, c.ContactName, s.CompanyName, o.RequiredDate, o.ShippedDate
from Customers as c, Orders as o, Shippers as s
where c.CustomerID = o.CustomerID
	and o.ShipVia = s.ShipperID
	and o.RequiredDate > o.ShippedDate

-- cho 3 bang Customers, Orders, Shippers, liet ke cac quoc gia van chuyen ma khach hang khong den tu 'United States'
-- chi chon nhung quoc gia co hon 100 don hang
-- hiem thi quoc gia van chuyen va so luong hang
SELECT o.ShipCountry, COUNT(o.OrderID) AS 'TotalOrder'
FROM dbo.Orders o, dbo.Customers c
WHERE o.CustomerID = c.CustomerID AND c.Country <> 'USA'
GROUP BY o.ShipCountry
HAVING COUNT(o.OrderID) > 100;