Create database DB_CRUD_Lct_8_11_SP
use DB_CRUD_Lct_8_11_SP

create table tblRegistration
(
rid int primary key identity,
name varchar(100),
gender varchar(100),
age int
)


create procedure sp_insert_tblregistration
@name varchar(100),
@gender varchar(100),
@age int
as
begin
	insert into tblregistration(name,gender,age) values(@name,@gender,@age)
end


create proc sp_Display_Registration
as
begin
	select * from tblRegistration
end


create proc sp_edit_tblRegistratn
@editid int
as
begin
	select * from tblregistration where rid = @editid
end

create proc sp_delete_registration
@deleteid int
as
begin
	delete from tblregistration where rid = @deleteid
end

create proc sp_update_registration
@updid int,
@name varchar(100),
@gender varchar(100),
@age int 
as
begin
	update tblregistration set name=@name,gender=@gender,age=@age where rid = @updid
end