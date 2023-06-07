USE [EmployeeDb]
GO
/****** Object:  Trigger [EmployeeAuditTrigger]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP TRIGGER [dbo].[EmployeeAuditTrigger]
GO
/****** Object:  Trigger [DepartmentAuditTrigger]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP TRIGGER [dbo].[DepartmentAuditTrigger]
GO
/****** Object:  Trigger [AddressAuditTriiger]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP TRIGGER [dbo].[AddressAuditTriiger]
GO
/****** Object:  StoredProcedure [dbo].[updateEmployee]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[updateEmployee]
GO
/****** Object:  StoredProcedure [dbo].[updateDepartment]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[updateDepartment]
GO
/****** Object:  StoredProcedure [dbo].[getEmployeeInfo]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[getEmployeeInfo]
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentInfo]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[getDepartmentInfo]
GO
/****** Object:  StoredProcedure [dbo].[getAllEmployees]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[getAllEmployees]
GO
/****** Object:  StoredProcedure [dbo].[getAllDepartments]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[getAllDepartments]
GO
/****** Object:  StoredProcedure [dbo].[deleteEmployee]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[deleteEmployee]
GO
/****** Object:  StoredProcedure [dbo].[deleteDepartment]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[deleteDepartment]
GO
/****** Object:  StoredProcedure [dbo].[createEmployee]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[createEmployee]
GO
/****** Object:  StoredProcedure [dbo].[createDepartment]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP PROCEDURE [dbo].[createDepartment]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__depart__114A936A]
GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK__Address__employe__17F790F9]
GO
ALTER TABLE [dbo].[Employee_Audit] DROP CONSTRAINT [DF__Employee___creat__14270015]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [DF__Employee__IsDele__10566F31]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [DF__Employee__create__0F624AF8]
GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [DF__Departmen__IsDel__0A9D95DB]
GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [DF__Departmen__creat__09A971A2]
GO
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [DF__Address__created__17036CC0]
GO
/****** Object:  Table [dbo].[Employee_Audit]    Script Date: 07-06-2023 12:16:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Audit]') AND type in (N'U'))
DROP TABLE [dbo].[Employee_Audit]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07-06-2023 12:16:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Department_Audit]    Script Date: 07-06-2023 12:16:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Audit]') AND type in (N'U'))
DROP TABLE [dbo].[Department_Audit]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 07-06-2023 12:16:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Address_Audit]    Script Date: 07-06-2023 12:16:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_Audit]') AND type in (N'U'))
DROP TABLE [dbo].[Address_Audit]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 07-06-2023 12:16:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
DROP TABLE [dbo].[Address]
GO
USE [master]
GO
/****** Object:  Database [EmployeeDb]    Script Date: 07-06-2023 12:16:19 PM ******/
DROP DATABASE [EmployeeDb]
GO
/****** Object:  Database [EmployeeDb]    Script Date: 07-06-2023 12:16:19 PM ******/
CREATE DATABASE [EmployeeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDb', FILENAME = N'C:\Users\23268937\EmployeeDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeDb_log', FILENAME = N'C:\Users\23268937\EmployeeDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EmployeeDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDb] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeDb] SET QUERY_STORE = OFF
GO
USE [EmployeeDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [EmployeeDb]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 07-06-2023 12:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[street_address] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip_code] [varchar](10) NULL,
	[created_on] [date] NULL,
	[updated_on] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address_Audit]    Script Date: 07-06-2023 12:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address_Audit](
	[audit_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NULL,
	[employee_id] [int] NULL,
	[street_address] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip_code] [varchar](10) NULL,
	[action] [varchar](10) NULL,
	[action_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 07-06-2023 12:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[created_on] [date] NULL,
	[updated_on] [date] NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department_Audit]    Script Date: 07-06-2023 12:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_Audit](
	[audit_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[action] [varchar](10) NULL,
	[action_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07-06-2023 12:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[age] [int] NULL,
	[gender] [varchar](10) NULL,
	[department_id] [int] NULL,
	[created_on] [date] NULL,
	[updated_on] [date] NULL,
	[IsDelete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Audit]    Script Date: 07-06-2023 12:16:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Audit](
	[audit_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[action] [varchar](50) NULL,
	[action_date] [datetime] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[age] [int] NULL,
	[gender] [varchar](10) NULL,
	[department_id] [int] NULL,
	[created_on] [date] NULL,
	[updated_on] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Employee_Audit] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
/****** Object:  StoredProcedure [dbo].[createDepartment]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createDepartment]
  @name VARCHAR(50),
  @description VARCHAR(200)
AS
BEGIN
  INSERT INTO Department (name, description, created_on, isDelete)
  VALUES (@name, @description,GETDATE(),0);
END;



GO
/****** Object:  StoredProcedure [dbo].[createEmployee]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createEmployee]
(
  @firstName VARCHAR(50),
  @lastName VARCHAR(50),
  @age INT,
  @gender VARCHAR(10),
  @departmentId INT,
  @street_address VARCHAR(100),
  @city VARCHAR(50),
  @state VARCHAR(50),
  @zip_code VARCHAR(10)
)
AS
BEGIN
	if Exists(Select * from department where department_id = @departmentId)
	Begin
	Declare @id as int
  INSERT INTO Employee (first_name, last_name, age, gender, department_id,isDelete)
  VALUES (@firstName, @lastName, @age, @gender, @departmentId, 0)

  set @id = SCOPE_IDENTITY();
  print @id
  if(@id <> null)
  Begin
  Insert into Address(employee_id,street_address,city,state,zip_code)
  VALUES(@id, @street_address,@city,@state,@zip_code)
  END
  end
END
GO
/****** Object:  StoredProcedure [dbo].[deleteDepartment]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteDepartment]
  @department_id INT
AS
BEGIN

  UPDATE Department
  SET IsDelete = 1,
      updated_on = GETDATE()
  WHERE department_id = @department_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[deleteEmployee]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteEmployee]
(
  @employee_id INT
)
AS
BEGIN
  
  -- Delete employee data
  UPDATE Employee set isDelete = 1 where employee_id = @employee_id 
END
GO
/****** Object:  StoredProcedure [dbo].[getAllDepartments]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllDepartments]
AS
BEGIN

  SELECT * FROM Department WHERE IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[getAllEmployees]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllEmployees]
AS
BEGIN
  SELECT * 
  FROM Employee 
  Join Department on Employee.department_id = Department.department_id
  left join Address on Employee.employee_id = Address.employee_id
  where Employee.isDelete = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentInfo]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDepartmentInfo]
  @department_id INT
AS
BEGIN

  SELECT * FROM Department WHERE department_id = @department_id AND IsDelete = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[getEmployeeInfo]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getEmployeeInfo]
(
  @employeeId INT
)
AS
BEGIN
  SELECT * 
  FROM Employee 
  Join Department on Employee.department_id = Department.department_id
  left join Address on Employee.employee_id = Address.employee_id
  WHERE Employee.employee_id = @employeeId And Employee.isDelete = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[updateDepartment]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateDepartment]
  @department_id INT,
  @name VARCHAR(50),
  @description VARCHAR(200)
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE Department
  SET name = @name,
      description = @description,
      updated_on = GETDATE()
  WHERE department_id = @department_id;
END;



GO
/****** Object:  StoredProcedure [dbo].[updateEmployee]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateEmployee]
(
  @employeeId INT,
  @firstName VARCHAR(50),
  @lastName VARCHAR(50),
  @age INT,
  @gender VARCHAR(10),
  @departmentId INT,
  @street_address VARCHAR(100),
  @city VARCHAR(50),
  @state VARCHAR(50),
  @zip_code VARCHAR(10)
)
AS
BEGIN
  UPDATE Employee SET
  first_name = @firstName,
  last_name = @lastName,
  age = @age,
  gender = @gender,
  department_id = @departmentId,
  Updated_on = GetDate()
  WHERE employee_id = @employeeId

  UPDATE Address SET
  street_address = @street_address,
  city = @city,
  state = @state,
  zip_code = @zip_code,
  Updated_on = GetDate()
  WHERE employee_id = @employeeId
END
GO
/****** Object:  Trigger [dbo].[AddressAuditTriiger]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[AddressAuditTriiger]
ON [dbo].[Address]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @action varchar(10)
    IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
        SET @action = 'UPDATE'
    ELSE IF EXISTS(SELECT * FROM inserted)
        SET @action = 'INSERT'
    ELSE IF EXISTS(SELECT * FROM deleted)
        SET @action = 'DELETE'

    INSERT INTO dbo.Address_Audit (address_id, employee_id, street_address, city, state, zip_code, action, action_date)
    SELECT i.address_id, i.employee_id, i.street_address, i.city, i.state, i.zip_code, @action, GETDATE()
    FROM inserted i
    LEFT JOIN deleted d ON i.address_id = d.address_id
    WHERE (d.address_id IS NULL) OR (i.street_address <> d.street_address OR i.city <> d.city OR i.state <> d.state OR i.zip_code <> d.zip_code)
END
GO
ALTER TABLE [dbo].[Address] ENABLE TRIGGER [AddressAuditTriiger]
GO
/****** Object:  Trigger [dbo].[DepartmentAuditTrigger]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[DepartmentAuditTrigger]
ON [dbo].[Department]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @action VARCHAR(10)
  IF EXISTS(SELECT * FROM inserted) -- if rows were inserted or updated
    IF EXISTS(SELECT * FROM deleted) -- if rows were also deleted
      SET @action = 'U' -- "update"
    ELSE
      SET @action = 'I' -- "insert"
  ELSE
    SET @action = 'D' -- "delete"

  INSERT INTO Department_Audit (department_id, name, description, action, action_date)
    SELECT
      COALESCE(i.department_id, d.department_id),
      COALESCE(i.name, d.name),
      COALESCE(i.description, d.description),
      @action,
      GETDATE()
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.department_id = d.department_id
    WHERE i.department_id IS NOT NULL OR d.department_id IS NOT NULL;
END;
GO
ALTER TABLE [dbo].[Department] ENABLE TRIGGER [DepartmentAuditTrigger]
GO
/****** Object:  Trigger [dbo].[EmployeeAuditTrigger]    Script Date: 07-06-2023 12:16:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[EmployeeAuditTrigger]
ON [dbo].[Employee]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @action VARCHAR(10)
  IF EXISTS(SELECT * FROM inserted) -- if rows were inserted or updated
    IF EXISTS(SELECT * FROM deleted) -- if rows were also deleted
      SET @action = 'U' -- "update"
    ELSE
      SET @action = 'I' -- "insert"
  ELSE
    SET @action = 'D' -- "delete"

  INSERT INTO Employee_Audit (employee_id, first_name, last_name, age, gender, department_id, action, action_date)
    SELECT
      COALESCE(d.employee_id, i.employee_id, deleted.employee_id),
      COALESCE(d.first_name, i.first_name, deleted.first_name),
      COALESCE(d.last_name, i.last_name, deleted.last_name),
      COALESCE(d.age, i.age, deleted.age),
      COALESCE(d.gender, i.gender, deleted.gender),
      COALESCE(d.department_id, i.department_id, deleted.department_id),
      @action,
      GETDATE()
    FROM inserted i
    FULL OUTER JOIN deleted ON i.employee_id = deleted.employee_id
    FULL OUTER JOIN Employee d ON i.employee_id = d.employee_id
    WHERE i.first_name <> d.first_name OR i.last_name <> d.last_name OR i.age <> d.age OR i.gender <> d.gender OR i.department_id <> d.department_id;
END;
GO
ALTER TABLE [dbo].[Employee] ENABLE TRIGGER [EmployeeAuditTrigger]
GO
USE [master]
GO
ALTER DATABASE [EmployeeDb] SET  READ_WRITE 
GO
