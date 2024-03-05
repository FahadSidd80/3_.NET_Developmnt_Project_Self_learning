create database DB_112223_L2
use DB_112223_L2

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
age int,
salary int,
city varchar(100),
status int default 0,
inserted_date date default Getdate()-- means today date lega.
)

--  primary key -- No Null, No duplicate value
--Identity -- Auto increment  
-- int type column me no single quotes req.
select * from tblEMployee

drop table tblEmployee

insert into tblEmployee(name,age,salary,city)values('Fahad',23,4000,'Sultanpur')
insert into tblEmployee(name,age,salary,city)values('Hamza',27,4500,'Kanpur')
insert into tblEmployee(name,age,salary,city)values('Ali',28,5000,'Lucknow')
insert into tblEmployee(name,age,salary,city)values('Abdul',24,6000,'Delhi')
insert into tblEmployee(name,age,salary,city)values('Anas',22,10000,'Agra')
insert into tblEmployee(name,age,salary,city)values('Wamique',21,19000,'Noida')
insert into tblEmployee(name,age,salary,city)values('hasan',29,2000,'Varanasi')

select * from tblEmployee


update tblEmployee set name='Kamran',age=29,city='Baliya' where empid = 3
delete from tblEmployee where empid=5

update tblEMployee set name='Abbas', age=45, city='Lucknow' where empid = 5
delete from tblEmployee where empid=6

update tblemployee set name='Zarrish' , age= 24, city='Bareli' where empid =3

delete from tblemployee where empid=5
-----------------------------------------------------------------------------------------------
--Interview Questions

insert tblEmployee(name,age,salary,city)values('Asif',30,9800,'Jaunpur')
delete tblEmployee where empid=8

-- here in Insert Query into is optional
-- and in Delete Query from is optional

select * from tblEMployee
delete tblemployee where empid=7

insert tblemployee(name,age,salary)values('Kamran',34,24242)



------------------------------------------------------------------------------------------------


create database DB_JOIN_04102023_L2
use DB_JOIN_04102023_L2
---lecture No 21

create table tblEmployee
(
empid int  primary key identity, -- primary key.
name varchar(100),
countryid int
)
-- Changing type of Country column
alter table tblEmployee alter column country varchar(100)
alter table tblEmployee alter column country int
alter table tblEMployee alter column countryid varchar(100)
alter table tblEMployee alter column countryid int


insert into tblEmployee(name,countryid)values('Fahad','1')
insert into tblEmployee(name,countryid)values('Hamza','2')
insert into tblEmployee(name,countryid)values('Ali','3')
insert into tblEmployee(name,countryid)values('Faraz','4')
insert into tblEmployee(name,countryid)values('Almas','5')
insert into tblEmployee(name,countryid)values('Aman','6')
insert into tblEmployee(name,countryid)values('Anas',7)

select * from tblEmployee
drop table tblEmployee

create table tblCountry
(
countryid int primary key identity,-- act as foreign key.
cname varchar(100)
)

select * from tblCountry
delete from tblcountry where countryid = 23
drop table  tblCountry

insert into tblCountry(cname)values('India')
insert into tblCountry(cname)values('Pakistan')
insert into tblCountry(cname)values('USA')
insert into tblCountry(cname)values('Canada')
insert into tblCountry(cname)values('Russia')
insert into tblCountry(cname)values('UAE')
insert into tblCountry(cname)values('Egypt')

select * from tblEmployee
select * from tblCountry


select * from tblEmployee join tblCountry on tblEmployee.Countryid = tblCountry.countryid
select empid,name,cname from tblEmployee join tblCountry on tblEmployee.countryid = tblCountry.countryid


select empid as EmployeeID,name EmployeeName,cname CountryName from tblEmployee join tblCountry on tblEmployee.countryid = tblCountry.countryid

select * from tblEmployee join tblCountry on tblEmployee.country=tblCountry.cid
----------------------------------------------------------------------
select empid,name,cname from tblEmployee join tblCountry on tblEmployee.country=tblCountry.cid
----
--create table tblEmployee_2
--(
--empid int  primary key identity,
--empid1 int primary key identity,
--name varchar(100),
--country int  
--)
-- In one table only 1 pK and identity is allowed.


-----------------------------------------------------------------------

create table tblCountry_3
(
cid int   primary key identity(1,2),
cname varchar(100)
)
insert into tblCountry_3(cname)values('India')
insert into tblCountry_3(cname)values('Pakistan')
insert into tblCountry_3(cname)values('USA')
insert into tblCountry_3(cname)values('Canada')
insert into tblCountry_3(cname)values('Russia')
insert into tblCountry_3(cname)values('UAE')
insert into tblCountry_3(cname)values('Egypt')


select * from tblCountry_3
drop table tblCountry_3
---------------------------------------------------------------------------

create table tblBook
(
bid int primary key identity(1,3),-- (3-1=2 ka diiference in ID)
bookname varchar(100)
)
drop table tblBook

insert into tblBook(bookname)values('Math')
insert into tblBook(bookname)values('Science')
insert into tblBook(bookname)values('English')
insert into tblBook(bookname)values('Hindi')
insert into tblBook(bookname)values('Urdu')
insert into tblBook(bookname)values('Sanskrit')
insert into tblBook(bookname)values('SST')


select * from tblBook

--------------------------------------------
create table tblCountry_2
(
cid varchar(100) primary key ,
cname varchar(100)
)

drop table tblCountry_2

insert into tblCountry_2(cid,cname)values(1123,'India')
insert into tblCountry_2(cid,cname)values('1123','Pakistan')
--insert into tblCountry_2(cid,cname)values('1123','USA') -- duplicate
insert into tblCountry_2(cid,cname)values('10','Canada')
--insert into tblCountry_2(cid,cname)values('10','Russia') -- duplicate
insert into tblCountry_2(cid,cname)values('11HH','USA')
insert into tblCountry_2(cid,cname)values('10XX','Canada')
--insert into tblCountry_2(cid,cname)values('10XX','Russia') -- duplicate
insert into tblCountry_2(cid,cname)values('','UAE')
delete tblCountry_2 where cid=''
--insert into tblCountry_2(cid,cname)values('','Egypt') -- duplicate
insert into tblCountry_2(cid,cname)values('1123','USA') -- duplicate
insert into tblCountry_2(cid,cname)values('0','Canada')
delete tblCountry_2 where cid='0'
--insert into tblCountry_2(cid,cname)values('null','Russia') -- duplicate
--insert into tblCountry_2(cid,cname)values('1123','USA') -- duplicate
insert into tblCountry_2(cid,cname)values('  ','Canada')
--insert into tblCountry_2(cid,cname)values('NULL','Russia') -- duplicate

select * from TblCountry_2

insert into TblCountry_2(cid,cname) values('1','Pakistan')
--------------------------------------------------------------


-- lecture No 22
-- Lecture 2-- JOIN Before advanced
--will count no of table in Database
create database DB_112223_L3 
use DB_112223_L3


SELECT COUNT(*)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'


SELECT COUNT(*)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'-- This Query Count no of table present in Current Database


create table tblEmployee
(
id int primary key identity,
name varchar(50),
salary int,
countryid int,
status int default 0,
inserted_date date
) 

insert into tblEmployee(name,salary,countryid,inserted_date)values('alok',500,1, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Arvind',700,2, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Shubhanshi',900,3, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Sweta',300,4, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Hitesh',800,5, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Deepak',500,6, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Fahad',800,7, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Hamza',500,8, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Kamran',800,9, GETDATE())
insert into tblEmployee(name,salary,countryid,inserted_date)values('Anans',500,10, GETDATE())

delete from tblEmployee where id=10

select * from tblEmployee 

