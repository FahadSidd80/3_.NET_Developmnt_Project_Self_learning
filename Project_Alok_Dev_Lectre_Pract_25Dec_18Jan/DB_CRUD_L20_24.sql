Create database DB_CRUD_L20_24
use DB_CRUD_L20_24

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
age int,
gender int,
country int,
state int
)

alter proc sp_tblemployee
@action varchar(50)=null,
@name varchar(100)=null,
@age int=0,
@gender int=0,
@country int=0,
@state int=0,
@deleteid int=0,
@updateid int=0,
@editid int=0
as
begin
	if(@action='Insert')
	begin
	insert into tblEmployee(name,age,gender,country,state)values(@name,@age,@gender,@country,@state)
	end
	else if(@action='Get')
	begin
	select tblEmployee.empid,tblEmployee.name,tblEmployee.age,tblEmployee.gender,tblEmployee.country,tblEmployee.state,tblcountry.cname ,tblstate.sname  from tblEmployee
	left join tblcountry on tblemployee.country= tblcountry.cid
	left join tblstate on tblemployee.state= tblstate.sid
	end
	else if(@action='Delete')
	begin
	delete from tblEMployee where empid=@deleteid
	end
	else if(@action='Edit')
	begin
	select * from tblEmployee where empid=@editid
	end
	else if(@action='Update')
	begin
	update tblemployee set name=@name,age=@age,gender=@gender,country=@country,state=@state where empid=@updateid
	end
end


create table tblcountry
(
cid int primary key identity,
cname varchar(100)
)

insert into tblcountry(cname)values('India')
insert into tblcountry(cname)values('Pakistan')
insert into tblcountry(cname)values('USA')
insert into tblcountry(cname)values('UAE')
insert into tblcountry(cname)values('Canada')

create proc sp_tblcountry_get
as
begin
	select * from  tblcountry
end


create table tblstate
(
sid int primary key identity,
cid int,
sname varchar(100)
)



insert into tblstate(cid,sname)values(1,'Bihar')
insert into tblstate(cid,sname)values(1,'Uttar Pradesh')
insert into tblstate(cid,sname)values(2,'Sindh')
insert into tblstate(cid,sname)values(2,'Khaiyber')
insert into tblstate(cid,sname)values(3,'Florida')
insert into tblstate(cid,sname)values(3,'Atlanta')
insert into tblstate(cid,sname)values(4,'Dubai')
insert into tblstate(cid,sname)values(4,'Sharjah')
insert into tblstate(cid,sname)values(5,'Toronto')
insert into tblstate(cid,sname)values(5,'Mexico')



create proc sp_tblstate_get
@countryid int 
as
begin
	select * from  tblstate where cid=@countryid
end

--sexec sp_tblstate_get(@countryid,1)
--select * from  tblstate where cid=1
