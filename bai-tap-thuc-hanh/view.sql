/*
view
- trinh bay database theo y muon duoc trich xuat tu mot hoac nhieu table/view khac nhau
- view khong luu data nen duoc biet den la bang ao (virtual table)

cu phap
create view view_name as
select column1, column2,...
from table_name
where condition;
*/

create view MonthlySales as
select year(OrderDate) as  'Year',
		month(OrderDate) as 'Month',
		count(OrderID) as TotalOdOrder
from Orders o
group by year(OrderDate), month(OrderDate);

--truy van den view
select * from MonthlySales;

--tuong duong
select * from (
select year(OrderDate) as  'Year',
		month(OrderDate) as 'Month',
		count(OrderID) as TotalOdOrder
from Orders o
group by year(OrderDate), month(OrderDate)
)as temp;

--tao view ket hop thong tin ve khach hang va don hang
create view CustomersOrders as
select c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, o.OrderDate, ShipCountry
from Customers c
join Orders o
on c.CustomerID = o.CustomerID;

create view OrderTotalValues as
select o.OrderID, o.CustomerID, o.OrderDate,
		sum(od.Quantity * (od.UnitPrice - (od.UnitPrice * od.Discount))) TotalOrderValue
from Orders o
join [Order Details] od
on o.OrderID = od.OrderID
group by o.OrderID, o.CustomerID, o.OrderDate;

/*
check option
--la mot cau dieu kien cho phep xac dinh rang buoc ve viec cap nhat hoac chen data
--dam bao data duoc chen hoac cap nhat thong qua view luon tuan theo dieu kien cu the
*/

--dung check option cho phep chen data thoa man dieu kienm
--co mot viw ten 'HighValueProducts' hiem thi san pham co gia tri > $500
create view HighValueProducts as
select p.ProductID, p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice > 500
with check option;

/*
update table view
--mot view duoc cau hinh cho phep cap nhat neu no duoc tao 
--dua tren bang database va tuan theeo mot so yeu cau
	- view phai duoc tao bang cach su dung select, khong duoc chua cac phep toan
			set, union, distinct, hoac group by phuc tap
	- view khong duoc chua cac cot tinh toan 
	- view phai co du cac truong can thiet de cap nhat

read only view
- cach chan update/delete/insert toi view
	-cach 1: phan quyen user
	-cach 2: lam cho viec update data qua view luon vi pham 1 trong nhung dieu kien
*/

--view vi pham (union) -> khong duoc update/delete/insert view neu khong mong muon
create view EmployeeViewReadOnly as
select e.EmployeeID, e.FirstName, e.LastName
from Employees e
union all
select null, null, null;


/*
1. Tạo một View có tên "HighValueProducts" để hiển thị danh sách các sản phẩm có giá trị cao hơn $50.
2. Tạo một View có tên "CustomerOrders" để hiển thị thông tin về khách hàng và số lượng hàng của họ.
3. Tạo một View có tên "EmployeeSalesByYear" để hiển thị tổng doanh số bán hàng của từng nhân viên theo năm.
4. Tạo một View có tên "CategoryProductCounts" để hiển thị số lượng sản phẩm trong mỗi danh mục sản phẩm.
5. Tạo một View có tên "CustomerOrderSummary" để hiển thị tổng giá trị đặt hàng của mỗi khách hàng.
*/

--cau 1
create view HighValueProducts as
select p.ProductID, p.ProductName, p.UnitPrice
from Products p
where p.UnitPrice > 50;

-- cau 2
create view CustomerOrders as
select c.CustomerID, count(o.OrderID) TotalOrders
from Orders o
join Customers c
on c.CustomerID = o.CustomerID
group by c.CustomerID

--cau 3
CREATE VIEW EmployeeSalesByYear AS
SELECT 
    e.EmployeeID,
    YEAR(o.OrderDate) AS OrderYear,
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalSales
FROM Employees e
JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
GROUP BY 
    e.EmployeeID,
    YEAR(o.OrderDate);

--cau 4
create view CategoryProductCounts as
select c.CategoryID, c.CategoryName, sum(p.ProductID) TotalProducts
from Categories c
join Products p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName;

--cau 5
create view CustomerOrderSummary as
select c.CustomerID,
		SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalSales
from Customers c
join Orders o on o.CustomerID = c.CustomerID
join [Order Details] od on od.OrderID = o.OrderID
group by c.CustomerID;