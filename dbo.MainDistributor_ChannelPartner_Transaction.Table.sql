USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[MainDistributor_ChannelPartner_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainDistributor_ChannelPartner_Transaction](
	[MD_CP_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[MD_SD_Transaction] [int] NULL,
	[SD_CP_Transaction] [int] NULL,
	[TransactionType] [nvarchar](12) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Distributor_ChannelPartner_Transaction] PRIMARY KEY CLUSTERED 
(
	[MD_CP_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainDistributor_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_ChannelPartner_Transaction_MainDistributor_SubDistributor_Transaction] FOREIGN KEY([MD_SD_Transaction])
REFERENCES [dbo].[MainDistributor_SubDistributor_Transaction] ([MD_SD_TransactionID])
GO
ALTER TABLE [dbo].[MainDistributor_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_MainDistributor_ChannelPartner_Transaction_MainDistributor_SubDistributor_Transaction]
GO
ALTER TABLE [dbo].[MainDistributor_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_ChannelPartner_Transaction_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[MainDistributor_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_MainDistributor_ChannelPartner_Transaction_Product]
GO
ALTER TABLE [dbo].[MainDistributor_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_ChannelPartner_Transaction_SubDistributor_ChannelPartner_Transaction] FOREIGN KEY([SD_CP_Transaction])
REFERENCES [dbo].[SubDistributor_ChannelPartner_Transaction] ([SD_CP_TransactionID])
GO
ALTER TABLE [dbo].[MainDistributor_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_MainDistributor_ChannelPartner_Transaction_SubDistributor_ChannelPartner_Transaction]
GO
