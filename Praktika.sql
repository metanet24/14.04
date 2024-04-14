create database School

use School

create table Students
(
    [Id] int primary key identity(1,1),
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Email] NVARCHAR(100) unique not null
    [Age] int,
    [CityId] int
)


insert into Students
    ( [Name], [Surname], [Email], [Age], [cityId])
values
    ('Arzu', 'Kerimli', 'arzu@gmail.com', 26, 2)

insert into Students
    ([Name], [Surname], [Email], [Age], [cityId])
values
    ('Nisa', 'Narimanova', 'nisa@gmail.com', 26, 2)

    insert into Students
    ([Name], [Surname], [Email], [Age], [cityId])
values
    ('Meryem', 'Eliyeva', 'meryem@gmail.com', 24, 2)

    insert into Students
    ([Name], [Surname], [Email], [Age], [Age], [cityId])
values
    ('Semed', 'Huseynov', 'semed@gmail.com', 27, 1)

    insert into Students
    ([Name], [Surname], [Email], [Age], [cityId])
values
    ('Tunzale', 'Memmedova', 'tunzale@gmail.com', 24, 4)



select *
from Students




create table Cities
(
    [Id] int primary key identity(1,1),
    [Name] NVARCHAR(50)
)

alter table Students
add [CityId] int foreign key references Cities(Id)

insert into Cities([Name])
values('Sumqayit'),
    ('Baku'),
    ('Qubadli'),
    ('Masalli'),
    ('Yardimli')


create view vw_ShowStudentsByAge
as 
select * from Students where [Age]>25


select * from vw_ShowStudentsByAge

create view vw_joinStudentsDatas
as 
select st.Name as 'Student Name', emp.Surname as 'Student Surname',  ct.Name as 'City' from Students st
inner join Cities ct
on st.CityId = ct.Id

select * from vw_joinStudentsDatas

create function dbo.showWord()
returns NVARCHAR(50)
as
begin 
return 'P418'
end

select dbo.showWord()


declare @result NVARCHAR(50) = (select dbo.showWord())

print @result



create function dbo.showWordWithParameter1(@text nvarchar(50))
returns nvarchar(50)
AS
BEGIN
return @text
END

select dbo.showWordwithParameter1('Aqshin bey')
select dbo.showWordwithParameter1('Semed bey')
select dbo.showWordwithParameter1('Oruc bey')



create function dbo.getEmployeesAvgAge()
returns INT
AS
BEGIN
declare @avgAge int = (select Avg(Age) from Employees)
return @avgAge
END


select dbo.getStudentsAvgAge()

 
create function dbo.getStudentsAvgAgeById(@id int)
returns INT
AS
BEGIN
declare @avgAge int = (select AVG(Age) from Students where [Id]> @id)
return @avgAge
end

select dbo.getStudentsAvgAgeById(3)



create function dbo.getStudentsByCondition(@avgAge int)
returns table 
as
return (select * from Students where [Age]> @avgAge)

declare @avgAge int = (select dbo.getStudentsAvgAgeById(3))
select * from  getStudentsByCondition(@avgAge)

create procedure usp_showText
AS
print 'salam'

exec usp_showText

usp_showText

create PROCEDURE usp_showTextWithParameter
@text NVARCHAR(50)
AS
print @text

exec usp_showTextWithParameter 'Azerbaycan'

select * from Students


create procedure usp_deleteStudentsById
@id INT
AS
delete from Students where [Id] = @id


 usp_deleteStudentsById 6


create procedure usp_createStudent
@name NVARCHAR(50),
@surname NVARCHAR(50),
@email NVARCHAR(100),
@age INT,
@cityId INT
AS
begin 
insert into Students ([Name], [Surname], [Email], [Age], [CityId])
values(@name, @surname, @email, @age, @cityId)
END


exec usp_createStudent 'Tofiq', 'Nasibli', 'tofig@gmail.com', 29, 1


select * from Students


create function dbo.getStudentsAvgAge2()
returns INT
AS
BEGIN
return (SELECT Avg(Age) from Students)
end


select dbo.getStudentsAvgAge2()


create procedure usp_deleteStudentsByAge
as
begin
declare @avgAge INT =  (select dbo.getStudentsAvgAge2())
delete from Students where [Age]> @avgAge
END

 usp_deleteStudentsByAge

 select *from Students
 