truncate table tblEmployee-- delete all records and we can use new ID  but table remain.
drop table tblEmployee-- delete whole table object,need to create new table gain
delete  from tblEmployee where name='alok'  and id=1-- delete all records but we cant use new id

create table tblCountry
(
countryid int primary key identity,
cname varchar(50)
)

truncate table tblCountry-- isme table along with ID Delete ho jaegi..but table nahi.
drop table tblCountry
select * from tblCountry

insert into tblCountry(cname)values('India')
insert into tblCountry(cname)values('Pakistan')
insert into tblCountry(cname)values('Japan')
insert into tblCountry(cname)values('USA')
insert into tblCountry(cname)values('Canada')
insert into tblCountry(cname)values('Colambia')
insert into tblCountry(cname)values('Afghanistan')
insert into tblCountry(cname)values('UAE')
------------------------------------------------------



-- JOIN
select * from tblEmployee
select * from tblCountry

select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
select * from tblEmployee join tblCountry on  tblCountry.countryid = tblEmployee.countryid
select * from tblEmployee inner join tblCountry on tblCountry.countryid = tblEmployee.countryid
select * from tblEmployee inner join tblCountry on  tblEmployee.countryid =tblCountry.countryid 
--------Both above join query are same. means give same output

select * from tblEmployee join tblCountry on tblEmployee.countryid = tblcountry.countryid
-- extract all record of both table

select top(1) * from tblEMployee inner join tblCountry on tblEMployee.countryid = tblcountry.countryid

select top(1) * from tblEmployee join tblcountry on tblemployee.countryid = tblcountry.countryid

select * from tblEMployee join tblCountry on tblEMployee.countryid = tblcountry.countryid

select * from tblcountry
-- Self Join sifr matched record nikalega table se. unmatched ko nahi na hi null record dega. means act as union of math

select tblEMployee.name as EmpName,tblEMployee.salary as EmpSalary,tblEMployee.inserted_date as InsertedDate,tblcountry.cname as CountryName from tblEMployee join tblCountry on tblEmployee.countryid = tblCountry.COuntryid

------------------------------------------------------------------------------------------
select * from tblCountry join tblEmployee on tblEmployee.countryid = tblCountry.countryid -- it gives country table on left
select * from tblCountry join tblEmployee on tblCountry.countryid = tblEmployee.countryid
select * from tblCountry inner join tblEmployee on tblEmployee.countryid = tblCountry.countryid -- it gives country table on left
select * from tblCountry inner join tblEmployee on tblCountry.countryid = tblEmployee.countryid  
--------Both above join query are same. means give same output

--NOTE :- If we change type of Countryid column then no affect happen in join.
-- Eg: 
alter table tblEmployee  alter column countryid varchar(100)
select * from tblCountry join tblEmployee on tblEmployee.countryid = tblCountry.countryid 

select top(2) * from tblEmployee inner join  tblCountry on tblEmployee.countryid = tblcountry.countryid
--*-- means select all columns na ki rows.
select top(2) name,salary from tblEmployee inner join  tblCountry on tblEmployee.countryid = tblcountry.countryid
--------------------------------------------------------------------------------------------------


select id,name,salary,cname from tblEmployee join Country on tblEmployee.countryid=Country.countryid
-- this query gives selected column from Joined table....
---------------------------------------------------------------------------------------
select id,name,salary from tblEmployee
select id,name from tblEmployee -- this query gives selected column
--------------------------------------------------------------

select id,name,salary,cname from tblEmployee join tblCountry on tblEmployee.countryid=tblCountry.countryid
select tblEmployee.id,tblEmployee.name,tblEmployee.salary,tblCountry.cname from tblEmployee join tblCountry on tblEmployee.countryid=tblCountry.countryid
-----Both above query gives same output.........

select tblEMployee.name as EmpName,tblEMployee.salary as EmpSalary,tblEMployee.inserted_date as InsertedDate,tblcountry.cname as CountryName from tblEMployee inner join tblCountry on tblEmployee.countryid = tblCountry.COuntryid


---ALIASING------

---THIS CONCEPT CALLLED ALIASING IN DATABSE WHICH IS MOST MOST IMPORTANT PART OF DB.
select tblEmployee.id,tblEmployee.name as EmployeeName,tblEmployee.salary,tblCountry.cname 
as CountryName from tblEmployee 
join tblCountry on tblEmployee.countryid=tblCountry.countryid

select id as EmpID, name as EmpName , salary EmpSalary, cname as CountryName from tblEmployee 
join tblCountry on tblEMployee.countryid = tblcountry.countryid


select tblEmployee.id,tblEmployee.name as tblEmployeeName from tblEmployee
select tblEmployee.id,tblEmployee.name as tblEmployeeName from tblEmployee 
join tblCountry on tblEmployee.countryid=tblCountry.countryid

-- last exect on 26/04/23

select tblEmployee.id,tblEmployee.name as EmployeeName from tblEmployee 
select tblEmployee.id,tblEmployee.name from tblEmployee

select tblEmployee.id as EmployeeID from tblEmployee

select tblEmployee.id as EmployeeID, tblEmployee.name as EmployeeName from tblEmployee 

select tblEmployee.id as EmployeeID, tblEmployee.name as EmployeeName, tblEmployee.salary as EmployeeSalary from tblEmployee

select tblEmployee.id as EmployeeID, tblEmployee.name as EmployeeName, tblEmployee.salary as EmployeeSalary, tblCountry.countryid as CountryID, tblCountry.cname as CountryName from tblEmployee join tblCountry on tblEmployee.Countryid= tblCountry.countryid

-- as/ AS is optional in aliasing eg:- given below
select tblEmployee.id  EmployeeID, tblEmployee.name  EmployeeName, tblEmployee.salary  EmployeeSalary, tblCountry.countryid  CountryID, tblCountry.cname  CountryName from tblEmployee join tblCountry on tblEmployee.Countryid= tblCountry.countryid

-------------------------------------------------------Aliasing me aur kya hai pata nahi------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------JOIN-----------------------------------------------------------------------------

--JOIN
--1) INNER JOIN (JOIN) 
--2) OUTER JOIN  ---- a) LEFT JOIN b) RIGHT JOIN c) FULL JOIN
--3) CROSS JOIN


-- INNER JOIN --  Returns only records that have matching values in both tables by W3C

--JOIN kaho ya INNER JOIN Both are same........... Inner keyword has no significance
select * from tblEmployee inner join tblCountry on tblEmployee.countryid=tblCountry.countryid 
-- Inner is optional, Kahani hai, only concept hai theory waala kuch written me nahi hai
select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid

select * from tblEmployee join tblCountry on tblEMployee.countryid = tblcountry.countryid

select * from tblEmployee
select * from tblCountry
--------------------------------------------------------------------------------------------

--OUTER JOIN  


-- 1. LEFT JOIN 
-- 2. RIGHT JOIN
-- 3. FULL JOIN

---OR ----
-- OUTER is optional, Kahani hai, only concept hai theory waala, kuch written me nahi hai

-- 1. LEFT OUTER JOIN 
-- 2. RIGHT OUTER JOIN
-- 3. FULL  OUTER JOIN


-----------------------------------------------------------------------------------------------------------------------------
--1. LEFT JOIN 


select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee left outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEMployee left outer join tblCountry on tblEmployee.countryid = tblCountry.countryid
select * from tblCountry left outer join tblEmployee on tblCountry.countryid = tblEmployee.countryid




select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee left outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
-- JOIN,LEFT JOIN , LEFT OUTER JOIN all are same gives same outp


--1. LEFT OUTER JOIN  --Returns all records from the left table, and the matched records from the right table
select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee left outer join tblCountry on tblEmployee.countryid=tblCountry.countryid


select * from tblemployee left join tblcountry  on tblemployee.countryid = tblcountry.countryid
select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
-- LEFT JOIN , LEFT OUTER JOIN all are same gives same output


