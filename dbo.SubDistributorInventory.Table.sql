USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[SubDistributorInventory]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributorInventory](
	[SubDistributorInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[SubDistributorID] [int] NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_SubDistributorInventory] PRIMARY KEY CLUSTERED 
(
	[SubDistributorInventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubDistributorInventory]  WITH CHECK ADD  CONSTRAINT [FK_SubDistributorInventory_SubDistributor] FOREIGN KEY([SubDistributorID])
REFERENCES [dbo].[SubDistributor] ([SubDistributorID])
GO
ALTER TABLE [dbo].[SubDistributorInventory] CHECK CONSTRAINT [FK_SubDistributorInventory_SubDistributor]
GO
