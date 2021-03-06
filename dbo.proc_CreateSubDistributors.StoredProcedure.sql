USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateSubDistributors]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_CreateSubDistributors]
as
begin
	declare @Name nvarchar(50)
	declare @MDNo int = 1
	declare @countOfMainDistributors int = 225
	declare @numSDforMD int = Round((rand()*9) + 1,0)
while @MDNo < (@countOfMainDistributors + 1)
begin
	IF EXISTS (select top 1 MainDistributorID from MainDistributor where MainDistributorID = @MDNo)
	begin
		while @numSDforMD > 0
		begin
			declare @firstName nvarchar(20) = (select top  1 FirstName from FirstName order by newID())
			declare @lastName nvarchar(20) = (select top 1 LastName from LastName order by newID())
			set @Name = CONCAT(@firstName,' ', @lastName)
			insert into SubDistributor values (@Name)
			declare @SDid int = (select top 1 SubDistributorID from SubDistributor where SubDistributorName = @Name order by SubDistributorID desc)
			insert into [MainDistributor-SubDistributor] values (@MDNo,@SDid)
			set @numSDforMD = @numSDforMD - 1
		end
	end
	set @numSDforMD = Round((rand()*9) + 1,0)
	set @MDNo = @MDNo + 1
end
end
GO
