-- tính số lượng sản phẩm còn lại trong kho (UnitInStock)
-- sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder)
select ProductID
		, ProductName
		, UnitsInStock - UnitsOnOrder as StockRemaining
from Products;

-- tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
select *
		, UnitPrice * Quantity as OrderDrtailValue
from [Order Details];

-- tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình
-- của các đơn đặt hàng trong bảng Orders só với giá trị vận chuyển của đơn hàng lớn nhất )MaxFreight)
select avg(Freight)/max(Freight) as FreigthRatio
from Orders;

-- bài tập 1 --
-- hãy liệt kê danh sách các sản phẩm, và gía (UnitPrice) cảu từng sản phẩm sẽ được giảm đi 10%
-- cách 1: dnugf pháp nhân + phép chia
-- cách 2: chỉ dùng phép nhân

-- cách 1 --
select ProductID
	, ProductName
	, UnitPrice
	, (UnitPrice * 90)/100 as [giá đã giảm] 
from Products;

-- cách 2 --
select ProductID
	, ProductName
	, UnitPrice
	, UnitPrice * 0.9 as [giá đã giảm] 
from Products;