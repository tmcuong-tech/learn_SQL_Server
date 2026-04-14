-- liet ke cac don hang co ngay dat gan nhat
select *
from Orders o
where o.OrderDate = (
	select max(OrderDate)
	from Orders
);

-- liet ke tat ca cac san pham (ProductName)
-- ma khong co don dat hang nao mua chung
select *
from Products p
where p.ProductID not in (
	select distinct ProductID
	from [Order Details]
);

-- lay thong tin ve cac don dat hang va ten cac nha san xuat
-- thuoc cac don hang chua duoc giao cho khach
select o.OrderID, p.ProductName
from Orders o
inner join [Order Details] od
on o.OrderID = od.OrderID
inner join Products p
on od.ProductID = p.ProductID
where o.OrderID in (
	select o.OrderID
	from Orders o
	where o.ShippedDate is null
);

-- lay thong tin va cac san pham co so luong ton kho
-- it hon so luong ton kho trung binh cua tat ca san pham
select *
from Products p
where p.UnitsInStock > (
	select avg(p.UnitsInStock)
	from Products p
);

-- lay thong tin ve cac khach hang co tong gia tri don hang lon nhat
select o.OrderID, c.CustomerID, c.CompanyName
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID
inner join [Order Details] od
on od.OrderID = o.OrderID
group by o.OrderID, c.CompanyName, c.CustomerID
having sum(od.UnitPrice*od.Quantity) = (
	select top 1 sum(od.UnitPrice*od.Quantity) total
	from [Order Details] od
	group by od.OrderID
	order by total desc
);