-- hãy liệt kê tất cả các nhân viên đến từ thành phố London
-- sắp xếp kết quả theo LastName a->z
select *
from Employees
where City='London'
order by LastName asc;

-- hãy liệt kê tất cả cá đơn hàng bị giao muộn
-- biết rằng ngày cần phải giao hàng là RequiredDate,
-- ngày giao hàng thực tế là ShippedDate
select OrderID, RequiredDate, ShippedDate
from Orders
where ShippedDate > RequiredDate;

select count(*) as [số đơn giao hàng muộn]
from Orders
where ShippedDate > RequiredDate;

-- lay ra tat ca cac don hang chi tiet duoc giam gia nhieu hon 10%
-- (Discount > 0.1)
select *
from [Order Details]
where Discount > 0.1;

-- bai tap 1 --
-- hay liet ke tat ca cac don hang duoc gui den quoc gia la 'France'
select *
from Orders
where ShipCountry='France';

-- bai tap 2 --
-- hay liet ke cac san pham co so luong hang trong kho (UnitsInStock) lon hon 20
select *
from Products
where UnitsInStock > 20;