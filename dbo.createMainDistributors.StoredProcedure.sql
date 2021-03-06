USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[createMainDistributors]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[createMainDistributors]
as
begin
	declare @Name nvarchar(40)
	declare @MDNo int = 1
	declare @CountryNo int = 1
	while @CountryNo < 226
	begin
		declare @firstNameNo int = floor(rand()*110)
		declare @lastNameNo int = floor(rand()*104)
		declare @firstName nvarchar(20) = (select FirstName.FirstName from FirstName where id = @firstNameNo)
		declare @lastName nvarchar(20) = (select LastName.LastName from LastName where id = @lastNameNo)
		set @Name = CONCAT(@firstName,' ',@lastName)
		insert into MainDistributor values(@MDNo,@Name,@CountryNo)
		set @MDNo = @MDNo + 1
		set @CountryNo = @CountryNo + 1
	end
end
GO
