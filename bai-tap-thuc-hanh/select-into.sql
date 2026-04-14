--them du lieu vao bang

/*
insert into table_name (column1, column2, column3,...)
values (value1, value2, value3,...);

insert into table_name
values (value1, value2, value3,...);
*/

--them mot khach hang moi
insert into Customers (CustomerID, CompanyName, ContactName, Phone)
values ('KH123', 'haha', 'hehe', '0123456789');

--them nhieu khach hang moi cung luc
insert into Customers (CustomerID, CompanyName, ContactName, Phone)
values 
	('KH123', 'haha', 'hehe', '0123456789'),
	('KH124', 'haha', 'hehe', '0123456789'),
	('KH125', 'haha', 'hehe', '0123456789'),
	('KH126', 'haha', 'hehe', '0123456789');

--them mot san pham moi
insert into Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock)
values ('New Product', 1, 2, '24 bottles', 10.99, 100);

--bai tap
--dung insert into de them nha cung cap vao bang Suppliers
--SupplierName:'New Supplier'
--ContactName:'John Smith'
--ContactTitle:'Sales Manager'
--Address:'123 Supplier Street'
--City:'New York'
--Region:'NY'
--PostalCode:'10001'
--Coutry:'USA'
--Phone:'555-555-5555'
--Fax:'555-555-5556'
--HomePage:'http://www.newsupplier.com'

insert into Suppliers (SupplierID, ContactName, ContactTitle, Address, City,
						Region, PostalCode, Country, Phone, Fax, HomePage)
values ('New Supplier', 'John Smith', 'Sales Manager', '123 Supplier Street',
		'New York' 'NY' , '10001', 'USA', '555-555-5555', '555-555-5556', 'http://wwwnewsupplier.com');

--dung lenh insert into de them don hang
--CustomerID: chon mot ma khach hang hien co trong bang Custonmers
--EmployeeID: chon mot mna nhan vien hien co trong bang Employees
--OrderDate: su dung ngay hien tai
--ShipVia: chon mot ma Shipper hien co trong bang Shippers

insert into Orders (CustomerID, EmployeeID, OrderDate, ShipVia)
values ('ANART', '1', getdate(), '1');