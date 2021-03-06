USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ProductionHouse_MainDistributor_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse_MainDistributor_Transaction](
	[PH_MD_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ProductionHouseID] [int] NOT NULL,
	[MainDistributorID] [int] NOT NULL,
	[TransactionInfoID] [int] NOT NULL,
 CONSTRAINT [PK_ProductionHouse_Distributor_Transaction] PRIMARY KEY CLUSTERED 
(
	[PH_MD_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductionHouse_MainDistributor_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_MainDistributor_Transaction_MainDistributor] FOREIGN KEY([MainDistributorID])
REFERENCES [dbo].[MainDistributor] ([MainDistributorID])
GO
ALTER TABLE [dbo].[ProductionHouse_MainDistributor_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_MainDistributor_Transaction_MainDistributor]
GO
ALTER TABLE [dbo].[ProductionHouse_MainDistributor_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_MainDistributor_Transaction_ProductionHouse] FOREIGN KEY([ProductionHouseID])
REFERENCES [dbo].[ProductionHouse] ([ProductionHouseID])
GO
ALTER TABLE [dbo].[ProductionHouse_MainDistributor_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_MainDistributor_Transaction_ProductionHouse]
GO
ALTER TABLE [dbo].[ProductionHouse_MainDistributor_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_MainDistributor_Transaction_TransactionInfo] FOREIGN KEY([TransactionInfoID])
REFERENCES [dbo].[TransactionInfo] ([TransactionInfoID])
GO
ALTER TABLE [dbo].[ProductionHouse_MainDistributor_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_MainDistributor_Transaction_TransactionInfo]
GO
