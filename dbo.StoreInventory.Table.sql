USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[StoreInventory]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreInventory](
	[StoreInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_StoreInventory] PRIMARY KEY CLUSTERED 
(
	[StoreInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StoreInventory]  WITH CHECK ADD  CONSTRAINT [FK_StoreInventory_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[StoreInventory] CHECK CONSTRAINT [FK_StoreInventory_Store]
GO