------------------------------------------------------------------------------------------------------------------------------------------------------


-- 2. RIGHT JOIN -- Returns all records from the right table, and the matched records from the left table


select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEmployee right join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee right outer join tblCountry on tblEmployee.countryid=tblCountry.countryid


select * from tblEmployee right outer join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblcountry right outer join tblemployee on tblemployee.countryid = tblcountry.countryid

select * from tblcountry right outer join tblemployee on tblemployee.countryid = tblcountry.countryid
select * from tblcountry right outer join tblemployee on tblcountry.countryid = tblemployee.countryid


select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid

--2. RIGHT OUTER JOIN   -- OUTER is optional, Kahani hai, only concept hai theory waala, kuch written me nahi hai
-- Returns all records from the right table, and the matched records from the left table

select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee left outer join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee right join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee right outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblemployee right outer join tblcountry on tblemployee.countryid =  tblcountry.countryid


--------------------------------------------------------------------------------------------------------------------------
--3.	FULL JOIN-- Returns all records when there is a match in either left or right table
--dono table record dega jo match ho raha hai aur jo nahi ho raha hai. 

select * from tblEmployee full join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee full outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from  tblCountry full outer join tblEmployee on tblEmployee.countryid = tblcountry.countryid

select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee left outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEmployee right join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee right outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
select * from tblEmployee inner join tblCountry on tblEmployee.countryid= tblCountry.countryid

select * from tblEmployee full outer join tblCountry 
on tblEmployee.countryid = tblcountry.countryid

select * from tblCountry full outer join tblemployee on tblemployee.countryid = tblcountry.countryid

select * from tblemployee full outer join tblcountry on tblemployee.countryid = tblcountry.countryid
on tblcountry.countryid = tblemployee.countryid

select * from tblemployee full outer join tblcountry

--3.	FULL  OUTER JOIN -- The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

select * from tblEmployee full join tblCountry on tblEmployee.Countryid=tblCountry.countryid
select * from tblEmployee full outer join tblCountry on tblEmployee.Countryid=tblCountry.countryid

select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee left outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEmployee right join Country on tblEmployee.countryid=Country.countryid
select * from tblEmployee right outer join tblCountry on tblEmployee.countryid=tblCountry.countryid

select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
select * from tblEmployee inner join tblCountry on tblEmployee.countryid= tblCountry.countryid

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. CROSS JOIN 
select * from tblEmployee cross join tblCountry -- gives total combinations of id
-- like employee table has 7 unique records and Country table has 3 unique records  so total possible condition will be 7*3 = 21

select * from tblEmployee cross join tblcountry
select * from  tblcountry cross join  tblEmployee

select * from tblcountry cross join tblemployee

------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from tblEmployee join tblCountry on tblEmployee.countryid= tblCountry.countryid
select * from tblEmployee left join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee right join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee full join tblCountry on tblEmployee.countryid=tblCountry.countryid
select * from tblEmployee cross join tblCountry 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--JOIN or INNER JOIN 
select * from tblemployee join tblcountry on tblemployee.countryid = tblcountry.countryid -- like intersection 
select * from tblemployee inner join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblcountry join tblemployee on tblemployee.countryid = tblcountry.countryid
select * from  tblcountry inner join tblemployee  on tblemployee.countryid = tblcountry.countryid

-- LEFT JOIN OR LEFT OUTER JOIN
select * from tblemployee left join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblemployee left outer join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblcountry left join tblemployee on tblemployee.countryid = tblcountry.countryid
select * from tblcountry left outer join tblemployee on tblemployee.countryid = tblcountry.countryid

--RIGHT JOIN OR RIGHT OUTER JOIN
select * from tblemployee right join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblemployee right outer join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblcountry right outer join tblemployee on tblemployee.countryid = tblcountry.countryid
select * from tblcountry right outer join tblemployee on tblemployee.countryid = tblcountry.countryid


--FULL JOIN  OR FULL OUTER JOIN
select * from tblemployee full join tblcountry on tblemployee.countryid= tblcountry.countryid
select * from tblemployee full outer join tblcountry on tblemployee.countryid = tblcountry.countryid
select * from tblcountry full join tblemployee on tblemployee.countryid = tblcountry.countryid
select * from tblcountry full outer join tblemployee on tblemployee.countryid = tblcountry.countryid


--CROSS JOIN 
select * from tblemployee cross join tblcountry
select * from tblcountry cross join tblemployee 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--JOIN
--1) INNER JOIN (JOIN)
--2) OUTER JOIN  ---- a) LEFT JOIN b) RIGHT JOIN c) FULL JOIN
--3) CROSS JOIN
--4) SELF JOIN -- A self join is a regular join, but the table is joined with itself.

--04 april23

select * from tblEmployee
select * from tblCountry

-------------------------------------------------------------
--4) SELF JOIN -- A self join is a regular join, but the table is joined with itself.

create table tblCustomers
(
CustomerID	 int primary key identity,
CustomerName varchar(100),	
ContactName	varchar(100),
Address	varchar(100),
City	varchar(100),
PostalCode	int,
Country varchar(100),
status int default 0,
inserted_date date
)

insert into tblCustomers(CustomerName,ContactName,Address,City,PostalCode,Country,inserted_date) values('Fahad','Ali','223, Goln Sultanpur','Sultanpur',228119,'India',GETDATE())
insert into tblCustomers(CustomerName,ContactName,Address,City,PostalCode,Country,inserted_date) values('Ali Hamza','Hamza sid','Vill and Post Kanpur','Kanpur',229817,'India',GETDATE())
insert into tblCustomers(CustomerName,ContactName,Address,City,PostalCode,Country,inserted_date) values('Ali abdul','Abdul sid','123, Sultanpur','Sultanpur',229988,'India',GETDATE())
insert into tblCustomers(CustomerName,ContactName,Address,City,PostalCode,Country,inserted_date) values('Fatima','Fatima sid','Alex Lucknow','Agra',768798,'India',GETDATE())
insert into tblCustomers(CustomerName,ContactName,Address,City,PostalCode,Country,inserted_date) values('Wamique','Wamique shaeikh','POst Agra','Lucknow',989809,'India',GETDATE())

truncate table tblCustomers
drop table tblCustomers

select * from tblCustomers


SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM tblCustomers A, tblCustomers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

select * from tblCustomers  
--11 jan 21 join 3rd -- sir
---------------------------------------------------------------------------------------------------------





--35.a.Database_16_03_2021_before_advance


create database DB_11223_L3
use DB_11223_L3

create table tblEmployee
(
id int primary key identity,
name varchar(50),
gender varchar(50),
salary int,
department varchar(50)
)
insert into tblEmployee(name,gender,salary,department)values('alok','male',400,'IT')
insert into tblEmployee(name,gender,salary,department)values('rubina','female',800,'HR')
insert into tblEmployee(name,gender,salary,department)values('Ashutosh','male',300,'IT')
insert into tblEmployee(name,gender,salary,department)values('pooja','female',500,'Sales')
insert into tblEmployee(name,gender,salary,department)values('Biraj','male',700,'HR')
insert into tblEmployee(name,gender,salary,department)values('alka','female',600,'Sales')
insert into tblEmployee(name,gender,salary,department)values('pp','other',450,'IT')
insert into tblEmployee(name,gender,salary,department)values('kk','other',550,'HR')
insert into tblEmployee(name,gender,salary,department)values('Dayanand','male',350,'Sales')
insert into tblEmployee(name,gender,salary,department)values('Anwar','male',650,'HR')


drop table Employee

select * from tblEmployee



select gender, sum(salary) from tblEMployee group by gender

select gender, sum(salary) from tblemployee group by gender

select gender as EmpGender, sum(salary) TotalSalary from tblEmployee group by gender

