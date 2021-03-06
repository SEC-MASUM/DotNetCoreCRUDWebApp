USE [master]
GO
/****** Object:  Database [StudentList_DB]    Script Date: 7/19/2021 8:01:34 PM ******/
CREATE DATABASE [StudentList_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentList_DB', FILENAME = N'D:\BACKUP\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudentList_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentList_DB_log', FILENAME = N'D:\BACKUP\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\StudentList_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentList_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentList_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentList_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentList_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentList_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentList_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentList_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentList_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StudentList_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentList_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentList_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentList_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentList_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentList_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentList_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentList_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentList_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentList_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentList_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentList_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentList_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentList_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentList_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentList_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentList_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentList_DB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentList_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentList_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentList_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentList_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentList_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentList_DB] SET QUERY_STORE = OFF
GO
USE [StudentList_DB]
GO
/****** Object:  Table [dbo].[Department_tb]    Script Date: 7/19/2021 8:01:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_tb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_tb]    Script Date: 7/19/2021 8:01:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_tb](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Description] [nvarchar](350) NULL,
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Student_tb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StudentList_DB] SET  READ_WRITE 
GO
