-- hay loc ra tat ca cac khach hang den tu cac quoc gia(Countrt)
-- bat dau bang chu A
select *
from Customers
where Country like 'A%'

-- lay danh sach cac don dat hang duoc gui den cac thanh pho co chua chu 'a'
select *
from Orders
where ShipCity like '%a%';

-- hay loc ra tat ca cac don dat hang voi dieu kien
-- ShipCountry like 'U_'
-- ShipCountry like 'U%'
select *
from Orders
where ShipCountry like 'U_';

select *
from Orders
where ShipCountry like 'U%';

-- bai tap 1 --
-- hay lay ra tat ca cac nha cung cap hang co chu 'b' trong ten cong ty
select *
from Suppliers
where CompanyName like '%b%';


