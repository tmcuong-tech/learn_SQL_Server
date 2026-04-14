-- tinh so luong don dat hang trong nam 1997 cua tung khach hang
select o.CustomerID, count(o.OrderID) as TotalOrders,
		year(o.OrderDate) as Year
from Orders as o
where year(o.OrderDate) = 1997
group by o.CustomerID, year(o.OrderDate);

-- hay loc ra cac don hang duoc dat hang vao thang 5 nam 1997
select *
from Orders as o
where month(o.OrderDate) = 5 and year(o.OrderDate) = 1997

-- lay danh sach cac don hang duoc dat vao ngay 4 thang 9 nam 1996
select *
from Orders as o
where day(o.OrderDate) = 4 
		and month(o.OrderDate) = 9 
		and year(o.OrderDate) = 1996;

select *
from Orders as o
where o.orderDate = '1996-09-04';

-- lay danh sach khach hang dat hang trong nam 1998 
-- va so don hang moi thang, 
-- sap xep thang tang dan
select o.CustomerID, 
		month(o.OrderDate) as [month],
		count(*) as TotalOrders
from Orders as o
where year(o.OrderDate) = 1998
group by o.CustomerID, month(o.OrderDate)
order by month(o.OrderDate) asc;

-- bai tap 1 --
-- hay loc cac don dat hang da duoc giao vao thang 5
-- va sap xep tang dan theo nam
select o.OrderID,
		month(o.OrderDate) as [Month],
		count(*) as TotalOrders
from Orders as o
where month(o.OrderDate) = 5
group by o.OrderID, month(o.OrderDate)
order by o.OrderID asc;