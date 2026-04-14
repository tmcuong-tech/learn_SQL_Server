/*
cu phap
update table_name
set column = value1, column2 = value2,...
where condition;
*/

--sao chep bang
select * into Customers_1 from Customers;

--cap nhat thong tin cua mot khach hang trong bang Customers
--cap nhat dia chi moi cua khach hang co CustomersID la 'ALFKI'
update Customers_1
set Address = 'new address'
where CustomerID like 'ALFKI'

--sao chep bang
select * into Products_1 from Products;

--tang gia toan bo san phan len 10%
update Products_1
set UnitPrice = UnitPrice*1.1;

--cap nhat thong tin cua san pham co ProductsID
--la 7 trong bag Products de thay doi ten san pham
--thanh 'may tinh xach tay moi'
--va cap nha gia ban thanh 999.999 do la
update Products_1
set ProductName = 'May tinh xach tay moi', UnitPrice = 999.99
where ProductID = 7;

--bai tap
--cap nhat thong tin cua tat ca cac khach hang trong bang Customers 
--co thanh pho (City) la 'Paris', thay doi ten quoc gia (Coutry) thanh 'Phap"
update Customers_1
set City='Paris', Country='Phap'

--cap nhat thong tin cua mot san pham cu the trong bang Products dua tren ProductName
update Products_1
set UnitPrice = '1000.00'
where ProductName='May tinh xach tay moi';