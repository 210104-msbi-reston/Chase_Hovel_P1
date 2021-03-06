USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[MainDistributor_SubDistributor_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainDistributor_SubDistributor_Transaction](
	[MD_SD_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[MainDistributorID] [int] NOT NULL,
	[SubDistributorID] [int] NOT NULL,
	[TransactionInfoID] [int] NOT NULL,
 CONSTRAINT [PK_MainDistributor_SubDistributor_Transaction] PRIMARY KEY CLUSTERED 
(
	[MD_SD_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainDistributor_SubDistributor_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_SubDistributor_Transaction_MainDistributor] FOREIGN KEY([MainDistributorID])
REFERENCES [dbo].[MainDistributor] ([MainDistributorID])
GO
ALTER TABLE [dbo].[MainDistributor_SubDistributor_Transaction] CHECK CONSTRAINT [FK_MainDistributor_SubDistributor_Transaction_MainDistributor]
GO
ALTER TABLE [dbo].[MainDistributor_SubDistributor_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_SubDistributor_Transaction_SubDistributor] FOREIGN KEY([SubDistributorID])
REFERENCES [dbo].[SubDistributor] ([SubDistributorID])
GO
ALTER TABLE [dbo].[MainDistributor_SubDistributor_Transaction] CHECK CONSTRAINT [FK_MainDistributor_SubDistributor_Transaction_SubDistributor]
GO
ALTER TABLE [dbo].[MainDistributor_SubDistributor_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_MainDistributor_SubDistributor_Transaction_TransactionInfo] FOREIGN KEY([TransactionInfoID])
REFERENCES [dbo].[TransactionInfo] ([TransactionInfoID])
GO
ALTER TABLE [dbo].[MainDistributor_SubDistributor_Transaction] CHECK CONSTRAINT [FK_MainDistributor_SubDistributor_Transaction_TransactionInfo]
GO
