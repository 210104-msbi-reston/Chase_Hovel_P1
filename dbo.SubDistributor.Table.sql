USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[SubDistributor]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributor](
	[SubDistributorID] [int] IDENTITY(1,1) NOT NULL,
	[SubDistributorName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_SubDistributor] PRIMARY KEY CLUSTERED 
(
	[SubDistributorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
