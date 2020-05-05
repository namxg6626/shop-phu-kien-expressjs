-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 07:08 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

/* SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; */

use shopnguyenxa

DECLARE @AUTOCOMMIT INT
SET @AUTOCOMMIT = 0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopnguyenxa`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE bill (
  [id] int NOT NULL,
  [id_customer] int NOT NULL,
  [total] float NOT NULL,
  [create_at] date NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_item`
--

CREATE TABLE bill_item (
  [id] int NOT NULL,
  [id_bill] int NOT NULL,
  [id_product] int NOT NULL,
  [quantity] int NOT NULL,
  [unit_price] float NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE customer (
  [id] int NOT NULL,
  [email] varchar(255) NOT NULL,
  [password] varchar(255) NOT NULL,
  [name] varchar(255) DEFAULT NULL,
  [phone_number] int DEFAULT NULL,
  [address] varchar(255) DEFAULT NULL,
  [gender] smallint DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE product (
  [id] int NOT NULL,
  [name] varchar(255) DEFAULT NULL,
  [brand] varchar(255) DEFAULT NULL,
  [material] varchar(255) DEFAULT NULL,
  [price] int DEFAULT NULL,
  [compatibility] varchar(255) DEFAULT NULL,
  [mfgDate] date DEFAULT NULL,
  [warranty] int DEFAULT NULL,
  [linkImage] varchar(512) DEFAULT NULL
) ;

--
-- Dumping data for table `product`
--

INSERT INTO product ([id], [name], [brand], [material], [price], [compatibility], [mfgDate], [warranty], [linkImage]) VALUES
(1, 'Đôi Loa 2.0', 'Kisonli', 'Nhựa tổng hợp', 100, 'Tất cả thiết bị có jack 3.5mm', '2018-01-07', 24, 'https://vn-live-03.slatic.net/p/218c4522031a109518a211c185eada38.jpg'),
(2, 'Ốp silicol cho Redmi note 7', 'Xiaomi', 'Silicon', 120, 'Điện thoại Redmi note 7', '2019-08-01', 3, 'https://www.upsieutoc.com/images/2020/04/05/image05bb215952eca19f.png'),
(3, 'Đầu chuyển từ Micro Usb sang Type C', 'Xiaomi', 'Nhựa cứng', 30, 'Điện thoại Redmi note 7', '2019-08-01', 3, 'https://www.upsieutoc.com/images/2020/04/05/image19ce353a70ae4075.png'),
(4, 'Cường lực Xiaomi Redmi note 7', 'Xiaomi', 'Nhựa tổng hợp', 70, 'Điện thoại Redmi note 7,7 pro', '2019-08-01', 3, 'https://www.upsieutoc.com/images/2020/04/05/imaged291218fdc0aa5ed.png'),
(5, 'Ốp lưng Xiaomi Redmi note 7 vân vải 3D', 'Xiaomi', 'Nhựa bền', 150, 'Điện thoại Redmi note 7,7 pro', '2019-08-01', 3, 'https://www.upsieutoc.com/images/2020/04/05/imagec5a2568cfd309d37.png'),
(6, 'Sạc dự phòng Polymer 10.000mAh', 'Samsung', 'Nhựa cứng', 490, 'Tất cả điện thoại', '2019-05-12', 36, 'https://cdn.tgdd.vn/Products/Images/57/217992/sac-du-phong-polymer-10000mah-type-c-aukey-pb-xn10-1-600x600.jpg'),
(7, 'Sạc dự phòng nền mặt mèo', 'Samsung', 'Nhựa cứng', 250, 'Tất cả điện thoại', '2019-04-15', 24, 'https://cdn.tgdd.vn/Products/Images/57/204428/pin-sac-du-phong-7500mah-ava-cat-3s-cam-trang-1-600x600.jpg'),
(8, 'Tai nghe bluetooth JBL LIVE200BTBLK đen', 'Samsung', 'Nhựa dẻo', 870, 'Tất cả điện thoại', '2019-03-17', 24, 'https://cdn.tgdd.vn/Products/Images/54/217995/tai-nghe-bluetooth-jbl-live200btblk-den-1-600x600.jpg?fbclid=IwAR1JJeQ_CHbzgj7mJ-2lAc8C4OWx2XSYIChy0uML2akbFFQiAjLFKKb_UKw'),
(9, 'Ốp lưng iPhone người sói 6-7-8-X-Plus', 'Wolverine', 'Nhựa cứng', 79, 'Iphone 6-7-8-X-Plus', '2019-03-26', 12, 'https://gomhang.vn/images/stories/virtuemart/product/op_wolverine_iphone_x_xs_avatar_mau_do.jpg'),
(10, 'Ốp lưng silicon case OEM iPhone', 'OEM', 'silicon', 119, 'Iphone 6-7-8-X-Plus', '2019-06-26', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-silicone-case-iph91.jpg'),
(11, 'Ốp lưng 360 siêu mỏng iPhone', 'NULL', 'nhựa mềm', 49, 'Iphone 6-7-8-X-Plus', '2019-06-21', 12, 'https://gomhang.vn/images/stories/virtuemart/product/360-sieu-m%E1%BB%8Fng-7.jpg'),
(12, 'Ốp lưng cường lực Toughened Glass iPhone 6-7-8-X', 'NULL', 'glass', 99, 'Iphone 6-7-8-X-Plus', '2019-05-01', 12, 'https://gomhang.vn/images/stories/virtuemart/product/avt1871.jpg'),
(13, 'Ốp lưng RichKid Dubai cho iPhone', 'NULL', 'glass', 129, 'Iphone 6-7-8-X-Plus', '2019-05-01', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-ch%E1%BB%91ng-nong-iph740.jpg'),
(14, 'Ốp lưng chống nóng iPhone', 'NULL', 'glass', 59, 'Iphone 6-7-8-X-Plus', '2019-05-01', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-ch%E1%BB%91ng-nong-iph740.jpg'),
(15, 'Túi da rút cho iPhone', 'NULL', 'da', 60, 'Iphone 6-7-8-X-Plus', '2019-01-06', 12, 'https://gomhang.vn/images/stories/virtuemart/product/bao-da-rut-iphone-6-7-ava.jpg'),
(16, 'Ốp silicon siêu mịn iPhone', 'NULL', 'silicon', 59, 'Iphone 6-7-8-X-Plus', '2019-05-01', 12, 'https://gomhang.vn/images/stories/virtuemart/product/op-silicon-sieu-min-iphone-7-plus-ava9538.jpg'),
(17, 'Ốp dựng mọi góc độ iPhone', 'NULL', 'nhựa', 159, 'Iphone 6-7-8-X-Plus', '2019-03-22', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava875.jpg'),
(18, 'Ốp lưng Hoco Ultrathin cho iPhone', 'NULL', 'nhựa mềm', 39, 'Iphone 6-7-8-X-Plus', '2019-07-08', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-hoco-ultrathin.jpg'),
(19, 'Ốp lưng Jetblack 360 cho iPhone', 'NULL', 'nhựa cứng', 120, 'Iphone 6-7-8-X-Plus', '2019-07-15', 12, 'https://gomhang.vn/images/stories/virtuemart/product/op-lung-jetblack-360-cho-iphone-7-plus-ava.jpg'),
(20, 'Ốp lưng Memumi siêu mỏng iPhone', 'NULL', 'silicon', 79, 'Iphone 6-7-8-X-Plus', '2019-10-08', 12, 'https://gomhang.vn/images/stories/virtuemart/product/op_memumi_sieu_mong_iphone_6_6s_avatar.jpg'),
(21, 'Case bảo vệ iPaky iPhone', 'NULL', 'nhựa', 149, 'Iphone 6-7-8-X-Plus', '2019-03-22', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-ipaky-6667.jpg'),
(22, 'Ốp lưng U case Slimfit iPhone', 'NULL', 'nhựa mềm', 149, 'Iphone 6-7-8-X-Plus', '2019-07-04', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava2394.jpg'),
(23, 'Ốp lưng Sulada vân da iPhone 11', 'NULL', 'nhựa cứng', 99, 'Iphone 11 Plus', '2019-07-04', 12, 'https://gomhang.vn/images/stories/virtuemart/product/op-lung-sulanda-van-da-iphone-11-pro-281.jpg'),
(24, 'Ốp lưng LEEU trong chống sốc iPhone 11', 'NULL', 'silicon', 99, 'Iphone 11 Plus', '2019-10-20', 12, 'https://gomhang.vn/images/stories/virtuemart/product/op-leeu-silicon-iphone-11-1.jpg'),
(25, 'Tai nghe s6-s7', 'Samsung', 'Nhựa dẻo', 99, 'Galaxy S6/S7', '2019-02-24', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe0-s6-s7-note5.jpg'),
(26, 'Tai nghe AKG Samsung S10/S10 +/S10e', 'AKG', 'Nhựa dẻo', 179, 'Galaxy S10/S10 +/S10e', '2019-03-10', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-s8-akg.jpg'),
(27, 'Tai nghe AKG S8/s9/P - Note 8 Note 9', 'AKG', 'Nhựa dẻo', 149, 'Galaxy S8/s9/P - Note 8 Note 9', '2019-04-16', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-akg.jpg'),
(28, 'Tai nghe Bluetooth Dacom K8i', 'DACOM', 'NULL', 199, 'Các dòng mãy hỗ trợ Bluetooth 3.0 trở lên', '2019-07-15', 12, 'https://gomhang.vn/images/stories/virtuemart/product/dacom-k8ia.jpg'),
(29, 'Tai nghe iPhone 7-8-Plus-X zin - chính hãng Apple', 'APPLE', 'nhựa dẻo', 519, 'iPhone 7-8-Plus-X', '2019-02-14', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-tai-foxconn-iph7.jpg'),
(30, 'Tai nghe EarPods chính hãng Apple Foxconn', 'APPLE', 'nhựa dẻo', 199, 'iPhone 6S Plus trở xuống', '2019-01-15', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-earport-chinh-hang-avaweb.jpg'),
(31, 'Tai nghe Apple GH01', 'APPLE', 'nhựa', 79, 'iPhone 6S Plus trở xuống', '2019-04-28', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tainghe80k.jpg'),
(32, 'Tai nghe Bluetooth i7s', 'NULL', 'nhựa', 145, 'iPhone 6S trở xuống', '2019-01-12', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-i7s.jpg'),
(33, 'Tai nghe Bluetooth 5.0 i12 đen', 'NULL', 'nhựa', 399, 'iPhone 5 trở lên', '2019-07-17', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-bluetooth-i12-den.jpg'),
(34, 'Tai nghe Galaxy Note 5', 'Samsung', 'nhựa', 99, 'Dòng máy Samsung hỗ trợ jack 3.5mm', '2019-03-08', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-s756.jpg'),
(35, 'Tai nghe Bluetooth Dacom P10', 'DACOM', 'NULL', 599, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-08-18', 12, 'https://songlongmedia.com/media/product/516_dacom_p10_red.jpg'),
(36, 'Tai nghe AKG N28 chính hãng', 'SAMSUNG', 'nhựa cứng', 649, 'Tất cả các dòng máy có jack 3.5mm', '2019-07-14', 12, 'https://gomhang.vn/images/stories/virtuemart/product/Akg-n28a.jpg'),
(37, 'Tai nghe Bluetooth Remax TWS-5', 'Remax', 'NULL', 890, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-02-28', 12, 'https://gomhang.vn/images/stories/virtuemart/product/tai-nghe-bluetooth-remax-tws-5.jpg'),
(38, 'Tai nghe Bluetooth Bluedio TN', 'Bluedio', 'nhựa', 589, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-05-02', 12, 'https://gomhang.vn/images/stories/virtuemart/product/!bluedio-ava75.jpg'),
(39, 'Tai nghe Bluetooth Awei G30BL', 'AWEI', 'NULL', 369, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-02-16', 12, 'https://gomhang.vn/images/stories/virtuemart/product/awei-g30-bl1.jpg'),
(40, 'Tai nghe Bluetooth Dacom L06', 'DACOM', 'NULL', 549, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-03-02', 12, 'https://gomhang.vn/images/stories/virtuemart/product/dacom-l06-1.jpg'),
(41, 'Tai nghe Bluetooth Awei G10BL', 'AWEI', 'Nhựa dẻo', 399, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-06-09', 12, 'https://gomhang.vn/images/stories/virtuemart/product/!ava-g10bl.png'),
(42, 'Tai nghe Bluetooth Huawei FreeBuds ( white )', 'Huawei', 'nhựa dẻo', 599, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-03-08', 12, 'https://gomhang.vn/images/stories/virtuemart/product/!avahuawei865.jpg'),
(43, 'Tai nghe Bluetooth Sony SP600N', 'Sony', 'nhựa dẻo', 3490, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-06-08', 24, 'https://gomhang.vn/images/stories/virtuemart/product/!sony.824.jpg'),
(44, 'Tai Nghe Bluetooth Thể Thao Sony WI-C300', 'Sony', 'nhựa dẻo', 815, 'Các dòng máy hỗ trợ Bluetooth 3.0 trở lên', '2019-08-07', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/5f/0d/6f/08f861903952fa6b69509cd357127b69.jpg'),
(45, 'Sạc dự phòng Yoobao mini 10000mAh P10W', 'Yoobao', 'NULL', 299, 'Tất cả các dòng máy', '2019-06-07', 12, 'https://gomhang.vn/images/stories/virtuemart/product/yoobao-p10w.jpg'),
(46, 'Sạc dự phòng Yoobao PL12 Pro 12000 mAh', 'Yoobao', 'NULL', 399, 'Tất cả các dòng máy', '2019-02-14', 12, 'https://gomhang.vn/images/stories/virtuemart/product/avatar61.jpg'),
(47, 'Sạc dự phòng Remax 10000mAh RPP 153', 'Remax', 'NULL', 249, 'Tất cả các dòng máy', '2019-01-15', 12, 'https://gomhang.vn/images/stories/virtuemart/product/sac-du-phong-remax-rp-15.jpg'),
(48, 'Sạc dự phòng Yoobao P6W 6000mAh', 'Yoobao', 'NULL', 199, 'Tất cả các dòng máy', '2019-03-14', 12, 'https://gomhang.vn/images/stories/virtuemart/product/sac-du-phong-Yoobao-P6w-6000mAh-den.jpg'),
(49, 'Sạc dự phòng nhanh Yoobao PD20 20000mAh', 'Yoobao', 'NULL', 479, 'Tất cả các dòng máy', '2019-01-17', 12, 'https://gomhang.vn/images/stories/virtuemart/product/S%E1%BA%A1c-d%E1%BB%B1-ph%C3%B2ng-Yoobao-PD20-20000mah.jpg'),
(50, 'Sạc dự phòng Yoobao P10T 10000mAh', 'Yoobao', 'NULL', 259, 'Tất cả các dòng máy', '2019-04-13', 12, 'https://gomhang.vn/images/stories/virtuemart/product/yoobao-p10t-10000.jpg'),
(51, 'Sạc dự phòng Pisen Led 10000mAh', 'Pisen', 'NULL', 449, 'Tất cả các dòng máy', '2019-06-20', 12, 'https://gomhang.vn/images/stories/virtuemart/product/S%E1%BA%A1c-d%E1%BB%B1-ph%C3%B2ng-Pisen-Led-10000-mAh.jpg'),
(52, 'Sạc dự phòng REMAX Jane Series 10000mah RPP-119', 'Remax', 'NULL', 299, 'Tất cả các dòng máy', '2019-08-19', 12, 'https://gomhang.vn/images/stories/virtuemart/product/REMAX-Jane-Series-10000mah.jpg'),
(53, 'Sạc dự phòng vỏ kim loại Yoobao A1 10000 mAh', 'Yoobao', 'NULL', 369, 'Tất cả các dòng máy', '2019-01-20', 12, 'https://gomhang.vn/images/stories/virtuemart/product/avatar2.jpg'),
(54, 'Sạc không dây Libtech BricksPower', 'NULL', 'NULL', 849, 'Tất cả các dòng máy', '2019-05-26', 12, 'https://gomhang.vn/images/stories/virtuemart/product/sac-khong-day-libtech-brickpower.jpg'),
(55, 'Sạc dự phòng Finger Pow', 'NULL', 'NULL', 1199, 'Tất cả các dòng máy', '2019-07-24', 12, 'https://gomhang.vn/images/stories/virtuemart/product/sac-du-phong-Fighter-Pow1.jpg'),
(56, 'Sạc dự phòng Remax 10000 mAh RPP-79', 'Remax', 'NULL', 519, 'Tất cả các dòng máy', '2019-02-26', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-remax-1000099.jpg'),
(57, 'Sạc dự phòng nhanh Yoobao 30W-PD 30000mAh', 'Yoobao', 'NULL', 649, 'Tất cả các dòng máy', '2019-08-21', 12, 'https://gomhang.vn/images/stories/virtuemart/product/Yoobao%2030W-PD.jpg'),
(58, 'Sac dự phòng kiêm không dây Totu 10000mah', 'Totu', 'NULL', 799, 'Tất cả các dòng máy', '2019-10-02', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava4318.jpg'),
(59, 'Sạc dự phòng Sinoele 10000 mAh', 'sinoele', 'NULL', 349, 'Tất cả các dòng máy', '2019-02-22', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava-sinoele-10000.jpg'),
(60, 'Sạc dự phòng Baseus M10', 'baseus', 'NULL', 399, 'Tất cả các dòng máy', '2019-07-08', 12, 'https://gomhang.vn/images/stories/virtuemart/product/17431.jpg'),
(61, 'Sạc dự phòng Samsung 5000 mAh chính hãng', 'SAMSUNG', 'NULL', 599, 'Điện thoại android và ios', '2019-03-19', 12, 'https://gomhang.vn/images/stories/virtuemart/product/ava394.jpg'),
(62, 'Ốp Lưng iPhone 7 Plus / 8 Plus Anker Karapax Touch', 'Wolverine', 'Nhựa cứng', 180, 'Iphone 7-8-Plus', '2019-03-31', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/c0/96/75/a38c54ab78088b9ec9d840c3eec42b61.jpg'),
(63, 'Ốp lưng dẻo iPhone XS Max Nillkin (trong suốt) ', 'OEM', 'silicon', 39, 'Iphone 6-7-8-X-Plus', '2019-06-20', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/b9/40/8c/3f1b0d4c017b3d47f101a79f96e2912f.jpg'),
(64, 'Ốp Chống Sốc Viền Màu Nắp Lưng Mờ ', 'NULL', 'nhựa mềm', 79, 'Iphone 6-7-8-X-Plus', '2019-06-06', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/91/d3/21/291149a3deadbe6dc0d1a12db59c080f.jpg'),
(65, 'Ốp Lưng Cường Lực Trong Suốt cho IPhone 11 Pro Max', 'NULL', 'glass', 200, 'Iphone 11-Pro-max', '2019-05-19', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/df/d7/2f/3e34b1da8502d4ab17dbb6db0b2448d5.jpg'),
(66, 'Ốp lưng chống sốc phát sáng cho điện thoại iPhone 11/ iPhone 11 Pro/ iPhone 11 Pro Max', 'NULL', 'glass', 129, 'Iphone 6-7-8-X-Plus', '2910-05-09', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/38/dc/64/9c52fa77ca57150d343157bd0a670fb4.jpg'),
(67, 'Ốp lưng Memumi cho iPhone 11 Pro Max 6.5 siêu mỏng 0.3 mm (xanh rêu)', 'NULL', 'glass', 59, 'Iphone 6-7-8-X-Plus', '2019-05-30', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/1a/46/fe/7d7aad58c13a032811ed896591a52c65.jpg'),
(68, 'Ốp lưng da cao cấp dành cho iPhone X và iPhone XS', 'NULL', 'da', 60, 'Iphone 6-7-8-X-Plus', '2019-06-08', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/a6/e8/11/07215f28c4a67112f3f26b938ccbf710.jpg'),
(69, 'Ốp lưng Memumi siêu mỏng 0.3 mm cho iPhone XS Max', 'NULL', 'silicon', 99, 'Iphone 6-7-8-X-Plus', '2019-05-01', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/80/8b/8f/cb681debd613c1157e609263a830163c.jpg'),
(70, 'ỐP LƯNG DẺO TRONG SUỐT CHO IPHONE X', 'NULL', 'nhựa', 159, 'Iphone X-Plus', '2019-03-02', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/b8/47/57/18123de57a3306f2606e996727d02305.jpg'),
(71, 'Ốp lưng chống sốc cho Iphone 6 Plus / 6s Plus', 'NULL', 'nhựa mềm', 79, 'Iphone 6-Plus', '2019-08-01', 12, 'https://salt.tikicdn.com/cache/w1200/ts/product/9b/0c/35/65fdc092dc15c43643e7d007fc67db7d.jpg'),
(72, 'Loa Bluetooth W-King X3', 'W-King X3', 'Nhựa cứng', 650, 'smart phone', '2019-08-01', 12, 'https://i.imgur.com/6g7aLXd.png'),
(73, 'Ốp lưng iPad Air 2019 Nắp gập Stand Flip MEEKER Navy', 'Apple', 'Da', 210, 'iPad', '2019-09-15', 6, 'https://i.imgur.com/2RuqFZX.jpg'),
(74, 'Củ sạc nhanh Remax RP-U46', 'Remax', 'Nhựa cứng', 300, 'smart phone', '2019-08-30', 6, 'https://i.imgur.com/fyPmKHM.png'),
(75, 'Miếng dán màn hình Oppo A5', 'Oppo', 'Nhựa cứng', 50, 'Oppo A5', '2019-03-19', 6, 'https://i.imgur.com/PZ2ckMG.jpg'),
(76, 'Miếng dán lưng iPhone 11', 'Apple', 'Nhựa cứng', 50, 'Iphone 11', '2019-08-15', 6, 'https://i.imgur.com/uS9fbLd.jpg'),
(77, 'Loa Bluetooth chống nước Vidvie SP901', 'Vidvie', 'Nhựa cứng', 630, 'Smart phone', '2020-01-03', 18, 'https://i.imgur.com/gcpPG2y.jpg'),
(78, 'Miếng dán màn hình Galaxy Note 10', 'Galaxy', 'Nhựa cứng', 50, 'Galaxy Note 10', '2019-10-13', 6, 'https://i.imgur.com/glbNkO7.jpg'),
(79, 'Củ sạc 4 cổng USB Remax RP-U43', 'Remax', 'Nhựa cứng', 250, 'Smart phone', '2019-11-20', 12, 'https://i.imgur.com/eOkP17b.jpg'),
(80, 'Tai nghe Bluetooth Mozard S205A Xanh', 'Mozard', 'Nhựa dẻo', 229, 'Smart phone', '2019-10-16', 12, 'https://i.imgur.com/5VoOpBG.jpg'),
(81, 'Cáp 3 đầu Lightning Type C Micro 1m eValu Spanker B Xanh Biển', 'NULL', 'Nhựa dẻo', 200, 'Smart phone', '2019-11-15', 12, 'https://i.imgur.com/uqu1nbM.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE [bill]
  ADD PRIMARY KEY ([id]),
  ADD KEY `fk_id_customer` ([id_customer]);

--
-- Indexes for table `bill_item`
--
ALTER TABLE [bill_item]
  ADD PRIMARY KEY ([id]),
  ADD KEY `fk_id_bill` ([id_bill]),
  ADD KEY `fk_id_product` ([id_product]);

--
-- Indexes for table `customer`
--
ALTER TABLE [customer]
  ADD PRIMARY KEY ([id],[email]);

--
-- Indexes for table `product`
--
ALTER TABLE [product]
  ADD PRIMARY KEY ([id]);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE [bill]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_item`
--
ALTER TABLE [bill_item]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE [customer]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE [product]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE [bill]
  ADD CONSTRAINT [fk_id_customer] FOREIGN KEY ([id_customer]) REFERENCES customer ([id]);

--
-- Constraints for table `bill_item`
--
ALTER TABLE [bill_item]
  ADD CONSTRAINT [fk_id_bill] FOREIGN KEY ([id_bill]) REFERENCES bill ([id]),
  ADD CONSTRAINT [fk_id_product] FOREIGN KEY ([id_product]) REFERENCES `product` ([id]);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
