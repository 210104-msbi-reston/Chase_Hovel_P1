USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateChannelPartners]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_CreateChannelPartners]
as
begin
declare @name nvarchar(50)
declare @sdNo int = 1
declare @numZones int = (select count(*) from Zone)
declare @zoneID int = 1
declare @SDCount int = (select count(*) from SubDistributor)
declare @numCPforSD int = Round((rand()*20)+25,0)
declare @ChannelPartnerID int
while @zoneID < (@numZones + 1)
begin
	while @sdNo < (@SDCount + 1)
	begin
		while @numCPforSD > 0
		begin
			declare @firstName nvarchar(20) = (select top  1 FirstName from FirstName order by newID())
			declare @lastName nvarchar(20) = (select top 1 LastName from LastName order by newID())
			set @Name = CONCAT(@firstName,' ', @lastName)
			insert into ChannelPartner values (@Name,@zoneID)
			set @ChannelPartnerID = (select ChannelPartnerID from ChannelPartner where ChannelPartnerName = @name and Zone = @zoneID)
			insert into SubDistributorChannelPartnerConnections values(@sdNo,@ChannelPartnerID)
			set @zoneID = @zoneID + 1
			if(@zoneID = (@numZones + 1))
			begin
				break;
			end
			set @numCPforSD = @numCPforSD - 1
		end
		if(@zoneID = (@numZones + 1))
		begin
			break;
		end
		set @sdNo = @sdNo + 1
		set @numCPforSD = Round((rand()*20)+15,0)
	end
	set @sdNo = 1
end
end
GO
