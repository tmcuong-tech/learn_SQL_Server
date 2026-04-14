-- hay loc ra tat ca cac khach hang co ten lien he bat dau bang chu 'A'
select *
from Customers
where ContactName like 'A%';

-- hay lap ra tat ca cac khach hang co ten lien he bat dau bang chu 'H'
-- va co chu thu 2 la bat ky ky tu nao 
select *
from Customers
where ContactName like 'H_%';

-- hay loc ra tat ca cac don hang duoc gui den thanh pho co chu cai bat dau la 'L'
-- chu cai thu hai la 'u' hoac 'o'
select *
from Orders
where ShipCity like 'L[u,o]%';

-- hay loc ra tat ca cac don hang duoc gui den thanh pho co chu cai bat dau la 'L'
-- chu cai thu hai khong phai la 'u' hoac 'o'
select *
from Orders
where ShipCity like 'L[^u,0]%';


-- hay loc ra tat ca cac don hang duoc gui den thanh pho co chu cai bat dau la 'L'
-- chu cai thu hia la cac ky tu tu 'a' den 'e'
select *
from Orders
where ShipCity like 'L[a-e]%';

-- bai tap 1 --
-- hay lay ra tat ca cac nha cung cap hang co ten cong ty bat dau bang chu 'A'
-- va khong chua ky tu 'b'
select *
from Suppliers
where ContactName like 'A[^b]%';