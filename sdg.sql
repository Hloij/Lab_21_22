USE [master]
GO
/****** Object:  Database [Lab_21]    Script Date: 02.06.2022 12:02:58 ******/
CREATE DATABASE [Lab_21]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab_21', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HOMESERV\MSSQL\DATA\Lab_21.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab_21_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HOMESERV\MSSQL\DATA\Lab_21_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lab_21] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab_21].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab_21] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab_21] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab_21] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab_21] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab_21] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab_21] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab_21] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab_21] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab_21] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab_21] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab_21] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab_21] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab_21] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab_21] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab_21] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab_21] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab_21] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab_21] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab_21] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab_21] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab_21] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab_21] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab_21] SET RECOVERY FULL 
GO
ALTER DATABASE [Lab_21] SET  MULTI_USER 
GO
ALTER DATABASE [Lab_21] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab_21] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab_21] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab_21] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab_21] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lab_21] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lab_21', N'ON'
GO
ALTER DATABASE [Lab_21] SET QUERY_STORE = OFF
GO
USE [Lab_21]
GO
/****** Object:  Table [dbo].[Объём_работ_на_объекте]    Script Date: 02.06.2022 12:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Объём_работ_на_объекте](
	[Код_объекта] [int] NOT NULL,
	[Код_работы] [int] NOT NULL,
	[Физ_объем_ед_измерения] [float] NULL,
 CONSTRAINT [PK_Объём_работ_на_объекте] PRIMARY KEY CLUSTERED 
(
	[Код_объекта] ASC,
	[Код_работы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[связб]    Script Date: 02.06.2022 12:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[связб](
	[код_работы] [int] NOT NULL,
 CONSTRAINT [PK_связб] PRIMARY KEY CLUSTERED 
(
	[код_работы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справочник_видов_работ]    Script Date: 02.06.2022 12:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справочник_видов_работ](
	[Код_вида_работ] [int] NOT NULL,
	[Наименование_вида_работ] [nvarchar](50) NULL,
	[Единица_измерения] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Справочник_видов_работ] PRIMARY KEY CLUSTERED 
(
	[Код_вида_работ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справочник_окончани_работ]    Script Date: 02.06.2022 12:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справочник_окончани_работ](
	[Код_объекта] [int] NOT NULL,
	[Дата_окончания_работ] [date] NULL,
 CONSTRAINT [PK_Справочник_окончани_работ] PRIMARY KEY CLUSTERED 
(
	[Код_объекта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справочник_расценок]    Script Date: 02.06.2022 12:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справочник_расценок](
	[Код_работы] [int] NOT NULL,
	[Код_вида_работ] [int] NOT NULL,
	[Наименование_работ] [nvarchar](50) NULL,
	[Расценка_за_ед_имерения] [int] NULL,
 CONSTRAINT [PK_Справочник_расценок] PRIMARY KEY CLUSTERED 
(
	[Код_работы] ASC,
	[Код_вида_работ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справочник_строительных_объектов]    Script Date: 02.06.2022 12:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справочник_строительных_объектов](
	[Код_объекта] [int] NOT NULL,
	[Наименование_объекта] [nvarchar](50) NULL,
	[Населенный_пункт] [nvarchar](50) NULL,
	[Адрес_объекта] [nvarchar](50) NULL,
	[Дата_начала_работ] [date] NULL,
 CONSTRAINT [PK_Справочник_строительных_объектов] PRIMARY KEY CLUSTERED 
(
	[Код_объекта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Объём_работ_на_объекте] ([Код_объекта], [Код_работы], [Физ_объем_ед_измерения]) VALUES (1, 4, 150)
INSERT [dbo].[Объём_работ_на_объекте] ([Код_объекта], [Код_работы], [Физ_объем_ед_измерения]) VALUES (2, 1, 10000)
INSERT [dbo].[Объём_работ_на_объекте] ([Код_объекта], [Код_работы], [Физ_объем_ед_измерения]) VALUES (3, 1, 10)
GO
INSERT [dbo].[связб] ([код_работы]) VALUES (1)
INSERT [dbo].[связб] ([код_работы]) VALUES (2)
INSERT [dbo].[связб] ([код_работы]) VALUES (3)
INSERT [dbo].[связб] ([код_работы]) VALUES (4)
INSERT [dbo].[связб] ([код_работы]) VALUES (5)
GO
INSERT [dbo].[Справочник_видов_работ] ([Код_вида_работ], [Наименование_вида_работ], [Единица_измерения]) VALUES (1, N'Строительные', N'М^2')
INSERT [dbo].[Справочник_видов_работ] ([Код_вида_работ], [Наименование_вида_работ], [Единица_измерения]) VALUES (2, N'Земляные', N'М^3')
INSERT [dbo].[Справочник_видов_работ] ([Код_вида_работ], [Наименование_вида_работ], [Единица_измерения]) VALUES (3, N'Кровельные', N'М^2')
INSERT [dbo].[Справочник_видов_работ] ([Код_вида_работ], [Наименование_вида_работ], [Единица_измерения]) VALUES (4, N'Отделочные', N'М^2')
INSERT [dbo].[Справочник_видов_работ] ([Код_вида_работ], [Наименование_вида_работ], [Единица_измерения]) VALUES (5, N'Бетонные', N'М^3')
GO
INSERT [dbo].[Справочник_окончани_работ] ([Код_объекта], [Дата_окончания_работ]) VALUES (1, CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Справочник_окончани_работ] ([Код_объекта], [Дата_окончания_работ]) VALUES (2, CAST(N'2025-09-05' AS Date))
INSERT [dbo].[Справочник_окончани_работ] ([Код_объекта], [Дата_окончания_работ]) VALUES (3, CAST(N'2022-08-20' AS Date))
GO
INSERT [dbo].[Справочник_расценок] ([Код_работы], [Код_вида_работ], [Наименование_работ], [Расценка_за_ед_имерения]) VALUES (1, 1, N'Строительные', 1000)
INSERT [dbo].[Справочник_расценок] ([Код_работы], [Код_вида_работ], [Наименование_работ], [Расценка_за_ед_имерения]) VALUES (2, 2, N'Земляные', 1500)
INSERT [dbo].[Справочник_расценок] ([Код_работы], [Код_вида_работ], [Наименование_работ], [Расценка_за_ед_имерения]) VALUES (3, 3, N'Кровельные', 1000)
INSERT [dbo].[Справочник_расценок] ([Код_работы], [Код_вида_работ], [Наименование_работ], [Расценка_за_ед_имерения]) VALUES (4, 4, N'Отделочные', 500)
INSERT [dbo].[Справочник_расценок] ([Код_работы], [Код_вида_работ], [Наименование_работ], [Расценка_за_ед_имерения]) VALUES (5, 5, N'Бетонные', 2000)
GO
INSERT [dbo].[Справочник_строительных_объектов] ([Код_объекта], [Наименование_объекта], [Населенный_пункт], [Адрес_объекта], [Дата_начала_работ]) VALUES (1, N'Дом', N'Рыбное', N'ул Пушкина', CAST(N'2020-05-01' AS Date))
INSERT [dbo].[Справочник_строительных_объектов] ([Код_объекта], [Наименование_объекта], [Населенный_пункт], [Адрес_объекта], [Дата_начала_работ]) VALUES (2, N'Многоэтажный дом', N'Рязань', N'Ул калатушкина 25', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Справочник_строительных_объектов] ([Код_объекта], [Наименование_объекта], [Населенный_пункт], [Адрес_объекта], [Дата_начала_работ]) VALUES (3, N'Сарай', N'Караблино', N'Ул Очная', CAST(N'2022-07-20' AS Date))
GO
ALTER TABLE [dbo].[Объём_работ_на_объекте]  WITH CHECK ADD  CONSTRAINT [FK_Объём_работ_на_объекте_связб] FOREIGN KEY([Код_работы])
REFERENCES [dbo].[связб] ([код_работы])
GO
ALTER TABLE [dbo].[Объём_работ_на_объекте] CHECK CONSTRAINT [FK_Объём_работ_на_объекте_связб]
GO
ALTER TABLE [dbo].[Объём_работ_на_объекте]  WITH CHECK ADD  CONSTRAINT [FK_Объём_работ_на_объекте_Справочник_строительных_объектов] FOREIGN KEY([Код_объекта])
REFERENCES [dbo].[Справочник_строительных_объектов] ([Код_объекта])
GO
ALTER TABLE [dbo].[Объём_работ_на_объекте] CHECK CONSTRAINT [FK_Объём_работ_на_объекте_Справочник_строительных_объектов]
GO
ALTER TABLE [dbo].[Справочник_окончани_работ]  WITH CHECK ADD  CONSTRAINT [FK_Справочник_окончани_работ_Справочник_строительных_объектов] FOREIGN KEY([Код_объекта])
REFERENCES [dbo].[Справочник_строительных_объектов] ([Код_объекта])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Справочник_окончани_работ] CHECK CONSTRAINT [FK_Справочник_окончани_работ_Справочник_строительных_объектов]
GO
ALTER TABLE [dbo].[Справочник_расценок]  WITH CHECK ADD  CONSTRAINT [FK_Справочник_расценок_связб] FOREIGN KEY([Код_работы])
REFERENCES [dbo].[связб] ([код_работы])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Справочник_расценок] CHECK CONSTRAINT [FK_Справочник_расценок_связб]
GO
ALTER TABLE [dbo].[Справочник_расценок]  WITH CHECK ADD  CONSTRAINT [FK_Справочник_расценок_Справочник_видов_работ] FOREIGN KEY([Код_вида_работ])
REFERENCES [dbo].[Справочник_видов_работ] ([Код_вида_работ])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Справочник_расценок] CHECK CONSTRAINT [FK_Справочник_расценок_Справочник_видов_работ]
GO
USE [master]
GO
ALTER DATABASE [Lab_21] SET  READ_WRITE 
GO
