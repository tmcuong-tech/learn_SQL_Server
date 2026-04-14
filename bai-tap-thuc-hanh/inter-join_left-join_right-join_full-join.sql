-- su dung inner join, dua vao bang Orders va Customers, hay in ra cac thong tin sau
-- ma don hang
-- ten cong ty khach hang
select o.OrderID, c.CompanyName
from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID;

-- su dung innter join, tu abng Products va Categories, hay in ra cac thong tin sau
-- ma the loai
-- ten the loai
-- ma san pham
-- ten san pham
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
inner join Products	p
on c.CategoryID = p.CategoryID;

-- su dung inner join
-- tu bang Products va Categories, hay dua ra cac thong tin sau
-- ma the loai
-- ten the loai
-- so luong san pham
select c.CategoryID, c.CategoryName, count(p.ProductID) TotalProducts
from Categories c
inner join Products p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName

-- su dung innter join, tu bang Products va Categories, hay in ra cac thong tin sau
-- ma the loai
-- ten the loai
-- ma san pham
-- ten san pham
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
inner join Products	p
on c.CategoryID = p.CategoryID;

-- su dung innter join, left join, tu bang Products va Categories, hay in ra cac thong tin sau
-- ma the loai
-- ten the loai
-- ma san pham
-- ten san pham
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
inner join Products	p
on c.CategoryID = p.CategoryID;

select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
left join Products	p
on c.CategoryID = p.CategoryID;

select c.CategoryID, c.CategoryName, count(p.ProductID) TotalProducts
from Categories c
inner join Products	p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName;


select c.CategoryID, c.CategoryName, count(p.ProductID) TotalProducts
from Categories c
left join Products	p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName;


-- su dung right join, dua vao bang Orders va Customers, hay in ra cac thong tin sau
-- ma don hang
-- ten cong ty khach hang
select o.OrderID, c.CustomerID
from Orders o
right join Customers c
on o.CustomerID = c.CustomerID;

-- su dung full join, tu abng Products va Categories, hay in ra cac thong tin sau
-- ma the loai
-- ten the loai
-- ma san pham
-- ten san pham
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories c
full join Products p
on c.CategoryID = p.CategoryID;

-- bai tap --
-- cau 1 - inter join: hay liet ke ten nhan vien va ten khach hang cua cac don hang trong bang Orders
select e.FirstName, e.LastName, c.CompanyName
from Employees e
inner join orders o
on e.EmployeeID = o.EmployeeID
inner join Customers c
on o.CustomerID = c.CustomerID;

-- cau 2 - left join: hay liet ke ten cac nha cung cap va ten san pham trong ban 'Products'
-- bao gom ca cac san pham khon co nha cung cap
select s.CompanyName, p.ProductName
from Products p
left join Suppliers s
on s.SupplierID = p.SupplierID;

-- cau 3 - right join: hay liet ke ten khach hang va ten don hang cua cac don hang torng bang 'Orders'
-- bao gom ca cac khach hang khong co trong don hang
select o.OrderID, c.CompanyName
from Orders o
left join Customers c
on o.CustomerID = c.CustomerID;

-- cau 4 - full join: hay liet ke ten danh muc va ten nha cung cap cua cac san pham trong ban 'Products'
-- bao gom ca cac danh muc va nha cung cap khong co san pham
select c.CategoryName, s.CompanyName 
from Categories c
full join  Products p
on c.CategoryID = p.CategoryID
full join Suppliers s
on s.SupplierID = p.SupplierID;