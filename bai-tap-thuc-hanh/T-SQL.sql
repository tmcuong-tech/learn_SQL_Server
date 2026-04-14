/*
T-SQL
- T-SQL (Transact-SQL): la cu phap ngon ngu la trinh mo rong cua ngon ngu TSQL
- gom cac tinh nang nhu: kiem saot giao dich, xu ly loi va cac bien duoc khai bao
*/

/*
-- khai bao vien
declare @CustomerName nvarchar(50)
declare @OrderTotal money

--gan gia tri cho bien
set @CustomerName = 'John Doe'
set @OrderTotal = 100.50

--su dung bien trong tuy van
select * from Orders o
where CustomerName = @CustomerName;

--su dung bien trong Stored Procedure
create procedure GetOrdersByTotal
	@MinTotal money
as
begin
	select * from Orders o
	where OrderTotal >= @MinTotal
end

--goi Strored Procedure va truyen bien
exec GetOrdersByTotal @MinTotal = @OrderTotal
*/