select gender as EMpGender, sum(salary) Gender_Wise_Salary_Sum from tblemployee group by gender


select gender, sum(salary) as Total_Salary from tblemployee --group by gender
--Column 'tblemployee.gender' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.



select gender,sum(salary) from Employee
group by gender

select gender,sum(salary)as Total_Salary from Employee
group by gender

select gender,sum(salary) Total_Salary from Employee
group by gender

select department,sum(salary) from Employee
group by department

select department , sum(salary) department_Wise_Salary_Sum from tblemployee group by department

select department EmpDepartment,sum(salary) TotalSalary from tblEmployee group by department


select department,count(*) Total_Employee from Employee
group by department

select department , count(*) Total_EMployee from tblEMployee group by department

select department,count(*) total_Employee from tblEmployee group by department

select name,count(*) Total_Employee from Employee
group by name

select name, count(*) Total_Emp_Same_Name from tblemployee group by name

select * from tblEmployee

-- 

select department,COUNT(*) from tblEmployee group by department

select count(department) from tblEmployee -- count function count no of rows mathing specific condition.

select count(*) from tblEmployee

select count(name) from tblEmployee

select * from tblEmployee

select department, count(*) from tblEmployee group by department-- departmnt wise total employee in department count ho gaye.



---------------------------------------
select count(name),gender,sum(salary) Total_Salary from Employee
group by gender


select count(name) NoOfEmployee, gender,sum(salary) Total_salary from tblEmployee group by gender
select count(gender) NoOfEmployee, gender,sum(salary) total_salary from tblEmployee group by gender


select gender,sum(salary) Total_Salary from Employee where salary > 500
group by gender having sum(salary)>1000

select gender,sum(salary) total_salary from tblEmployee  group by gender having sum(salary) > 1000

select name, count(*) Total_Employee from tblEmployee group by name

select department, count(*) total_employee from tblEmployee group by department
-- select me wahi column select hoga jo group by ya aggregate function me ho--- bus groupby ke case me.
Select gender EMpGender,COUNT(*) TotalEmployee, sum(salary) as TotalSalary from tblEmployee group by gender

select gender EmpGender, Count(*) Total_EMployee , sum(salary) as Total_Salary from tblemployee group by gender
select gender EMpGender, count(gender) Total_Employee, sum(salary) as Total_Salary from tblemployee group by gender

select department EmpDepartment, count(*) Total_Employee_Per_Department, sum(salary) as Total_Salary_Each_Department from tblemployee group by department
select department EmplDepartment, count(department) total_EMployee, sum(salary) as Total_Salary from tblemployee group by department 

Select COUNT(*) TotalEmployee,gender EMpGender, sum(salary) as TotalSalary from tblEmployee group by gender



select gender,sum(salary) Total_Salary from Employee where salary > 500
group by gender having sum(salary)>1000

select gender, sum(salary) Total_Salary from tblEMployee where salary > 500 group by gender
having sum(salary) > 1200

select gender, sum(salary) Total_Salary from tblemployee group by gender having sum(salary) > 2000

--Difference between Where and Having -- both is used to apply condition in table.

--but where is used only to apply condition on table
--and having is used to apply condition on group by
--In short without group by there is no having.

select gender,sum(salary) Total_salary from tblEmployee where salary>500 group by gender
having sum(salary) > 1000

select gender,sum(salary) Total_salary from tblEMployee where salary > 500 group by gender,salary
having salary > 10

select * from tblEmployee

select department , sum(salary) total_Salary from  tblemployee where salary > 500 group by department having sum(salary) >= 1200


-----------------------------------------------------------------------------------------
select * from tblEmployee

-- How to remove duplicate record from table.

delete from Employee where not id in(select max(id)from Employee
group by name,gender,salary,department)


delete from tblEmployee where not id in (1,5,2)

delete from tblEmployee where not id in (select max(id) from tblEmployee group by name,gender,salary,department)
select max(id),name,gender,salary,department from tblEmployee group by name,gender,salary,department

delete from tblEmployee where not id in (select max(id) from tblEmployee group by name,gender,salary,department)
delete from tblEmployee where not id in (select min(id) from tblEmployee group by name,gender,salary,department)


select name,gender, salary, department from tblEmployee group by name,gender,salary,department-- find only unique row

select min(id) as EmpID, name,gender,salary,department from tblemployee group by name,gender,salary,department

delete from tblEmployee where  id in (1002,1004)-- it will delete selected id row completely in ine go
delete from tblemployee where  not id in (1002,1004)-- it will delete all row except the row present in () bracket.

select * from tblEmployee

select min(id) as EmpID from tblemployee group by name,gender,salary,department

delete from tblEmployee where not id in (select min(id) as EmpID from tblemployee 
group by name,gender,salary,department)




-------------------------------------------------------------------------------------------
select * from tblEmployee

select max(salary) from  tblEmployee
select max(salary) from  Employee
select min(salary) from  Employee
select sum(salary) from  Employee
select avg(salary) from  Employee
select count(salary) from  Employee

select max(salary) from tblEmployee -- find maximun slaary value present in slaary column
select min(salary) from tblEmployee -- find minimum slaary value present in slaary column
select sum(salary) from tblEmployee-- it sum all slaary value present in slary column

select avg(salary) from tblEmployee -- 530 -- gives average== total salary value sum / no of slaary value
select count(salary) from tblEmployee

select count(name) from tblEmployee
select count(salary) from tblEmployee
select count(gender) from tblEmployee
select count(department) from tblEmployee



select * from tblEmployee order by name --order by basically works to find value in ascending order by default
select * from tblEmployee order by name desc


select * from tblemployee order by name 
select * from tblemployee order by name desc


select * from Employee order by name desc
select * from Employee order by salary
select * from Employee order by salary desc

select * from tblEmployee order by salary desc

select * from tblEmployee order by salary

select * from tblemployee order by salary 
select * from tblemployee order by salary asc


select top(2) * from tblemployee order by salary desc

select top(1) salary from (
select top(2) salary from tblemployee order by salary desc) ABC order by salary desc

select top(2)* from tblEmployee
select top(2)* from tblEmployee order by id desc

select top(2) * from tblEmployee order by id


select top(3) salary from tblEmployee

select top(1) salary  from 
(select top(3) salary from tblEmployee order by salary desc)ABC_Derivedtable order by salary desc

select min(salary)from
(select top(3)salary from tblEmployee order by salary desc)ABC


select top(1)salary from
(select top(3)salary from tblEmployee order by salary desc)ABC order by salary asc


select top(1) salary from (
select top(2) salary from tblemployee order by salary desc) ABC -- this ABC table is derived table.
order by salary desc

select max(salary) salary from (select top(2) salary from tblEmployee order by salary desc) abc order by salary desc

select min(salary) salary from 
(select top(2) salary from tblEmployee order by salary asc) ABC order by salary asc


----------------------------------------------------------------------------------------------------------

Create database DB_Lecture_4_Advnd
use DB_Lecture_4_Advnd

--36.a.Database_query_18_march_21



create table Employee
(
id int primary key identity,
name varchar(50),
gender varchar(50),
salary int,
department varchar(50),
inserted_date date default getdate(),
status int default 0
)
insert into Employee(name,gender,salary,department)values('alok srivastava','male',400,'IT')
insert into Employee(name,gender,salary,department)values('rubina khan','female',800,'HR')
insert into Employee(name,gender,salary,department)values('Ashutosh kumar','male',300,'IT')
insert into Employee(name,gender,salary,department)values('pooja','female',500,'Sales')
insert into Employee(name,gender,salary,department)values('Biraj','male',700,'HR')
insert into Employee(name,gender,salary,department)values('chintu','female',600,'Sales')
insert into Employee(name,gender,salary,department)values('pp','other',450,'IT')
insert into Employee(name,gender,salary,department)values('kk','other',550,'HR')
insert into Employee(name,gender,salary,department)values('Dayanand','male',350,'Sales')
insert into Employee(name,gender,salary,department)values('Anwar','male',650,'HR')


