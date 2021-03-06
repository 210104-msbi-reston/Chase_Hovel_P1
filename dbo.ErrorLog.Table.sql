USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorDate] [datetime] NULL,
	[ErrorMsg] [varchar](max) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorProc] [sysname] NOT NULL,
	[ErrorLine] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (getdate()) FOR [ErrorDate]
GO
