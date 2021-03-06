USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ProductionHouse_ChannelPartner_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction](
	[PH_CP_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[PH_SD_Transaction] [int] NULL,
	[MD_CP_Transaction] [int] NULL,
	[TransactionType] [nvarchar](12) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ProductionHouse_ChannelPartner_Transaction] PRIMARY KEY CLUSTERED 
(
	[PH_CP_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_ChannelPartner_Transaction_MainDistributor_ChannelPartner_Transaction] FOREIGN KEY([MD_CP_Transaction])
REFERENCES [dbo].[MainDistributor_ChannelPartner_Transaction] ([MD_CP_TransactionID])
GO
ALTER TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_ChannelPartner_Transaction_MainDistributor_ChannelPartner_Transaction]
GO
ALTER TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_ChannelPartner_Transaction_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_ChannelPartner_Transaction_Product]
GO
ALTER TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_ChannelPartner_Transaction_ProductionHouse_SubDistributor_Transaction] FOREIGN KEY([PH_SD_Transaction])
REFERENCES [dbo].[ProductionHouse_SubDistributor_Transaction] ([PH_SD_TransactionID])
GO
ALTER TABLE [dbo].[ProductionHouse_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_ChannelPartner_Transaction_ProductionHouse_SubDistributor_Transaction]
GO
