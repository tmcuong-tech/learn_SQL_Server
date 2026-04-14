-- hãy đếm số lượng khách hàng có trong bảng Customers
select count(*) as "NumerOfCustomers"
from Customers;

select count(CustomerID)
from Customers;

-- tính tổng số tiền vận chuyển (Freight) của tất cả các đơn đặt hàng
select sum(Freight) as "SumOfFreight"
from Orders;

-- tính trung bình số lượng đặt hàng (Quantity) cảu tất cả các sản phẩm trong bảng [Order Details]
select avg(Quantity) as "AVGofQuantity"
from "Order Details";

-- đếm số lượng, tính tổng số lượng hàng tồn kho và trung bình giá của các sản phẩm có trong bảng Product
select count(*) as "NumberOfProducts", 
		sum(UnitsInStock) as "TotalUnitsInStock", 
		avg(UnitPrice) as "TotalUnitPrice"
from Products;

-- bài tập --
-- hãy đếm số lượng đơn hàng từ bảng Order với 2 cách
-- cách 1: dùng dấu "*"
-- cách 2: dùng mã đơn hàng
select count(*) from Orders; -- cách 1
select count(OrderID) from Orders; -- cách 2

-- từ bảng [Order Details] hãy tính trung bình cho cột UnitPrice và tính tổng cho cột Quantity
select avg(UnitPrice) as "AVGOfUnitPrice" from [Order Details]; -- tính trung bình
select sum(Quantity) as "TotalOfQuantity" from [Order Details]; -- tính tổng