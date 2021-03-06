USE [Chase_Hovel_Project1]
GO
/****** Object:  View [dbo].[v_MainDistributorLocationInfo]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_MainDistributorLocationInfo]
as
select 
MD.MainDistributorID as [Distributor ID],
MD.MainDistributorName as [Name],
C.CountryName as [Country Name],
Con.ContinentName as [Continent Name],
C.TaxRate as [Tax Rate]
from MainDistributor MD
join Countries C on C.CountryID = MD.MainDistributorCountry
join Continent Con on Con.ContinentID = C.Continent
GO
