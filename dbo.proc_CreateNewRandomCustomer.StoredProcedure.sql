USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateNewRandomCustomer]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_CreateNewRandomCustomer]
@customerID int output
as
begin
declare @firstUIDnum int = Round((rand()*9),0)
declare @secondUIDnum int = Round((rand()*9),0)
declare @thirdUIDnum int = Round((rand()*9),0)
declare @fourthUIDnum int = Round((rand()*9),0)
declare @fifthUIDnum int = Round((rand()*9),0)
declare @sixthUIDnum int = Round((rand()*9),0)
declare @seventhUIDnum int = Round((rand()*9),0)
declare @eightUIDnum int = Round((rand()*9),0)
declare @ninthUIDnum int = Round((rand()*9),0)
declare @tenthUIDnum int = Round((rand()*9),0)
declare @UIDnum nvarchar(10) = concat(@firstUIDnum,@secondUIDnum,@thirdUIDnum,@fourthUIDnum,@fifthUIDnum,@sixthUIDnum,@seventhUIDnum,@eightUIDnum,@ninthUIDnum,@tenthUIDnum)
print(@UIDnum)

declare @fullName nvarchar(80)
declare @firstName nvarchar(40) = (select top 1 FirstName from FirstName order by newid()) 
declare @lastName nvarchar(40) = (select top 1 LastName from LastName order by newid())
set @fullName = CONCAT(@firstName,' ',@lastName)

declare @country nvarchar(80) = (select top 1 CountryName from Countries order by newid())
declare @countryID int = (select top 1 CountryID from countries where CountryName = @country)

declare @state nvarchar(30) = 'N/A'
IF EXISTS(select * from State where Country = @countryID)
begin
	set @state = (select top 1 StateName from State where Country = @countryID order by newid())
end

declare @city nvarchar(50) = (select top 1 CityName from City order by newid())

declare @address nvarchar(100)

declare @numberOfNumbers int = Round(rand()*2+2,0)
declare @HouseNumber nvarchar(4)
if(@numberOfNumbers = 2)
begin
	declare @firstHouseNum int = Round((rand()*9),0)
	declare @SecondHouseNum int = Round((rand()*9),0)
	set @HouseNumber= concat(@firstHouseNum,@SecondHouseNum)
end
else if(@numberOfNumbers = 3)
begin
	set @firstHouseNum  = Round((rand()*9),0)
	set @SecondHouseNum = Round((rand()*9),0)
	declare @thirdHouseNum int = Round((rand()*9),0)
	set @HouseNumber= concat(@firstHouseNum,@SecondHouseNum,@thirdHouseNum)
end
else
begin
	set @firstHouseNum  = Round((rand()*9),0)
	set @SecondHouseNum = Round((rand()*9),0)
	set @thirdHouseNum = Round((rand()*9),0)
	declare @fourthHouseNum int = Round((rand()*9),0)
	set @HouseNumber= concat(@firstHouseNum,@SecondHouseNum,@thirdHouseNum,@fourthHouseNum)
end
declare @stName nvarchar(20) = (select top 1 RoadNames from RoadNames order by newID())
declare @stType nvarchar(5) 
declare @stTypeNumber int = Round(rand()*5+1,0)
if(@stTypeNumber % 5 = 1)
begin
	set @stType = 'Ave.'
end
else if(@stTypeNumber % 5 = 2)
begin
	set @stType = 'Dr.'
end
else if(@stTypeNumber % 5 = 3)
begin
	set @stType = 'St.'
end
else if(@stTypeNumber % 5 = 4)
begin
	set @stType = 'Rd.'
end
else if(@stTypeNumber % 5 = 0)
begin
	set @stType = 'Blvd.'
end

set @address = concat(@HouseNumber,' ',@stName,' ',@stType)

exec proc_CreateNewCustomer @fullName, @UIDnum, @country,@state,@city,@address,@customerID output
end

GO
