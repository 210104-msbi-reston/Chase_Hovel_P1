USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ProductionHouse_Customer_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse_Customer_Transaction](
	[PH_Cu_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[PH_St_Transaction] [int] NULL,
	[MD_Cu_Transaction] [int] NULL,
	[TransactionType] [nvarchar](12) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ProductionHouse_Customer_Transaction] PRIMARY KEY CLUSTERED 
(
	[PH_Cu_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductionHouse_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_Customer_Transaction_MainDistributor_Customer_Transaction] FOREIGN KEY([MD_Cu_Transaction])
REFERENCES [dbo].[MainDistributor_Customer_Transaction] ([MD_Cu_TransactionID])
GO
ALTER TABLE [dbo].[ProductionHouse_Customer_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_Customer_Transaction_MainDistributor_Customer_Transaction]
GO
ALTER TABLE [dbo].[ProductionHouse_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_Customer_Transaction_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[ProductionHouse_Customer_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_Customer_Transaction_Product]
GO
ALTER TABLE [dbo].[ProductionHouse_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_Customer_Transaction_ProductHouse_Store_Transaction] FOREIGN KEY([PH_St_Transaction])
REFERENCES [dbo].[ProductionHouse_Store_Transaction] ([PH_St_TransactionID])
GO
ALTER TABLE [dbo].[ProductionHouse_Customer_Transaction] CHECK CONSTRAINT [FK_ProductionHouse_Customer_Transaction_ProductHouse_Store_Transaction]
GO
