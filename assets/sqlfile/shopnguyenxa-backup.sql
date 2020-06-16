USE [master]
GO
/****** Object:  Database [shopnguyenxa]    Script Date: 6/16/2020 10:22:00 PM ******/
CREATE DATABASE [shopnguyenxa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopnguyenxa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopnguyenxa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shopnguyenxa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopnguyenxa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shopnguyenxa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shopnguyenxa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shopnguyenxa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shopnguyenxa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shopnguyenxa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shopnguyenxa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shopnguyenxa] SET ARITHABORT OFF 
GO
ALTER DATABASE [shopnguyenxa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shopnguyenxa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shopnguyenxa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shopnguyenxa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shopnguyenxa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shopnguyenxa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shopnguyenxa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shopnguyenxa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shopnguyenxa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shopnguyenxa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shopnguyenxa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shopnguyenxa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shopnguyenxa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shopnguyenxa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shopnguyenxa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shopnguyenxa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shopnguyenxa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shopnguyenxa] SET RECOVERY FULL 
GO
ALTER DATABASE [shopnguyenxa] SET  MULTI_USER 
GO
ALTER DATABASE [shopnguyenxa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shopnguyenxa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shopnguyenxa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shopnguyenxa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shopnguyenxa] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'shopnguyenxa', N'ON'
GO
ALTER DATABASE [shopnguyenxa] SET QUERY_STORE = OFF
GO
USE [shopnguyenxa]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/16/2020 10:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_customer] [int] NULL,
	[total] [real] NULL,
	[create_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_item]    Script Date: 6/16/2020 10:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_bill] [int] NULL,
	[id_product] [int] NULL,
	[quantity] [int] NULL,
	[unit_price] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/16/2020 10:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[phone_number] [varchar](50) NULL,
	[address] [nvarchar](512) NULL,
	[gender] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordered]    Script Date: 6/16/2020 10:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordered](
	[id_customer] [int] NULL,
	[id_bill] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/16/2020 10:22:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_no] [int] NULL,
	[name] [nvarchar](255) NULL,
	[brand] [nvarchar](255) NULL,
	[material] [nvarchar](255) NULL,
	[price] [int] NULL,
	[compatibility] [nvarchar](255) NULL,
	[mfgDate] [date] NULL,
	[warranty] [int] NULL,
	[linkImage] [varchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [id_customer], [total], [create_at]) VALUES (13, 1, 1757, CAST(N'2020-05-11' AS Date))
SET IDENTITY_INSERT [dbo].[bill] OFF
SET IDENTITY_INSERT [dbo].[bill_item] ON 

