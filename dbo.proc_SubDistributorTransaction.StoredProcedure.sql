USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_SubDistributorTransaction]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_SubDistributorTransaction]
@SubDistributorID int,
@ChannelPartnerID int,
@ProductSerialNumber nvarchar(20),
@TransactionType nvarchar(12)
as
begin
	begin try
		BEGIN TRAN
		declare @sellPrice float = (select CurrentPrice from Product where ProductSerialNumber = @ProductSerialNumber)
		declare @currentTime datetime = GETDATE()
		declare @transactionID int
		if(@TransactionType = 'Sale')
		begin
			IF EXISTS(select top 1 * from SubDistributorInventory where SubDistributorID = @SubDistributorID and ProductSerialNumber = @ProductSerialNumber)
			begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,@sellPrice,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into SubDistributor_ChannelPartner_Transaction values(@SubDistributorID,@ChannelPartnerID,@transactionID)
			end
			else
			begin
				THROW 356470,'SubDistributor DOES NOT OWN THAT PRODUCT',1;
			end
		end
		else if(@TransactionType = 'Replacement')
		begin
			IF EXISTS(select top 1 * from SubDistributorInventory where SubDistributorID = @SubDistributorID and ProductSerialNumber = @ProductSerialNumber)
			begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,0,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into SubDistributor_ChannelPartner_Transaction values(@SubDistributorID,@ChannelPartnerID,@transactionID)
			end
			else
			begin
				THROW 356470,'SubDistributor DOES NOT OWN THAT PRODUCT',1;
			end
		end
		else if(@TransactionType = 'Return')
		begin
				insert into TransactionInfo values (@currentTime,@ProductSerialNumber,0,@TransactionType)
				set @transactionID = (select top 1 TransactionInfoID from TransactionInfo
											where ProductSerialNumber = @ProductSerialNumber
											and TransactionType = @TransactionType
											order by TransactionDateTime desc)
				insert into SubDistributor_ChannelPartner_Transaction values(@SubDistributorID,@ChannelPartnerID,@transactionID)
		end
		else
			throw 786987, N'Invalid Transaction Type',1;
		COMMIT TRAN
	end try
	begin catch
		if @@TRANCOUNT > 0 rollback transaction
		print(ERROR_MESSAGE())
	end catch
end
GO
