/*
y nghia
- select into dung de toa mot bang moi va sao chep du lieu tu bang hien co vao bang nay
- thuong duoc dung de tao bang tam thoi hoac luu du lieu tu bang hien co 
	de thuc hien cac phan tich hoac thao tac du lieu
- select into dung de chon mot phan du lieu tu bang nguon va chen no vao bang moi
*/

/*
cu phap
select *
into new_table [in externaldb]
from old_table
where condition;

select column1, coluimn2, column3,...
into new_table [in externaldb]
from old_table
where condition;
*/

--tao ra bang moi voi gia cac san pham co gia > 50
select *
into HighValueProducts
from Products p
where p.UnitPrice > 50;

--tao bang moi voi cac don hang duoc gia den usa
select *
into USAOrders
from Orders o
where o.ShipCountry like 'USA';

--bai tap
--tao mot bang tam 'CustimerInLondon' tu bang 'Customers' chua 
--cac thong tin khach hang co dia chi o London
select * 
into CustomerInLondon
from Customers c
where c.Country like 'London';

--tao mot bang tam 'HighValueOrders' chua thong tin ve cac don hang
--co tong gia tri dat hang lon hon $1000
with TotalPriceOrder as (
	select od.OrderID, sum((od.Quantity*od.UnitPrice)*(1-od.Discount)) TotalPrices
	from [Order Details] od
	group by od.OrderID
)

SELECT 
    o.*, 
    tpo.TotalPrices AS Price
INTO HighValueOrders
FROM Orders o
JOIN TotalPriceOrder tpo
    ON o.OrderID = tpo.OrderID
WHERE tpo.TotalPrices > 1000;