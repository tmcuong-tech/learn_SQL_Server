-- so fibo
WITH fibo(prev_n, n, step) AS (
    -- khởi tạo
    SELECT 0, 1, 1

    UNION ALL

    -- đệ quy
    SELECT 
        n,
        prev_n + n,
        step + 1
    FROM fibo
    WHERE step < 10   -- số lượng phần tử Fibonacci muốn lấy
)
SELECT prev_n, n AS Fibonacci
FROM fibo;

--de quy
WITH giaithua(n, gt) AS (
    -- khởi tạo
    SELECT 1, 1   -- 1! = 1

    UNION ALL

    -- đệ quy
    SELECT 
        n + 1,
        gt * (n + 1)
    FROM giaithua
    WHERE n < 5
)
SELECT * FROM giaithua;

--su dung truy van de quy de tao mot cay cau truc quya ly cua nhan vien trong bang 'Employees'
--trong do 'ReposrrsTp' chi la ma chua nguoi quan ly
declare @EmployeeID int
set @EmployeeID=2;

with e_cte as (
	-- khoi tao
	select e.EmployeeID, 
			e.FirstName+' '+e.LastName as Name,
			e.ReportsTo as ManagerID,
			0 as level
	from Employees e
	where e.EmployeeID=@EmployeeID
	
	union all
	-- de quy
	select 
			e1.EmployeeID, 
			e1.FirstName+' '+e1.LastName as Name,
			e1.ReportsTo as ManagerID,
			level+1 as level
	from Employees e1
	join e_cte on e1.ReportsTo=e_cte.EmployeeID
)
select * from e_cte
option (maxrecursion 500);