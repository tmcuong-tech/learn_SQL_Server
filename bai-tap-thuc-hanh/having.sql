-- hay cho biet nhung khach hang nao da dat nhieu hon 20 don hang
-- sap xep theo thu tu tong os don hang giam dan
select o.CustomerID, 
		count(o.OrderID) as TotalOrderID
from Orders as o
group by o.CustomerID
having count(o.OrderID) > 20
order by count(o.OrderID) desc;

-- hay loc ra nhung nha cung cap san pham co tong so luong hang trong kho (UnitsInStock) lon hon  30
-- va co trung binh don gia (UnitPrice) co gia tri duoi 50
select p.SupplierID,
		sum(p.UnitsInStock) as TotalUnitsInStock,
		avg(p.UnitPrice) as AvgUnitPrice
from Products as p
group by p.SupplierID
having sum(p.UnitsInStock) > 30 and
		avg(p.UnitPrice) < 50;


-- hay cho biet tong so tien van chuyen cua tung thang
-- trong nua nam sau cua nam 1996
-- sap xep theo gia tri tang dan
select month(o.ShippedDate) as [Month],
		sum(o.Freight) as TotalFreight
from Orders as o
where o.ShippedDate between '1996-07-01' and '1996-12-31'
group by month(o.ShippedDate)
-- having
order by month(o.ShippedDate) asc;

-- hay loc ra nhung thanh pho co so luong don hang > 16
-- sap xep theo tong so luong giam gian
select o.ShipCity,
		count(o.OrderID) as TotalOrder
from Orders as o
group by o.ShipCity
having count(o.OrderID) > 16
order by count(o.OrderID) desc;
