USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ProductionHouse_Store_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse_Store_Transaction](
	[PH_St_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[PH_CP_Transaction] [int] NULL,
	[MD_St_Transaction] [int] NULL,
	[TransactionType] [nvarchar](12) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ProductHouse_Store_Transaction] PRIMARY KEY CLUSTERED 
(
	[PH_St_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductionHouse_Store_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductHouse_Store_Transaction_MainDistributor_Store_Transaction] FOREIGN KEY([MD_St_Transaction])
REFERENCES [dbo].[MainDistributor_Store_Transaction] ([MD_St_TransactionID])
GO
ALTER TABLE [dbo].[ProductionHouse_Store_Transaction] CHECK CONSTRAINT [FK_ProductHouse_Store_Transaction_MainDistributor_Store_Transaction]
GO
ALTER TABLE [dbo].[ProductionHouse_Store_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductHouse_Store_Transaction_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[ProductionHouse_Store_Transaction] CHECK CONSTRAINT [FK_ProductHouse_Store_Transaction_Product]
GO
ALTER TABLE [dbo].[ProductionHouse_Store_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductHouse_Store_Transaction_ProductionHouse_ChannelPartner_Transaction] FOREIGN KEY([PH_CP_Transaction])
REFERENCES [dbo].[ProductionHouse_ChannelPartner_Transaction] ([PH_CP_TransactionID])
GO
ALTER TABLE [dbo].[ProductionHouse_Store_Transaction] CHECK CONSTRAINT [FK_ProductHouse_Store_Transaction_ProductionHouse_ChannelPartner_Transaction]
GO
