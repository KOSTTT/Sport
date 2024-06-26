USE [master]
GO
/****** Object:  Database [dem]    Script Date: 15.06.2024 19:30:27 ******/
CREATE DATABASE [dem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dem] SET ARITHABORT OFF 
GO
ALTER DATABASE [dem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dem] SET  MULTI_USER 
GO
ALTER DATABASE [dem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dem] SET QUERY_STORE = OFF
GO
USE [dem]
GO
/****** Object:  Table [dbo].[ClimateTechTypes]    Script Date: 15.06.2024 19:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClimateTechTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_ClimateTechTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 15.06.2024 19:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](200) NOT NULL,
	[RequestId] [int] NOT NULL,
	[MasterId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 15.06.2024 19:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[ClimateTechTypeId] [int] NOT NULL,
	[ClimateTechModel] [nvarchar](100) NOT NULL,
	[ProblemDescription] [nvarchar](500) NOT NULL,
	[RequestStatusId] [int] NOT NULL,
	[CompletionDate] [date] NULL,
	[RepairParts] [nvarchar](500) NULL,
	[MasterId] [int] NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatuses]    Script Date: 15.06.2024 19:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_RequestStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 15.06.2024 19:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15.06.2024 19:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClimateTechTypes] ON 

INSERT [dbo].[ClimateTechTypes] ([Id], [Name]) VALUES (1, N'Кондиционер')
INSERT [dbo].[ClimateTechTypes] ([Id], [Name]) VALUES (2, N'Увлажнитель воздуха')
INSERT [dbo].[ClimateTechTypes] ([Id], [Name]) VALUES (3, N'Сушилка для рук')
SET IDENTITY_INSERT [dbo].[ClimateTechTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Message], [RequestId], [MasterId]) VALUES (1, N'Всё сделаем!', 2, 1)
INSERT [dbo].[Comments] ([Id], [Message], [RequestId], [MasterId]) VALUES (2, N'Всё сделаем!', 3, 2)
INSERT [dbo].[Comments] ([Id], [Message], [RequestId], [MasterId]) VALUES (3, N'Починим в момент.', 3, 3)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescription], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (1, CAST(N'2023-06-06' AS Date), 1, N'TCL TAC-12CHSA/TPG-W белый', N'Не охлаждает воздух', 1, NULL, NULL, 2, 7)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescription], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (2, CAST(N'2023-05-05' AS Date), 1, N'Electrolux EACS/I-09HAT/N3_21Y белый', N'Выключается сам по себе', 1, NULL, NULL, 3, 8)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescription], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (3, CAST(N'2022-07-07' AS Date), 2, N'Xiaomi Smart Humidifier 2', N'Пар имеет неприятный запах', 2, CAST(N'2023-01-01' AS Date), NULL, 3, 9)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescription], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (4, CAST(N'2023-08-02' AS Date), 2, N'Polaris PUH 2300 WIFI IQ Home', N'Увлажнитель воздуха продолжает работать при предельном снижении уровня воды', 3, NULL, NULL, NULL, 8)
INSERT [dbo].[Requests] ([Id], [StartDate], [ClimateTechTypeId], [ClimateTechModel], [ProblemDescription], [RequestStatusId], [CompletionDate], [RepairParts], [MasterId], [ClientId]) VALUES (5, CAST(N'2023-08-02' AS Date), 3, N'Ballu BAHD-1250', N'Не работает', 3, NULL, NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestStatuses] ON 

INSERT [dbo].[RequestStatuses] ([Id], [Name]) VALUES (1, N'В процессе ремонта')
INSERT [dbo].[RequestStatuses] ([Id], [Name]) VALUES (2, N'Готова к выдаче')
INSERT [dbo].[RequestStatuses] ([Id], [Name]) VALUES (3, N'Новая заявка')
SET IDENTITY_INSERT [dbo].[RequestStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (2, N'Специалист')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (3, N'Оператор')
INSERT [dbo].[Types] ([Id], [Name]) VALUES (4, N'Заказчик')
SET IDENTITY_INSERT [dbo].[Types] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (1, N'Широков', N'Василий', N'Матвеевич', N'89210563128', N'login1', N'pass1', 1)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (2, N'Кудрявцева', N'Ева', N'Ивановна', N'89535078985', N'login2', N'pass2', 2)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (3, N'Гончарова', N'Ульяна', N'Ярославовна', N'89210673849', N'login3', N'pass3', 2)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (4, N'Гусева', N'Виктория', N'Данииловна', N'89990563748', N'login4', N'pass4', 3)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (5, N'Баранов', N'Артём', N'Юрьевич', N'89994563847', N'login5', N'pass5', 3)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (6, N'Овчинников', N'Фёдор', N'Никитич', N'89219567849', N'login6', N'pass6', 4)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (7, N'Петров', N'Никита', N'Артёмович', N'89219567841', N'login7', N'pass7', 4)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (8, N'Ковалева', N'Софья', N'Владимировна', N'89219567842', N'login8', N'pass8', 4)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (9, N'Кузнецов', N'Сергей', N'Матвеевич', N'89219567843', N'login9', N'pass9', 4)
INSERT [dbo].[Users] ([Id], [Surname], [Name], [Patronymic], [Phone], [Login], [Password], [TypeId]) VALUES (10, N'Беспалова', N'Екатерина', N'Даниэльевна', N'89219567844', N'login10', N'pass10', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Requests] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Requests]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_ClimateTechTypes] FOREIGN KEY([ClimateTechTypeId])
REFERENCES [dbo].[ClimateTechTypes] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_ClimateTechTypes]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_RequestStatuses] FOREIGN KEY([RequestStatusId])
REFERENCES [dbo].[RequestStatuses] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_RequestStatuses]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([MasterId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users1] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Types]
GO
USE [master]
GO
ALTER DATABASE [dem] SET  READ_WRITE 
GO
