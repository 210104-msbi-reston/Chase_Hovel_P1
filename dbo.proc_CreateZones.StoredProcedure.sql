USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateZones]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_CreateZones]
as
begin
	declare @zoneName nvarchar(400)
	declare @currentCity int = 1
	declare @numberOfCities int = (select max(CityID) from City)
	declare @NumberOfZonesPerCity int = 2
	declare @zoneNumber int = 1
	declare @zoneSide nvarchar(4)
	declare @cityName nvarchar(50)
	while @currentCity < @numberOfCities + 1
	begin
		IF EXISTS(select CityID from City where CityID = @currentCity)
		begin
			while @zoneNumber < @NumberOfZonesPerCity + 1
			begin
				set @cityName = (select CityName from City where CityID = @currentCity)
				if(@zoneNumber%2 = 1)
				begin
					set @zoneSide = 'East'
				end
				else
				begin
					set @zoneSide = 'West'
				end
				set @zoneName = Concat(@cityName, ' ', @zoneSide)
				insert into Zone values (@zoneName)
				set @zoneNumber = @zoneNumber + 1
			end
			set @zoneNumber = 1
		end
		set @currentCity = @currentCity + 1
	end
end
GO