drop table Employee
select * from Employee
----------execute only create table till this. last learn on - 15/01/24

select gender,sum(salary) from Employee
group by gender

select gender,sum(salary)as Total_Salary from Employee
group by gender

select gender,sum(salary) Total_Salary from Employee
group by gender

select department,sum(salary) from Employee
group by department

select department,count(*) Total_Employee from Employee
group by department

select name,count(*) Total_Employee from Employee
group by name


---------------------------------------
select count(name),gender,sum(salary) Total_Salary from Employee
group by gender

select count(name) TotalEmployee_Genderwise, gender, sum(salary) Total_Salary from Employee group by gender


select gender,sum(salary) Total_Salary from Employee where salary > 500
group by gender having sum(salary)>1000

-------------------------------------------------
select * from Employee

delete from Employee where not id in(select max(id)from Employee
group by name,gender,salary,department)
-------------------------------------------------------------------------------------------
select * from Employee
select max(salary) from  Employee
select min(salary) from  Employee
select sum(salary) from  Employee
select avg(salary) from  Employee
select count(salary) from  Employee



select * from Employee order by name desc
select * from Employee order by salary
select * from Employee order by salary desc

select top(2)* from Employee
select top(2)* from Employee order by id desc


select min(salary)from
(select top(3)salary from Employee order by salary desc)ABC


select top(1)salary from
(select top(3)salary from Employee order by salary desc)ABC order by salary asc

-------------------------------------------------------------------------------------------

update Employee set name=gender,gender=name

update Employee set name=gender , gender = name

select * from Employee

update Employee set gender=
case
when gender='male' then 'female'
when gender='female' then 'male'
end

update Employee set gender=
case
when gender='male' then 'female'
when gender='female' then 'male'
else gender
end


update Employee set gender=
case
when gender='male' then 'female'
when gender='female' then 'male'
else gender
end

select ASCII('Z')
select CHAR(66)


select ASCII('?')
select ASCII('a')

select char(98)

-- print abcd from a to z
declare @start int
set @start=65
while(@start < 91)
begin
	print char(@start)
	set @start=@start+1
end

declare @start1 int
set @start1 = 65
while(@start1 < 91)
begin
	print char(@start1)
	set @start1 = @start1 +1
end





create table Student
(
sid int primary key identity,
sname varchar(50),
salary int
)
select * from Employee
select * from Student

insert into Student select * from Employee -- RUN if both table structure are same
insert into Student(sname,salary) select name,salary from Employee
select * into Product from Employee
select * from kk
select * into kk from Employee where 1=2

insert into student(sname,salary) select name,salary from Employee -- only column type matter--not column name

select * into Product_1 from Employee
select * from Product_1, Employee

select * into Worker from  Employee where 1=2 -- universal jhoot bolna hai where condition me
select * from Worker


----------------------------------------------------------------------------
select * from Employee
select * from Employee where name='alok'
select * from Employee where name like 'al%' -- % means kuch bhi 
select * from Employee where name like 'a%'
select * from Employee where name like '%a'
select * from Employee where name like '_a%' -- _ means kuch bhi
select * from Employee where name like '%a_' -- last se doosra a ho
select * from Employee where name like 'a%' or name like 'd%'
select * from Employee where name like '[a,d]%' 
select * from Employee where name like '[a-d]%' 
select * from Employee where name not like '[a,d]%' 
select * from Employee where name like '[^a,d]%' --

--WILD CARD OPERATOR

select * from Employee where name like '[a-d]%'
select * from Employee where name like '[a,b,c,d]%' -- both are same

select * from Employee where name not like '[a,d]%' 
select * from Employee where name like '[^a,d]%' -- Not ka symbol ^

--Operator used with like command are called wildcard operator

-----------------------------------------------------------------------------------
select * from sys.objects where type='U' -- U -- user define table -- is used to find no of table with name in our database
select * from sys.objects where type='P' -- U -- user define procedure -- is used to find no of procedure with name in our table
select * from sys.databases 
select * from sys.objects where type='PK'
select * from sys.objects where type='F'
------------------------------------------------------------------------------


select GETDATE()-- returns date time

select @@DATEFIRST

select DATEPART(DAY,GETDATE())
select DATEPART(YEAR,GETDATE())
select DATEPART(MONTH,GETDATE())

select DATEPART(DAY, GETDATE())  -- returns only day
select DATEPART(YEAR, GETDATE())-- returns only year
select DATEPART(MONTH, GETDATE()) -- returns only month

select DATENAME(DW,GETDATE())
select DATENAME(DW,'08-15-1947')

select DATENAME(DW, GETDATE()) -- returns today day -- Thursday
select DATENAME(DW, '08-15-1947') -- FRIDAY


select DATENAME(DW, '09-06-1999')-- Monday
select DATENAME(DW, '12-29-1998') -- Tuesday
select DATENAME(DAY, '12-29-1998') -- 29
select DATENAME(DD, '12-29-1998')--29
select DATENAME(DAYOFYEAR, '12-29-1998')-- 363 -- uss year ka kaun sa day tha

select DATENAME(DAYOFYEAR, '06-09-1998')-- 160



select DATEFROMPARTS(2018, 10, 31)--2018-10-31

select DATEADD(DAY,5,GETDATE())
select DATEADD(YEAR,5,GETDATE())
select DATEADD(YEAR,-6,GETDATE())

select DATEADD(DAY, 5, GETDATE())

select DATEADD(YEAR, 5, GETDATE())



SELECT * FROM Employee WHERE inserted_date BETWEEN  DATEADD(DAY,-6,GETDATE()) AND GETDATE()


SELECT * FROM Employee WHERE inserted_date BETWEEN  DATEADD(DAY,-6,GETDATE()) AND '08-15-1947'-- it is used to find record between this date

select * from Employee where inserted_date between '08-15-1947' AND '08-15-1947'


select * from Employee where inserted_date between  GETDATE() AND '08-15-1947'


select * from Employee where inserted_date between '08-15-1947' AND GETDATE() -- it is used to find record from date A('08-15-1947')  to date B (GETDATE())


select * from EMployee where inserted_date between DATEADD(YEAR, -80, GETDATE()) and GETDATE()

select * from EMployee where inserted_date between DATEADD(YEAR, -800, GETDATE()) and GETDATE()-- Adding a value to a 'datetime' column caused an overflow.


select gender EMP_gender, sum(salary) as Total_salary  from employee  where inserted_date between DATEADD(YEAR, -2, GETDATE()) and GETDATE() group by gender  



SELECT DATEDIFF(YEAR,'08-15-1947',GETDATE())
SELECT DATEDIFF(YEAR,'09-08-1995',GETDATE())
SELECT DATEDIFF(DAY,'09-08-1995',GETDATE())
SELECT DATEDIFF(HOUR,'09-08-1995',GETDATE())

select DATEDIFF(YEAR,'08-15-1947', GETDATE())--1947

select DATEDIFF(YEAR,'08-15-1947', '08-15-2024')-- 77 years

select DATEDIFF(YEAR, '01-26-1950', '01-26-2024') -- 74

select DATEDIFF(YEAR, '09-06-1999', GETDATE())-- 25 years

select DATEDIFF(YEAR, '12-29-1998', GETDATE())-- 26 years -- it exclude 1 year either starting year or last year

select DATEDIFF(YEAR,'12-29-1998', '01-18-2024')-- 26


select DATEDIFF(DAY,'12-29-1998', '01-18-2024')-- 9151 days


select DATEDIFF(HOUR,'12-29-1998', '01-18-2024')--219624 hrs 


