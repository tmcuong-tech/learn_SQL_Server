-- viết câu lệnh sql lấy ra tên các quốc gia (country)
-- khác nhau từ bảng khách hàng - Customers
select distinct Country
from Customers;

-- viết câu lệnh sql lấy ra tên các mã số 
-- bưu điện (PostalCode) khác nhau từ bảng Nhà cung cấp - Suppliers
select distinct PostalCode
from Suppliers;

-- viết câu lệnh sql lấy ra các dữ liệu khác nhau về họ cảu nhân viên (LastName)
-- và các gọi danh hiệu lịch sử (TitleOfCourtesy) cảu nhân viên từ bảng Employees
select distinct LastName, TitleOfCourtesy
from Employees;

-- bài tập --
-- viết câu lệnh sql lấy ra mã đơn vị vận chuyển (ShipVia) khác nhau của các đơn hàng - Orders
select distinct ShipVia
from Orders;