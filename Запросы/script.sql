USE [master]
GO
/****** Object:  Database [Rulee]    Script Date: 19.02.2024 13:35:07 ******/
CREATE DATABASE [Rulee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rulee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Rulee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Rulee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Rulee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Rulee] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rulee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rulee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rulee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rulee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rulee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rulee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rulee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rulee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rulee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rulee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rulee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rulee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rulee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rulee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rulee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rulee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rulee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rulee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rulee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rulee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rulee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rulee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rulee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rulee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rulee] SET  MULTI_USER 
GO
ALTER DATABASE [Rulee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rulee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rulee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rulee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Rulee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Rulee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Rulee] SET QUERY_STORE = ON
GO
ALTER DATABASE [Rulee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Rulee]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorization]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](40) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[ID_Role] [int] NOT NULL,
 CONSTRAINT [PK_Authorization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [datetime] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 19.02.2024 13:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authorization] ON 

INSERT [dbo].[Authorization] ([ID], [Login], [Password], [ID_Role]) VALUES (1, N'Oewhwefh', N'239eu23c2n', 1)
INSERT [dbo].[Authorization] ([ID], [Login], [Password], [ID_Role]) VALUES (2, N'Heygef', N'38ddu2yUF&', 1)
INSERT [dbo].[Authorization] ([ID], [Login], [Password], [ID_Role]) VALUES (4, N'HIUeudw', N'h3fh43', 2)
INSERT [dbo].[Authorization] ([ID], [Login], [Password], [ID_Role]) VALUES (5, N'admin', N'serega', 3)
SET IDENTITY_INSERT [dbo].[Authorization] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (1, N'Абрамов', N'Станислав', N'Филатович', N'1', N' 7(6545)478-87-79 ', N'Клиенты\m32.jpg', CAST(N'1989-05-18' AS Date), N' solomon@att.net', CAST(N'2016-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (2, N'Авдеев', N'Самуил', N'Улебович', N'1', N' 7(3168)043-63-31 ', N'Клиенты\m96.jpg', CAST(N'1996-07-04' AS Date), N' cliffordj@mac.com', CAST(N'2016-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (3, N'Андреева', N'Патрисия', N'Валерьевна', N'2', N' 7(9648)953-81-26 ', N'Клиенты\37.jpg', CAST(N'1993-11-18' AS Date), N' jigsaw@aol.com', CAST(N'2016-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (4, N'Анисимов', N'Валентин', N'Пантелеймонович', N'1', N' 7(700)326-70-24 ', N'Клиенты\m99.jpg', CAST(N'2000-12-10' AS Date), N' aaribaud@hotmail.com', CAST(N'2018-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (5, N'Архипова', N'Прасковья', N'Валерьевна', N'2', N' 7(86)540-10-21 ', N'Клиенты\33.jpg', CAST(N'1979-01-09' AS Date), N' cgcra@live.com', CAST(N'2018-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (7, N'Беляева', N'Сабрина', N'Федосеевна', N'2', N' 7(6580)534-32-58 ', N'Клиенты\47.jpg', CAST(N'2024-02-02' AS Date), N' agapow@gmail.com', CAST(N'2017-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (9, N'Большаков', N'Вадим', N'Данилович', N'2', N' 7(386)641-13-37 ', N'Клиенты\m97.jpg', CAST(N'2024-02-16' AS Date), N' uncle@gmail.com', CAST(N'2018-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (10, N'Бурова', N'Светлана', N'Лукьевна', N'2', N' 7(358)173-82-21 ', N'Клиенты\39.jpg', CAST(N'1979-01-04' AS Date), N' wsnyder@aol.com', CAST(N'2016-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (11, N'Волков', N'Людвиг', N'Витальевич', N'1', N' 7(8459)592-05-58 ', N'Клиенты\m50.jpg', CAST(N'1977-12-27' AS Date), N' jrkorson@msn.com', CAST(N'2016-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (12, N'Воронова', N'Изабелла', N'Вячеславовна', N'2', N' 7(17)433-44-98 ', N'Клиенты\21.jpg', CAST(N'1999-09-24' AS Date), N' kildjean@sbcglobal.net', CAST(N'2017-12-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (13, N'Горбачёв', N'Давид', N'Тимурович', N'1', N' 7(53)602-85-41 ', N'Клиенты\m36.jpg', CAST(N'1983-05-22' AS Date), N' hedwig@att.net', CAST(N'2018-12-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (14, N'Дементьев', N'Вадим', N'Ростиславович', N'1', N' 7(79)330-46-15 ', N'Клиенты\m39.jpg', CAST(N'1993-07-10' AS Date), N' jacks@aol.com', CAST(N'2018-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (15, N'Дементьева', N'Эдита', N'Онисимовна', N'2', N' 7(198)922-28-76 ', N'Клиенты\38.jpg', CAST(N'1975-09-17' AS Date), N' frosal@hotmail.com', CAST(N'2018-11-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (16, N'Ермакова', N'Алла', N'Мироновна', N'2', N' 7(06)437-13-73 ', N'Клиенты\48.jpg', CAST(N'1976-01-22' AS Date), N' whimsy@aol.com', CAST(N'2017-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (17, N'Зуев', N'Матвей', N'Иванович', N'1', N' 7(5383)893-04-66 ', N'Клиенты\m38.jpg', CAST(N'1981-03-28' AS Date), N' brickbat@verizon.net', CAST(N'2018-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (18, N'Игнатов', N'Захар', N'Павлович', N'1', N' 7(578)574-73-36 ', N'Клиенты\m98.jpg', CAST(N'1998-10-07' AS Date), N' dieman@icloud.com', CAST(N'2017-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (19, N'Казаков', N'Дмитрий', N'Русланович', N'1', N' 7(51)682-19-40 ', N'Клиенты\m44.jpg', CAST(N'1978-12-15' AS Date), N' ozawa@verizon.net', CAST(N'2016-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (20, N'Калинин', N'Петр', N'Иванович', N'1', N' 7(90)316-07-17 ', N'Клиенты\m47.jpg', CAST(N'1993-09-08' AS Date), N' aschmitz@hotmail.com', CAST(N'2016-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (21, N'Колесникова', N'Алина', N'Еремеевна', N'2', N' 7(74)977-39-71 ', N'Клиенты\40.jpg', CAST(N'2001-04-19' AS Date), N' gfxguy@outlook.com', CAST(N'2017-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (22, N'Корнилова', N'Анэля', N'Михайловна', N'2', N' 7(20)980-01-60 ', N'Клиенты\26.jpg', CAST(N'1973-04-02' AS Date), N' jonathan@aol.com', CAST(N'2016-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (23, N'Костина', N'Любава', N'Авксентьевна', N'2', N' 7(6419)959-21-87 ', N'Клиенты\41.jpg', CAST(N'1972-07-13' AS Date), N' gordonjcp@hotmail.com', CAST(N'2016-02-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (24, N'Кудряшов', N'Аверкий', N'Константинович', N'1', N' 7(88)732-96-30 ', N'Клиенты\m33.jpg', CAST(N'1991-07-26' AS Date), N' nanop@msn.com', CAST(N'2018-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (25, N'Кузьмина', N'Дэнна', N'Витальевна', N'2', N' 7(9940)977-45-73 ', N'Клиенты\20.jpg', CAST(N'1993-08-24' AS Date), N' nichoj@mac.com', CAST(N'2016-03-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (26, N'Куликова', N'Эвелина', N'Вячеславовна', N'2', N' 7(0236)682-42-78 ', N'Клиенты\23.jpg', CAST(N'1997-11-14' AS Date), N' ilikered@hotmail.com', CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (27, N'Лазарев', N'Алексей', N'Богданович', N'1', N' 7(0055)737-37-48 ', N'Клиенты\m48.jpg', CAST(N'1977-03-10' AS Date), N' claesjac@me.com', CAST(N'2017-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (28, N'Лазарева', N'Эльвина', N'Робертовна', N'2', N' 7(5564)609-81-37 ', N'Клиенты\28.jpg', CAST(N'1996-02-16' AS Date), N' ahuillet@comcast.net', CAST(N'2018-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (29, N'Мамонтова', N'Марфа', N'Мироновна', N'2', N' 7(38)095-64-18 ', N'Клиенты\29.jpg', CAST(N'1984-10-19' AS Date), N' rfoley@verizon.net', CAST(N'2018-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (30, N'Мишина', N'Иветта', N'Андреевна', N'2', N' 7(3926)244-81-96 ', N'Клиенты\30.jpg', CAST(N'2002-10-05' AS Date), N' aukjan@yahoo.com', CAST(N'2016-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (31, N'Морозов', N'Наум', N'Валерьянович', N'1', N' 7(636)050-96-13 ', N'Клиенты\m49.jpg', CAST(N'1985-07-04' AS Date), N' salesgeek@mac.com', CAST(N'2016-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (32, N'Некрасов', N'Варлам', N'Михайлович', N'1', N' 7(019)258-06-35 ', N'Клиенты\m42.jpg', CAST(N'2000-11-12' AS Date), N' dogdude@verizon.net', CAST(N'2017-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (33, N'Новиков', N'Адриан', N'Аркадьевич', N'1', N' 7(70)572-33-62 ', N'Клиенты\m40.jpg', CAST(N'1974-01-15' AS Date), N' multiplx@verizon.net', CAST(N'2018-11-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (34, N'Овчинникова', N'Лаура', N'Еремеевна', N'2', N' 7(85)829-33-79 ', N'Клиенты\35.jpg', CAST(N'1992-04-03' AS Date), N' carcus@yahoo.ca', CAST(N'2018-11-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (35, N'Орлова', N'Влада', N'Мартыновна', N'2', N' 7(2506)433-38-35 ', N'Клиенты\22.jpg', CAST(N'1990-06-26' AS Date), N' rnelson@yahoo.ca', CAST(N'2016-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (36, N'Панфилов', N'Марк', N'Рудольфович', N'1', N' 7(764)282-55-22 ', N'Клиенты\m45.jpg', CAST(N'1991-04-13' AS Date), N' cremonini@optonline.net', CAST(N'2016-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (37, N'Попова', N'Харита', N'Якуновна', N'2', N' 7(335)386-81-06 ', N'Клиенты\36.jpg', CAST(N'1997-12-16' AS Date), N' firstpr@verizon.net', CAST(N'2016-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (39, N'Сидорова', N'Татьяна', N'Михайловна', N'2', N' 7(51)732-91-79 ', N'Клиенты\42.jpg', CAST(N'1974-04-24' AS Date), N' tbeck@mac.com', CAST(N'2018-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (40, N'Силин', N'Гаянэ', N'Анатольевич', N'1', N' 7(4547)615-22-69 ', N'Клиенты\m46.jpg', CAST(N'1976-05-27' AS Date), N' multiplx@comcast.net', CAST(N'2017-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (41, N'Смирнов', N'Мартын', N'Арсеньевич', N'1', N' 7(6251)589-02-43 ', N'Клиенты\m34.jpg', CAST(N'1996-06-25' AS Date), N' haddawy@live.com', CAST(N'2017-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (42, N'Суворова', N'Божена', N'Анатольевна', N'2', N' 7(347)895-86-57 ', N'Клиенты\34.jpg', CAST(N'1981-03-09' AS Date), N' attwood@aol.com', CAST(N'2016-01-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (43, N'Сысоева', N'Дарина', N'Ярославовна', N'2', N' 7(0698)387-96-04 ', N'Клиенты\32.jpg', CAST(N'1982-02-03' AS Date), N' treit@verizon.net', CAST(N'2016-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (44, N'Трофимова', N'Альжбета', N'Якововна', N'2', N' 7(1084)658-92-95 ', N'Клиенты\25.jpg', CAST(N'1988-10-22' AS Date), N' gbacon@mac.com', CAST(N'2017-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (45, N'Турова', N'Георгина', N'Семёновна', N'2', N' 7(555)321-42-99 ', N'Клиенты\27.jpg', CAST(N'1974-05-28' AS Date), N' yruan@optonline.net', CAST(N'2018-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (46, N'Устинова', N'Юнона', N'Валентиновна', N'2', N' 7(33)367-13-07', N'Клиенты\44.jpg', CAST(N'1982-08-08' AS Date), N' kempsonc@live.com', CAST(N'2017-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (47, N'Федотова', N'Сандра', N'Владленовна', N'2', N' 7(126)195-25-86 ', N'Клиенты\24.jpg', CAST(N'1985-03-29' AS Date), N' penna@verizon.net', CAST(N'2016-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (48, N'Филатов', N'Аристарх', N'Дмитриевич', N'1', N' 7(696)235-29-24 ', N'Клиенты\m43.jpg', CAST(N'1989-05-29' AS Date), N' hampton@att.net', CAST(N'2017-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (49, N'Шашкова', N'Гелла', N'Эдуардовна', N'2', N' 7(57)446-21-04 ', N'Клиенты\43.jpg', CAST(N'1979-02-24' AS Date), N' jadavis@mac.com', CAST(N'2016-11-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (50, N'Шестаков', N'Геннадий', N'Рубенович', N'1', N' 7(2066)037-11-60 ', N'Клиенты\m41.jpg', CAST(N'2001-07-01' AS Date), N' tokuhirom@live.com', CAST(N'2018-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (52, N'Ефремов', N' Витольд', N' Авксентьевич', N'1', N' 7(93)922-14-03 ', N'Клиенты\m28.jpg', CAST(N'1975-12-02' AS Date), N' kwilliams@yahoo.ca', CAST(N'2018-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (53, N'Федотов', N' Осип', N' Анатольевич', N'1', N' 7(590)702-33-06 ', N'Клиенты\m9.jpg', CAST(N'1971-04-13' AS Date), N' breegster@hotmail.com', CAST(N'2018-07-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (54, N'Ершова', N' Номи', N' Андреевна', N'2', N' 7(7757)315-90-99 ', N'Клиенты\14.jpg', CAST(N'2001-09-13' AS Date), N' miltchev@mac.com', CAST(N'2016-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (55, N'Белозёрова', N' Диана', N' Антоновна', N'2', N' 7(9900)174-59-87 ', N'Клиенты\7.jpg', CAST(N'1989-02-27' AS Date), N' dialworld@aol.com', CAST(N'2017-01-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (56, N'Борисов', N' Аввакум', N' Артемович', N'1', N' 7(2296)930-08-88 ', N'Клиенты\m12.jpg', CAST(N'1974-04-25' AS Date), N' chlim@live.com', CAST(N'2017-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (57, N'Дроздов', N' Вольдемар', N' Артемович', N'1', N' 7(307)456-99-05 ', N'Клиенты\m21.jpg', CAST(N'1976-02-07' AS Date), N' smpeters@me.com', CAST(N'2017-07-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (58, N'Васильев', N' Оскар', N' Богданович', N'1', N' 7(585)801-94-29 ', N'Клиенты\m15.jpg', CAST(N'1971-01-30' AS Date), N' miturria@verizon.net', CAST(N'2017-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (59, N'Князев4', N' Терентий', N' Валерьевич', N'1', N' 7(98)397-23-234', N'Клиенты\m26.jpg', CAST(N'1991-06-19' AS Date), N' rjones@aol.com', CAST(N'2018-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (60, N'Кузьмин', N' Леонтий', N' Валерьянович', N'1', N' 7(1340)148-90-68 ', N'Клиенты\m17.jpg', CAST(N'2000-05-05' AS Date), N' msloan@hotmail.com', CAST(N'2017-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (61, N'Евсеев', N' Макар', N' Васильевич', N'1', N' 7(2141)077-85-70 ', N'Клиенты\m22.jpg', CAST(N'1977-09-13' AS Date), N' parsimony@sbcglobal.net', CAST(N'2018-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (62, N'Бобылёв', N' Георгий', N' Витальевич', N'1', N' 7(88)685-13-51 ', N'Клиенты\m11.jpg', CAST(N'1983-12-19' AS Date), N' csilvers@mac.com', CAST(N'2018-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (63, N'Анисимова', N' Тамара', N' Витальевна', N'2', N' 7(66)128-04-10 ', N'Клиенты\2.jpg', CAST(N'1988-06-16' AS Date), N' schwaang@mac.com', CAST(N'2016-02-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (64, N'Быкова', N' Тала', N' Георгьевна', N'2', N' 7(13)915-53-53 ', N'Клиенты\6.jpg', CAST(N'2000-02-22' AS Date), N' ganter@optonline.net', CAST(N'2016-08-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (65, N'Егорова', N' Амалия', N' Дамировна', N'2', N' 7(7486)408-12-26 ', N'Клиенты\13.jpg', CAST(N'1999-09-28' AS Date), N' drezet@yahoo.com', CAST(N'2016-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (66, N'Дмитриева', N' Элина', N' Даниловна', N'2', N' 7(787)140-48-84 ', N'Клиенты\12.jpg', CAST(N'1988-12-10' AS Date), N' vmalik@live.com', CAST(N'2017-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (67, N'Баранова', N' Эльмира', N' Дмитриевна', N'2', N' 7(9240)643-15-50 ', N'Клиенты\4.jpg', CAST(N'1977-01-15' AS Date), N' jgmyers@comcast.net', CAST(N'2016-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (68, N'Гусева', N' Роза', N' Дмитриевна', N'2', N' 7(23)064-51-84 ', N'Клиенты\10.jpg', CAST(N'1999-02-13' AS Date), N' martyloo@live.com', CAST(N'2017-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (69, N'Горбачёва', N' Никки', N' Еремеевна', N'2', N' 7(94)789-69-20 ', N'Клиенты\8.jpg', CAST(N'1987-04-21' AS Date), N' chinthaka@att.net', CAST(N'2018-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (70, N'Крюков', N' Наум', N' Ильяович', N'1', N' 7(81)657-88-92 ', N'Клиенты\m30.jpg', CAST(N'1993-11-17' AS Date), N' floxy@hotmail.com', CAST(N'2017-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (71, N'Горшкова', N' Марта', N' Иосифовна', N'2', N' 7(544)650-59-03 ', N'Клиенты\9.jpg', CAST(N'2001-02-13' AS Date), N' gbacon@mac.com', CAST(N'2016-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (72, N'Быков', N' Трофим', N' Константинович', N'1', N' 7(3414)460-12-05 ', N'Клиенты\m14.jpg', CAST(N'1994-12-20' AS Date), N' jguyer@aol.com', CAST(N'2016-04-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (73, N'Цветков', N' Демьян', N' Львович', N'1', N' 7(93)546-43-73 ', N'Клиенты\m4.jpg', CAST(N'1996-03-29' AS Date), N' hauma@icloud.com', CAST(N'2016-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (74, N'Артемьева', N' Лиза', N' Максимовна', N'2', N' 7(696)972-70-21 ', N'Клиенты\3.jpg', CAST(N'1996-05-17' AS Date), N' snunez@yahoo.ca', CAST(N'2018-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (75, N'Андреев', N' Станислав', N' Максович', N'1', N' 7(02)993-91-28 ', N'Клиенты\m3.jpg', CAST(N'1975-10-10' AS Date), N' budinger@mac.com', CAST(N'2017-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (76, N'Алексеева', N' Элина', N' Матвеевна', N'2', N' 7(8086)245-64-81 ', N'Клиенты\1.jpg', CAST(N'2002-05-07' AS Date), N' pthomsen@verizon.net', CAST(N'2018-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (77, N'Блинов', N' Евгений', N' Мэлсович', N'1', N' 7(0852)321-82-64 ', N'Клиенты\m7.jpg', CAST(N'1994-01-05' AS Date), N' moxfulder@outlook.com', CAST(N'2017-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (78, N'Агафонов', N' Юстиниан', N' Олегович', N'1', N' 7(303)810-28-78 ', N'Клиенты\m1.jpg', CAST(N'1997-02-02' AS Date), N' staffelb@sbcglobal.net', CAST(N'2016-06-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (79, N'Галкин', N' Эрик', N' Онисимович', N'1', N' 7(759)873-77-39 ', N'Клиенты\m16.jpg', CAST(N'1975-01-18' AS Date), N' snunez@verizon.net', CAST(N'2016-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (80, N'Ефимова', N' Магда', N' Платоновна', N'2', N' 7(9261)386-15-92 ', N'Клиенты\16.jpg', CAST(N'1995-08-16' AS Date), N' rbarreira@me.com', CAST(N'2017-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (81, N'Ефимов', N' Альберт', N' Проклович', N'1', N' 7(416)375-97-19 ', N'Клиенты\m6.jpg', CAST(N'1997-10-29' AS Date), N' houle@live.com', CAST(N'2018-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (82, N'Копылов', N' Касьян', N' Робертович', N'1', N' 7(5774)679-82-06 ', N'Клиенты\m29.jpg', CAST(N'1983-08-04' AS Date), N' crobles@sbcglobal.net', CAST(N'2018-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (83, N'Комиссарова', N' Амалия', N' Робертовна', N'2', N' 7(22)647-46-32 ', N'Клиенты\17.jpg', CAST(N'1971-08-18' AS Date), N' jorgb@msn.com', CAST(N'2017-08-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (84, N'Степанова', N' Амелия', N' Робертовна', N'2', N' 7(1217)441-28-42 ', N'Клиенты\15.jpg', CAST(N'1970-06-06' AS Date), N' rasca@hotmail.com', CAST(N'2017-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (85, N'Баранов', N' Михаил', N' Романович', N'1', N' 7(750)985-94-13 ', N'Клиенты\m5.jpg', CAST(N'1997-07-12' AS Date), N' bigmauler@outlook.com', CAST(N'2018-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (86, N'Колобова', N' Злата', N' Романовна', N'2', N' 7(50)884-07-35 ', N'Клиенты\18.jpg', CAST(N'1994-08-25' AS Date), N' sinkou@aol.com', CAST(N'2016-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (87, N'Крюкова', N' Авигея', N' Святославовна', N'2', N' 7(499)318-88-53 ', N'Клиенты\19.jpg', CAST(N'2000-08-10' AS Date), N' simone@gmail.com', CAST(N'2018-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (88, N'Гордеев', N' Павел', N' Семенович', N'1', N' 7(5243)599-66-72 ', N'Клиенты\m19.jpg', CAST(N'1984-09-06' AS Date), N' dawnsong@verizon.net', CAST(N'2016-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (89, N'Голубев', N' Иосиф', N' Тимофеевич', N'1', N' 7(78)972-73-11 ', N'Клиенты\m18.jpg', CAST(N'1982-05-06' AS Date), N' smcnabb@att.net', CAST(N'2018-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (90, N'Бирюкова', N' Инара', N' Улебовна', N'2', N' 7(098)346-50-58 ', N'Клиенты\5.jpg', CAST(N'1978-07-21' AS Date), N' smpeters@hotmail.com', CAST(N'2017-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (91, N'Ершов', N' Глеб', N' Федорович', N'1', N' 7(2608)298-40-82 ', N'Клиенты\m23.jpg', CAST(N'1970-06-14' AS Date), N' sjava@aol.com', CAST(N'2016-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (92, N'Гущина', N' Янита', N' Федоровна', N'2', N' 7(4544)716-68-96 ', N'Клиенты\11.jpg', CAST(N'1999-03-02' AS Date), N' lishoy@att.net', CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (93, N'Блохин', N' Пантелеймон', N' Феликсович', N'1', N' 7(9524)556-48-98 ', N'Клиенты\m8.jpg', CAST(N'1978-03-06' AS Date), N' balchen@comcast.net', CAST(N'2018-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (95, N'Александров', N' Станислав', N' Эдуардович', N'1', N' 7(18)164-05-12 ', N'Клиенты\m2.jpg', CAST(N'1981-07-04' AS Date), N' bigmauler@aol.com', CAST(N'2018-11-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (96, N'Колобов', N' Орест', N' Юлианович', N'1', N' 7(1680)508-58-26 ', N'Клиенты\m27.jpg', CAST(N'2001-07-14' AS Date), N' parkes@verizon.net', CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (97, N'Медведев', N' Святослав', N' Юлианович', N'1', N' 7(3520)435-21-20 ', N'Клиенты\m13.jpg', CAST(N'1972-10-04' AS Date), N' hllam@comcast.net', CAST(N'2018-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (98, N'Калашников', N' Артур', N' Юрьевич', N'1', N' 7(147)947-47-21 ', N'Клиенты\m10.jpg', CAST(N'1972-12-13' AS Date), N' oevans@aol.com', CAST(N'2017-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (99, N'Журавлёв', N' Леонтий', N' Яковлевич', N'1', N' 7(4403)308-56-96 ', N'Клиенты\m24.jpg', CAST(N'2000-03-02' AS Date), N' cmdrgravy@me.com', CAST(N'2018-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (100, N'Киселёв', N' Устин', N' Яковлевич', N'1', N' 7(83)334-52-76 ', N'Клиенты\m25.jpg', CAST(N'1985-01-08' AS Date), N' dalamb@verizon.net', CAST(N'2018-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (101, N'Афанасьева', N'Розалия', N'Макаровна', N'2', N' 7(0661)413-23-32 ', N'Клиенты\31.jpg', CAST(N'1977-05-01' AS Date), N' malattia@hotmail.com', CAST(N'2017-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (102, N'Афанасьева', N'Розалия', N'Макаровна', N'2', N' 7(0661)413-23-32 ', N'Клиенты\31.jpg', CAST(N'1977-05-01' AS Date), N' malattia@hotmail.com', CAST(N'2017-09-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 34, 24, CAST(N'2019-06-10T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 63, 22, CAST(N'2019-02-16T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 69, 8, CAST(N'2019-06-21T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 18, 27, CAST(N'2019-10-14T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 98, 38, CAST(N'2019-04-22T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 80, 5, CAST(N'2019-06-22T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 35, 4, CAST(N'2019-04-21T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 7, 31, CAST(N'2019-10-05T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 11, 20, CAST(N'2019-12-05T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 37, 20, CAST(N'2019-09-17T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 97, 14, CAST(N'2019-07-07T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 37, 4, CAST(N'2019-05-28T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 60, 40, CAST(N'2019-05-01T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 60, 47, CAST(N'2019-04-15T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 33, 19, CAST(N'2019-10-16T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 71, 27, CAST(N'2019-07-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 90, 31, CAST(N'2019-03-23T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 24, 26, CAST(N'2019-05-23T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 42, 30, CAST(N'2019-07-30T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 25, 15, CAST(N'2019-08-24T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 82, 10, CAST(N'2019-12-23T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 97, 10, CAST(N'2019-08-02T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 5, 23, CAST(N'2019-02-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 69, 12, CAST(N'2019-12-28T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 96, 43, CAST(N'2019-04-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 35, 35, CAST(N'2019-12-18T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 91, 29, CAST(N'2019-07-30T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 48, 12, CAST(N'2019-06-15T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 9, 22, CAST(N'2019-07-28T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 5, 48, CAST(N'2019-07-12T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 93, 26, CAST(N'2019-07-02T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 68, 4, CAST(N'2019-09-09T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 79, 47, CAST(N'2019-01-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 33, 50, CAST(N'2019-01-19T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 75, 41, CAST(N'2019-07-05T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 9, 16, CAST(N'2019-10-10T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 77, 3, CAST(N'2019-12-07T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 48, 32, CAST(N'2019-06-05T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 1, 24, CAST(N'2019-04-05T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 100, 47, CAST(N'2019-06-24T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 96, 12, CAST(N'2019-09-05T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 24, 34, CAST(N'2019-11-27T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 63, 36, CAST(N'2019-02-21T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 69, 13, CAST(N'2019-11-26T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 25, 25, CAST(N'2019-04-26T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 32, 25, CAST(N'2019-11-23T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 63, 50, CAST(N'2019-08-25T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 98, 18, CAST(N'2019-05-09T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 96, 17, CAST(N'2019-08-08T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 27, 38, CAST(N'2019-12-30T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 82, 25, CAST(N'2019-09-05T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 18, 16, CAST(N'2019-12-24T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 27, 28, CAST(N'2019-04-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 30, 41, CAST(N'2019-08-12T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 90, 40, CAST(N'2019-08-12T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 79, 16, CAST(N'2019-07-29T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 31, 2, CAST(N'2019-04-14T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 68, 6, CAST(N'2019-03-19T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 18, 30, CAST(N'2019-12-15T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 69, 7, CAST(N'2019-11-30T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 98, 49, CAST(N'2019-11-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 91, 46, CAST(N'2019-06-14T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 97, 12, CAST(N'2019-03-22T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 57, 3, CAST(N'2019-10-09T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 24, 22, CAST(N'2019-03-16T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 75, 48, CAST(N'2019-12-16T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 5, 29, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 30, 42, CAST(N'2019-09-20T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 63, 31, CAST(N'2019-04-15T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 70, 38, CAST(N'2019-08-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 70, 47, CAST(N'2019-03-04T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 63, 36, CAST(N'2019-02-24T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 80, 7, CAST(N'2019-12-06T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 35, 25, CAST(N'2019-08-05T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 70, 11, CAST(N'2019-05-19T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 71, 46, CAST(N'2019-12-30T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 100, 38, CAST(N'2019-06-28T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 31, 17, CAST(N'2019-11-05T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 5, 28, CAST(N'2019-09-19T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 97, 43, CAST(N'2019-02-26T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 71, 8, CAST(N'2019-09-13T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 33, 4, CAST(N'2019-10-14T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 75, 41, CAST(N'2019-04-11T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 3, 8, CAST(N'2019-03-06T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 57, 29, CAST(N'2019-08-21T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 11, 4, CAST(N'2019-06-29T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 41, 13, CAST(N'2019-02-04T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 71, 29, CAST(N'2019-07-09T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 91, 4, CAST(N'2019-06-16T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 1, 46, CAST(N'2019-11-27T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 32, 40, CAST(N'2019-05-27T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 1, 4, CAST(N'2019-12-15T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 33, 49, CAST(N'2019-10-17T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 24, 19, CAST(N'2019-11-15T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 9, 14, CAST(N'2019-08-24T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 75, 32, CAST(N'2019-05-27T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 79, 43, CAST(N'2019-08-19T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 80, 9, CAST(N'2019-08-08T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 77, 26, CAST(N'2019-02-24T13:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 96, 23, CAST(N'2019-12-19T15:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'Мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'Женский')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Замена масла в вариаторе', 4720.0000, 7200, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Покраска', 2370.0000, 7200, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Диагностика трансмиссии', 2790.0000, 7200, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Замена свечей', 2240.0000, 7200, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Диагностика рулевого редуктора', 2930.0000, 10800, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Замена трубки кондиционера', 2810.0000, 10800, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Диагностика выхлопной системы автомобиля', 2550.0000, 10800, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Развал-схождение', 3890.0000, 10800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Замена рулевой тяги', 570.0000, 10800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Ремонт двигателя', 2470.0000, 14400, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Чистка форсунок ультразвуком', 3920.0000, 14400, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Установка сигнализации', 1760.0000, 14400, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Снятие/установка форсунок', 1470.0000, 18000, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Замена кулисы АКПП', 3250.0000, 21600, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Замена тормозной жидкости', 2200.0000, 21600, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Замена масла заднего редуктора (моста)', 840.0000, 25200, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Замена ремня кондиционера', 4650.0000, 28800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Замена тормозных колодок', 4260.0000, 28800, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Замена троса сцепления', 4460.0000, 28800, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Ремонт стартера', 2680.0000, 28800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Замена масла в МКПП', 4490.0000, 32400, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Замена жидкости ГУР', 2380.0000, 32400, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Ремонт сцепления', 3290.0000, 36000, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Замена маховика', 2400.0000, 36000, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Замена ремня привода ГУР', 3350.0000, 36000, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Ремонт компрессора кондиционера', 4760.0000, 9000, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Кузовной ремонт', 2750.0000, 9000, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Ремонт глушителя', 2100.0000, 9000, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Замена охлаждающей жидкости', 1590.0000, 12600, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Замена фильтров', 530.0000, 12600, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Ремонт бензонасоса', 500.0000, 12600, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Ремонт карданного вала', 780.0000, 12600, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Испанский массаж', 2190.0000, 2400, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Замена лямбда зонда', 770.0000, 16200, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Замена подшипника задней ступицы', 1860.0000, 16200, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Ремонт и замена катализатора', 500.0000, 16200, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 1800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Замена подшипника передней ступицы', 4020.0000, 19800, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Замена сцепления', 4320.0000, 19800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Замена подшипника компрессора кондиционера', 1110.0000, 19800, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Диагностика подвески', 1460.0000, 19800, N'', 0, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Диагностика инжектора', 3390.0000, 19800, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Замена заднего сальника АКПП', 1510.0000, 23400, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Балансировка колес', 4690.0000, 23400, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Наращивание ресниц', 1430.0000, 2400, N'', 5, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Ремонт автоэлектрики', 4230.0000, 27000, N'', 10, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Замена масла АКПП', 2430.0000, 27000, N'', 25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Антибактериальная обработка кондиционера', 4580.0000, 27000, N'', 20, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Замена сальника привода', 3820.0000, 34200, N'', 15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Ремонт кронштейна глушителя', 1410.0000, 34200, N'', 0, N'')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Rulee] SET  READ_WRITE 
GO