select DATEDIFF(DAYOFYEAR,'12-29-1998', '01-18-2024')--9151 days 


select DATEDIFF(WEEKDAY,'12-29-1998', '01-18-2024')--9151 weekdays 

select DATEDIFF(MINUTE,'12-29-1998', '01-18-2024') -- 13177440 minutes

select DATEDIFF(SECOND,'12-29-1998', '01-18-2024') -- 790646400 seconds

select datediff (MICROSECOND,'12-29-1998', '01-18-2024') --

select DATEDIFF(MILLISECOND,'12-29-1998', '01-18-2024')


select DATEDIFF(NANOSECOND,'12-29-1998', '01-18-2024') -- overflow error due  to very large date difference



select DATEDIFF(NANOSECOND, '12-29-1998', '01-18-2024')

SELECT SYSDATETIME() AS SysDateTime; -- 2024-01-18 23:12:32.5898588


------------------------------------------------------------------------------
CREATE FUNCTION FN_1(@DOB DATE)
RETURNS INT
AS
BEGIN
	DECLARE @AGE INT
	SELECT @AGE=DATEDIFF(YEAR,@DOB,GETDATE())
	RETURN @AGE
END

SELECT DBO.FN_1('01-01-1991')

-- how to create function in sql

create function functioname(@dob date)
returns int
as
begin
	declare @age int
	select @age = datediff(year,@dob, getdate())
	return @age
end

drop  function functioname

select dbo.functioname('09-06-1999')

create function  agecalculator(@dob date)
returns int
as
begin
	declare @age int
	select @age = datediff(YEAR, @dob, GETDATE())
	return @age
end

select dbo.agecalculator('09-06-1999')


create function dobcalculator(@dob date)
returns int

as
begin
	--declare @age int
	--declare @month int
	declare @days int

	--select @age = DATEDIFF(YEAR, @dob, GETDATE())
	--select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	--return @age
	--return @month
	return @days
end


create function dobcalculator_days(@dob date)
returns int

as
begin
	--declare @age int
	--declare @month int
	declare @days int

	--select @age = DATEDIFF(YEAR, @dob, GETDATE())
	--select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	--return @age
	--return @month
	return @days
end

select dbo.dobcalculator_days('09-06-1999')-- 8900 days

select  DATEDIFF(DAY,'09-06-1999' , GETDATE())-- 8900 days

select  DATEDIFF(MONTH,'09-06-1999' , GETDATE())

SELECT 'W3Schools' + '.com';-- W3Schools.com

SELECT CONCAT('W3Schools', '.com');-- W3Schools.com

select  CONCAT(DATEDIFF(DAY,'09-06-1999' , GETDATE()))


create function dobcalculator_d(@dob date)
returns int

as
begin
	declare @age int
	declare @month int
	declare @days int
	declare @dat int

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS (@age, @month,@days)
	return @dat
end



create function dobcalculator_d1(@dob date)
returns int

as
begin
	declare @age int
	declare @month int
	declare @days int
	declare @dat int

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS('-',@age, @month,@days)
	return @dat
end


create function dobcalculator_d2(@dob date)
returns int

as
begin
	declare @age int
	declare @month int
	declare @days int
	declare @dat int

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS('-',@age, @month,@days)
	return @dat
end


create function dobcalculator_d3(@dob date)
returns varchar(100)

as
begin
	declare @age varchar(100)
	declare @month varchar(100)
	declare @days varchar(100)
	declare @dat varchar(100)

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS('-',@age, @month,@days)
	return @dat
end



create function dobcalculator_d4(@dob date)
returns varchar(100)

as
begin
	declare @age varchar(100)
	declare @month varchar(100)
	declare @days varchar(100)
	declare @dat varchar(100)

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS('-',@age, @month,@days)
	return @dat
end



create function dobcalculator_d5(@dob date)
returns varchar(100)

as
begin
	declare @age varchar(100)
	declare @month varchar(100)
	declare @days varchar(100)
	declare @dat varchar(100)

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS('-',@age,'years', @month,'months',@days,'days')
	return @dat
end

select dbo.dobcalculator_d5('09-06-1999')

create function dobcalculator_d6(@dob date)
returns varchar(100)

as
begin
	declare @age varchar(100)
	declare @month varchar(100)
	declare @days varchar(100)
	declare @dat varchar(100)

	select @age = DATEDIFF(YEAR, @dob, GETDATE())
	select @month = DATEDIFF(MONTH, @dob, GETDATE())
	select @days = DATEDIFF(DAY, @dob, GETDATE())

	select @dat =  CONCAT_WS(@age,'years', @month,'months',@days,'days')
	return @dat
end


select   CONCAT_WS(25,'years', 78,'months',908,'days')

SELECT CONCAT_WS('.', 'www', 'W3Schools', 'com');

select dbo.dobcalculator_d6('09-06-1999')

--------------------------------------------------------------------------------------------------------

Create database DB_Lect_5_Advnce_Pr

use DB_Lect_5_Advnce_Pr

--37.a.Function_Temprary_table_20_03-21


create table Employee
(
id int primary key identity,
name varchar(50),
gender int,
salary int,
department varchar(50),
dob date
)
insert into Employee(name,gender,salary,department)values('alok srivastava',1,400,'IT')
insert into Employee(name,gender,salary,department)values('rubina khan',2,800,'HR')
insert into Employee(name,gender,salary,department)values('Ashutosh kumar',1,300,'IT')
insert into Employee(name,gender,salary,department)values('pooja',2,500,'Sales')
insert into Employee(name,gender,salary,department)values('Biraj',1,700,'HR')
insert into Employee(name,gender,salary,department)values('chintu',2,600,'Sales')
insert into Employee(name,gender,salary,department)values('pp',3,450,'IT')
insert into Employee(name,gender,salary,department)values('kk',3,550,'HR')
insert into Employee(name,gender,salary,department)values('Dayanand',1,350,'Sales')
insert into Employee(name,gender,salary,department)values('Anwar',1,650,'HR')


alter table Employee add dob date
alter table employee add dob date

update Employee set gender=1 where id=1
update Employee set gender=1 where id=3
update Employee set gender=2 where id=4
update Employee set gender=3 where id=7
update Employee set gender=3 where id=8
update Employee set gender=1 where id=10
update Employee set gender=1 where id=11
update Employee set gender=2 where id=12
update Employee set gender=1 where id=13


update Employee set dob = '09-06-1999' where id=1
update Employee set dob = '01-06-1998' where id=2
update Employee set dob = '04-06-1995' where id=3
update Employee set dob = '06-12-1953' where id=4
update Employee set dob = '10-12-1991' where id=5
update Employee set dob = '09-08-1969' where id=6
update Employee set dob = '06-07-1990' where id=7
update Employee set dob = '03-02-1974' where id=8
update Employee set dob = '03-04-1966' where id=9
update Employee set dob = '08-09-1957' where id=10

select * from Employee
-------------------------

CREATE FUNCTION FN_1(@DOB DATE)
RETURNS INT
AS
BEGIN
	DECLARE @AGE INT
	SELECT @AGE=DATEDIFF(YEAR,@DOB,GETDATE())
	RETURN @AGE
END

create function DOB_1(@dob date) -- age jaane waala function
returns int
as
begin
	declare @age int
	select @age= DATEDIFF(YEAR,@dob,GETDATE())
	return @age
end


SELECT DBO.DOB_1('03-04-1966')



alter proc sp_emp_get
as
begin
select id,name,dbo.FN_2(gender)Gender,salary,convert(varchar(50),dob,106)DateOfBirth,department,DBO.FN_1(dob)Age from Employee
end


select id,name,gender,salary,department,DBO.DOB_1(dob) from Employee

-- we can't write any procedure in select statement. 

