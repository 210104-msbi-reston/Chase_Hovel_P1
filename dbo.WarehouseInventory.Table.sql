USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[WarehouseInventory]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseInventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
	[WarehouseID] [int] NOT NULL,
 CONSTRAINT [PK_WarehouseInventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WarehouseInventory]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseInventory_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[WarehouseInventory] CHECK CONSTRAINT [FK_WarehouseInventory_Product]
GO
ALTER TABLE [dbo].[WarehouseInventory]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseInventory_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[WarehouseInventory] CHECK CONSTRAINT [FK_WarehouseInventory_Warehouse]
GO
