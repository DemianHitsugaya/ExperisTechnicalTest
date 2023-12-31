USE [master]
GO
/****** Object:  Database [TestExperis]    Script Date: 9/25/2023 11:26:45 PM ******/
CREATE DATABASE [TestExperis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestExperis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestExperis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestExperis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestExperis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestExperis] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestExperis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestExperis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestExperis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestExperis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestExperis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestExperis] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestExperis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestExperis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestExperis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestExperis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestExperis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestExperis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestExperis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestExperis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestExperis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestExperis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestExperis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestExperis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestExperis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestExperis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestExperis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestExperis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestExperis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestExperis] SET RECOVERY FULL 
GO
ALTER DATABASE [TestExperis] SET  MULTI_USER 
GO
ALTER DATABASE [TestExperis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestExperis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestExperis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestExperis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestExperis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestExperis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestExperis', N'ON'
GO
ALTER DATABASE [TestExperis] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestExperis] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestExperis]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 9/25/2023 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 9/25/2023 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[salary] [int] NOT NULL,
	[department_id] [int] NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees_projects]    Script Date: 9/25/2023 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees_projects](
	[project_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
 CONSTRAINT [PK_employees_projects] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projects]    Script Date: 9/25/2023 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[budget] [int] NOT NULL,
 CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_departments] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_departments]
GO
ALTER TABLE [dbo].[employees_projects]  WITH CHECK ADD  CONSTRAINT [FK_employees_projects_employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([id])
GO
ALTER TABLE [dbo].[employees_projects] CHECK CONSTRAINT [FK_employees_projects_employees]
GO
ALTER TABLE [dbo].[employees_projects]  WITH CHECK ADD  CONSTRAINT [FK_employees_projects_projects] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[employees_projects] CHECK CONSTRAINT [FK_employees_projects_projects]
GO
USE [master]
GO
ALTER DATABASE [TestExperis] SET  READ_WRITE 
GO
