USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[SubDistributorChannelPartnerConnections]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributorChannelPartnerConnections](
	[SubDistributorID] [int] NOT NULL,
	[ChannelPartnerID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubDistributorChannelPartnerConnections]  WITH CHECK ADD  CONSTRAINT [FK_SubDistributorChannelPartnerConnections_ChannelPartner] FOREIGN KEY([ChannelPartnerID])
REFERENCES [dbo].[ChannelPartner] ([ChannelPartnerID])
GO
ALTER TABLE [dbo].[SubDistributorChannelPartnerConnections] CHECK CONSTRAINT [FK_SubDistributorChannelPartnerConnections_ChannelPartner]
GO
ALTER TABLE [dbo].[SubDistributorChannelPartnerConnections]  WITH CHECK ADD  CONSTRAINT [FK_SubDistributorChannelPartnerConnections_SubDistributor] FOREIGN KEY([SubDistributorID])
REFERENCES [dbo].[SubDistributor] ([SubDistributorID])
GO
ALTER TABLE [dbo].[SubDistributorChannelPartnerConnections] CHECK CONSTRAINT [FK_SubDistributorChannelPartnerConnections_SubDistributor]
GO
