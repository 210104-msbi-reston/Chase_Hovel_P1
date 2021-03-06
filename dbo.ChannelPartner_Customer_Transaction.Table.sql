USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ChannelPartner_Customer_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelPartner_Customer_Transaction](
	[CP_Cu_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[CP_St_Transaction] [int] NULL,
	[St_Cu_Transaction] [int] NULL,
	[TransactionType] [nvarchar](12) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ChannelPartner_Customer_Transaction] PRIMARY KEY CLUSTERED 
(
	[CP_Cu_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChannelPartner_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Customer_Transaction_ChannelPartner_Store_Transaction] FOREIGN KEY([CP_St_Transaction])
REFERENCES [dbo].[ChannelPartner_Store_Transaction] ([CP_St_TransactionID])
GO
ALTER TABLE [dbo].[ChannelPartner_Customer_Transaction] CHECK CONSTRAINT [FK_ChannelPartner_Customer_Transaction_ChannelPartner_Store_Transaction]
GO
ALTER TABLE [dbo].[ChannelPartner_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Customer_Transaction_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[ChannelPartner_Customer_Transaction] CHECK CONSTRAINT [FK_ChannelPartner_Customer_Transaction_Product]
GO
ALTER TABLE [dbo].[ChannelPartner_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Customer_Transaction_Store_Customer_Transaction] FOREIGN KEY([St_Cu_Transaction])
REFERENCES [dbo].[Store_Customer_Transaction] ([St_Cu_TransactionID])
GO
ALTER TABLE [dbo].[ChannelPartner_Customer_Transaction] CHECK CONSTRAINT [FK_ChannelPartner_Customer_Transaction_Store_Customer_Transaction]
GO
