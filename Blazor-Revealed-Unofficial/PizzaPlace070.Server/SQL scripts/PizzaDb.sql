USE [master]
GO
/****** Object:  Database [PizzaDb]    Script Date: 07/07/2019 22.47.55 ******/
CREATE DATABASE [PizzaDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaDb', FILENAME = N'C:\SQL Server Databases\PizzaDb' , SIZE = 23872KB , MAXSIZE = 30720KB , FILEGROWTH = 20480KB )
 LOG ON 
( NAME = N'PizzaDb_log', FILENAME = N'C:\SQL Server Databases\PizzaDb_log' , SIZE = 3976KB , MAXSIZE = 51200KB , FILEGROWTH = 40960KB )
GO
ALTER DATABASE [PizzaDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PizzaDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PizzaDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaDb] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PizzaDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PizzaDb] SET QUERY_STORE = OFF
GO
USE [PizzaDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PizzaDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/07/2019 22.47.55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 07/07/2019 22.47.55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/07/2019 22.47.55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PizzaOrders]    Script Date: 07/07/2019 22.47.55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PizzaOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[PizzaId] [int] NULL,
 CONSTRAINT [PK_PizzaOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizzas]    Script Date: 07/07/2019 22.47.55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizzas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[Spiciness] [int] NOT NULL,
 CONSTRAINT [PK_Pizzas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190106091124_CreatingPizzaDb', N'2.1.11-servicing-32099')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190106093352_HandlingOrders', N'2.1.11-servicing-32099')
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (1, N'Muhammed', N'311 Rd, MBZ Rd', N'Dubai')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (2, N'Ali', N'Kabasakal Cd.', N'Istanbul')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (3, N'Omar', N'Islamabad Highway', N'Islamabad')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (4, N'Abu-Bakr', N'9th Avenue', N'Islamabad')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (5, N'Uthman', N'Mall Road', N'Lahore')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (6, N'Aisha', N'Main Boulevard Faisal Town', N'Lahore')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (7, N'Jaffar', N'Hijra road', N'Makkah')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (8, N'Khaleed', N'Jaffa street', N'Jerusalem')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (9, N'Abu-Hurairah', N'As Salam road', N'Makkah')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (10, N'Fatima', N'Abo Bakr Al Siddiq Road', N'Medina')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (11, N'Khadeejah', N'Omar Ibn Al Khattab Road', N'Medina')
INSERT [dbo].[Customers] ([Id], [Name], [Street], [City]) VALUES (12, N'Abdellah', N'King David street', N'Jerusalem')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (1, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (2, 2, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (3, 3, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (4, 4, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (5, 5, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (6, 6, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (7, 7, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (8, 8, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (9, 9, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (10, 10, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (11, 11, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([Id], [CustomerId], [TotalPrice]) VALUES (12, 12, CAST(300.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PizzaOrders] ON 

INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (1, 1, 5)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (2, 2, 2)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (3, 4, 1)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (4, 4, 7)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (5, 5, 1)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (6, 5, 9)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (7, 6, 1)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (8, 6, 2)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (9, 7, 1)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (10, 7, 2)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (11, 8, 3)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (12, 8, 12)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (13, 8, 13)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (14, 9, 3)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (15, 9, 2)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (16, 9, 5)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (17, 10, 7)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (18, 10, 9)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (19, 10, 12)
INSERT [dbo].[PizzaOrders] ([Id], [OrderId], [PizzaId]) VALUES (20, 10, 13)
SET IDENTITY_INSERT [dbo].[PizzaOrders] OFF
SET IDENTITY_INSERT [dbo].[Pizzas] ON 

INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (1, N'Pepperoni Pizza', 85.0000, 0)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (2, N'Vegetarian Pizza', 69.0000, 1)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (3, N'Kebab Pizza', 65.0000, 2)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (5, N'Tandoori Chicken Pizza', 65.0000, 2)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (7, N'Punjabi Mix', 65.0000, 2)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (9, N'Margherita', 65.0000, 0)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (12, N'Kashmiri Pizza', 65.0000, 2)
INSERT [dbo].[Pizzas] ([Id], [Name], [Price], [Spiciness]) VALUES (13, N'Chicken Tikka Pizza', 65.0000, 2)
SET IDENTITY_INSERT [dbo].[Pizzas] OFF
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 07/07/2019 22.47.55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PizzaOrders_OrderId]    Script Date: 07/07/2019 22.47.55 ******/
CREATE NONCLUSTERED INDEX [IX_PizzaOrders_OrderId] ON [dbo].[PizzaOrders]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PizzaOrders_PizzaId]    Script Date: 07/07/2019 22.47.55 ******/
CREATE NONCLUSTERED INDEX [IX_PizzaOrders_PizzaId] ON [dbo].[PizzaOrders]
(
	[PizzaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[PizzaOrders]  WITH CHECK ADD  CONSTRAINT [FK_PizzaOrders_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[PizzaOrders] CHECK CONSTRAINT [FK_PizzaOrders_Orders_OrderId]
GO
ALTER TABLE [dbo].[PizzaOrders]  WITH CHECK ADD  CONSTRAINT [FK_PizzaOrders_Pizzas_PizzaId] FOREIGN KEY([PizzaId])
REFERENCES [dbo].[Pizzas] ([Id])
GO
ALTER TABLE [dbo].[PizzaOrders] CHECK CONSTRAINT [FK_PizzaOrders_Pizzas_PizzaId]
GO
USE [master]
GO
ALTER DATABASE [PizzaDb] SET  READ_WRITE 
GO
