-- lay ra tat ca cac don hang chua duoc giao hang
-- (ShippedDate => NULL)
select *
from Orders
where ShippedDate is null;

select count(*)
from Orders
where ShippedDate is null;

-- lay danh sach cac khach hang co khu vuc (Region) khon bi NULL
select *
from Customers
where Region is not null;

-- lay ra danh sach cac khach hang khong co ten cong ty (CompanyName)
select *
from Customers
where CompanyName is null;

-- hay lay ra tat ca cac don hang chua duoc giao hang
-- va co khu vuc giao hang (ShipRegion) khong bi NULL
select *
from Orders
where ShippedDate is null and ShipRegion is not null;