USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[MainDistributor_Customer_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainDistributor_Customer_Transaction](
	[MD_Cu_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[MD_St_Transaction] [int] NULL,
	[SD_Cu_Transaction] [int] NULL,
	[TransactionType] [nvarchar](12) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_MainDistributor_Customer_Transaction] PRIMARY KEY CLUSTERED 
(
	[MD_Cu_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainDistributor_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_Customer_Transaction_MainDistributor_Store_Transaction] FOREIGN KEY([MD_St_Transaction])
REFERENCES [dbo].[MainDistributor_Store_Transaction] ([MD_St_TransactionID])
GO
ALTER TABLE [dbo].[MainDistributor_Customer_Transaction] CHECK CONSTRAINT [FK_MainDistributor_Customer_Transaction_MainDistributor_Store_Transaction]
GO
ALTER TABLE [dbo].[MainDistributor_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_Customer_Transaction_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[MainDistributor_Customer_Transaction] CHECK CONSTRAINT [FK_MainDistributor_Customer_Transaction_Product]
GO
ALTER TABLE [dbo].[MainDistributor_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_Customer_Transaction_SubDistributor_Customer_Transaction] FOREIGN KEY([SD_Cu_Transaction])
REFERENCES [dbo].[SubDistributor_Customer_Transaction] ([SD_Cu_TransactionID])
GO
ALTER TABLE [dbo].[MainDistributor_Customer_Transaction] CHECK CONSTRAINT [FK_MainDistributor_Customer_Transaction_SubDistributor_Customer_Transaction]
GO
