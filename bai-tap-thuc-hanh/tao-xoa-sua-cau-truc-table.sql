--tao bang moi
/*
create table table_name (
	columnName1 column type [other constraints],
	columnName2 column type [other constraints],
	...
	colunmNamen column tupe [other constraints]
)
*/

--vi du tao bang
/*
create table [NhanVien] (
	[MaNV] int not null primary key,
	[HoTen] varchar(50) not null,
	[Phai] varchar(10),
	[NgaySinh] date,
	[DiaChi] varchar(255),
	[SDT] varchar(10)
);

chu thich:
Bang NhanVien voi cac cot sau:
MaNV: kieu INT, khoa chinh, khong chua gia tri NULL (khong de trong)
HoTen: kieu varchar(50) khong chua gia tri NULL
Phai: kieu varchar(10)
NgaySinh: kieu date
DiaChi: kieu varchar(255)
SDT: kieu varchar(10)
*/

create table NhanVien(
	MaNV int not null primary key,
	HoTen varchar(50) not null, 
	Phai varchar(50),
	NgaySinh date,
	DiaChia varchar(255),
	SDT varchar(10)
);

/*
constraints - cac lenh bo sung khi tao bang
identity: tao cot tu tang
identity(seed, increment): tao cot tu tang voi gia tri seed va increment
default: thiet lap gia tri mac dinh cho cot
check: thiet lap rang buoc kiem tra cho cot
unique: thiet lap rang buoc duy nhat cho cot
*/

-- tao bang khach hang
create table KhachHang(
	MaKH int identity (100, 5) not null primary key, 
	TenKH varchar(50) not null,
	DiaChi varchar(255),
	SDT varchar(10) check (SDT like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

create table KhachHang1(
	MaKH int identity (100, 5) not null primary key, 
	TenKH varchar(50) not null,
	DiaChi varchar(255),
	SDT varchar(10) check (len(SDT) = 10 and patindex('%[^0-9]%', SDT)=0)
);


/*
thay doi cau truc table

-- them cot
alter table table_name
add column_name datatype;

-- xoa cot
alter table table_name
grop column column_name;

--doi ten cot
alter table table_name
rename column old_name to new_name;

--sua kieu du lieu cot
alter table table_name
alter column cloumn_name datatype;
*/

--them cot Email vao bang NhanVien, kieu varchar(100)
alter table Nhanvien
add Email varchar(100);

--thay doi do dai cot HoTen trong bang NhanVien thanh varchar(100)
alter table NhanVien
alter column HoTen varchar(100);

--them rang buoc cho cot NgaySinh trong bang NhanVien
alter table NhanVien
add constraint NgaySinhCheck check (NgaySinh <= getdate()); --ngay sinh phai nho hon ngay hien tai

/*
cu phap xoa table
--xoa tat ca du lieu trong bang, nhung khong xoa cau truc bang
truncate table table_name;

--xoa hoan toan bang, bao go, ca cau truc va du lieu
drop table table_name;
*/

--xoa du lieu trong bang NhanVien
truncate table NhanVien;

--xoa toan bo bang NhanVien;
drop table NhanVien;

--bai tap
-- tao bang SinhVien voi cac cot sau:
--MaSV: int, khoa chinh, not null
--HoTen: varchar(50), not null
--Lop: varchar(20)
--Nganh: varchar(20)
--DiemTB: float

--them cot email vao bang SinhVien kieu varchar(100)
--sua kieu cot DiemTB trong bang SinhVien thanh decimal(2,1)
--xoa cot nganh khoi bang SinhVien
--them rang buoc cho cot DiemTB trong bang SInhVien de gia tri phai lon hon hoac bang 0
--them rang buoc duy nhat cho cot MaSV trong bang SInhVien

create table SinhVien (
	MaSV int not null primary key,
	HoTen varchar(50) not null,
	Lop varchar(20),
	Nganh varchar(20),
	DiemTB float
);

--them cot email vao bang SinhVien kieu varchar(100)
alter table SinhVien
add Email varchar(100);

--sua kieu cot DiemTB trong bang SinhVien thanh decimal(2,1)
alter table SinhVien
alter column DiemTB decimal(2,1);

--xoa cot nganh khoi bang SinhVien
alter table SinhVien
drop column Nganh;

--them rang buoc cho cot DiemTB trong bang SInhVien de gia tri phai lon hon hoac bang 0
alter table SinhVien
add constraint CheckDiemTB check (DiemTB >= 0);

--them rang buoc duy nhat cho cot MaSV trong bang SInhVien
alter table SinhVien
add constraint MaSVUnique unique(MaSV);