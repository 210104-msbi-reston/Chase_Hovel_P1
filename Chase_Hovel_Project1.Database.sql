USE [master]
GO
/****** Object:  Database [Chase_Hovel_Project1]    Script Date: 2/2/2021 5:47:30 PM ******/
CREATE DATABASE [Chase_Hovel_Project1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chase_Hovel_Project1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LEARNINGSERVER\MSSQL\DATA\Chase_Hovel_Project1.mdf' , SIZE = 270336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chase_Hovel_Project1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.LEARNINGSERVER\MSSQL\DATA\Chase_Hovel_Project1_log.ldf' , SIZE = 598016KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Chase_Hovel_Project1] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chase_Hovel_Project1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chase_Hovel_Project1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET RECOVERY FULL 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET  MULTI_USER 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chase_Hovel_Project1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chase_Hovel_Project1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Chase_Hovel_Project1', N'ON'
GO
ALTER DATABASE [Chase_Hovel_Project1] SET QUERY_STORE = OFF
GO
USE [Chase_Hovel_Project1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE [Chase_Hovel_Project1] SET  READ_WRITE 
GO
