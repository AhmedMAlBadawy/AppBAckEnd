USE [master]
GO
ALTER DATABASE [UnNamedAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnNamedAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnNamedAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UnNamedAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnNamedAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UnNamedAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [UnNamedAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnNamedAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnNamedAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnNamedAppDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UnNamedAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UnNamedAppDB]
GO
/****** Object:  Table [dbo].[Captain_Complaints]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Captain_Complaints](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Captian_ID] [numeric](18, 0) NOT NULL,
	[Complaint_Type_ID] [numeric](18, 0) NOT NULL,
	[Status_ID] [numeric](18, 0) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[isEscalated] [bit] NOT NULL,
	[Order_ID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Captain_Complaints] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Captain_Rates]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Captain_Rates](
	[Captain_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Order_ID] [numeric](18, 0) NOT NULL,
	[Rate] [int] NOT NULL,
	[Rate_Notes] [nvarchar](100) NULL,
	[Rate_User] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Captain_Rates] PRIMARY KEY CLUSTERED 
(
	[Captain_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Captain_Vehicles]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Captain_Vehicles](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[User_Custom_Name] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Model] [nchar](10) NOT NULL,
	[Licence_No] [nvarchar](50) NOT NULL,
	[Licence_Validity] [nvarchar](50) NOT NULL,
	[Vehicle_Sequence_No] [nvarchar](50) NOT NULL,
	[Captain_ID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Captain_Vehicles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Captains]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Captains](
	[User_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Captains] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint_Actions]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint_Actions](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Action_Description] [nvarchar](250) NOT NULL,
	[Action_User_ID] [numeric](18, 0) NOT NULL,
	[Complaint_ID] [numeric](18, 0) NOT NULL,
	[Date_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Complaint_Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint_Statuses]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint_Statuses](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Complaint_Statuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaints_Types]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaints_Types](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Complaints_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[User_ID] [numeric](18, 0) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Middle_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item_Packing_Types]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Packing_Types](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item_Packing_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Complaints]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Complaints](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[User_ID] [numeric](18, 0) NOT NULL,
	[Complaint_Type_Id] [numeric](18, 0) NOT NULL,
	[Status_ID] [numeric](18, 0) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[isEscalated] [bit] NOT NULL,
	[Order_ID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Order_Complaints] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Order_ID] [numeric](18, 0) NOT NULL,
	[Item_ID] [numeric](18, 0) NOT NULL,
	[Price_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Statues]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Statues](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Statues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Order_Generated_No] [nvarchar](50) NOT NULL,
	[Customer_ID] [numeric](18, 0) NOT NULL,
	[Captain_ID] [numeric](18, 0) NULL,
	[Issue_Date_Time] [datetime] NOT NULL,
	[Arrival_Date_Time] [datetime] NULL,
	[Status_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalities]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalities](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Severity_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Penalities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penality_Reasons]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penality_Reasons](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Penality_ID] [numeric](18, 0) NOT NULL,
	[Reason_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Penality_Reasons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Period_Types]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period_Types](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Period_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periods]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periods](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Date_From] [date] NOT NULL,
	[Date_To] [date] NOT NULL,
	[Period_Type_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Periods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[canBeAssigned] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreDefined_Reasons]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreDefined_Reasons](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_PreDefined_Reasons] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severities]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severities](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Rank] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Action_To_Undo] [nvarchar](500) NULL,
	[Procedures_To_Follow] [nvarchar](500) NULL,
	[Severity_Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Severities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[User_ID] [numeric](18, 0) NOT NULL,
	[Title_ID] [numeric](18, 0) NOT NULL,
	[Hiring_Date] [date] NULL,
	[End_Hiring_Date] [date] NULL,
	[File_Info] [nvarchar](500) NULL,
	[isBlocked] [bit] NOT NULL,
	[Staff_Type_ID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Reason]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Reason](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Captain_ID] [numeric](18, 0) NOT NULL,
	[Reason_ID] [numeric](18, 0) NOT NULL,
	[Date_Time] [datetime] NULL,
	[Effective_Date] [date] NULL,
	[End_Date_Time] [datetime] NULL,
	[Order_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Staff_Reason] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Salaries]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Salaries](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Staff_ID] [numeric](18, 0) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Start_Date] [date] NOT NULL,
 CONSTRAINT [PK_Staff_Salaries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Titles]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Titles](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff_Titles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff_Types]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Types](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Staff_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Item_Categories]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Item_Categories](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Parent_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Store_Item_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Item_Prices]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Item_Prices](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Item_ID] [numeric](18, 0) NOT NULL,
	[Price_Value] [float] NOT NULL,
	[Date_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Store_Item_Prices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Items]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Items](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Category_ID] [numeric](18, 0) NOT NULL,
	[Packing_Type_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Store_Items] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Addresses]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Addresses](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[User_ID] [numeric](18, 0) NOT NULL,
	[isDefault] [bit] NOT NULL,
	[Remarks] [nvarchar](200) NULL,
	[Location_LAT] [nvarchar](50) NULL,
	[Location_LONG] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[District] [nvarchar](50) NULL,
	[Building_No] [nvarchar](5) NULL,
	[Street_Name] [nvarchar](50) NULL,
	[Apartment_No] [nvarchar](5) NULL,
	[Floor_No] [nvarchar](3) NULL,
 CONSTRAINT [PK_User_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Type_Permissions]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Type_Permissions](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[User_Type_ID] [numeric](18, 0) NOT NULL,
	[Permission_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_User_Type_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Types]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Types](
	[UserTypes_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[UserTypes_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User_Types] PRIMARY KEY CLUSTERED 
(
	[UserTypes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/21/2019 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](12) NOT NULL,
	[Alternative_Phone_No] [nvarchar](12) NULL,
	[isActive] [bit] NOT NULL,
	[UserType_ID] [numeric](18, 0) NULL,
	[Profile_Image_URL] [nvarchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Captain_Complaints] ADD  CONSTRAINT [DF_Captain_Complaints_isEscalated]  DEFAULT ((0)) FOR [isEscalated]
GO
ALTER TABLE [dbo].[Complaint_Actions] ADD  CONSTRAINT [DF_Complaint_Actions_Date_Time]  DEFAULT (getutcdate()) FOR [Date_Time]
GO
ALTER TABLE [dbo].[Order_Complaints] ADD  CONSTRAINT [DF_Order_Complaints_isEscalated]  DEFAULT ((0)) FOR [isEscalated]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Issue_Date_Time]  DEFAULT (getutcdate()) FOR [Issue_Date_Time]
GO
ALTER TABLE [dbo].[Periods] ADD  CONSTRAINT [DF_Periods_Date_From]  DEFAULT (getutcdate()) FOR [Date_From]
GO
ALTER TABLE [dbo].[Periods] ADD  CONSTRAINT [DF_Periods_Date_To]  DEFAULT (getutcdate()) FOR [Date_To]
GO
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [DF_Permissions_canBeAssigned]  DEFAULT ((0)) FOR [canBeAssigned]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_isBlocked]  DEFAULT ((0)) FOR [isBlocked]
GO
ALTER TABLE [dbo].[Staff_Reason] ADD  CONSTRAINT [DF_Staff_Reason_Date_Time]  DEFAULT (getutcdate()) FOR [Date_Time]
GO
ALTER TABLE [dbo].[Staff_Salaries] ADD  CONSTRAINT [DF_Staff_Salaries_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Store_Item_Prices] ADD  CONSTRAINT [DF_Store_Item_Prices_Date_Time]  DEFAULT (getutcdate()) FOR [Date_Time]
GO
ALTER TABLE [dbo].[User_Addresses] ADD  CONSTRAINT [DF_User_Addresses_isDefalt]  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Captain_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Complaints_Captains] FOREIGN KEY([Captian_ID])
REFERENCES [dbo].[Captains] ([User_ID])
GO
ALTER TABLE [dbo].[Captain_Complaints] CHECK CONSTRAINT [FK_Captain_Complaints_Captains]
GO
ALTER TABLE [dbo].[Captain_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Complaints_Complaint_Statuses] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Complaint_Statuses] ([ID])
GO
ALTER TABLE [dbo].[Captain_Complaints] CHECK CONSTRAINT [FK_Captain_Complaints_Complaint_Statuses]
GO
ALTER TABLE [dbo].[Captain_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Complaints_Complaints_Types] FOREIGN KEY([Complaint_Type_ID])
REFERENCES [dbo].[Complaints_Types] ([ID])
GO
ALTER TABLE [dbo].[Captain_Complaints] CHECK CONSTRAINT [FK_Captain_Complaints_Complaints_Types]
GO
ALTER TABLE [dbo].[Captain_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Complaints_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Captain_Complaints] CHECK CONSTRAINT [FK_Captain_Complaints_Orders]
GO
ALTER TABLE [dbo].[Captain_Rates]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Rates_Captains] FOREIGN KEY([Captain_ID])
REFERENCES [dbo].[Captains] ([User_ID])
GO
ALTER TABLE [dbo].[Captain_Rates] CHECK CONSTRAINT [FK_Captain_Rates_Captains]
GO
ALTER TABLE [dbo].[Captain_Rates]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Rates_Users] FOREIGN KEY([Rate_User])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Captain_Rates] CHECK CONSTRAINT [FK_Captain_Rates_Users]
GO
ALTER TABLE [dbo].[Captain_Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Captain_Vehicles_Captains] FOREIGN KEY([Captain_ID])
REFERENCES [dbo].[Captains] ([User_ID])
GO
ALTER TABLE [dbo].[Captain_Vehicles] CHECK CONSTRAINT [FK_Captain_Vehicles_Captains]
GO
ALTER TABLE [dbo].[Captains]  WITH CHECK ADD  CONSTRAINT [FK_Captains_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Captains] CHECK CONSTRAINT [FK_Captains_Users]
GO
ALTER TABLE [dbo].[Complaint_Actions]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_Actions_Order_Complaints] FOREIGN KEY([Complaint_ID])
REFERENCES [dbo].[Order_Complaints] ([ID])
GO
ALTER TABLE [dbo].[Complaint_Actions] CHECK CONSTRAINT [FK_Complaint_Actions_Order_Complaints]
GO
ALTER TABLE [dbo].[Complaint_Actions]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_Actions_Users] FOREIGN KEY([Action_User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Complaint_Actions] CHECK CONSTRAINT [FK_Complaint_Actions_Users]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[Order_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Order_Complaints_Complaint_Statuses] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Complaint_Statuses] ([ID])
GO
ALTER TABLE [dbo].[Order_Complaints] CHECK CONSTRAINT [FK_Order_Complaints_Complaint_Statuses]
GO
ALTER TABLE [dbo].[Order_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Order_Complaints_Complaints_Types] FOREIGN KEY([Complaint_Type_Id])
REFERENCES [dbo].[Complaints_Types] ([ID])
GO
ALTER TABLE [dbo].[Order_Complaints] CHECK CONSTRAINT [FK_Order_Complaints_Complaints_Types]
GO
ALTER TABLE [dbo].[Order_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Order_Complaints_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Order_Complaints] CHECK CONSTRAINT [FK_Order_Complaints_Orders]
GO
ALTER TABLE [dbo].[Order_Complaints]  WITH CHECK ADD  CONSTRAINT [FK_Order_Complaints_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Order_Complaints] CHECK CONSTRAINT [FK_Order_Complaints_Users]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Store_Item_Prices] FOREIGN KEY([Price_ID])
REFERENCES [dbo].[Store_Item_Prices] ([ID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Store_Item_Prices]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Store_Items] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Store_Items] ([ID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Store_Items]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Statues] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Order_Statues] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Order_Statues]
GO
ALTER TABLE [dbo].[Penalities]  WITH CHECK ADD  CONSTRAINT [FK_Penalities_Severities] FOREIGN KEY([Severity_ID])
REFERENCES [dbo].[Severities] ([ID])
GO
ALTER TABLE [dbo].[Penalities] CHECK CONSTRAINT [FK_Penalities_Severities]
GO
ALTER TABLE [dbo].[Penality_Reasons]  WITH CHECK ADD  CONSTRAINT [FK_Penality_Reasons_Penalities] FOREIGN KEY([Penality_ID])
REFERENCES [dbo].[Penalities] ([ID])
GO
ALTER TABLE [dbo].[Penality_Reasons] CHECK CONSTRAINT [FK_Penality_Reasons_Penalities]
GO
ALTER TABLE [dbo].[Penality_Reasons]  WITH CHECK ADD  CONSTRAINT [FK_Penality_Reasons_PreDefined_Reasons] FOREIGN KEY([Reason_ID])
REFERENCES [dbo].[PreDefined_Reasons] ([ID])
GO
ALTER TABLE [dbo].[Penality_Reasons] CHECK CONSTRAINT [FK_Penality_Reasons_PreDefined_Reasons]
GO
ALTER TABLE [dbo].[Periods]  WITH CHECK ADD  CONSTRAINT [FK_Periods_Period_Types] FOREIGN KEY([Period_Type_ID])
REFERENCES [dbo].[Period_Types] ([ID])
GO
ALTER TABLE [dbo].[Periods] CHECK CONSTRAINT [FK_Periods_Period_Types]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Staff_Titles] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[Staff_Titles] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Staff_Titles]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Staff_Types] FOREIGN KEY([Staff_Type_ID])
REFERENCES [dbo].[Staff_Types] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Staff_Types]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Users]
GO
ALTER TABLE [dbo].[Staff_Reason]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Reason_Captains] FOREIGN KEY([Captain_ID])
REFERENCES [dbo].[Captains] ([User_ID])
GO
ALTER TABLE [dbo].[Staff_Reason] CHECK CONSTRAINT [FK_Staff_Reason_Captains]
GO
ALTER TABLE [dbo].[Staff_Reason]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Reason_PreDefined_Reasons] FOREIGN KEY([Reason_ID])
REFERENCES [dbo].[PreDefined_Reasons] ([ID])
GO
ALTER TABLE [dbo].[Staff_Reason] CHECK CONSTRAINT [FK_Staff_Reason_PreDefined_Reasons]
GO
ALTER TABLE [dbo].[Staff_Salaries]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Salaries_Staff] FOREIGN KEY([ID])
REFERENCES [dbo].[Staff] ([User_ID])
GO
ALTER TABLE [dbo].[Staff_Salaries] CHECK CONSTRAINT [FK_Staff_Salaries_Staff]
GO
ALTER TABLE [dbo].[Store_Item_Prices]  WITH CHECK ADD  CONSTRAINT [FK_Store_Item_Prices_Store_Items] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Store_Items] ([ID])
GO
ALTER TABLE [dbo].[Store_Item_Prices] CHECK CONSTRAINT [FK_Store_Item_Prices_Store_Items]
GO
ALTER TABLE [dbo].[Store_Items]  WITH CHECK ADD  CONSTRAINT [FK_Store_Items_Item_Packing_Types] FOREIGN KEY([Packing_Type_ID])
REFERENCES [dbo].[Item_Packing_Types] ([ID])
GO
ALTER TABLE [dbo].[Store_Items] CHECK CONSTRAINT [FK_Store_Items_Item_Packing_Types]
GO
ALTER TABLE [dbo].[Store_Items]  WITH CHECK ADD  CONSTRAINT [FK_Store_Items_Store_Item_Categories] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Store_Item_Categories] ([ID])
GO
ALTER TABLE [dbo].[Store_Items] CHECK CONSTRAINT [FK_Store_Items_Store_Item_Categories]
GO
ALTER TABLE [dbo].[User_Addresses]  WITH CHECK ADD  CONSTRAINT [FK_User_Addresses_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[User_Addresses] CHECK CONSTRAINT [FK_User_Addresses_Users]
GO
ALTER TABLE [dbo].[User_Type_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_User_Type_Permissions_Permissions] FOREIGN KEY([Permission_ID])
REFERENCES [dbo].[Permissions] ([ID])
GO
ALTER TABLE [dbo].[User_Type_Permissions] CHECK CONSTRAINT [FK_User_Type_Permissions_Permissions]
GO
ALTER TABLE [dbo].[User_Type_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_User_Type_Permissions_User_Types] FOREIGN KEY([User_Type_ID])
REFERENCES [dbo].[User_Types] ([UserTypes_ID])
GO
ALTER TABLE [dbo].[User_Type_Permissions] CHECK CONSTRAINT [FK_User_Type_Permissions_User_Types]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_User_Types] FOREIGN KEY([UserType_ID])
REFERENCES [dbo].[User_Types] ([UserTypes_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_User_Types]
GO
USE [master]
GO
ALTER DATABASE [UnNamedAppDB] SET  READ_WRITE 
GO
