-- viết câu lệnh sql tìm giá thấp nhất của các sản phẩm trong bảng Products
select min(UnitPrice) as minPrice
from Products;

-- viết câu lệnh lấy ra ngày đặt hàng gần đây nhất từ bảng Orders
select max(OrderDate)
from Orders;

-- viết câu lệnh sql tìm ra số lượng hàng tồn kho (UnitsInStock) lớn nhất
select max(UnitsInStock)
from Products;

-- bài tập --
-- hãy cho biết tuổi đời của nhân viên lớn nhất trong công ty
-- gợi ý: ai có ngày sinh càng nhỏ thì người đó càng lớn tuổi
select min(BirthDate)
from Employees;