INSERT [dbo].[bill_item] ([id], [id_bill], [id_product], [quantity], [unit_price]) VALUES (13, 13, 12, 2, 99)
INSERT [dbo].[bill_item] ([id], [id_bill], [id_product], [quantity], [unit_price]) VALUES (14, 13, 74, 5, 300)
INSERT [dbo].[bill_item] ([id], [id_bill], [id_product], [quantity], [unit_price]) VALUES (15, 13, 14, 1, 59)
SET IDENTITY_INSERT [dbo].[bill_item] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [email], [password], [name], [phone_number], [address], [gender]) VALUES (1, N'namxg6626@gmail.com', N'$2b$10$jPWp/Df1ji97.cYt3EME9uicELONzUdrUMustzs747WQtmkIifbya', NULL, N'0985784219', NULL, NULL)
INSERT [dbo].[customer] ([id], [email], [password], [name], [phone_number], [address], [gender]) VALUES (2, N'namxg@gmail.com', N'$2b$10$MAuNB7lkGU7AyeVbuqSOo..7duabIeSGjD2.tCKAR8zkQxchR7/zq', NULL, N'0985784219', NULL, NULL)
INSERT [dbo].[customer] ([id], [email], [password], [name], [phone_number], [address], [gender]) VALUES (3, N'levannam@gmail.com', N'$2b$10$4ABOED0UFUFyTjsMEYE6eeidXG5cLIzEhpCRFzA3L2Cp60dZXNvcG', NULL, N'0985784219', NULL, NULL)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (1, 1, N'Đôi Loa 2.0', N'Kisonli', N'Nhựa tổng hợp', 100, N'Tất cả thiết bị có jack 3.5mm', CAST(N'2018-01-07' AS Date), 24, N'https://vn-live-03.slatic.net/p/218c4522031a109518a211c185eada38.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (2, 2, N'Ốp silicol cho Redmi note 7', N'Xiaomi', N'Nhựa dẻo', 50, N'Điện thoại Redmi note 7', CAST(N'2019-08-01' AS Date), 3, N'https://www.upsieutoc.com/images/2020/04/05/image05bb215952eca19f.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (3, 3, N'Đầu chuyển từ Micro Usb sang Type C', N'Xiaomi', N'Nhựa cứng', 30, N'Điện thoại Redmi note 7', CAST(N'2019-08-01' AS Date), 3, N'https://www.upsieutoc.com/images/2020/04/05/image19ce353a70ae4075.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (4, 4, N'Cường lực Xiaomi Redmi note 7', N'Xiaomi', N'Nhựa tổng hợp', 70, N'Điện thoại Redmi note 7,7 pro', CAST(N'2019-08-01' AS Date), 3, N'https://www.upsieutoc.com/images/2020/04/05/imaged291218fdc0aa5ed.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (5, 5, N'Ốp lưng Xiaomi Redmi note 7 vân vải 3D', N'Xiaomi', N'Nhựa bền', 100, N'Điện thoại Redmi note 7,7 pro', CAST(N'2019-08-01' AS Date), 3, N'https://www.upsieutoc.com/images/2020/04/05/imagec5a2568cfd309d37.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (6, 6, N'Sạc dự phòng Polymer 10.000mAh', N'Samsung', N'Nhựa cứng', 490, N'Tất cả điện thoại', CAST(N'2019-05-12' AS Date), 36, N'https://cdn.tgdd.vn/Products/Images/57/217992/sac-du-phong-polymer-10000mah-type-c-aukey-pb-xn10-1-600x600.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (7, 7, N'Sạc dự phòng nền mặt mèo', N'Samsung', N'Nhựa cứng', 250, N'Tất cả điện thoại', CAST(N'2019-04-15' AS Date), 24, N'https://cdn.tgdd.vn/Products/Images/57/204428/pin-sac-du-phong-7500mah-ava-cat-3s-cam-trang-1-600x600.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (8, 8, N'Tai nghe bluetooth JBL LIVE200BTBLK đen', N'Samsung', N'Nhựa dẻo', 870, N'Tất cả điện thoại', CAST(N'2019-03-17' AS Date), 24, N'https://cdn.tgdd.vn/Products/Images/54/217995/tai-nghe-bluetooth-jbl-live200btblk-den-1-600x600.jpg?fbclid=IwAR1JJeQ_CHbzgj7mJ-2lAc8C4OWx2XSYIChy0uML2akbFFQiAjLFKKb_UKw')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (9, 9, N'Ốp lưng iPhone người sói 6-7-8-X-Plus', N'Wolverine', N'Nhựa cứng', 79, N'Iphone 6-7-8-X-Plus', CAST(N'2019-03-26' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/op_wolverine_iphone_x_xs_avatar_mau_do.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (10, 10, N'Ốp lưng silicon case OEM iPhone', N'OEM', N'silicon', 119, N'Iphone 6-7-8-X-Plus', CAST(N'2019-06-26' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-silicone-case-iph91.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (11, 11, N'Ốp lưng 360 siêu mỏng iPhone', NULL, N'nhựa mềm', 49, N'Iphone 6-7-8-X-Plus', CAST(N'2019-06-21' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/360-sieu-m%E1%BB%8Fng-7.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (12, 12, N'Ốp lưng cường lực Toughened Glass iPhone 6-7-8-X', NULL, N'glass', 99, N'Iphone 6-7-8-X-Plus', CAST(N'2019-05-01' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/avt1871.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (13, 13, N'Ốp lưng RichKid Dubai cho iPhone', NULL, N'glass', 129, N'Iphone 6-7-8-X-Plus', CAST(N'2019-05-01' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-ch%E1%BB%91ng-nong-iph740.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (14, 14, N'Ốp lưng chống nóng iPhone', NULL, N'glass', 59, N'Iphone 6-7-8-X-Plus', CAST(N'2019-05-01' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-ch%E1%BB%91ng-nong-iph740.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (15, 15, N'Túi da rút cho iPhone', NULL, N'da', 60, N'Iphone 6-7-8-X-Plus', CAST(N'2019-01-06' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/bao-da-rut-iphone-6-7-ava.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (16, 16, N'Ốp silicon siêu mịn iPhone', NULL, N'silicon', 59, N'Iphone 6-7-8-X-Plus', CAST(N'2019-05-01' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/op-silicon-sieu-min-iphone-7-plus-ava9538.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (17, 17, N'Ốp dựng mọi góc độ iPhone', NULL, N'nhựa', 159, N'Iphone 6-7-8-X-Plus', CAST(N'2019-03-22' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava875.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (18, 18, N'Ốp lưng Hoco Ultrathin cho iPhone', NULL, N'nhựa mềm', 39, N'Iphone 6-7-8-X-Plus', CAST(N'2019-07-08' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-hoco-ultrathin.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (19, 19, N'Ốp lưng Jetblack 360 cho iPhone', NULL, N'nhựa cứng', 120, N'Iphone 6-7-8-X-Plus', CAST(N'2019-07-15' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/op-lung-jetblack-360-cho-iphone-7-plus-ava.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (20, 20, N'Ốp lưng Memumi siêu mỏng iPhone', NULL, N'silicon', 79, N'Iphone 6-7-8-X-Plus', CAST(N'2019-10-08' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/op_memumi_sieu_mong_iphone_6_6s_avatar.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (21, 21, N'Case bảo vệ iPaky iPhone', NULL, N'nhựa', 149, N'Iphone 6-7-8-X-Plus', CAST(N'2019-03-22' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-ipaky-6667.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (22, 22, N'Ốp lưng U case Slimfit iPhone', NULL, N'nhựa mềm', 149, N'Iphone 6-7-8-X-Plus', CAST(N'2019-07-04' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava2394.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (23, 23, N'Ốp lưng Sulada vân da iPhone 11', NULL, N'nhựa cứng', 99, N'Iphone 11 Plus', CAST(N'2019-07-04' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/op-lung-sulanda-van-da-iphone-11-pro-281.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (24, 24, N'Ốp lưng LEEU trong chống sốc iPhone 11', NULL, N'silicon', 99, N'Iphone 11 Plus', CAST(N'2019-10-20' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/op-leeu-silicon-iphone-11-1.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (25, 25, N'Tai nghe s6-s7', N'Samsung', N'Nhựa dẻo', 99, N'Galaxy S6/S7', CAST(N'2019-02-24' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe0-s6-s7-note5.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (26, 26, N'Tai nghe AKG Samsung S10/S10 +/S10e', N'AKG', N'Nhựa dẻo', 179, N'Galaxy S10/S10 +/S10e', CAST(N'2019-03-10' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-s8-akg.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (27, 27, N'Tai nghe AKG S8/s9/P - Note 8 Note 9', N'AKG', N'Nhựa dẻo', 149, N'Galaxy S8/s9/P - Note 8 Note 9', CAST(N'2019-04-16' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-akg.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (28, 28, N'Tai nghe Bluetooth Dacom K8i', N'DACOM', NULL, 199, N'Các dòng mãy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-07-15' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/dacom-k8ia.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (29, 29, N'Tai nghe iPhone 7-8-Plus-X zin - chính hãng Apple', N'APPLE', N'nhựa dẻo', 519, N'iPhone 7-8-Plus-X', CAST(N'2019-02-14' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-tai-foxconn-iph7.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (30, 30, N'Tai nghe EarPods chính hãng Apple Foxconn', N'APPLE', N'nhựa dẻo', 199, N'iPhone 6S Plus trở xuống', CAST(N'2019-01-15' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-earport-chinh-hang-avaweb.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (31, 31, N'Tai nghe Apple GH01', N'APPLE', N'nhựa', 79, N'iPhone 6S Plus trở xuống', CAST(N'2019-04-28' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tainghe80k.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (32, 32, N'Tai nghe Bluetooth i7s', NULL, N'nhựa', 145, N'iPhone 6S trở xuống', CAST(N'2019-01-12' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-i7s.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (33, 33, N'Tai nghe Bluetooth 5.0 i12 đen', NULL, N'nhựa', 399, N'iPhone 5 trở lên', CAST(N'2019-07-17' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-bluetooth-i12-den.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (34, 34, N'Tai nghe Galaxy Note 5', N'Samsung', N'nhựa', 99, N'Dòng máy Samsung hỗ trợ jack 3.5mm', CAST(N'2019-03-08' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-s756.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (35, 35, N'Tai nghe Bluetooth Dacom P10', N'DACOM', NULL, 599, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-08-18' AS Date), 12, N'https://songlongmedia.com/media/product/516_dacom_p10_red.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (36, 36, N'Tai nghe AKG N28 chính hãng', N'SAMSUNG', N'nhựa cứng', 649, N'Tất cả các dòng máy có jack 3.5mm', CAST(N'2019-07-14' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/Akg-n28a.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (37, 37, N'Tai nghe Bluetooth Remax TWS-5', N'Remax', NULL, 890, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-02-28' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-bluetooth-remax-tws-5.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (38, 38, N'Tai nghe Bluetooth Bluedio TN', N'Bluedio', N'nhựa', 589, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-05-02' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/!bluedio-ava75.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (39, 39, N'Tai nghe Bluetooth Awei G30BL', N'AWEI', NULL, 369, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-02-16' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/awei-g30-bl1.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (40, 40, N'Tai nghe Bluetooth Dacom L06', N'DACOM', NULL, 549, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-03-02' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/dacom-l06-1.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (41, 41, N'Tai nghe Bluetooth Awei G10BL', N'AWEI', N'Nhựa dẻo', 399, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-06-09' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/!ava-g10bl.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (42, 42, N'Tai nghe Bluetooth Huawei FreeBuds ( white )', N'Huawei', N'nhựa dẻo', 599, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-03-08' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/!avahuawei865.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (43, 43, N'Tai nghe Bluetooth Sony SP600N', N'Sony', N'nhựa dẻo', 3490, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-06-08' AS Date), 24, N'https://gomhang.vn/images/stories/virtuemart/product/!sony.824.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (44, 44, N'Tai Nghe Bluetooth Thể Thao Sony WI-C300', N'Sony', N'nhựa dẻo', 815, N'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', CAST(N'2019-08-07' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/5f/0d/6f/08f861903952fa6b69509cd357127b69.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (45, 45, N'Sạc dự phòng Yoobao mini 10000mAh P10W', N'Yoobao', NULL, 299, N'Tất cả các dòng máy', CAST(N'2019-06-07' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/yoobao-p10w.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (46, 46, N'Sạc dự phòng Yoobao PL12 Pro 12000 mAh', N'Yoobao', NULL, 399, N'Tất cả các dòng máy', CAST(N'2019-02-14' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/avatar61.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (47, 47, N'Sạc dự phòng Remax 10000mAh RPP 153', N'Remax', NULL, 249, N'Tất cả các dòng máy', CAST(N'2019-01-15' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/sac-du-phong-remax-rp-15.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (48, 48, N'Sạc dự phòng Yoobao P6W 6000mAh', N'Yoobao', NULL, 199, N'Tất cả các dòng máy', CAST(N'2019-03-14' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/sac-du-phong-Yoobao-P6w-6000mAh-den.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (49, 49, N'Sạc dự phòng nhanh Yoobao PD20 20000mAh', N'Yoobao', NULL, 479, N'Tất cả các dòng máy', CAST(N'2019-01-17' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/S%E1%BA%A1c-d%E1%BB%B1-ph%C3%B2ng-Yoobao-PD20-20000mah.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (50, 50, N'Sạc dự phòng Yoobao P10T 10000mAh', N'Yoobao', NULL, 259, N'Tất cả các dòng máy', CAST(N'2019-04-13' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/yoobao-p10t-10000.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (51, 51, N'Sạc dự phòng Pisen Led 10000mAh', N'Pisen', NULL, 449, N'Tất cả các dòng máy', CAST(N'2019-06-20' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/S%E1%BA%A1c-d%E1%BB%B1-ph%C3%B2ng-Pisen-Led-10000-mAh.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (52, 52, N'Sạc dự phòng REMAX Jane Series 10000mah RPP-119', N'Remax', NULL, 299, N'Tất cả các dòng máy', CAST(N'2019-08-19' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/REMAX-Jane-Series-10000mah.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (53, 53, N'Sạc dự phòng vỏ kim loại Yoobao A1 10000 mAh', N'Yoobao', NULL, 369, N'Tất cả các dòng máy', CAST(N'2019-01-20' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/avatar2.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (54, 54, N'Sạc không dây Libtech BricksPower', NULL, NULL, 849, N'Tất cả các dòng máy', CAST(N'2019-05-26' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/sac-khong-day-libtech-brickpower.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (55, 55, N'Sạc dự phòng Finger Pow', NULL, NULL, 1199, N'Tất cả các dòng máy', CAST(N'2019-07-24' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/sac-du-phong-Fighter-Pow1.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (56, 56, N'Sạc dự phòng Remax 10000 mAh RPP-79', N'Remax', NULL, 519, N'Tất cả các dòng máy', CAST(N'2019-02-26' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-remax-1000099.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (57, 57, N'Sạc dự phòng nhanh Yoobao 30W-PD 30000mAh', N'Yoobao', NULL, 649, N'Tất cả các dòng máy', CAST(N'2019-08-21' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/Yoobao%2030W-PD.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (58, 58, N'Sac dự phòng kiêm không dây Totu 10000mah', N'Totu', NULL, 799, N'Tất cả các dòng máy', CAST(N'2019-10-02' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava4318.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (59, 59, N'Sạc dự phòng Sinoele 10000 mAh', N'sinoele', NULL, 349, N'Tất cả các dòng máy', CAST(N'2019-02-22' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava-sinoele-10000.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (60, 60, N'Sạc dự phòng Baseus M10', N'baseus', NULL, 399, N'Tất cả các dòng máy', CAST(N'2019-07-08' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/17431.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (61, 61, N'Sạc dự phòng Samsung 5000 mAh chính hãng', N'SAMSUNG', NULL, 599, N'Điện thoại android và ios', CAST(N'2019-03-19' AS Date), 12, N'https://gomhang.vn/images/stories/virtuemart/product/ava394.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (62, 62, N'Ốp Lưng iPhone 7 Plus / 8 Plus Anker Karapax Touch', N'Wolverine', N'Nhựa cứng', 180, N'Iphone 7-8-Plus', CAST(N'2019-03-31' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/c0/96/75/a38c54ab78088b9ec9d840c3eec42b61.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (63, 63, N'Ốp lưng dẻo iPhone XS Max Nillkin (trong suốt) ', N'OEM', N'silicon', 39, N'Iphone 6-7-8-X-Plus', CAST(N'2019-06-20' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/b9/40/8c/3f1b0d4c017b3d47f101a79f96e2912f.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (64, 64, N'Ốp Chống Sốc Viền Màu Nắp Lưng Mờ ', NULL, N'nhựa mềm', 79, N'Iphone 6-7-8-X-Plus', CAST(N'2019-06-06' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/91/d3/21/291149a3deadbe6dc0d1a12db59c080f.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (65, 65, N'Ốp Lưng Cường Lực Trong Suốt cho IPhone 11 Pro Max', NULL, N'glass', 200, N'Iphone 11-Pro-max', CAST(N'2019-05-19' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/df/d7/2f/3e34b1da8502d4ab17dbb6db0b2448d5.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (66, 66, N'Ốp lưng chống sốc phát sáng cho điện thoại iPhone 11/ iPhone 11 Pro/ iPhone 11 Pro Max', NULL, N'glass', 129, N'Iphone 6-7-8-X-Plus', CAST(N'2910-05-09' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/38/dc/64/9c52fa77ca57150d343157bd0a670fb4.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (67, 67, N'Ốp lưng Memumi cho iPhone 11 Pro Max 6.5 siêu mỏng 0.3 mm (xanh rêu)', NULL, N'glass', 59, N'Iphone 6-7-8-X-Plus', CAST(N'2019-05-30' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/1a/46/fe/7d7aad58c13a032811ed896591a52c65.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (68, 68, N'Ốp lưng da cao cấp dành cho iPhone X và iPhone XS', NULL, N'da', 60, N'Iphone 6-7-8-X-Plus', CAST(N'2019-06-08' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/a6/e8/11/07215f28c4a67112f3f26b938ccbf710.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (69, 69, N'Ốp lưng Memumi siêu mỏng 0.3 mm cho iPhone XS Max', NULL, N'silicon', 99, N'Iphone 6-7-8-X-Plus', CAST(N'2019-05-01' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/80/8b/8f/cb681debd613c1157e609263a830163c.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (70, 70, N'ỐP LƯNG DẺO TRONG SUỐT CHO IPHONE X', NULL, N'nhựa', 159, N'Iphone X-Plus', CAST(N'2019-03-02' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/b8/47/57/18123de57a3306f2606e996727d02305.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (71, 71, N'Ốp lưng chống sốc cho Iphone 6 Plus / 6s Plus', NULL, N'nhựa mềm', 79, N'Iphone 6-Plus', CAST(N'2018-07-12' AS Date), 12, N'https://salt.tikicdn.com/cache/w1200/ts/product/9b/0c/35/65fdc092dc15c43643e7d007fc67db7d.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (72, 72, N'Loa Bluetooth W-King X3', N'W-King X3', N'Nhựa cứng', 650, N'smart phone', CAST(N'2019-08-01' AS Date), 3, N'https://i.imgur.com/6g7aLXd.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (73, 73, N'Ốp lưng iPad Air 2019 Nắp gập Stand Flip MEEKER Navy', N'Apple', N'Da', 210, N'iPad', CAST(N'2019-09-15' AS Date), 3, N'https://i.imgur.com/2RuqFZX.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (74, 74, N'Củ sạc nhanh Remax RP-U46', N'Remax', N'Nhựa cứng', 300, N'smart phone', CAST(N'2019-08-30' AS Date), 3, N'https://i.imgur.com/fyPmKHM.png')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (75, 75, N'Miếng dán màn hình Oppo A5', N'Oppo', N'Nhựa cứng', 50, N'Oppo A5', CAST(N'2019-03-19' AS Date), 3, N'https://i.imgur.com/PZ2ckMG.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (76, 76, N'Miếng dán lưng iPhone 11', N'Apple', N'Nhựa cứng', 50, N'Iphone 11', CAST(N'2019-08-15' AS Date), 3, N'https://i.imgur.com/uS9fbLd.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (77, 77, N'Loa Bluetooth chống nước Vidvie SP901', N'Vidvie', N'Nhựa cứng', 630, N'Smart phone', CAST(N'2020-01-03' AS Date), 3, N'https://i.imgur.com/gcpPG2y.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (78, 78, N'Miếng dán màn hình Galaxy Note 10', N'Galaxy', N'Nhựa cứng', 50, N'Galaxy Note 10', CAST(N'2019-10-13' AS Date), 3, N'https://i.imgur.com/glbNkO7.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (79, 79, N'Củ sạc 4 cổng USB Remax RP-U43', N'Remax', N'Nhựa cứng', 250, N'Smart phone', CAST(N'2019-11-20' AS Date), 3, N'https://i.imgur.com/eOkP17b.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (80, 80, N'Tai nghe Bluetooth Mozard S205A Xanh', N'Mozard', N'Nhựa dẻo', 229, N'Smart phone', CAST(N'2019-10-16' AS Date), 3, N'https://i.imgur.com/5VoOpBG.jpg')
INSERT [dbo].[product] ([id], [product_no], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES (81, 81, N'Cáp 3 đầu Lightning Type C Micro 1m eValu Spanker B Xanh Biển', NULL, N'Nhựa dẻo', 200, N'Smart phone', CAST(N'2019-11-15' AS Date), 3, N'https://i.imgur.com/uqu1nbM.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [fk_id_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [fk_id_customer]
GO
ALTER TABLE [dbo].[bill_item]  WITH CHECK ADD  CONSTRAINT [fk_id_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[bill_item] CHECK CONSTRAINT [fk_id_bill]
GO
ALTER TABLE [dbo].[bill_item]  WITH CHECK ADD  CONSTRAINT [fk_id_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[bill_item] CHECK CONSTRAINT [fk_id_product]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD  CONSTRAINT [fk_ordered_id_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[ordered] CHECK CONSTRAINT [fk_ordered_id_bill]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD  CONSTRAINT [fk_ordered_id_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[ordered] CHECK CONSTRAINT [fk_ordered_id_customer]
GO
USE [master]
GO
ALTER DATABASE [shopnguyenxa] SET  READ_WRITE 
GO
