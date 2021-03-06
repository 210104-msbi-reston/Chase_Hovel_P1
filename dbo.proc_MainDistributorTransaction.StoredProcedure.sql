USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_MainDistributorTransaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_MainDistributorTransaction]
@MainDistributorID int,
@SubDistributorID int,
@ProductSerialNumber nvarchar(20),
@transactionType nvarchar(12)
as
begin
BEGIN TRAN
	begin try
		declare @sellPrice float = (select CurrentPrice from Product where ProductSerialNumber = @ProductSerialNumber)
		declare @currentTime datetime = GETDATE()
		declare @transactionID  int
		if(@TransactionType = 'Sale')
		begin
			if exists(SELECT TOP 1 * FROM MainDistributorInventory where ProductSerialNumber = @ProductSerialNumber and DistributorID = @MainDistributorID)
			begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,@sellPrice,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into MainDistributor_SubDistributor_Transaction values(@MainDistributorID,@SubDistributorID,@transactionID)
			end
			else
			begin
				THROW 356460,'MAIN DISTRIBUTOR DOESNT OWN THAT PRODUCT',1;
			end
		end
		else if(@TransactionType = 'Replacement')
		begin
			if exists(SELECT TOP 1 * FROM MainDistributorInventory where ProductSerialNumber = @ProductSerialNumber and DistributorID = @MainDistributorID)
			begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,0,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into MainDistributor_SubDistributor_Transaction values(@MainDistributorID,@SubDistributorID,@transactionID)
			end
			else
			begin
				THROW 356460,'MAIN DISTRIBUTOR DOESNT OWN THAT PRODUCT',1;
			end
		end
		else if(@TransactionType = 'Return')
		begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,0,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into MainDistributor_SubDistributor_Transaction values(@MainDistributorID,@SubDistributorID,@transactionID)
		end
		else
		begin
			throw 786987, N'Invalid Transaction Type',1;
		end
	COMMIT TRAN
	end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction
		print(ERROR_MESSAGE())
	end catch

end
GO
