USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[createWarehouses]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[createWarehouses]
as
begin
declare @countryNo int = 1
declare @WarehouseName nvarchar(400)
declare @WarehouseNo int = 0
declare @WarehousePer int = 0
while @countryNo < 226
	begin
		while @WarehousePer < 4
		begin
			declare @CountryName nvarchar(400) = (select Countries.CountryName from Countries where CountryID = @countryNo)
			---print(@CountryName)
			set @WarehouseNo = @WarehouseNo + 1
			set @WarehousePer = @WarehousePer + 1
			set @WarehouseName = CONCAT(@CountryName,'Warehouse',@WarehousePer)
			insert into Warehouse values(@WarehouseNo,@WarehouseName,@countryNo)
		end
		set @countryNo = @countryNo + 1
		set @WarehousePer = 0
	end
end
GO
