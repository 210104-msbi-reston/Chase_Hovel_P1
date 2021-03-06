USE [Chase_Hovel_Project1]
GO
/****** Object:  Table [dbo].[Store_Customer_Transaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Customer_Transaction](
	[St_Cu_TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TransactionInfoID] [int] NOT NULL,
 CONSTRAINT [PK_Store_Customer_Transaction] PRIMARY KEY CLUSTERED 
(
	[St_Cu_TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Store_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Store_Customer_Transaction_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Store_Customer_Transaction] CHECK CONSTRAINT [FK_Store_Customer_Transaction_Customer]
GO
ALTER TABLE [dbo].[Store_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Store_Customer_Transaction_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Store_Customer_Transaction] CHECK CONSTRAINT [FK_Store_Customer_Transaction_Store]
GO
ALTER TABLE [dbo].[Store_Customer_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Store_Customer_Transaction_TransactionInfo] FOREIGN KEY([TransactionInfoID])
REFERENCES [dbo].[TransactionInfo] ([TransactionInfoID])
GO
ALTER TABLE [dbo].[Store_Customer_Transaction] CHECK CONSTRAINT [FK_Store_Customer_Transaction_TransactionInfo]
GO
