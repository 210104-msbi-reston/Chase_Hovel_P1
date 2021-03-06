USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateNewSpecificProduct]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_CreateNewSpecificProduct]
@ProductionHouseNum int,
@productType int,
@productSerialNumber nvarchar(20) output
as
begin
begin try
	begin TRAN
	declare @productionHouseNumberCountry int = (select ProductionHouseCountry from ProductionHouse where ProductionHouseID = @ProductionHouseNum)
	declare @countryOfOrigin nvarchar(80) = (select CountryName from Countries where CountryID = @productionHouseNumberCountry)
	declare @timeCreate nvarchar(30) = CONVERT(nvarchar,GETDATE(),12)
	declare @ContinentNumber int = (select Continent from Countries where CountryID = @productionHouseNumberCountry)
	declare @firstTwoLetters nvarchar(2) = substring(@countryOfOrigin,1,2)
	declare @lastTwoLetters nvarchar(2) = reverse(substring(reverse(@countryOfOrigin),1,2))
	set @productSerialNumber = CONCAT(@firstTwoLetters,@timeCreate,@ProductionHouseNum,@ContinentNumber,@lastTwoLetters,@productType)
	declare @priceToCreate float = (select CreationPrice from ProductType where ProductTypeID = @productType)
	declare @taxRate float = (select TaxRate from Countries where CountryID = @productionHouseNumberCountry)
	declare @currentPrice float= (@taxRate * @priceToCreate)/100
	insert into Product values(@productSerialNumber,@productType,@currentPrice)
	declare @warehousePlacement int = (select TOP(1) WarehouseID from Warehouse where WarehouseCountry = @productionHouseNumberCountry order by NEWID())
	insert into WarehouseInventory values (@productSerialNumber,@warehousePlacement)
	insert into ProductionHouse_Warehouse_Movements values('Store',GETDATE(),@productSerialNumber,@ProductionHouseNum,@warehousePlacement)
	Commit TRAN
end try
begin catch
	rollback TRAN
	print('Error Creating Serial Number, Likely Invalid ProductionHouse Number, Working Numbers 19-36')
end catch
end
GO