alter proc sp_get_emp
as
begin
select id,name,CONVERT(varchar(50),dob,106) DateOfBirth,dbo.gender_1(gender) gender,salary,department,DBO.DOB_1(dob) Age from Employee
end

exec sp_get_emp

create function gender_1(@gender int)
returns varchar(50)
as
begin
	declare @gname varchar(50)
		if(@gender = 1)
		begin
		set @gname='Male'
		end
		else if(@gender = 2)
		begin
		set @gname='Female'
		end
		else if(@gender = 3)
		begin
		set @gname='Other'
		end
	return @gname 
end

--DBO - database object 
-------------------------------------------------------

CREATE FUNCTION FN_2(@Gender int)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @GNAME VARCHAR(50)
		if(@Gender=1)
			begin
				set @GNAME='male'
			end
		else if(@Gender=2)
			begin
				set @GNAME='female'
			end
		else if(@Gender=3)
			begin
				set @GNAME='other'
			end
	RETURN @GNAME
END

--------------------------------------------------------------
alter table Employee alter column age varchar(50)
alter table EMployee alter column age varchar(50)
-----------------------------------------------------------
select * from Employee
select name,department from Employee
select (name+department)Detail from Employee
select (name+' '+department)Detail from Employee -- + operatoer is used to concatenation - chipkana
select (name+space(5)+department)Detail from Employee  -- space(5) function is used to put space 
select (name+space(5)+department+space(5)+salary)Detail from Employee
select (name+space(5)+department+space(5)+convert(varchar(50),salary))Detail from Employee
select (name+space(5)+department+space(5)+cast(salary as varchar(50)))Detail from Employee

select (name+department)detail from employee 
-- + operator un values ko jodta hai jo same type ki hoti hai na ki un columns ko jo same type ka hota hai.
-- means + operator mainly column ki values pe apply hota hai na ki columns ke type pe. isko column ke type se koi matlab nahi hai.

select (name+space(5)+department+space(5)+salary)Details from Employee
--ab yahan pe salary ka type to int hai and int value bhi hai slaary column me iss loye nahi jud raha.
--ab hame isko conver ya cast ki help se type ko change karna hoga then ho jaega

select (name+space(5)+department+space(5)+CONVERT(varchar(50),salary)) Details from Employee -- kaam kar rahi
select (name+space(10)+department+space(10)+CAST(salary as varchar(50))) details from employee

select convert(varchar(50),salary) from Employee 
select cast(salary as varchar(50)) from Employee 
select convert(int,name) from Employee 

select convert(varchar(50), salary) salary from Employee

select cast(salary as varchar(50)) salary from Employee

-- difference between convert and cast 
-- in conver we can take 3rd parameter also but optional but we cant take in cast only 2 allow

select GETDATE()
select convert(varchar(50),GETDATE())
select cast(GETDATE()as varchar(50))
select convert(varchar(50),GETDATE(),106)

select GETDATE()-- int value return ho rahi
select convert(varchar(50), GETDATE())-- Jan 19 2024  5:19PM   -- string me a arahi
select cast(GETDATE() as varchar(50))-- Jan 19 2024  5:20PM -- string me a arahi -- but diff is only 2 parameter allow hai isme

select convert(varchar(50),GETDATE(),106) -- 19 Jan 2024 only date we get-- 3rd parameter ki help se date ki formatting kar sakte hai.

select CONVERT(varchar(50), GETDATE(), 101) -- 01/19/2024 -- MM/DD/YYYY format me milega if used 101
select CONVERT(varchar(100), GETDATE(), 103) -- 19/01/2024 -- DD/MM/YYYY format me milega if used 103
----------------------------------------------------------------------------
--id int primary key identity,
--name varchar(50),
--gender int,
--salary int,
--department varchar(50),
--dob date

-- + Operator definition
-- if two column type is same means varchar then + operator concatenate columns value chahe fir dono column me int hi value kyo naho
-- if two column type is same means int type  and value bhi dono me int hona chahiye then + operator  perform addition of values of two column 
-- if one columns type is int and another is varchar but value in both are int then addition happen
 
-- if one column type varchar and contain varchar value only and other column type is int cantain value int only thenerror happen
-- if dono column type varchar but ek me int value ho and ek me varchar value then + operator concatenate karega
-- if dono culumn is varchar but value int ho dono me then + operator conactenate kaerga 


select (salary+SPACE(5)+gender) details from Employee --
select (salary+' '+gender) details from Employee

alter table employee alter column gender  varchar(100)
alter table employee alter column salary   varchar(100)

select (name+gender) details from Employee
select (salary+space (10)+gender) details from Employee

select convert(int,salary) from Employee -- but isse values convert hogi na ki column ka type change hoga

select * from Employee

select convert(int,name) from employee-- failed

--------------------------------------------------------------------
create table #Student
(
id int primary key identity,
name varchar(50),
age int
)
select * from #student
insert into #student(name,age)values('alok',36)
insert into #student(name,age)values('Bhiraj',31)
insert into #student(name,age)values('vimlesh',32)


create table ##Stu
(
id int primary key identity,
name varchar(50),
age int
)
select * from ##stu
insert into ##stu(name,age)values('dayanand',36)
insert into ##stu(name,age)values('deepankar',31)
insert into ##stu(name,age)values('valmiki',32)


create table Student -- permanent tableremain always
(
id int primary key identity,
name varchar(50),
age int
)

create table #Student -- temporary table
(
id int primary key identity,
name varchar(50),
age int
)

insert into #student(name,age)values('alok',36)
insert into #student(name,age)values('Bhiraj',31)
insert into #student(name,age)values('vimlesh',32)


-- temporary table 
-- 2 types - Local and global
-- It present till current window open once we close window, then it removes automatically
-- delete automatically
-- always use and access as same as permanent table.
-- only 256 permanent table ban sakti hai ek database me
-- aur temporary table kitni bhi bana sakte hai
-- Aur ye database me store nahi hoti -- isse database ka load nahi badhta
-- But ye store hota hi - Databses folder -> System Datbases folder -> tempdb folder -> Temporary table folder - temporary table with unique id 
-- Same databse ko access karne waala user aapki temporary table ko nahi dekh sakta - same window me access hogi jisme wo bani hai other window me nahi hogi
-- temporary table same name kai ho sakta hai but permanent nahi kyo ki jab doosre user ko access hi nahi hai to fir bana sakte hai na.
-- har temporary table ke last me unique id jud jaegi 


create table ##Student --  global temporary table
(
id int primary key identity,
name varchar(50),
age int
)

insert into ##student(name,age)values('alok',36)
insert into ##student(name,age)values('Bhiraj',31)
insert into ##student(name,age)values('vimlesh',32)

-- global Temporary table.
-- 1. Multiple user access kar lega 
-- 2.  database me staore nahi hoi present in same location as lOCAL TEMP TABLE location
-- 3. EK naame se ek hi hogi
-- 4. unique hogi means poore DB me ek hi name se hogi
-- 5. ye tab tak present rahegi jab tak jis user ne banaya hai wo active rahega - jise window closed hogi ye remove ho jaegi
--------------------------------------------------------------------------------------------------------------------------------------------

--23-03-21 Monday Function and Procedure...

create database DB_Lect_6_Advnce_PR

use DB_Lect_6_Advnce_PR


create table Employee
(
id int primary key identity,
name varchar(50),
gender varchar(50),
salary int,
department varchar(50)
)
insert into Employee(name,gender,salary,department)values('alok srivastava','male',400,'IT')
insert into Employee(name,gender,salary,department)values('rubina khan','female',800,'HR')
insert into Employee(name,gender,salary,department)values('Ashutosh kumar','male',300,'IT')
insert into Employee(name,gender,salary,department)values('pooja','female',500,'Sales')
insert into Employee(name,gender,salary,department)values('Biraj','male',700,'HR')
insert into Employee(name,gender,salary,department)values('chintu','female',600,'Sales')
insert into Employee(name,gender,salary,department)values('pp','other',450,'IT')
insert into Employee(name,gender,salary,department)values('kk','other',550,'HR')
insert into Employee(name,gender,salary,department)values('Dayanand','male',350,'Sales')
insert into Employee(name,gender,salary,department)values('Anwar','male',650,'HR')


