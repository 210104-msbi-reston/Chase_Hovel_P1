USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[LastName]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastName](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NULL,
 CONSTRAINT [PK_LastName] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
