-- bai tap 1 --
-- (inner join) liet ke ten san pham va ten nha cung cap cua cac san pham da duoc dat hang
-- trong bang 'Order Details'.  su dung Inner join de ket hop bang 'Order Details' voi cac bang lien quan
-- de lay thong tin san pham va nha cung cap
select distinct od.ProductID, p.ProductName, s.CompanyName
from [Order Details] od
inner join Products p
on od.ProductID = p.ProductID
inner join Suppliers s
on p.SupplierID = s.SupplierID;

-- bai tap 2 --
-- (left Join) hay liet ke ten khach hang va ten nhan vien phu trach cua cac don hang trong bang 'Orders'
-- bao gom ca cac don hang khong co nhan vien phu trach
-- su dung left join de ket hop bang 'Orders'voi bang 'Employees' de lay thon tin ve khach hang
-- va nhan vien phu trach
select o.OrderID, e.LastName, e.FirstName, c.CompanyName
from Orders o
left join Employees e
on o.EmployeeID = e.EmployeeID
left join Customers c
on c.CustomerID = o.CustomerID

-- bai tap 3 --
-- (right Join) hay liet ke ten khach hang va ten nhan vien phu trach cua cac don hang trong bang 'Orders'
-- bao gom ca cac don hang khong co nhan vien phu trach
-- su dung right join de ket hop bang 'Orders'voi bang 'Employees' de lay thon tin ve khach hang
-- va nhan vien phu trach
select o.OrderID, e.LastName, e.FirstName, c.CompanyName
from Orders o
right join Employees e
on o.EmployeeID = e.EmployeeID
right join Customers c
on c.CustomerID = o.CustomerID

-- bai tap 4 --
-- (full join) liet ke ten danh muc va ten nha cung cap cua cac san pham trong bang 'Products'
-- boa gom ca cac danh muc va nha cung cap khong co san pham
-- du dung full join hoac ket hop left join va right join de lay thong tin ve danh muc va nha cung cap
select p.ProductID, p.ProductName, s.CompanyName, c.CategoryName
from Products p
full join Suppliers s
on p.SupplierID = s.SupplierID
full join Categories c
on p.CategoryID = c.CategoryID;

-- bai tap 5 --
-- (inner join) liet ke ten khach hang va ten san pham da duoc dat hang trong bang 'Orders' va 'Ordes  Details'
-- su dung inner join de ket hop bang 'Orders' va 'Orders Detais de lay thong tin khach hang va san pham da duoc dat hang
select o.OrderID, c.CompanyName, p.ProductName
from Orders o
inner join [Order Details] od
on o.OrderID = od.OrderID
full join Products p
on p.ProductID = od.ProductID
full join Customers c
on c.CustomerID = o.CustomerID;

-- bai tap 6 --
-- (full join) liet ke ten nhan vien va ten khach hang cua cac don hang trong ban 'Orders'
-- bao gom ca cac don hang khong co nhan vien hoac khach hang tuong ung.
-- su dung full join hoac ket hop left join va right join de ket hop bang 'Orders' va bang "employees' va 'Customers'
-- de lay thong tin ve nhan vien va khach hang
select o.OrderID, e.FirstName, e.LastName, c.CompanyName
from Employees e
full join Orders o
on e.EmployeeID = o.EmployeeID
full join Customers c
on c.CustomerID = o.CustomerID