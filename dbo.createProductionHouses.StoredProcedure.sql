USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[createProductionHouses]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[createProductionHouses]
as
begin
declare @productionHouseContinent int = 1
declare @productionHouseContCount int = 0
while @productionHouseContinent < 7
begin
	while @productionHouseContCount < 3
	begin
		declare @productionHouseCountry int = (select TOP 1 CountryID from Countries where Continent = @productionHouseContinent order by newid())
		insert into ProductionHouse values(@productionHouseContinent,@productionHouseCountry)
		set @productionHouseContCount = @productionHouseContCount + 1
	end
set @productionHouseContCount = 0
set @productionHouseContinent += 1
end
end
GO
