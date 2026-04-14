-- liet ke ra toan bo san pham
select p.ProductID, p.ProductName, p.UnitPrice
from Products p ;

-- tim gia trung binh cua cac san pham
select avg(p.UnitPrice)
from Products p

-- loc nhung san pham co gia lon hon gia trung binh
select p.ProductID, p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice > 28.8663;

select p.ProductID, p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice > (
	select avg(p.UnitPrice)
	from Products p
);

-- loc khach hang co so don hang > 10
select c.CustomerID, c.CompanyName , count(o.OrderID) TotalOrders
from Customers c 
left join Orders o
on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName
having count(o.OrderID) > 10;

-- sub query
select *
from Customers c
where c.CustomerID in (
	select o.CustomerID
	from orders o
	group by o.CustomerID
	having count(o.OrderID) > 10
);

-- tinh tong so tien cua tung don hang
select o.*, (
	select sum(od.Quantity*od.UnitPrice)
	from [Order Details] od
	where od.OrderID = o.OrderID
) Total
from Orders o;

-- loc ra ten san pham va tong so don hang cua san pham
select p.ProductID, p.ProductName, (
	select count(*) 
	from [Order Details] od
	where od.ProductID = p.ProductID
	) TotalOrders
from Products p;

select ProductName, TotalOrders
from (
	select p.ProductID, p.ProductName, (
		select count(*) 
		from [Order Details] od
		where od.ProductID = p.ProductID
	) TotalOrders
	from Products p
) Temp;

-- bai tap --
-- hay in ra ma don hang, va tong gia tri cua don hang do
select o.OrderID, (
	select sum(od.UnitPrice*od.Quantity)
	from [Order Details] od
	where o.OrderID = od.OrderID
	) Total
from orders o;

-- hay in ra ma don hang, va so luong san pham cua don hang do
select o.OrderID, (
	select sum(od.Quantity)
	from [Order Details] od
	where o.OrderID = od.OrderID
) TotalQuanity
from Orders o;