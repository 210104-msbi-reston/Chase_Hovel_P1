USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[TransactionInfo]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionInfo](
	[TransactionInfoID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[ProductSerialNumber] [nvarchar](20) NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[TransactionType] [nvarchar](12) NULL,
 CONSTRAINT [PK_TransactionInfo] PRIMARY KEY CLUSTERED 
(
	[TransactionInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_TransactionInfo_10_699149536__K4_K2_K3_1]    Script Date: 2/2/2021 5:47:30 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_TransactionInfo_10_699149536__K4_K2_K3_1] ON [dbo].[TransactionInfo]
(
	[TotalPrice] ASC,
	[TransactionDateTime] ASC,
	[ProductSerialNumber] ASC
)
INCLUDE([TransactionInfoID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [_dta_index_TransactionInfo_10_699149536__K5_K3_K2D_1]    Script Date: 2/2/2021 5:47:30 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_TransactionInfo_10_699149536__K5_K3_K2D_1] ON [dbo].[TransactionInfo]
(
	[TransactionType] ASC,
	[ProductSerialNumber] ASC,
	[TransactionDateTime] DESC
)
INCLUDE([TransactionInfoID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionInfo] ADD  CONSTRAINT [DF_TransactionInfo_TransactionDateTime]  DEFAULT (getdate()) FOR [TransactionDateTime]
GO
ALTER TABLE [dbo].[TransactionInfo]  WITH CHECK ADD  CONSTRAINT [FK_TransactionInfo_Product] FOREIGN KEY([ProductSerialNumber])
REFERENCES [dbo].[Product] ([ProductSerialNumber])
GO
ALTER TABLE [dbo].[TransactionInfo] CHECK CONSTRAINT [FK_TransactionInfo_Product]
GO
