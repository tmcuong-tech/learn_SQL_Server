/*
common table expression (CTE)
- tao bang tam thoi va su dung trong cac cau truy van sau do
- lam cau lenh tro nen de doc, de quan ly
cu phap
WITH ten_CTE (cot1, cot2, ...) as (
	-- truy van de dinh nghia CTE
)
cau truc cua CTE
WITH: tu khoa bat buoc de bat dau dinh nghia CTE
ten_CTE: ten dung de tham chieu den no trong cac truy van sau
cot1, cot2: danh sach cot muon dinh nghia cho CTE, 
			khong can dinh danh cot neu muon CTE chua tat ca cac cot tu ket qua truy van
truy van de dinh nghia: noi dat cac cau truy van SQL de xac dinhj du lieu CTE
					(select, from, where, group by, having va order by) tuy vao nhu cau
*/

with short_e as (
	select e.EmployeeID, e.LastName, e.FirstName
	from Employees e
)
select * from short_e;

-- lay thong tin ve cac san pham (Products) co cung the loai voi mot san pham cu the
/*
su dung sub query
select p.ProductName, p.CategoryID
from Products p
where p.CategoryID = (
	select CategoryID
	from Products
	where ProductName = 'Product_Name'
);

su dung sub query + join
select p.ProductName, p.CategoryID
from Products p
left join (
	select CategoryID
	from Products
	where ProductName = 'Product_Name'
) as SubQuery
on p.CategoryID = SubQuery.CategoryID;

su dung cte
with ProductCategory as (
	select p.CategoryID
	from Products p
	where p.ProductName = 'Product_Name'
)
select p.ProductName, p.CategoryID
from Products p
join ProductCategory as pc
on pc.CategoryID = p.CategoryID;
*/

-- lay thong tin ve don hang (Orders) cung voi tong gia tri don hang
-- va ty le giua tong gia tri va phi giao hang
-- cach 1
select o.OrderID, o.OrderDate, o.Freight, (
		select sum(od.Quantity*od.UnitPrice)
		from [Order Details] od
		where od.OrderID = o.OrderID
		) TotalPrice, (
		select sum(od.Quantity*od.UnitPrice)
		from [Order Details] od
		where od.OrderID = o.OrderID
		)/Freight ratio
from orders o;

-- cach 2 - cte
with OrderTotals as (
    select 
        od.OrderID, 
        sum(od.Quantity * od.UnitPrice) as TotalPrice
    from [Order Details] od
    group by od.OrderID
)
select 
    o.OrderID, 
    o.OrderDate, 
    o.Freight,
    ot.TotalPrice, 
    ot.TotalPrice / o.Freight as ratio
from Orders o
join OrderTotals ot
on ot.OrderID = o.OrderID;

-- bai tap -- 
/*
1. su dung cte tinh tong doanh so ban hang cho tung san pham tu hai bang 'Order DeTails' va 'Products' 
trong co so du lieu NorthWind
2. su dung cte tinh toan tong doanh so ban hang theo tung khach hang va sau do 
sap xep danh sach khach hang theo tong doanh so giam dan
3. su dung cte tinh tong doanh so ban hang theo nam tu 'Orders' va 'Order DeTails'
*/

-- cau 1
with TotalProducts as (
	select od.ProductID, sum(od.Quantity*od.UnitPrice) as TotalPrice
	from [Order Details] od
	group by od.ProductID
)
select p.ProductID, p.ProductName
from Products p
join TotalProducts tp
on p.ProductID = tp.ProductID;

--cau 2
with Totals as (
	select o.CustomerID, sum(od.Quantity*od.UnitPrice) as TotalPrice
	from [Order Details] od, Orders o
	where o.OrderID = od.OrderID
	group by o.CustomerID
)
select c.CustomerID, t.TotalPrice
from Customers c
join Totals t 
on c.CustomerID = t.CustomerID
order by t.TotalPrice desc;

-- cau 3
with Totals as (
	select year(o.OrderDate) as [year] , sum(od.Quantity*od.UnitPrice) as TotalPrice
	from [Order Details] od, Orders o
	where o.OrderID = od.OrderID
	group by year(o.OrderDate)
)
select * from Totals;