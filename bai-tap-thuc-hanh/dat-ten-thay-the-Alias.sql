-- viết câu lệnh sql lấy :
-- "CompanyName" đặt tên thay thế là "Công ty"
-- "PostalCode" đặt tên thay thế là "Mã bưu điện"
select CompanyName as [Công ty],
		PostalCode as "Mã bưu điện",
		City "Thành phố"
from Customers;

-- viết câu lệnh ra:
-- "LastName" đặt tên thay thế là "Họ"
-- "FirstName" đặt tên thay thế là "Tên"
select LastName [Họ], FirstName [Tên]
from Employees;

-- viết câu lệnh sql lấy ra 15 dòng đầu tiên tất cả các cột trong bảng Order
-- đặt tên thay thế cho bảng Orders là "o"
select top 15 [o].*
from Orders as [o];

-- bài tập --
-- viết câu lệnh sql lấy ra các cột và đặt tên thay thế như sau:
-- ProductName => Tên sản phẩm
-- SupplierID => Mã nhà cung cấp
-- CategoryID => Mã thể loại
-- và đặt tên thay thế cho bản Products là "p"
-- sử dụng tên thay thế khi truy vấn đến cột bên trên
-- cà chỉ lấy ra 5 sản phẩm đầu tiên trong bảng
select top 5 p.ProductName "Tên sản phẩm", 
		p.SupplierID "Mã nhà cung cấp",
		p.CategoryID "Mã thể loại"
from Products p;