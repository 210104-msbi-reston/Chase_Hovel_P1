USE [Chase_Hovel_Project1]
GO
/****** Object:  View [dbo].[v_CustomerAddressInfo]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_CustomerAddressInfo]
as
select Cust.CustomerID as [Customer ID], 
Cust.CustomerName as [Customer Name],
Coun.CountryName as [Country],
S.StateName as [State],
City.CityName as [City],
A.AddressString as [Address]
from Customer Cust
join FullAddress FA on Cust.CustomerAddress = FA.FullAddressID
join Countries Coun on FA.Country = Coun.CountryID
join State S on S.StateID = FA.State
join City on City.CityID = FA.City
join Address A on A.AddressesID = FA.Address
GO
