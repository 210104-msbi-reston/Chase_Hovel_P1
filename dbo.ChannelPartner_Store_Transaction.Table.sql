USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ChannelPartner_Store_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelPartner_Store_Transaction](
	[CP_St_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelPartnerID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[TransactionInfoID] [int] NOT NULL,
 CONSTRAINT [PK_ChannelPartner_Store_Transaction] PRIMARY KEY CLUSTERED 
(
	[CP_St_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChannelPartner_Store_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Store_Transaction_ChannelPartner] FOREIGN KEY([ChannelPartnerID])
REFERENCES [dbo].[ChannelPartner] ([ChannelPartnerID])
GO
ALTER TABLE [dbo].[ChannelPartner_Store_Transaction] CHECK CONSTRAINT [FK_ChannelPartner_Store_Transaction_ChannelPartner]
GO
ALTER TABLE [dbo].[ChannelPartner_Store_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Store_Transaction_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[ChannelPartner_Store_Transaction] CHECK CONSTRAINT [FK_ChannelPartner_Store_Transaction_Store]
GO
ALTER TABLE [dbo].[ChannelPartner_Store_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Store_Transaction_TransactionInfo] FOREIGN KEY([TransactionInfoID])
REFERENCES [dbo].[TransactionInfo] ([TransactionInfoID])
GO
ALTER TABLE [dbo].[ChannelPartner_Store_Transaction] CHECK CONSTRAINT [FK_ChannelPartner_Store_Transaction_TransactionInfo]
GO
