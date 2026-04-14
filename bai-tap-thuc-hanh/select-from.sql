-- viết câu lệnh sql lấy ra tên của tất cả sản phẩm
select ProductName
from Products;

-- viết câu lệnh sql lất ra tên sản phẩm,
-- giá bán trên mỗi đơn vị, 
-- số lượng sản phẩm trên đơn vị
select ProductName, UnitPrice, QuantityPerUnit
from Products;

-- viết câu lệnh sql lấy ra tên công ty của khách hàng 
-- và quốc gia của các khách hàng đó
select  CompanyName, Country
from Customers;

--bài tập--
-- 1. viết câu lệnh sql lấy ra tên công ty và 
-- số điện thoại của tất cả các nhà cung cấp hàng
select CompanyName, Phone
from Suppliers;

-- viết câu lệnh sql lấy ra tất cả dữ liệu từ bản Products
select *
from Products;

-- viết câu lệnh sql lấy ra tất cả dữ liệu từ bảng khách hàng từ bảng Customers
select *
from Customers;

-- bài tập --
-- 1. viết câu lệnh sql lấy ra tất cả dữ liệu từ bàng nhà cung cấp - Suppliers
select *
from Suppliers;
