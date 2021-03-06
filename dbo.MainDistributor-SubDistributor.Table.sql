USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[MainDistributor-SubDistributor]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainDistributor-SubDistributor](
	[MainDistributorID] [int] NOT NULL,
	[SubDistributorID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainDistributor-SubDistributor]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor-SubDistributor_MainDistributor] FOREIGN KEY([MainDistributorID])
REFERENCES [dbo].[MainDistributor] ([MainDistributorID])
GO
ALTER TABLE [dbo].[MainDistributor-SubDistributor] CHECK CONSTRAINT [FK_MainDistributor-SubDistributor_MainDistributor]
GO
ALTER TABLE [dbo].[MainDistributor-SubDistributor]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor-SubDistributor_SubDistributor] FOREIGN KEY([SubDistributorID])
REFERENCES [dbo].[SubDistributor] ([SubDistributorID])
GO
ALTER TABLE [dbo].[MainDistributor-SubDistributor] CHECK CONSTRAINT [FK_MainDistributor-SubDistributor_SubDistributor]
GO
