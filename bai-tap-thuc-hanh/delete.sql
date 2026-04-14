/*
xoa du lieu trong bang
cu phap:
delete from table_name where condition;
*/

select * into Customers_1
from Customers;

--xoa khach hang 'ALFKI'
delete from Customers_1
where CustomerID like 'ALFKI';

--xoa di toan bo khach hang co quoc gia bat dau bang 'U'
delete from Customers_1
where Country like 'U%';

--xoa sach 1 bang
delete from Customers_1;

--cau hoi
--delete from khac gi truncate
/*
| Tiêu chí         | DELETE         | TRUNCATE              |
| ---------------- | -------------- | --------------------- |
| Xóa có điều kiện | Có (`WHERE`)	| Không                 |
| Tốc độ           | Chậm hơn       | Nhanh hơn             |
| Log              | Nhiều          | Ít                    |
| Rollback         | Có	            | Có (nhưng hạn chế)    |
| Reset IDENTITY   | Không	        | Có					|
| Foreign Key      | Dùng được	    | Không					|
*/

--bai tap
--luu y truoc khi thuc hien bai tap lien quan den xoa du lieu can
--phai sao chep table can thao tac va thuc hien thao tac xoa tren table da sao chep
--tranh viec mat du lieu

--viet mot cau lenh delete xoa mot don dat hang cu the dua tren OrderID
--vi du: xoa don hang co OrderID la 10248
--sao chep bang Orders
select * into Orders_1 from Orders;

--xoa du lieu
delete from Orders_1
where OrderID like '10248';

--xoa cac san pham tu bang Products co so luong ton kho (UnitsInStock) bang 0
--sao cheo bang Products
select * into Products_1 from Products;

--xoa san pham ton kho bang 0
delete from Products_1
where UnitPrice = 0;

--xoa tat ca don hang va chi tiet dat hang lien quan den mot khach hang cu the dua vao CustomerID
--sao chep bang Orders Details, Orders, Customers
select * into [Order Details 1] from [Order Details]
select * into Orders_1 from Orders
select * into Customers_1 from Customers;

--xoa chi tiet don hang
delete od1
from [Order Details 1] od1
join Orders_1 o1
on o1.OrderID = od1.OrderID
where o1.CustomerID like '10409';