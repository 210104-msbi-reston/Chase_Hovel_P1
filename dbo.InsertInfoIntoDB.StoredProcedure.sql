USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[InsertInfoIntoDB]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertInfoIntoDB]
as
begin
begin TRAN
	Begin try
	declare @numOfTransaction int = Round(rand()*5,0)
	---declare the first two variables
	declare @productSerialNum nvarchar(20)
	declare @ProductionHouseID int = (select top 1 ProductionHouseID from ProductionHouse order by newid())
	---create a random product and store it in the warehouse using

    exec createSerialNumber @ProductionHouseID, @productSerialNum output

	---we now have @ProductionHouseID and @productSerialNum
	---next step is ProductionHouse selling to a MainDistributor
	if(@numOfTransaction > 1)
	begin
		declare @productionHouseContNum int = (select ProductionHouseContient from ProductionHouse where  ProductionHouseID = @ProductionHouseID)
		declare @productionHouseContName nvarchar(255) = (select ContinentName from Continent where ContinentID = @productionHouseContNum)
		declare @mainDistributorID int = (select top 1 [Distributor ID] from v_MainDistributorLocationInfo M where M.[Continent Name] = @productionHouseContName order by newid())
	
		exec proc_ProductionHouseTransaction @ProductionHouseID,@mainDistributorID,@productSerialNum,'Sale'
	end
	--the main distributor has receive the item, he must now sell it to a SubDistributor
	if(@numOfTransaction > 2)
	begin
		declare @subDistributorID int =(select top 1 SubDistributorID from [MainDistributor-SubDistributor] where MainDistributorID = @mainDistributorID order by newid())

		exec proc_MainDistributorTransaction @mainDistributorID,@subDistributorID,@productSerialNum,'Sale'
	end
	
	
	---the sub distributor has received the item, he must now sell it to a channel partner
	if(@numOfTransaction > 3)
	begin
		declare @channelPartnerID int = (select top 1 ChannelPartnerID from SubDistributorChannelPartnerConnections where SubDistributorID = @subDistributorID order by newid())
		print(Concat('CPID: ',@channelPartnerID))
		exec proc_SubDistributorTransaction @subDistributorID,@channelPartnerID,@productSerialNum,'Sale'
	end
	
	
	----  the channel partner has received the item, he must now sell it to a store
	if(@numOfTransaction > 4)
	begin
		declare @zoneID int =(select Zone from ChannelPartner where ChannelPartnerID = @channelPartnerID)
		declare @storeID int =(select top 1 StoreID from Store where Zone = @zoneID order by newid())

		exec proc_ChannelPartnerTransaction @channelPartnerID,@storeID,@productSerialNum,'Sale'
	end



	---- the store now has the object, they must sell it to a customer
	if(@numOfTransaction >= 5)
	begin

		declare @newOrReturningCustomer int = Round((rand()+1),0)
		declare @customerID int

		if(@newOrReturningCustomer %2 = 0)
		begin
			exec proc_createNewRandomCustomer @customerID output
		end
		else
		begin
			set @customerID = (select top 1 CustomerID from Customer order by newid())
		end

		exec proc_StoreTransaction @storeID,@customerID,@productSerialNum,'Sale'
	end

	declare @returned int = Round(rand()*2,0)


	--we had a faulty/broken product
	if(@numOfTransaction >= 5)
	begin
		if(@returned = 1)
		begin
			print('Returning A Product')
			print('Returning A Product')
			print('Returning A Product')
			set @numOfTransaction = Round(rand()*4+1,0)
			declare @newProductSerialNum nvarchar(20)
			---Customer returning to store
			if(@numOfTransaction = 1)
			begin
				exec proc_StoreTransaction @storeID,@customerID,@productSerialNum,'Return'
				IF EXISTS(select ProductSerialNumber from StoreInventory where StoreID = @storeID)
				begin
					set @newProductSerialNum = (select top 1 ProductSerialNumber from StoreInventory where StoreID = @storeID order by newid())
					exec proc_StoreTransaction @storeID,@customerID,@newProductSerialNum,'Replacement'
				end
			end

		---Store returning it to Channel Partner
			if(@numOfTransaction = 2)
			begin
				exec proc_ChannelPartnerTransaction @channelPartnerID,@storeID,@productSerialNum,'Return'
				IF EXISTS(select ProductSerialNumber from ChannelPartnerInventory where ChannelPartnetID = @channelPartnerID)
				begin
					set @newProductSerialNum = (select top 1 ProductSerialNumber from ChannelPartnerInventory where ChannelPartnetID = @channelPartnerID order by newID())
					exec proc_ChannelPartnerTransaction @channelPartnerID,@storeID,@newProductSerialNum,'Replacement'
				end
			end
		---Channel Partner returning to SubDistributor
			if(@numOfTransaction = 3)
			begin
				exec proc_SubDistributorTransaction @subDistributorID,@channelPartnerID,@productSerialNum,'Return'
				IF EXISTS(select ProductSerialNumber from SubDistributorInventory where SubDistributorID = @subDistributorID)
				begin
					set @newProductSerialNum = (select top 1 ProductSerialNumber from SubDistributorInventory where SubDistributorID = @subDistributorID order by newID())
					exec proc_SubDistributorTransaction @subDistributorID,@channelPartnerID,@newProductSerialNum,'Replacement'
				end
			end
		---SubDistributor returning to MainDistributor
			if(@numOfTransaction = 4)
			begin
				exec proc_MainDistributorTransaction @mainDistributorID,@subDistributorID,@productSerialNum,'Return'
				IF EXISTS(select ProductSerialNumber from MainDistributorInventory where DistributorID = @mainDistributorID)
				begin
					set @newProductSerialNum = (select top 1 ProductSerialNumber from SubDistributorInventory where SubDistributorID = @subDistributorID order by newID())
					exec proc_MainDistributorTransaction @mainDistributorID,@subDistributorID,@newProductSerialNum,'Replacement'
				end
			end
		---MainDistributor returning to ProductionHouse
			if(@numOfTransaction = 5)
			begin
				exec proc_ProductionHouseTransaction @ProductionHouseID,@mainDistributorID,@productSerialNum,'Return'
				declare @productType int = (select ProductType from Product where ProductSerialNumber = @productSerialNum)
				exec proc_CreateNewSpecificProduct @ProductionHouseID,@productType,@newProductSerialNum
				exec proc_ProductionHouseTransaction @ProductionHouseID,@mainDistributorID,@productSerialNum,'Replacement'
			end
		end
	end
	Commit TRAN
	end try
	begin catch
			if @@TRANCOUNT > 0 rollback transaction
			print(ERROR_MESSAGE())
			print(ERROR_PROCEDURE())
			print(ERROR_LINE())
	end catch
end
GO
