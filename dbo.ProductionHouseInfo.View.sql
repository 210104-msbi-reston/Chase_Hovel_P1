USE [Chase_Hovel_Project1]
GO
/****** Object:  View [dbo].[ProductionHouseInfo]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProductionHouseInfo] as
select PH.ProductionHouseID,Cont.ContinentName,Countries.CountryName 
from ProductionHouse PH, Continent Cont, Countries
where PH.ProductionHouseContient = Cont.ContinentID
and PH.ProductionHouseCountry = Countries.CountryID
GO
