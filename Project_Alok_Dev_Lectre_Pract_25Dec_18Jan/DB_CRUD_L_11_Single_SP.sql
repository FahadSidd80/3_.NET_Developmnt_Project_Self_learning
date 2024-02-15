Create database DB_CRUD_L_11_SP
use DB_CRUD_L_11_SP

create table tblRegistration
(
rid int primary key identity,
name varchar(100),
gender varchar(100),
age int
)


---sp_helptext sp_Employee -- used to find proc code


alter proc sp_Employee

@action Varchar(10)=null,
@name varchar(100)=null,
@gender varchar(100)=null,
@age int=0,
@deleteid int=0,
@updid int=0,
@editid int=0

as
begin
	if(@action = 'Insert')
	begin
	Insert into tblRegistration(name,gender,age)values(@name,@gender,@age)
	end
	else if (@action= 'Display')
	begin
		select * from tblregistration 
	end
	else if (@action= 'Delete')
	begin
		delete from tblregistration where rid = @deleteid
	end
	else if (@action= 'Edit')
	begin
		select * from tblregistration where rid = @editid
	end
	else if (@action= 'Update')
	begin
		update tblregistration set name=@name,gender=@gender,age=@age where rid = @updid
	end
end

select * from tblregistration