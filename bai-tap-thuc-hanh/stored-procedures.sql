/*
stored procedure
- tap mot hoac nhieu cac cau lenh sql 
	thanh mot nhom don vi logic va luu tru tren database server
- khi lenh goi chay strored procedure lan dau tien,
	sql server chay no va luu vao bo nho dem, goi la plan cahce 
	nhung lan tiep theo, sql server su dung lai plan cache 
	nen se cho toc do xu ly toi uu
*/

/*
-- phap
create procedure [database_name].[schema_name].[procedure_name]
(
	[parameter_1] [datatype], [parameter_2] [datatype],...
)
as begin
	[statements]
end
*/

--tao mot stored procedure de lay thong tin ve san pham
--dua tren ten san pham duoc cung cap
create procedure GetProductByName 
	@ProductName nvarchar(100)

as
begin
	select * from Products p
	where p.ProductName = @ProductName
end

--su dung
exec GetProductByName 'Chai'
exec GetProductByName 'Chang'
exec GetProductByName 'Ikura'

--tao mot stored procedure de tinh tong doanh so ban hang
--cua mot nhan vien dua tren EmployeeID
create procedure GetEmployeeSalesTotal
	@EmployeeID int
as
begin
	select sum(od.Quantity*od.UnitPrice) TotalSales
	from Orders o
	join [Order Details] od on od.OrderID = o.OrderID
	where o.EmployeeID = @EmployeeID
end

exec GetEmployeeSalesTotal @EmployeeID = 1;

--tao mot stored procedure de them moi mot khach hang vao bang
create procedure AddCustomer
	@CustomerID nvarchar(5),
	@CompanyName nvarchar(40),
	@ContactName nvarchar(30),
	@ContactTitle nvarchar (30)
as
begin
	insert into Customers (CustomerID, CompanyName, ContactName, ContactTitle)
	values
		(@CustomerID, upper(@CompanyName), @ContactName, @ContactTitle)
end

exec AddCustomer @CustomerID='NewN',
				 @CompanyName='hehehe',
				 @ContactName='haha',
				 @ContactTitle='hihi';

select * from Customers c
where c.CustomerID='NewN';

--tao mot stored procedure de cap nhat gia cua tat ca cac san pham
--thuoc mot danh muc cu the
create procedure IncreasPrice
	@ProductID int,
	@PriceIncreas decimal(10,2)
as
begin
	update Products 
	set UnitPrice = UnitPrice + @PriceIncreas
	where ProductID = @ProductID
end

exec IncreasPrice @ProductID = 1,
				  @PriceIncreas = 100;

select * from Products p
where p.ProductID=1;

--bai tap
/*
1. Viết một Stored Procedure để truy xuất danh sách 
các đơn đặt hàng cho một khách hàng dựa trên tên khách hàng. 
Tham số đầu vào là tên khách hàng, và Stored Procedure sẽ 
trả về danh sách các đơn đặt hàng liên quan.

2. Viết một Stored Procedure để cập nhật số lượng hàng tồn kho 
cho một sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới. 
Stored Procedure này sẽ nhận vào ID sản phẩm và số lượng mới, 
sau đó cập nhật số lượng tồn kho trong bảng Products.

3. Viết một Stored Procedure để truy xuất danh sách 
các sản phẩm thuộc một danh mục cụ thể và giới hạn 
số lượng sản phẩm trả về. Tham số đầu vào bao gồm 
ID danh mục và số lượng sản phẩm cần trả về.

4. Viết một Stored Procedure để truy xuất danh sách khách hàng 
dựa trên khu vực địa lý (Region) hoặc quốc gia (Country) của họ. 
Tham số đầu vào sẽ là khu vực địa lý hoặc quốc gia và 
Stored Procedure sẽ trả về danh sách các khách hàng trong khu vực đó.
*/

--1
create procedure ListOrderByCustomerName
	@CustomerName nvarchar(50)
as
begin
	select o.*
	from Customers c
	join Orders o on o.CustomerID = c.CustomerID
	where c.ContactName = @CustomerName
end

exec ListOrderByCustomerName @CustomerName='Maria Anders';


--2
create procedure UpdateUnitsInStock
	@ProductID int,
	@Quantity int
as
begin
	update Products
	set UnitsInStock += @Quantity
	where ProductID = @ProductID
end

exec UpdateUnitsInStock @ProductID=1,
						@Quantity=0;


--3
create procedure ListProductsOfCategory
	@CategoryID int,
	@ReturnQuantity int
as
begin
	select top (@ReturnQuantity)*
	from Products p
	where p.CategoryID = @CategoryID
end

exec ListProductsOfCategory @CategoryID = 1,
							@ReturnQuantity=4;


--4
create procedure ListCustomerFromCountry
	@Region nvarchar(50) = null,
	@Country nvarchar(50) = null
as
begin
	select c.ContactName
	from Customers c
	where (c.Region = @Region) or (c.Country = @Country)
end

exec ListCustomerFromCountry @Country = 'USA';