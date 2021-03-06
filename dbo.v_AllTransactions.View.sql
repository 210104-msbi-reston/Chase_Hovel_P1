USE [Chase_Hovel_Project1]
GO
/****** Object:  View [dbo].[v_AllTransactions]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_AllTransactions]
as
select TI.TransactionInfoID as [Transaction Number],
CAST(concat('Production House-',PH.ProductionHouseID) as nvarchar(MAX)) as [Seller],
concat('Main Distributor- ',MD.MainDistributorName) as [Customer],
TI.TransactionDateTime as [Date],
TI.TransactionType as [Transaction Type],
TI.ProductSerialNumber as [Product Serial Number],
TI.TotalPrice as [Sell Price]
from ProductionHouse_MainDistributor_Transaction PHMD
join TransactionInfo TI on PHMD.TransactionInfoID = TI.TransactionInfoID
join ProductionHouse PH on PHMD.ProductionHouseID = PH.ProductionHouseID
join MainDistributor MD on PHMD.MainDistributorID = MD.MainDistributorID

UNION

select TI.TransactionInfoID as [Transaction Number],
concat('Main Distributor- ',MD.MainDistributorName) as [Seller],
concat('Sub Distributor- ',SD.SubDistributorName) as [Customer],
TI.TransactionDateTime as [Date],
TI.TransactionType as [Transaction Type],
TI.ProductSerialNumber as [Product Serial Number],
TI.TotalPrice as [Sell Price]
from MainDistributor_SubDistributor_Transaction MDSD 
join TransactionInfo TI on MDSD.TransactionInfoID = TI.TransactionInfoID
join MainDistributor MD on MDSD.MainDistributorID = MD.MainDistributorID
join SubDistributor SD on MDSD.SubDistributorID = SD.SubDistributorID
 
UNION

select TI.TransactionInfoID as [Transaction Number],
concat('Sub Distributor- ',SD.SubDistributorName) as [Seller],
concat('Channel Partner- ',CP.ChannelPartnerName) as [Customer],
TI.TransactionDateTime as [Date],
TI.TransactionType as [Transaction Type],
TI.ProductSerialNumber as [Product Serial Number],
TI.TotalPrice as [Sell Price]
from SubDistributor_ChannelPartner_Transaction SDCP
join TransactionInfo TI on SDCP.TransactionInfoID = TI.TransactionInfoID
join SubDistributor SD on SDCP.SubDistributorID = SD.SubDistributorID
join ChannelPartner CP on SDCP.ChannelPartnerID = CP.ChannelPartnerID

UNION

select TI.TransactionInfoID as [Transaction Number],
concat('Channel Partner- ',CP.ChannelPartnerName) as [Seller],
S.StoreName as [Customer],
TI.TransactionDateTime as [Date],
TI.TransactionType as [Transaction Type],
TI.ProductSerialNumber as [Product Serial Number],
TI.TotalPrice as [Sell Price]
from ChannelPartner_Store_Transaction CPST
join TransactionInfo TI on CPST.TransactionInfoID = TI.TransactionInfoID
join ChannelPartner CP on CPST.ChannelPartnerID = CP.ChannelPartnerID
join Store S on CPST.StoreID = S.StoreID


UNION

select TI.TransactionInfoID as [Transaction Number],
S.StoreName as [Seller],
C.CustomerName as [Customer],
TI.TransactionDateTime as [Date],
TI.TransactionType as [Transaction Type],
TI.ProductSerialNumber as [Product Serial Number],
TI.TotalPrice as [Sell Price]
from Store_Customer_Transaction STCU
join TransactionInfo TI on STCU.TransactionInfoID = TI.TransactionInfoID
join Store S on STCU.StoreID = S.StoreID
join Customer C on STCU.CustomerID = C.CustomerID

GO
