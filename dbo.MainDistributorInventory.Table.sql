USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[MainDistributorInventory]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainDistributorInventory](
	[MainDistributorInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[DistributorID] [int] NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_MainDistributorInventory] PRIMARY KEY CLUSTERED 
(
	[MainDistributorInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainDistributorInventory]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributorInventory_MainDistributor] FOREIGN KEY([DistributorID])
REFERENCES [dbo].[MainDistributor] ([MainDistributorID])
GO
ALTER TABLE [dbo].[MainDistributorInventory] CHECK CONSTRAINT [FK_MainDistributorInventory_MainDistributor]
GO
