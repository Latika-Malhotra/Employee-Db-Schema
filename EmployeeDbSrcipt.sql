USE [master]
GO
/****** Object:  Database [EmployeeDb]    Script Date: 29-03-2023 06:15:31 PM ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 29-03-2023 06:15:31 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 29-03-2023 06:15:31 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29-03-2023 06:15:31 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Audit]    Script Date: 29-03-2023 06:15:31 PM ******/
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
/****** Object:  Table [dbo].[Salary]    Script Date: 29-03-2023 06:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[salary_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[amount] [float] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[created_on] [date] NULL,
	[updated_on] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 
GO
INSERT [dbo].[Address] ([address_id], [employee_id], [street_address], [city], [state], [zip_code], [created_on], [updated_on]) VALUES (1, 1, N'Janakpuri', N'New Delhi', N'Delhi', N'110019', CAST(N'2023-03-29' AS Date), CAST(N'2023-03-29' AS Date))
GO
INSERT [dbo].[Address] ([address_id], [employee_id], [street_address], [city], [state], [zip_code], [created_on], [updated_on]) VALUES (4, 4, N'GK', N'New Delhi', N'Delhi', N'110098', CAST(N'2023-03-29' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([department_id], [name], [description], [created_on], [updated_on]) VALUES (1, N'IT', N'IT Department', CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Department] ([department_id], [name], [description], [created_on], [updated_on]) VALUES (2, N'Marketing', N'Marketing Department', CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Department] ([department_id], [name], [description], [created_on], [updated_on]) VALUES (3, N'Human Resource', N'Human Resource Department', CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Department] ([department_id], [name], [description], [created_on], [updated_on]) VALUES (4, N'Sales', N'Sales Department', CAST(N'2023-03-29' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([employee_id], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (1, N'Megha', N'Malhotra', 25, N'Female', 1, CAST(N'2023-03-29' AS Date), CAST(N'2023-03-29' AS Date))
GO
INSERT [dbo].[Employee] ([employee_id], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (4, N'Harsh', N'Sehgal', 29, N'Male', 2, CAST(N'2023-03-29' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_Audit] ON 
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (1, 1, N'Insert', CAST(N'2023-03-29T03:52:26.127' AS DateTime), N'Latika', N'Malhotra', 25, N'Female', 1, CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (2, 1, N'Update', CAST(N'2023-03-29T04:07:35.590' AS DateTime), N'Megha', N'Malhotra', 25, N'Female', 1, NULL, CAST(N'2023-03-29' AS Date))
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (3, 2, N'Insert', CAST(N'2023-03-29T04:08:28.007' AS DateTime), N'Harsh', N'Sehgal', 29, N'Male', 2, CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (4, 3, N'Insert', CAST(N'2023-03-29T04:09:41.580' AS DateTime), N'Harsh', N'Sehgal', 29, N'Male', 2, CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (5, 4, N'Insert', CAST(N'2023-03-29T04:11:38.153' AS DateTime), N'Harsh', N'Sehgal', 29, N'Male', 2, CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (6, 2, N'Delete', CAST(N'2023-03-29T04:13:31.230' AS DateTime), N'Harsh', N'Sehgal', 29, N'Male', 2, NULL, CAST(N'2023-03-29' AS Date))
GO
INSERT [dbo].[Employee_Audit] ([audit_id], [employee_id], [action], [action_date], [first_name], [last_name], [age], [gender], [department_id], [created_on], [updated_on]) VALUES (7, 3, N'Delete', CAST(N'2023-03-29T04:13:57.400' AS DateTime), N'Harsh', N'Sehgal', 29, N'Male', 2, NULL, CAST(N'2023-03-29' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Employee_Audit] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary] ON 
GO
INSERT [dbo].[Salary] ([salary_id], [employee_id], [amount], [start_date], [end_date], [created_on], [updated_on]) VALUES (1, 1, 98789, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-31' AS Date), CAST(N'2023-03-29' AS Date), NULL)
GO
INSERT [dbo].[Salary] ([salary_id], [employee_id], [amount], [start_date], [end_date], [created_on], [updated_on]) VALUES (2, 1, 98767, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-28' AS Date), CAST(N'2023-03-29' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Salary] OFF
GO
ALTER TABLE [dbo].[Address] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Employee_Audit] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Salary] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
/****** Object:  StoredProcedure [dbo].[createEmployee]    Script Date: 29-03-2023 06:15:31 PM ******/
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
	Declare @id as int
  INSERT INTO Employee (first_name, last_name, age, gender, department_id)
  VALUES (@firstName, @lastName, @age, @gender, @departmentId)

  set @id = SCOPE_IDENTITY();
  print @id

  Insert into Address(employee_id,street_address,city,state,zip_code)
  VALUES(@id, @street_address,@city,@state,@zip_code)
END
GO
/****** Object:  StoredProcedure [dbo].[deleteEmployee]    Script Date: 29-03-2023 06:15:31 PM ******/
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
  DELETE FROM Salary
  WHERE employee_id = @employee_id;
  
  -- Delete address data for the employee
  DELETE FROM Address
  WHERE employee_id = @employee_id;
  
  -- Delete employee data
  DELETE FROM Employee
  WHERE employee_id = @employee_id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllEmployees]    Script Date: 29-03-2023 06:15:31 PM ******/
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
  left join salary on Employee.employee_id = salary.employee_id
  left join Address on Employee.employee_id = Address.employee_id
END
GO
/****** Object:  StoredProcedure [dbo].[getEmployeeInfo]    Script Date: 29-03-2023 06:15:31 PM ******/
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
  left join salary on Employee.employee_id = salary.employee_id
  left join Address on Employee.employee_id = Address.employee_id
  WHERE Employee.employee_id = @employeeId
END
GO
/****** Object:  StoredProcedure [dbo].[updateEmployee]    Script Date: 29-03-2023 06:15:31 PM ******/
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
/****** Object:  Trigger [dbo].[auditEmployee]    Script Date: 29-03-2023 06:15:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[auditEmployee]
ON [dbo].[Employee]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  DECLARE @action VARCHAR(50)
  DECLARE @create_on Date
  DECLARE @update_on Date
  IF EXISTS (SELECT * FROM inserted)
  BEGIN
    IF EXISTS (SELECT * FROM deleted)
		BEGIN
			SET @action = 'Update'
			SET @update_on = GetDate()
			SET @create_on = null
		END
      
    ELSE
		BEGIN
			SET @action = 'Insert'
			SET @update_on = null
			SET @create_on = GetDate()
		END
      
    INSERT INTO Employee_Audit (employee_id, action, action_date, first_name, last_name, age, gender, department_id, created_on, updated_on)
    SELECT employee_id, @action, GETDATE(), first_name, last_name, age, gender, department_id, @create_on, @update_on
    FROM inserted
  END
  ELSE
  BEGIN
    SET @action = 'Delete'
    INSERT INTO Employee_Audit (employee_id, action, action_date, first_name, last_name, age, gender, department_id, created_on, updated_on)
    SELECT employee_id, @action, GETDATE(), first_name, last_name, age, gender, department_id, null, GetDate()
    FROM deleted
  END
END
GO
ALTER TABLE [dbo].[Employee] ENABLE TRIGGER [auditEmployee]
GO
USE [master]
GO
ALTER DATABASE [EmployeeDb] SET  READ_WRITE 
GO
