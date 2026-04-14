-- hãy liệt kê tất cả các nhà cung cấp theo thú tự tên đơn vị CompanyName từ a-z
select *
from Suppliers
order by CompanyName asc;


-- hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
select *
from Products
order by UnitPrice desc;

--hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm a-z
-- không dùng asc | desc
select *
from Employees
order by LastName asc, FirstName asc;

select *
from Employees
order by LastName, FirstName;

-- hãy lấy ra một sản phẩm có số lượng bán cao nhất từ bản [Order Detail]
-- không được dùng hàm max
select *
from [Order Details]
order by Quantity desc;

select top 1 *
from [Order Details]
order by Quantity desc;

-- bài tập 1 --
-- hãy liệt kê danh sách các đơn đặt hàng (OrderID) trong bảng Order 
-- theo thứ tự giảm dần cảu ngày đặt thàng (OrderDate)
select OrderID
from orders
order by OrderDate desc;

-- bài tập 2 -- 
-- hãy liệt kê tên, đơn giá, số lượng trong kho (UnitsInStock) của tất cả các sản phầm trong bảng Products
-- theo thứ tự giảm dần cảu UnitsInStock
select ProductName, UnitPrice, QuantityPerUnit
from Products
order by UnitsInStock desc;