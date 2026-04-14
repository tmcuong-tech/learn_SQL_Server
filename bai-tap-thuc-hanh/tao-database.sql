--tao database moi
/*
create datebase DataBaseName;
*/
--vi du: tao database
/*
create database employees
on
(name = 'employees_data',
	fileName = 'C:\data\employees_data.mdf',
	size = 10MB
	maxSize = 100MB
	fileGrowth = 5MB)
log on
(name = 'employees_log',
	fileName = 'C:\data\employees_log.ldf',
	size = 5MB
	maxSize = 50MB
	fileGrowth = 1MB);
*/
create database nvdb
on
(	name = 'nvdb_data',
	filename = 'C:\data\nvdb_data.mdf',
	size = 10MB,
	maxsize = 100MB,
	filegrowth = 5MB)
log on
(	name = 'nvdb_log',
	filename = 'C:\data\nvdb_log.ldf',
	size = 5MB,
	maxsize = 50MB,
	filegrowth = 5MB);