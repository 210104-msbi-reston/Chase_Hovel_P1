USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ProductionHouse_Warehouse_Movements]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse_Warehouse_Movements](
	[MovementID] [int] IDENTITY(1,1) NOT NULL,
	[MovementType] [nvarchar](10) NOT NULL,
	[MovementDateTime] [date] NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
	[ProductionHouseID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
 CONSTRAINT [PK_ProductionHouse_Warehouse_Movements] PRIMARY KEY CLUSTERED 
(
	[MovementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductionHouse_Warehouse_Movements]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_Warehouse_Movements_ProductionHouse] FOREIGN KEY([ProductionHouseID])
REFERENCES [dbo].[ProductionHouse] ([ProductionHouseID])
GO
ALTER TABLE [dbo].[ProductionHouse_Warehouse_Movements] CHECK CONSTRAINT [FK_ProductionHouse_Warehouse_Movements_ProductionHouse]
GO
ALTER TABLE [dbo].[ProductionHouse_Warehouse_Movements]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHouse_Warehouse_Movements_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[ProductionHouse_Warehouse_Movements] CHECK CONSTRAINT [FK_ProductionHouse_Warehouse_Movements_Warehouse]
GO
