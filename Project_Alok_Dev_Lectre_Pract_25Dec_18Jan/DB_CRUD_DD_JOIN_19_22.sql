create database DB_L19_Dropdown_JOIN
use DB_L19_Dropdown_JOIN

create table tblRegistration
(
id int primary key identity,
name varchar(100),
bloodgroup int,
course int
)

alter proc sp_Registration
@action varchar(50)=null,
@name varchar(100)=null,
@bloodgroup int=0,
@course int=0
as
begin
	if(@action='Insert')
	begin
	insert into tblRegistration(name,bloodgroup,course)values(@name,@bloodgroup,@course)
	end
	else if (@action='Get')
	begin
	select name,bname,cname  from tblRegistration  
	left  join tblBloodgroup on tblRegistration.bloodgroup = tblBloodgroup.bid
	left outer  join tblCourse on tblRegistration.course = tblCourse.cid
	end
end

create table tblBloodgroup
(
bid int primary key identity,
bname varchar(100)
)

insert into tblBloodgroup(bname)values('A+')
insert into tblBloodgroup(bname)values('B+')
insert into tblBloodgroup(bname)values('AB+')
insert into tblBloodgroup(bname)values('O+')
insert into tblBloodgroup(bname)values('A-')
insert into tblBloodgroup(bname)values('B-')
insert into tblBloodgroup(bname)values('AB-')
insert into tblBloodgroup(bname)values('O-')


create proc sp_bloodgroup_get
as
begin
  select * from tblBloodgroup
end


create table tblCourse
(
cid int primary key identity,
cname varchar(100)
)

insert into tblCourse(cname)values('B. Tech')
insert into tblCourse(cname)values('M. Tech')
insert into tblCourse(cname)values('BCA')
insert into tblCourse(cname)values('MCA')
insert into tblCourse(cname)values('BBA')
insert into tblCourse(cname)values('MBA')
insert into tblCourse(cname)values('MBBS')
insert into tblCourse(cname)values('BUMS')


create proc sp_Course_get
as
begin
  select * from tblCourse
end


