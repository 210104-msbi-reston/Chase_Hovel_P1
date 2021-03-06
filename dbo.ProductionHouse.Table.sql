USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ProductionHouse]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse](
	[ProductionHouseID] [int] IDENTITY(1,1) NOT NULL,
	[ProductionHouseContient] [int] NOT NULL,
	[ProductionHouseCountry] [int] NOT NULL,
 CONSTRAINT [PK_ProductionHouse] PRIMARY KEY CLUSTERED 
(
	[ProductionHouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
