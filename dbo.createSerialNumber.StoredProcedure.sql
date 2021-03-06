USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[createSerialNumber]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[createSerialNumber]
@prodHouseNum int,
@productSN nvarchar(20)OUTPUT
as
begin
begin try
	begin TRAN
	declare @productionHouseNumberCountry int = (select ProductionHouseCountry from ProductionHouse where ProductionHouseID = @prodHouseNum)
	declare @countryOfOrigin nvarchar(80) = (select CountryName from Countries where CountryID = @productionHouseNumberCountry)
	declare @timeCreate nvarchar(30) = CONVERT(nvarchar,GETDATE(),12)
	declare @ContinentNumber int = (select Continent from Countries where CountryID = @productionHouseNumberCountry)
	declare @productType int = (select top 1 ProductTypeID from ProductType order by newid())
	declare @firstTwoLetters nvarchar(2) = substring(@countryOfOrigin,1,2)
	declare @lastTwoLetters nvarchar(2) = reverse(substring(reverse(@countryOfOrigin),1,2))
	set @productSN = CONCAT(@firstTwoLetters,@timeCreate,@prodHouseNum,@ContinentNumber,@lastTwoLetters,@productType)
	IF EXISTS(select * from product where @productSN = ProductSerialNumber)
	begin
		set @productSN = CONCAT(@firstTwoLetters,@timeCreate,@prodHouseNum,@ContinentNumber,@lastTwoLetters,@productType,Round(rand()*9,0),Round(Rand()*9,0),Round(rand()*9,0),Round(rand()*9,0))
	end
	declare @priceToCreate float = (select CreationPrice from ProductType where ProductTypeID = @productType)
	declare @taxRate float = (select TaxRate from Countries where CountryID = @productionHouseNumberCountry)
	declare @currentPrice float= (@taxRate * @priceToCreate)/100 + @priceToCreate
	insert into Product values(@productSN,@productType,@currentPrice)
	declare @warehousePlacement int = (select TOP(1) WarehouseID from Warehouse where WarehouseCountry = @productionHouseNumberCountry order by NEWID())
	insert into WarehouseInventory values (@productSN,@warehousePlacement)
	insert into ProductionHouse_Warehouse_Movements values('Store',GETDATE(),@productSN,@prodHouseNum,@warehousePlacement)
	Commit TRAN
end try
begin catch
	rollback TRAN
	print('Error Creating Serial Number, Likely Invalid ProductionHouse Number, Working Numbers 19-36')
	declare @message nvarchar(MAX) = ERROR_MESSAGE(),
			@severity int = ERROR_SEVERITY(),
			@errorState int = ERROR_STATE()
	RAISERROR(@message,@severity,@errorState);
end catch
end


GO
