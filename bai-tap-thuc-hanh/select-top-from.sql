-- viết câu lệnh sql lấy ra 5 dòng đầu tiên trong bảng Customers
select top 5 *
from Customers;

-- viết câu lệnh sql lấy ra 30% nhân viên của công ty hiện tại
select top 30 percent *
from Employees;

-- viết câu lệnh sql lấy ra các mã khách hàng trong bảng đơn hàng
-- mã khách hàng không trùng lặp
-- chỉ lấy 5 dòng dữ liệu đầu tiên
select distinct top 5 CustomerID
from Orders;

-- viết câu lệnh sql lấy ra các sản phẩm:
-- có mã thể loại không bị trùng lặp, và chỉ lấy ra 3 dòng đầu tiên
select distinct top 3 CategoryID
from Products;