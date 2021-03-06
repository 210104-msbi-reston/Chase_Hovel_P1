USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ChannelPartner]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelPartner](
	[ChannelPartnerID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelPartnerName] [nvarchar](50) NOT NULL,
	[Zone] [int] NOT NULL,
 CONSTRAINT [PK_ChannelPartner] PRIMARY KEY CLUSTERED 
(
	[ChannelPartnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChannelPartner]  WITH CHECK ADD  CONSTRAINT [FK_ChannelPartner_Zone] FOREIGN KEY([Zone])
REFERENCES [dbo].[Zone] ([ZoneID])
GO
ALTER TABLE [dbo].[ChannelPartner] CHECK CONSTRAINT [FK_ChannelPartner_Zone]
GO
