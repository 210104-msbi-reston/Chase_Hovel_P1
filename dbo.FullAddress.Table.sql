USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[FullAddress]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FullAddress](
	[FullAddressID] [int] IDENTITY(1,1) NOT NULL,
	[Country] [int] NOT NULL,
	[State] [int] NULL,
	[City] [int] NOT NULL,
	[Address] [int] NOT NULL,
 CONSTRAINT [PK_FullAddress] PRIMARY KEY CLUSTERED 
(
	[FullAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FullAddress]  WITH CHECK ADD  CONSTRAINT [FK_FullAddress_Address] FOREIGN KEY([Address])
REFERENCES [dbo].[Address] ([AddressesID])
GO
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_Address]
GO
ALTER TABLE [dbo].[FullAddress]  WITH CHECK ADD  CONSTRAINT [FK_FullAddress_City] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_City]
GO
ALTER TABLE [dbo].[FullAddress]  WITH CHECK ADD  CONSTRAINT [FK_FullAddress_Countries] FOREIGN KEY([Country])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_Countries]
GO
ALTER TABLE [dbo].[FullAddress]  WITH CHECK ADD  CONSTRAINT [FK_FullAddress_State] FOREIGN KEY([State])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[FullAddress] CHECK CONSTRAINT [FK_FullAddress_State]
GO