alter table Employee add dob date
update Employee set gender=1 where id=5
update Employee set gender=2 where id=2
update Employee set gender=2 where id=6
update Employee set gender=1 where id=9
update Employee set gender=3 where id=8
update Employee set gender=1 where id=10
update Employee set gender=1 where id=11
update Employee set gender=2 where id=12
update Employee set gender=1 where id=13

select * from Employee

update Employee set dob = '09-06-1999' where id=1
update Employee set dob = '01-06-1998' where id=2
update Employee set dob = '04-06-1995' where id=3
update Employee set dob = '06-12-1953' where id=4
update Employee set dob = '10-12-1991' where id=5
update Employee set dob = '09-08-1969' where id=6
update Employee set dob = '06-07-1990' where id=7
update Employee set dob = '03-02-1974' where id=8
update Employee set dob = '03-04-1966' where id=9
update Employee set dob = '08-09-1957' where id=10


-------------------------
CREATE FUNCTION FN_1(@DOB DATE)
RETURNS INT
AS
BEGIN
	DECLARE @AGE INT
	SELECT @AGE=DATEDIFF(YEAR,@DOB,GETDATE())
	RETURN @AGE
END

SELECT DBO.FN_1('01-01-1991')
create proc sp_emp_get
as
begin
select id,name,dbo.FN_2(gender)Gender,salary,convert(varchar(50),dob,106)DateOfBirth,department,DBO.FN_1(dob)Age from Employee
end


-------------------------------------------------------

CREATE FUNCTION FN_2(@Gender int)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @GNAME VARCHAR(50)
		if(@Gender=1)
			begin
				set @GNAME='male'
			end
		else if(@Gender=2)
			begin
				set @GNAME='female'
			end
		else if(@Gender=3)
			begin
				set @GNAME='other'
			end
	RETURN @GNAME
END

--------------------------------------------------------------
alter table Employee alter column age varchar(50)
-----------------------------------------------------------
select * from Employee
select name,department from Employee
select (name+department)Detail from Employee
select (name+' '+department)Detail from Employee
select (name+space(5)+department)Detail from Employee
select (name+space(5)+department+space(5)+salary)Detail from Employee
select (name+space(5)+department+space(5)+convert(varchar(50),salary))Detail from Employee
select (name+space(5)+department+space(5)+cast(salary as varchar(50)))Detail from Employee


select convert(varchar(50),salary) from Employee 
select cast(salary as varchar(50)) from Employee 
select convert(int,name) from Employee 

select GETDATE()
select convert(varchar(50),GETDATE())
select cast(GETDATE()as varchar(50))
select convert(varchar(50),GETDATE(),106)
----------------------------------------------------------------------------
--------------------------------------------------------------------
create table #Student
(
id int primary key identity,
name varchar(50),
age int
)
select * from #student
insert into #student(name,age)values('alok',36)
insert into #student(name,age)values('Bhiraj',31)
insert into #student(name,age)values('vimlesh',32)


create table ##Stu
(
id int primary key identity,
name varchar(50),
age int
)
select * from ##stu
insert into ##stu(name,age)values('dayanand',36)
insert into ##stu(name,age)values('deepankar',31)
insert into ##stu(name,age)values('valmiki',32)
---------------------------------------------------------------------------
select * from Employee
begin transaction
update Employee set name='Rohit' where id=8
commit transaction

begin transaction
update Employee set name = 'Deepak' where id=7
commit transaction

--------------------------------------------------------------------
create table Items
(
itemid int primary key identity,
itemname varchar(50),
itemprice int,
itemqty int
)
insert into Items(itemname,itemprice,itemqty)values('LED',22000,500)
insert into Items(itemname,itemprice,itemqty)values('LAPTOP',30000,400)
insert into Items(itemname,itemprice,itemqty)values('Mobile',15000,700)

create table Sold
(
soldid int primary key identity,
itemid int,
qty int
)


alter proc sp_transaction_trade
@itemid int,
@qty int
as
begin
	begin try
	begin transaction
	insert into Sold(itemid,qty) values(@itemid,@qty)
	update Items set itemqty= itemqty - @qty where itemid='fahad'
	print 'TRANSACTION SUCCEESFULL !!!';
	commit transaction
	end try

	begin catch
	rollback transaction
	print 'TRANSACTION FAILED !!!';
	end catch
	
end

select * from Items
select * from Sold

exec sp_transaction_trade 1,40

exec sp_transaction_trade 3,90




-----------------------------------------------------------------------------

create proc sp_transaction
@itemid int,
@qty int
as
begin
	begin try
		begin transaction
		insert into Sold(itemid,qty)values(@itemid,@qty)
		update Items set itemqty=itemqty-@qty where itemid='pppp'
		commit transaction
		print 'TRANSACTION SUCCESSFULL !!!'
	end try

	begin catch
		rollback transaction
		print 'TRANSACTION FAILED !!!'
	end catch
	
end

exec sp_transaction 2,15
select * from Items
select * from Sold


----------------------------------------------------------------------
select * from Employee
create proc sp_salary_get
@id int
as
begin
	select salary from Employee where id=@id
end

exec sp_salary_get 4


create proc sp_salary_gett
@id int
as
begin
select salary from Employee where id=@id
end

exec sp_salary_gett 4 -- but it return salary column not salary
-------------------------------------------------
create proc sp_salaryy_get
@id int
as
begin
	declare @p int
	select @p=salary from Employee where id=@id
	return @p
end

declare @k int
exec @k=sp_salaryy_get 4
print @k


create proc sp_salary_get
@id int
as
begin
	declare @p int
	select @p = salary from Employee where id=@id
	return @p
end

declare @d int
exec @d = sp_salary_get 4 -- 500 -- procedure se return hi kara sakte hai but hame only integer value karta hai... koi bhi non int value nahi karega
print @d
-------------------------------------------------------
create proc sp_name_get  --- error
@id int
as
begin
	declare @p varchar(50)
	select @p=name from Employee where id=@id
	return @p
end

declare @k varchar(50)
exec @k=sp_name_get 4
print @k

-- Conversion failed when converting the varchar value 'pooja' to data type int.
-----------------------------------------------
create procedure sp_namee_get 
@id int, -- input parameter input koi word hota nahi hai by default ye hota hai aur ise hame input value chahiye hoti hai
@m varchar(50) out
as
begin
	select @m=name from Employee where id=@id
end

declare @k varchar(50)
exec sp_namee_get 4,@k output
print @k

alter proc sp_ret_out_name
@id int,
@outparamter varchar(100) out
--@outparamter varchar(100) output -- out or out purt both are same like proc or procedure
as
begin
	select @outparamter = name from Employee where id=@id
end

declare @holdoutvalue varchar(100)
exec sp_ret_out_name 4,@holdoutvalue output
print @holdoutvalue
----------------------------------------------------------

--Difference between Procedure and function

--1. Prcudeure may or may not be return but function always return
--2. Procedure always return int value but function return all value
--3. Is liye procedure have output keyword kyo ki wo sabkuch nahi return karta but funtion doesnt have kyo ki wo sab kar hi raha so not required.
--4. Procedure koi bhi query chala sakte hai - all CRUD
--5. But FUnction me only select query hi chala sakte hai
--6. Procedure ke andar function use kar sakte hai
--7. but function ke andar procedure nahi use kar sakte

-- 4 classes left like trigger concept left.


-- last updates on 05/03/24.

