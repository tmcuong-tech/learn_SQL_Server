-- thu tu thuc thi cac cau truy van
/*
select distinct (9) top (11) , , (8)
from (1)
full/l/r (4) outer join (2) on (3)
where (5)
group by (6)
having (7)
order by (10)
*/

select p.ProductID, p.ProductName --2
from Products p; --1

select p.ProductID, p.ProductName --3
from Products p --1
where p.CategoryID = 1; --2

select p.CategoryID, count(p.CategoryID) as TotalProducts --4
from products p --1
where p.CategoryID in (1, 2, 3) --2
group by p.CategoryID --3

select p.CategoryID, count(p.CategoryID) as TotalProducts --5
from products p --1
where p.CategoryID in (1, 2, 3) --2
group by p.CategoryID --3
having count(p.CategoryID) >= 13 --4 --TotalProducts chua ton tai

select p.CategoryID, count(p.CategoryID) as TotalProducts --5
from products p --1
where p.CategoryID in (1, 2, 3, 4, 5, 6, 7) --2
group by p.CategoryID --3
having count(p.CategoryID) >= 10 --4 --TotalProducts chua ton tai
order by TotalProducts asc; --6 --TotalProducts da ton tai

-- vi du -- 
-- danh so thu tu thuc hien cua cau truy van sau
select top 3 /*9*/ p.ProductID, o.Discount, o2.ShipCountry --8
from Products p --1
inner join [Order Details]o --2
on p.ProductID = o.ProductID --3
inner join Orders o2 --4
on o.OrderID = o2.OrderID --5
where o.Discount = 0.25 and o2.ShipCountry = 'Germany' --6
order by p.ProductID desc; --10