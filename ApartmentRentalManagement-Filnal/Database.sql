USE [master]
GO
/****** Object:  Database [apartment_manager]    Script Date: 2/25/2024 4:08:40 PM ******/
CREATE DATABASE [apartment_manager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'apartment_manager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\apartment_manager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'apartment_manager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\apartment_manager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [apartment_manager] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [apartment_manager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [apartment_manager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [apartment_manager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [apartment_manager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [apartment_manager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [apartment_manager] SET ARITHABORT OFF 
GO
ALTER DATABASE [apartment_manager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [apartment_manager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [apartment_manager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [apartment_manager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [apartment_manager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [apartment_manager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [apartment_manager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [apartment_manager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [apartment_manager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [apartment_manager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [apartment_manager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [apartment_manager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [apartment_manager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [apartment_manager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [apartment_manager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [apartment_manager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [apartment_manager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [apartment_manager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [apartment_manager] SET  MULTI_USER 
GO
ALTER DATABASE [apartment_manager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [apartment_manager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [apartment_manager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [apartment_manager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [apartment_manager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [apartment_manager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [apartment_manager] SET QUERY_STORE = ON
GO
ALTER DATABASE [apartment_manager] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [apartment_manager]
GO
/****** Object:  Table [dbo].[apartments]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apartments](
	[id] [varchar](20) NOT NULL,
	[notes] [text] NULL,
	[area_name] [varchar](20) NOT NULL,
	[household_id] [varchar](20) NULL,
	[type_id] [int] NOT NULL,
	[status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apartments_types]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apartments_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](255) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contracts]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contract_number] [varchar](20) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[apartment_id] [varchar](20) NOT NULL,
	[staff_id] [varchar](20) NOT NULL,
	[household_id_number] [varchar](20) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[contract_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_chart]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_chart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[record_date] [date] NOT NULL,
	[occupancy_ratio] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[households]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[households](
	[id_number] [varchar](20) NOT NULL,
	[household_head_name] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](20) NOT NULL,
	[date_of_birth] [date] NULL,
	[email] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[gender] [varchar](10) NULL,
	[member_quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_invoice]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[staff_id] [varchar](20) NOT NULL,
	[printing_date] [date] NOT NULL,
	[payment_date] [date] NULL,
	[apartment_id] [varchar](20) NOT NULL,
	[notes] [text] NULL,
	[service_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staffs]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staffs](
	[id] [varchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [varchar](20) NULL,
	[dob] [date] NULL,
	[email] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[id_number] [varchar](20) NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [varchar](20) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[apartments]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[apartments_types] ([id])
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD FOREIGN KEY([apartment_id])
REFERENCES [dbo].[apartments] ([id])
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD FOREIGN KEY([household_id_number])
REFERENCES [dbo].[households] ([id_number])
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[staffs] ([id])
GO
ALTER TABLE [dbo].[service_invoice]  WITH CHECK ADD FOREIGN KEY([apartment_id])
REFERENCES [dbo].[apartments] ([id])
GO
ALTER TABLE [dbo].[service_invoice]  WITH CHECK ADD FOREIGN KEY([service_id])
REFERENCES [dbo].[services] ([id])
GO
ALTER TABLE [dbo].[service_invoice]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[staffs] ([id])
GO
ALTER TABLE [dbo].[staffs]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[staffs] ([id])
GO
/****** Object:  StoredProcedure [dbo].[addApartment]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addApartment]
    @apartmentId VARCHAR(20),
    @notes TEXT,
    @areaName VARCHAR(20),
    @householdId VARCHAR(20),
    @typeId INT,
    @status VARCHAR(20)
AS
BEGIN
    INSERT INTO apartments (id, notes, area_name, household_id, type_id, status)
    VALUES (@apartmentId, @notes, @areaName, @householdId, @typeId, @status);
END
GO
/****** Object:  StoredProcedure [dbo].[addApartmentType]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addApartmentType]
    @typeName NVARCHAR(255),
    @price DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO apartments_types (type, price)
    VALUES (@typeName, @price);
END
GO
/****** Object:  StoredProcedure [dbo].[addContract]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addContract]
    @contractNumber VARCHAR(20),
    @startDate DATE,
    @endDate DATE,
    @apartmentId VARCHAR(20),
    @staffId VARCHAR(20),
    @householdIdNumber VARCHAR(20),
    @status BIT
AS
BEGIN
    INSERT INTO contracts (contract_number, start_date, end_date, apartment_id, staff_id, household_id_number, status)
    VALUES (@contractNumber, @startDate, @endDate, @apartmentId, @staffId, @householdIdNumber, @status);
END
GO
/****** Object:  StoredProcedure [dbo].[addDepartment]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addDepartment]
    @departmentName NVARCHAR(255)
AS
BEGIN
    INSERT INTO departments (name) VALUES (@departmentName);
END
GO
/****** Object:  StoredProcedure [dbo].[addHousehold]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addHousehold]
    @idNumber VARCHAR(20),
    @headName NVARCHAR(255),
    @phoneNumber VARCHAR(20),
    @dob DATE,
    @email VARCHAR(255),
    @image VARCHAR(255),
    @gender VARCHAR(10),
    @memberQuantity INT
AS
BEGIN
    INSERT INTO households (id_number, household_head_name, phone_number, date_of_birth, email, image, gender, member_quantity)
    VALUES (@idNumber, @headName, @phoneNumber, @dob, @email, @image, @gender, @memberQuantity);
END
GO
/****** Object:  StoredProcedure [dbo].[addService]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addService]
    @serviceName VARCHAR(255),
    @servicePrice DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO services (name, price) VALUES (@serviceName, @servicePrice);
END
GO
/****** Object:  StoredProcedure [dbo].[addServiceInvoice]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addServiceInvoice]
    @Name VARCHAR(255),
    @StaffId VARCHAR(20),
    @PrintingDate DATE,
	@PaymentDate DATE,
    @ApartmentId VARCHAR(20),
    @Notes TEXT,
    @ServiceId INT,
    @Quantity INT,
    @Price DECIMAL(10, 2),
    @Status BIT
AS
BEGIN
    INSERT INTO service_invoice (name, staff_id, printing_date, payment_date, apartment_id, notes, service_id, quantity, price, status)
    VALUES (@Name, @StaffId, @PrintingDate, @PaymentDate, @ApartmentId, @Notes, @ServiceId, @Quantity, @Price, @Status);
END
GO
/****** Object:  StoredProcedure [dbo].[addStaff]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addStaff]
    @staffId VARCHAR(20),
    @staffName NVARCHAR(255),
    @gender BIT,
    @address NVARCHAR(255),
    @phoneNumber VARCHAR(20),
    @dob DATE,
    @email VARCHAR(255),
    @image VARCHAR(255),
    @idNumber VARCHAR(20),
    @departmentId INT
AS
BEGIN
    INSERT INTO staffs (id, name, gender, address, phone_number, dob, email, image, id_number, department_id)
    VALUES (@staffId, @staffName, @gender, @address, @phoneNumber, @dob, @email, @image, @idNumber, @departmentId);
END
GO
/****** Object:  StoredProcedure [dbo].[addUser]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addUser]
    @userId VARCHAR(20),
    @username VARCHAR(255),
    @password VARCHAR(255),
    @role VARCHAR(50)
AS
BEGIN
    INSERT INTO users (id, username, password, role)
    VALUES (@userId, @username, @password, @role);
END
GO
/****** Object:  StoredProcedure [dbo].[changePassword]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[changePassword]
    @userId VARCHAR(20),
    @newPassword VARCHAR(255)
AS
BEGIN
    UPDATE users
    SET password = @newPassword
    WHERE id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[countInvoice]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[countInvoice]
	@serviceId INT = -1,
    @apartmentId VARCHAR(20) = NULL,
    @staffId VARCHAR(20) = NULL,
	@fromDate DATE = NULL,
    @toDate DATE = NULL
AS
BEGIN
	SELECT COUNT(id) total FROM service_invoice
	WHERE (@serviceId = -1 OR service_id = @serviceId)
      AND (@apartmentId IS NULL OR apartment_id = @apartmentId)
      AND (@staffId IS NULL OR staff_id = @staffId)
	  AND (@fromDate IS NULL OR printing_date >= @fromDate)
      AND (@toDate IS NULL OR printing_date <= @toDate)
END
GO
/****** Object:  StoredProcedure [dbo].[deleteApartment]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteApartment]
    @apartmentId VARCHAR(20)
AS
BEGIN
    DELETE FROM apartments WHERE id = @apartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteApartmentType]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteApartmentType]
    @typeId INT
AS
BEGIN
    DELETE FROM apartments_types WHERE id = @typeId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteContract]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteContract]
    @contractId INT
AS
BEGIN
    DELETE FROM contracts WHERE id = @contractId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteDepartment]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteDepartment]
    @departmentId INT
AS
BEGIN
    DELETE FROM departments WHERE id = @departmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteHousehold]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteHousehold]
    @idNumber VARCHAR(20)
AS
BEGIN
    DELETE FROM households WHERE id_number = @idNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteService]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteService]
    @serviceId INT
AS
BEGIN
    DELETE FROM services WHERE id = @serviceId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteServiceInvoice]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteServiceInvoice]
    @id INT
AS
BEGIN
    DELETE FROM service_invoice
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteStaff]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteStaff]
    @staffId VARCHAR(20)
AS
BEGIN
    DELETE FROM staffs WHERE id = @staffId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteUser]
    @userId VARCHAR(20)
AS
BEGIN
    DELETE FROM users WHERE id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllApartmentIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllApartmentIds]
AS
BEGIN
    SELECT id FROM apartments
    ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllApartments]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- APARTMENTS
CREATE PROCEDURE [dbo].[getAllApartments]
AS
BEGIN
    SELECT * FROM apartments;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllApartmentTypeIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllApartmentTypeIds]
AS
BEGIN
    SELECT id FROM apartments_types
    ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllApartmentTypes]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- APARTMENTS_TYPES
CREATE PROCEDURE [dbo].[getAllApartmentTypes]
AS
BEGIN
    SELECT * FROM apartments_types;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllContractIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllContractIds]
AS
BEGIN
    SELECT id FROM contracts
    ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllContracts]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- CONTRACTS
CREATE PROCEDURE [dbo].[getAllContracts]
AS
BEGIN
    SELECT * FROM contracts;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDepartmentIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllDepartmentIds]
AS
BEGIN
    SELECT id FROM departments
    ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDepartments]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- DEPARTMENTS
CREATE PROCEDURE [dbo].[getAllDepartments]
AS
BEGIN
    SELECT * FROM departments;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllHouseholdIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllHouseholdIds]
AS
BEGIN
    SELECT id_number FROM households
    ORDER BY id_number;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllHouseholds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- HOUSEHOLDS
CREATE PROCEDURE [dbo].[getAllHouseholds]
AS
BEGIN
    SELECT * FROM households;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllServiceIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllServiceIds]
AS
BEGIN
    SELECT id FROM services
	ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllServiceInvoices]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SERVICE INVOICE
CREATE PROCEDURE [dbo].[getAllServiceInvoices]
AS
BEGIN
    SELECT * FROM service_invoice;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllServices]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- SERVICE
CREATE PROCEDURE [dbo].[getAllServices]
AS
BEGIN
    SELECT * FROM services;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllStaffIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllStaffIds]
AS
BEGIN
    SELECT id FROM staffs
    ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllStaffs]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- STAFFS
CREATE PROCEDURE [dbo].[getAllStaffs]
AS
BEGIN
    SELECT * FROM staffs;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllUserIds]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllUserIds]
AS
BEGIN
    SELECT id FROM users
    ORDER BY id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllUsers]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- USERS
CREATE PROCEDURE [dbo].[getAllUsers]
AS
BEGIN
    SELECT * FROM users;
END
GO
/****** Object:  StoredProcedure [dbo].[getApartmentById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getApartmentById]
    @apartmentId VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM apartments
    WHERE id = @apartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[getApartmentTypeById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getApartmentTypeById]
    @id INT
AS
BEGIN
    SELECT *
    FROM apartments_types
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAreaNameById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAreaNameById]
    @id VARCHAR(20)
AS
BEGIN
    SELECT area_name
    FROM apartments
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getContractById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getContractById]
    @contractId INT
AS
BEGIN
    SELECT *
    FROM contracts
    WHERE id = @contractId;
END
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getDepartmentById]
    @id INT
AS
BEGIN
    SELECT *
    FROM departments
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentNameById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getDepartmentNameById]
    @id INT
AS
BEGIN
    SELECT name
    FROM departments
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getHouseholdById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getHouseholdById]
    @idNumber VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM households
    WHERE id_number = @idNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[getHouseholdHeadNameById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getHouseholdHeadNameById]
    @idNumber VARCHAR(20)
AS
BEGIN
    SELECT household_head_name
    FROM households
    WHERE id_number = @idNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOccupancyRatio]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOccupancyRatio]
AS
BEGIN
    DECLARE @OccupiedCount INT;
    DECLARE @TotalCount INT;
    DECLARE @OccupancyRatio DECIMAL(5, 2);

    SELECT @OccupiedCount = COUNT(*) FROM apartments WHERE status = 'Occupied';
    SELECT @TotalCount = COUNT(*) FROM apartments;

    IF @TotalCount = 0
        SET @OccupancyRatio = 0.0; -- To handle division by zero
    ELSE
        SET @OccupancyRatio = CONVERT(DECIMAL(5, 2), @OccupiedCount) / @TotalCount * 100;

    SELECT 
        @OccupiedCount AS OccupiedCount,
        @TotalCount AS TotalCount,
        @OccupancyRatio AS OccupancyRatio;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOccupancyRatioByYearMonth]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOccupancyRatioByYearMonth]
    @Year INT,
    @Month INT
AS
BEGIN
    DECLARE @StartDate DATE = DATEFROMPARTS(@Year, @Month, 1);
    DECLARE @EndDate DATE = EOMONTH(@StartDate);

    SELECT record_date, occupancy_ratio
    FROM data_chart
    WHERE record_date >= @StartDate AND record_date <= @EndDate;
END
GO
/****** Object:  StoredProcedure [dbo].[GetOccupiedApartments]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOccupiedApartments]
AS
BEGIN
    SELECT * 
    FROM apartments
    WHERE status = 'Occupied';
END
GO
/****** Object:  StoredProcedure [dbo].[getServiceById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getServiceById]
    @id INT
AS
BEGIN
    SELECT *
    FROM services
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getServiceInvoice]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[getServiceInvoice]
	@pageNumber INT,
	@rowOfPage INT,
	@serviceId INT = -1,
    @apartmentId VARCHAR(20) = NULL,
    @staffId VARCHAR(20) = NULL,
	@fromDate DATE = NULL,
    @toDate DATE = NULL
AS
BEGIN
	SELECT * FROM service_invoice
	WHERE (@serviceId = -1 OR service_id = @serviceId)
      AND (@apartmentId IS NULL OR apartment_id = @apartmentId)
      AND (@staffId IS NULL OR staff_id = @staffId)
	  AND (@fromDate IS NULL OR printing_date >= @fromDate)
      AND (@toDate IS NULL OR printing_date <= @toDate)
	ORDER BY id
	OFFSET (@pageNumber-1)*@rowOfPage ROWS
	FETCH NEXT @rowOfPage ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[getServiceInvoiceById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getServiceInvoiceById]
    @id INT
AS
BEGIN
    SELECT *
    FROM service_invoice
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getServiceInvoicesByApartmentId]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getServiceInvoicesByApartmentId]
    @ApartmentId VARCHAR(20)
AS
BEGIN
    SELECT
        id,
        name,
        printing_date,
		payment_date,
        notes,
        service_id,
        quantity,
        price,
		status
    FROM
        service_invoice
    WHERE
        apartment_id = @ApartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[getServiceNameById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getServiceNameById]
    @id INT
AS
BEGIN
    SELECT name
    FROM services
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getStaffById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getStaffById]
    @id VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM staffs
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getStaffNameById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getStaffNameById]
    @id VARCHAR(20)
AS
BEGIN
    SELECT name
    FROM staffs
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetStaffsWithoutUser]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetStaffsWithoutUser]
AS
BEGIN
    SELECT s.*
    FROM staffs s
    LEFT JOIN users u ON s.id = u.id
    WHERE u.id IS NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[getUserById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getUserById]
    @id VARCHAR(20)
AS
BEGIN
    SELECT *
    FROM users
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getUserByUsername]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getUserByUsername]
    @username NVARCHAR(255)
AS
BEGIN
    SELECT 
        id, 
        username, 
        password, 
        role
    FROM 
        users
    WHERE 
        username = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[getUsernameById]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getUsernameById]
    @id VARCHAR(20)
AS
BEGIN
    SELECT username
    FROM users
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetVacantApartments]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetVacantApartments]
AS
BEGIN
    SELECT * 
    FROM apartments
    WHERE status = 'Vacant';
END
GO
/****** Object:  StoredProcedure [dbo].[getValidatedContract]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getValidatedContract]
AS
BEGIN
    SELECT *
    FROM contracts
    WHERE status = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDataChartRow]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Data Chart
CREATE PROCEDURE [dbo].[InsertDataChartRow]
    @RecordDate DATE,
    @OccupancyRatio DECIMAL(5, 2)
AS
BEGIN
    INSERT INTO data_chart (record_date, occupancy_ratio)
    VALUES (@RecordDate, @OccupancyRatio);
END
GO
/****** Object:  StoredProcedure [dbo].[resetPassword]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[resetPassword] 
    @userId VARCHAR(20),
    @hashedPassword VARCHAR(255)
AS
BEGIN
    UPDATE users
    SET password = @hashedPassword
    WHERE id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[setStatusToTrue]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[setStatusToTrue]
    @invoiceId INT,
	@PaymentDate DATE
AS
BEGIN
    UPDATE service_invoice
    SET status = 1,
		payment_date = @PaymentDate
    WHERE id = @invoiceId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateApartment]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateApartment]
    @apartmentId VARCHAR(20),
    @newNotes TEXT,
    @newAreaName VARCHAR(20),
    @newHouseholdId VARCHAR(20),
    @newTypeId INT,
    @newStatus VARCHAR(20)
AS
BEGIN
    UPDATE apartments
    SET notes = @newNotes,
        area_name = @newAreaName,
        household_id = @newHouseholdId,
        type_id = @newTypeId,
        status = @newStatus
    WHERE id = @apartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentStatus]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateApartmentStatus]
    @ApartmentId VARCHAR(20),
	@newHouseholdId VARCHAR(20)
AS
BEGIN
    UPDATE apartments
    SET status = 'Occupied',
		household_id = @newHouseholdId
    WHERE id = @ApartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateApartmentStatusToVacant]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateApartmentStatusToVacant]
    @ApartmentId VARCHAR(20)
AS
BEGIN
    UPDATE apartments
    SET status = 'Vacant',
		household_id = null
    WHERE id = @ApartmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateApartmentType]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateApartmentType]
    @typeId INT,
    @newTypeName NVARCHAR(255),
    @newPrice DECIMAL(10, 2)
AS
BEGIN
    UPDATE apartments_types
    SET type = @newTypeName,
        price = @newPrice
    WHERE id = @typeId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateContract]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateContract]
    @contractId INT,
    @newContractNumber VARCHAR(20),
    @newStartDate DATE,
    @newEndDate DATE,
    @newApartmentId VARCHAR(20),
    @newStaffId VARCHAR(20),
    @newHouseholdIdNumber VARCHAR(20),
    @newStatus BIT
AS
BEGIN
    UPDATE contracts
    SET contract_number = @newContractNumber,
        start_date = @newStartDate,
        end_date = @newEndDate,
        apartment_id = @newApartmentId,
        staff_id = @newStaffId,
        household_id_number = @newHouseholdIdNumber,
        status = @newStatus
    WHERE id = @contractId;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateContractStatusToFalse]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateContractStatusToFalse]
    @ContractId INT
AS
BEGIN
    UPDATE contracts
    SET status = 0
    WHERE id = @ContractId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateDepartment]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateDepartment]
    @departmentId INT,
    @newName NVARCHAR(255)
AS
BEGIN
    UPDATE departments
    SET name = @newName
    WHERE id = @departmentId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateHousehold]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateHousehold]
    @idNumber VARCHAR(20),
    @newHeadName NVARCHAR(255),
    @newPhoneNumber VARCHAR(20),
    @newDob DATE,
    @newEmail VARCHAR(255),
    @newImage VARCHAR(255),
    @newGender VARCHAR(10),
    @newMemberQuantity INT
AS
BEGIN
    UPDATE households
    SET household_head_name = @newHeadName,
        phone_number = @newPhoneNumber,
        date_of_birth = @newDob,
        email = @newEmail,
        image = @newImage,
        gender = @newGender,
        member_quantity = @newMemberQuantity
    WHERE id_number = @idNumber;
END
GO
/****** Object:  StoredProcedure [dbo].[updateService]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateService]
    @serviceId INT,
    @newName VARCHAR(255),
    @newPrice DECIMAL(10, 2)
AS
BEGIN
    UPDATE services
    SET name = @newName,
        price = @newPrice
    WHERE id = @serviceId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateServiceInvoice]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateServiceInvoice]
    @Id INT,
    @Name VARCHAR(255),
    @StaffId VARCHAR(20),
    @PrintingDate DATE,
	@PaymentDate DATE,
    @ApartmentId VARCHAR(20),
    @Notes TEXT,
    @ServiceId INT,
    @Quantity INT,
    @Price DECIMAL(10, 2),
    @Status BIT
AS
BEGIN
    UPDATE service_invoice
    SET name = @Name,
        staff_id = @StaffId,
        printing_date = @PrintingDate,
		payment_date = @PaymentDate,
        apartment_id = @ApartmentId,
        notes = @Notes,
        service_id = @ServiceId,
        quantity = @Quantity,
        price = @Price,
        status = @Status
    WHERE id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[updateStaff]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateStaff]
    @staffId VARCHAR(20),
    @newName NVARCHAR(255),
    @newGender BIT,
    @newAddress NVARCHAR(255),
    @newPhoneNumber VARCHAR(20),
    @newDob DATE,
    @newEmail VARCHAR(255),
    @newImage VARCHAR(255),
    @newIdNumber VARCHAR(20),
    @newDepartmentId INT
AS
BEGIN
    UPDATE staffs
    SET name = @newName,
        gender = @newGender,
        address = @newAddress,
        phone_number = @newPhoneNumber,
        dob = @newDob,
        email = @newEmail,
        image = @newImage,
        id_number = @newIdNumber,
        department_id = @newDepartmentId
    WHERE id = @staffId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 2/25/2024 4:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateUser]
    @userId VARCHAR(20),
    @newUsername VARCHAR(255),
    @newPassword VARCHAR(255),
    @newRole VARCHAR(50)
AS
BEGIN
    UPDATE users
    SET username = @newUsername,
        password = @newPassword,
        role = @newRole
    WHERE id = @userId;
END
GO
USE [master]
GO
ALTER DATABASE [apartment_manager] SET  READ_WRITE 
GO
