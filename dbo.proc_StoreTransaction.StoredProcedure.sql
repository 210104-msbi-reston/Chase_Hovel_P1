USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_StoreTransaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_StoreTransaction]
@StoreID int,
@CustomerID int,
@ProductSerialNumber nvarchar(20),
@TransactionType nvarchar(12)
as
begin
	
	begin
	begin try
		BEGIN TRAN
		declare @sellPrice float = (select CurrentPrice from Product where ProductSerialNumber = @ProductSerialNumber)
		declare @currentTime datetime = GETDATE()
		declare @transactionID int
		if(@TransactionType = 'Sale')
		begin
				if exists(SELECT TOP 1 * FROM StoreInventory where ProductSerialNumber = @ProductSerialNumber and StoreID = @StoreID)
				begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,@sellPrice,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into Store_Customer_Transaction values(@StoreID,@CustomerID,@transactionID)
				end
				else
				begin
					THROW 356463,'STORE DOESNT OWN THAT PRODUCT',1;
				end
		end
		else if(@TransactionType = 'Replacement')
		begin
				if exists(SELECT TOP 1 * FROM StoreInventory where ProductSerialNumber = @ProductSerialNumber and StoreID = @StoreID)
				begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,0,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into Store_Customer_Transaction values(@StoreID,@CustomerID,@transactionID)
				end
				else
				begin
					THROW 356463,'STORE DOESNT OWN THAT PRODUCT',1;
				end
		end
		else if(@TransactionType = 'Return')
		begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,0,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into Store_Customer_Transaction values(@StoreID,@CustomerID,@transactionID)
		end
		else
		begin
			throw 987654, N'Invalid Transaction Type',1;
		end
		COMMIT TRAN
	end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction
		print(ERROR_MESSAGE())
	end catch
	end	
end
GO
