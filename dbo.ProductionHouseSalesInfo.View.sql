USE [Chase_Hovel_Project1]
GO
/****** Object:  View [dbo].[ProductionHouseSalesInfo]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProductionHouseSalesInfo] as
select PH_MD_TransactionID,
	   PH.ProductionHouseID as [Production House], 
	   MainDistributorName as [Distributor Name],
	   TI.TransactionType as [Transaction Type],
	   TI.TransactionDateTime as [Transaction Date],
	   ProductSerialNumber as [Serial Number]

from ProductionHouse PH, MainDistributor MD, TransactionInfo TI,ProductionHouse_MainDistributor_Transaction PMT
where PH.ProductionHouseID = PMT.ProductionHouseID
and	  MD.MainDistributorID = PMT.MainDistributorID
and	  TI.TransactionInfoID = PMT.TransactionInfoID
GO
