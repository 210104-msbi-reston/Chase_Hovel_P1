USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[SubDistributor_ChannelPartner_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributor_ChannelPartner_Transaction](
	[SD_CP_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[SubDistributorID] [int] NOT NULL,
	[ChannelPartnerID] [int] NOT NULL,
	[TransactionInfoID] [int] NOT NULL,
 CONSTRAINT [PK_SubDistributor_ChannelPartner_Transaction] PRIMARY KEY CLUSTERED 
(
	[SD_CP_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubDistributor_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_SubDistributor_ChannelPartner_Transaction_ChannelPartner] FOREIGN KEY([ChannelPartnerID])
REFERENCES [dbo].[ChannelPartner] ([ChannelPartnerID])
GO
ALTER TABLE [dbo].[SubDistributor_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_SubDistributor_ChannelPartner_Transaction_ChannelPartner]
GO
ALTER TABLE [dbo].[SubDistributor_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_SubDistributor_ChannelPartner_Transaction_SubDistributor] FOREIGN KEY([SubDistributorID])
REFERENCES [dbo].[SubDistributor] ([SubDistributorID])
GO
ALTER TABLE [dbo].[SubDistributor_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_SubDistributor_ChannelPartner_Transaction_SubDistributor]
GO
ALTER TABLE [dbo].[SubDistributor_ChannelPartner_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_SubDistributor_ChannelPartner_Transaction_TransactionInfo] FOREIGN KEY([TransactionInfoID])
REFERENCES [dbo].[TransactionInfo] ([TransactionInfoID])
GO
ALTER TABLE [dbo].[SubDistributor_ChannelPartner_Transaction] CHECK CONSTRAINT [FK_SubDistributor_ChannelPartner_Transaction_TransactionInfo]
GO
