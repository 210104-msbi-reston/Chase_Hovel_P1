USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ChannelPartnerInventory]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelPartnerInventory](
	[ChannelPartnerInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelPartnetID] [int] NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ChannelPartnetInventory] PRIMARY KEY CLUSTERED 
(
	[ChannelPartnerInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChannelPartnerInventory]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartnerInventory_ChannelPartner] FOREIGN KEY([ChannelPartnetID])
REFERENCES [dbo].[ChannelPartner] ([ChannelPartnerID])
GO
ALTER TABLE [dbo].[ChannelPartnerInventory] CHECK CONSTRAINT [FK_ChannelPartnerInventory_ChannelPartner]
GO
