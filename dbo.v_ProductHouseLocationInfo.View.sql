USE [Chase_Hovel_Project1]
GO
/****** Object:  View [dbo].[v_ProductHouseLocationInfo]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_ProductHouseLocationInfo]
as
select 
PH.ProductionHouseID as [Production House ID],
con.ContinentName as [Continent  Name],
C.CountryName as [Country Name],
C.TaxRate as [Tax Rate]
from ProductionHouse PH
join Continent Con on Con.ContinentID = PH.ProductionHouseContient
join Countries C on C.CountryID = PH.ProductionHouseCountry
GO
