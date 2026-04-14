/*
cu phap co ban

FUNCTION_NAME(expression) OVER (
	[PARTITION BY parttion_expression, ...]
	[ORDER BY sort_expression [ASC | DESC], ...]
	[ROWS BETWEEN frame_specification]
)
*/

--sap xep san pham giam dan theo gia tren toan bo table
select p.ProductID, p.ProductName, p.CategoryID, 
		rank() over (order by UnitPrice desc) as Ranking
from Products p

--sap xep san pham giam dan dua tren the loai
select p.ProductID, p.ProductName, p.CategoryID, p.UnitPrice, 
		rank() over (partition by p.CategoryID order by p.UnitPrice desc) as Ranking
from Products p

-- chen 20 dong du lieu thuc te vao bang 
--tao bang 'SInhVien'
create table [SinhVien](
	[MaSinhVien] int primary key,
	[HoTen] nvarchar(255),
	[DiemTrungBinh] decimal(3, 2),
	[MaLopHoc] int
);

-- chen 20 dong du lieu thuc te vao bang
insert into [SinhVien] ([MaSinhVien], [HoTen], [DiemTrungBinh], [MaLopHoc])
values
	(1, N'Nguyễn Văn A', 3.75, 101),
	(2, N'Trần Thị B', 3.88, 102),
	(3, N'Phạm Văn C', 3.75, 101),
	(4, N'Huỳnh Thị D', 3.92, 103),
	(5, N'Lê Văn E', 3.60, 102),
	(6, N'Ngô Thị F', 3.78, 101),
	(7, N'Trịnh Văn G', 3.65, 102),
	(8, N'Võ Thị H', 3.80, 103),
	(9, N'Đặng Văn I', 3.55, 101),
	(10, N'Hoàng Thị K', 3.95, 102),
	(11, N'Mai Thị L', 3.70, 103),
	(12, N'Lý Thị M', 3.62, 101),
	(13, N'Chu Thị N', 3.85, 102),
	(14, N'Đỗ Thị P', 3.58, 103),
	(15, N'Dương Văn Q', 3.72, 101),
	(16, N'Lâm Thị R', 3.85, 102),
	(17, N'Nguyễn Văn S', 3.36, 101),
	(18, N'Nguyễn Thị T', 3.75, 103),
	(19, N'Nguyễn Văn U', 3.93, 102),
	(20, N'Nguyễn Thị V', 3.67, 101);


-- xep hang sinh vien toan truong dua tren diem so trung binh giam dan
select sv.MaSinhVien, sv.HoTen, sv.DiemTrungBinh, sv.MaLopHoc,
		rank() over (order by sv.DiemTrungBinh desc) Ranking
from SinhVien sv;

-- xep hang sinh vien theo tung lop hoc dua tren diem so trung binh giam dan
select sv.MaSinhVien, sv.HoTen, sv.DiemTrungBinh, sv.MaLopHoc,
		rank() over (partition by sv.MaLopHoc order by sv.DiemTrungBinh desc) Ranking
from SinhVien sv;

-- xep hang sinh vien theo tung lop hoc dua tren diem so trung binh giam dan
select sv.MaSinhVien, sv.HoTen, sv.DiemTrungBinh, sv.MaLopHoc,
		dense_rank() over (partition by sv.MaLopHoc order by sv.DiemTrungBinh desc) Ranking
from SinhVien sv;

-- xep hang sinh vien theo tung lop hoc dua tren diem so trung binh giam dan, khong bi trung hang
select sv.MaSinhVien, sv.HoTen, sv.DiemTrungBinh, sv.MaLopHoc,
		row_number() over (partition by sv.MaLopHoc order by sv.DiemTrungBinh desc) Ranking
from SinhVien sv;

--chung ta se su dung ham LAG() lay thong tin ve don dat hang
--va ngay dat hang cua don hang truoc do cho moi khach hang
select o.CustomerID, o.OrderID, o.OrderDate, 
		lag(o.OrderDate) over (partition by o.CustomerID order by o.OrderDate asc) PreviousOrderDate
from Orders o
order by o.CustomerID, o.OrderDate;

--bai tap
--tinh tong doanh so ban hang nam cho moi khach hang va xep hang khach hang dua tren doanh so ban hang
with TotalPrice as (
	select od.OrderID, sum(od.Quantity*od.UnitPrice) Totals
	from [Order Details] od
	group by od.OrderID
)

select year(o.OrderDate) [year], o.CustomerID, sum(tp.Totals) TotalPriceOfYear,
		dense_rank() over (partition by year(o.OrderDate) order by sum(Totals) desc) ranking
from Orders o
join TotalPrice tp on tp.OrderID = o.OrderID
group by year(o.OrderDate), o.CustomerID;