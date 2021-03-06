USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateStores]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_CreateStores]
as
begin
	declare @numZones int = (select count(*) from zone)
	declare @storesPerZone int = 6
	declare @currentZoneStore int = 1
	declare @storeName nvarchar(255)
	declare @currentZone int = 1
	declare @zoneName nvarchar(80)
	while @currentZone < (@numZones + 1)
	begin
		while @currentZoneStore < (@storesPerZone + 1)
		begin
			set @zoneName = (select ZoneName from Zone where ZoneID = @currentZone)
			if((@currentZoneStore % 6) = 0)
			begin
				set @storeName = CONCAT(@zoneName,' ','Apple Store')
			end
			else if((@currentZoneStore % 6) = 1)
			begin
				set @storeName = CONCAT(@zoneName,' ','Sprint Store')
			end
			else if((@currentZoneStore % 6) = 2)
			begin
				set @storeName = CONCAT(@zoneName,' ','Verizon Store')
			end
			else if((@currentZoneStore % 6) = 3)
			begin
				set @storeName = CONCAT(@zoneName,' ','AT&T Store')
			end
			else if((@currentZoneStore % 6) = 4)
			begin
				set @storeName = CONCAT(@zoneName,' ','Best Buy')
			end
			else if((@currentZoneStore % 6) = 5)
			begin
				set @storeName = CONCAT(@zoneName,' ','Target')
			end

			insert into Store values (@storeName, @currentZone)
			set @currentZoneStore = @currentZoneStore + 1
		end
		set @currentZoneStore = 1
		set @currentZone = @currentZone + 1
	end
end
GO
