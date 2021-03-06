USE [Chase_Hovel_Project1]
GO
/****** Object:  StoredProcedure [dbo].[proc_CreateNewCustomer]    Script Date: 2/2/2021 5:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_CreateNewCustomer]
@name nvarchar(50),
@UniqueID nvarchar(20),
@Country nvarchar(50),
@State nvarchar(50) = 'N/A',
@City nvarchar(50),
@Address nvarchar (50),
@CustomerID int output
as
begin
	declare @CountryID int
	declare @StateID int
	declare @CityID int
	declare @AddressID int
	declare @FullAddressID int
begin try
	begin TRAN
	IF EXISTS(select top 1 * from Customer where CustomerIdentity = @UniqueID)
	begin
		throw 323465, N'That ID has already been used',1;
	end

	IF EXISTS (select top 1 * from Countries where CountryName = @Country)
	begin
		set @CountryID = (select CountryID from Countries where CountryName = @Country)
	end
	else
	begin
		throw 99999, N'The Given Country Does Not Exist',1;
	end

	IF EXISTS(select top 1 * from State where StateName = @State and Country = @CountryID)
	begin
		set @StateID = (select StateID from State where StateName = @State and Country = @CountryID)
	end
	else
	begin
		insert into State values(@State,@CountryID)
		set @StateID = (select StateID from State where StateName = @State and Country = @CountryID)
	end

	if EXISTS(select top 1 * from City where CityName = @City)
	begin
		set @CityID = (select CityID from City where CityName = @City)
	end
	else
	begin
		insert into City values (@city)
		set @CityID = (select CityID from City where CityName = @City)
	end
	
	IF EXISTS(select top 1 * from Address where AddressString = @Address)
	begin
		set @AddressID = (select AddressesID from Address where AddressString = @Address)
	end
	else
	begin
		insert into Address values (@Address)
		set @AddressID = (select AddressesID from Address where AddressString = @Address)
	end

	IF EXISTS(select top 1 * from FullAddress FA where FA.Address = @AddressID
												   and FA.City = @CityID
												   and FA.Country = @CountryID
												   and FA.State = @StateID)
	begin
		set @FullAddressID = (select FullAddressID from FullAddress FA where FA.Address = @AddressID
																	  and FA.City = @CityID
																	  and FA.Country = @CountryID
																	  and FA.State = @StateID)
	end
	else
	begin
		insert into FullAddress values(@CountryID,@StateID,@CityID,@AddressID)
		set @FullAddressID = (select FullAddressID from FullAddress FA where FA.Address = @AddressID
																	  and FA.City = @CityID
																	  and FA.Country = @CountryID
																	  and FA.State = @StateID)
	end

		insert into Customer Values(@name,@UniqueID,@FullAddressID)
		set @CustomerID = (select CustomerID from Customer where CustomerIdentity = @UniqueID)
	COMMIT TRAN
end try
begin catch
	ROLLBACK TRAN
	print(ERROR_MESSAGE())
end catch

end
GO
