-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 27, 2021 lúc 08:07 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nlcs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(6) NOT NULL,
  `time` datetime NOT NULL,
  `empaccount` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `time`, `empaccount`, `total`) VALUES
(0, '2019-10-30 07:10:47', 'quoc187', 156000),
(1, '2019-10-30 07:10:01', 'quoc187', 457000),
(2, '2019-10-30 07:10:13', 'quoc187', 952000),
(3, '2019-10-31 10:10:16', 'quoc187', 58000),
(4, '2021-05-25 03:05:43', 'quoc187', 29000),
(5, '2021-05-25 09:05:55', 'quoc187', 29000),
(6, '2021-05-25 09:05:40', 'quoc187', 58000),
(7, '2021-05-25 09:05:14', 'quoc187', 195000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_bill`
--

CREATE TABLE `detail_bill` (
  `id` int(4) NOT NULL,
  `product` varchar(50) NOT NULL,
  `quantity` int(6) NOT NULL,
  `total` float NOT NULL,
  `id_product` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `detail_bill`
--

INSERT INTO `detail_bill` (`id`, `product`, `quantity`, `total`, `id_product`) VALUES
(5, 'Cafe Đen', 1, 29000, 3),
(6, 'Bánh chocolate', 2, 58000, 39),
(7, 'Bạc sửu', 5, 145000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_import`
--

CREATE TABLE `detail_import` (
  `id` int(4) NOT NULL,
  `id_employee` int(4) UNSIGNED NOT NULL,
  `id_supplier` int(4) UNSIGNED NOT NULL,
  `id_warehouse` int(4) UNSIGNED NOT NULL,
  `quantity` float NOT NULL,
  `unit` varchar(10) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `id` int(4) UNSIGNED NOT NULL,
  `fullname` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `account` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_vietnamese_ci NOT NULL,
  `id_num` varchar(13) COLLATE utf8_vietnamese_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `job` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL,
  `start` varchar(15) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `user_group` varchar(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `shiftSalary` int(11) NOT NULL DEFAULT 100000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `fullname`, `account`, `password`, `id_num`, `address`, `phone`, `job`, `start`, `user_group`, `shiftSalary`) VALUES
(1, 'Nguyễn Trọng Quốc', 'quoc187', '7c4a8d09ca3762af61e59520943dc26494f8941b', '331800117', 'Cau Giay, Ha Noi', '0868442808', 'Quản lý', '2018', 'admin', 100000),
(2, 'Hoàng Ngọc Huyền', 'huyen', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123456789', 'Modified', '0859711330', 'Chế biến', '2018', '', 100000),
(3, 'Nguyễn Trọng Khang', 'khangnguyen', 'c863bacbc71869fc68a88d11b1f8c6d3b2f42ca9', '987654321', 'Cau Giay, Ha Noi', '0323233232', 'Phục vụ', '2018', '', 100000),
(4, 'Đỗ Minh Khôi', 'khoitran', 'cae1b52d0ab8b788a944a94be70dedffa876bd61', '123654987', 'Cau Giay, Ha Noi', '0392959702', 'Phục vụ', '2018', NULL, 100000),
(5, 'Nguyễn Mạnh Khâm', 'khamnguyen', '5f79460e4f906c045759e7bb5580b62aceb2cc85', '123456987', 'Cau Giay, Ha Noi', '0356879141', 'Chế biến', '2018', NULL, 100000),
(6, 'Nguyễn Minh Thuật', 'thuatnguyen', '4aa49a57b3c11757e7e391f52347572bb837597f', '321456987', 'Cau Giay, Ha Noi', '0929090507', 'Phục vụ', '2018', NULL, 100000),
(7, 'Nguyễn Đức Duy', 'duyho', '00fb8183479aed9947aebded28b36c57de7eb16b', '321546789', 'Cau Giay, Ha Noi', '0929262646', 'Phục vụ', '2018', NULL, 100000),
(8, 'Trần Văn Tường', 'tuongtran', 'e03a3b0df7ef2aa513131811010f32f66cfa8e06', '312645978', 'Cau Giay, Ha Noi', '0907047617', 'Order', '2018', 'order', 100000),
(11, 'Lê Thanh Lương', 'luongle', 'aa93e733a85dcd3e134fca45d926427e19a05afb', '121345648', 'Cau Giay, Ha Noi', '0824521572', 'Order', '2018', 'order', 100000),
(14, 'Trần Sơn Đạt', 'dattran', 'fbd0b9c3677241899bad77be49dcbb69471a7ef5', '226444232', 'Cau Giay, Ha Noi', '0254545444', 'Chế biến', '2018', '', 100000),
(17, 'Test Name', 'test', '123456', '2132332323222', 'tes EQWE', '0123456789', 'Order', '2021', 'order', 100000),
(18, 'Teller Jax', 'tesss', '7c4a8d09ca3762af61e59520943dc26494f8941b', '323323232', '3101 24TH ST SAN FRANCISCO CA94110', '0123456763', 'Phục vụ', '2019', '', 100000),
(20, 'Teller Jax', 'quoctes', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123321123', '3101 24TH ST SAN FRANCISCO CA94110', '0378946889', 'Phục vụ', '2010', '', 32313);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `species` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `price` int(11) NOT NULL,
  `thumb_img` varchar(200) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `species`, `price`, `thumb_img`) VALUES
(1, 'Americano', 'Cafe', 39000, 'https://i.ibb.co/qCdrfrx/americano.jpg'),
(2, 'Bạc sửu', 'Cafe', 29000, 'https://i.ibb.co/68jX7RR/bacsiu.jpg'),
(3, 'Cafe Đen', 'Cafe', 29000, 'https://i.ibb.co/2sWP63x/image.png'),
(4, 'Cafe Sữa', 'Cafe', 29000, 'https://i.ibb.co/ZcnDDq7/image.png'),
(5, 'Cappucinno', 'Cafe', 45000, 'https://i.ibb.co/C2ccwyG/capuchino.jpg'),
(6, 'Caramel Macchiato', 'Cafe', 55000, 'https://i.ibb.co/DRr17Wj/image.png'),
(7, 'Cold brew cam sả', 'Cafe', 45000, 'https://i.ibb.co/jkvS02Y/coldbrew-camsa.jpg'),
(8, 'Cold brew phúc bồn tử', 'Cafe', 50000, 'https://i.ibb.co/q19ytJx/coldbrew-phuc-bon-tu.jpg'),
(9, 'Cold brew sữa tươi', 'Cafe', 50000, 'https://i.ibb.co/C6rF7N0/coldbrew-sua-tuoi.jpg'),
(10, 'Cold brew sữa tươi macchiatio', 'Cafe', 50000, 'https://i.ibb.co/JyNLPYt/image.png'),
(11, 'Cold brew truyền thống', 'Cafe', 45000, 'https://i.ibb.co/Kbq9R8f/coldbrew-truyenthong.jpg'),
(12, 'Espresso', 'Cafe', 35000, 'https://i.ibb.co/68XrBw3/espresso.jpg'),
(13, 'Latte', 'Cafe', 45000, 'https://i.ibb.co/4mcT6Vb/latte.jpg'),
(16, 'Mocha', 'Cafe', 49000, 'https://i.ibb.co/X454PBs/mocha.jpg'),
(17, 'Chocolate Đá', 'Cafe', 55000, 'https://i.ibb.co/71cTDdV/chocolate-da-xay.jpg'),
(18, 'Trà  cherry macchiato', 'Trà  & Macchiato', 55000, 'https://i.ibb.co/RSL5P0B/cherry-machiato.jpg'),
(19, 'Trà đào cam sả', 'Trà  & Macchiato', 45000, 'https://i.ibb.co/vYBGL5h/tra-dao-cam-sa.jpg'),
(20, 'Trà đen macchiato', 'Trà  & Macchiato', 42000, 'https://i.ibb.co/hmbDjhb/tra-den-machiato.jpg'),
(21, 'Trà gạo rang macchiato', 'Trà  & Macchiato', 48000, 'https://product.hstatic.net/1000075078/product/genmaicha_macchiatov_large.jpg'),
(22, 'Trà  matcha latte', 'Trà  & Macchiato', 59000, 'https://i.ibb.co/Wc4C30f/matcha-latte.jpg'),
(23, 'Trà  matcha macchiato', 'Trà  & Macchiato', 45000, 'https://i.ibb.co/4dRpsdb/matcha-macchiato.jpg'),
(24, 'Trà  oolong sen', 'Trà  & Macchiato', 45000, 'https://i.ibb.co/ZT9K0YW/olong-sen.jpg'),
(25, 'Trà oolong vải như ý', 'Trà  & Macchiato', 45000, 'https://i.ibb.co/HGDXFWQ/olong-vai-nhu-y.jpg'),
(26, 'Trà phúc bồn tử', 'Trà  & Macchiato', 49000, 'https://i.ibb.co/Bqq3KBn/tra-phuc-bon-tu.jpg'),
(27, 'Trà xoài macchiato', 'Trà  & Macchiato', 55000, 'https://i.ibb.co/FVpSm0C/tra-xoai-macchiato.jpg'),
(29, 'Chanh sả đá xay', 'Thức uống đá xay', 49000, 'https://i.ibb.co/cw6xRrj/chanh-sa-da-xay.jpg'),
(30, 'Chocolate đá xay', 'Thức uống đá xay', 59000, 'https://i.ibb.co/71cTDdV/chocolate-da-xay.jpg'),
(31, 'Cookies đá xay', 'Thức uống đá xay', 59000, 'https://i.ibb.co/54yrh8L/cookie-da-xay.jpg'),
(32, 'Đào việt quất đá xay', 'Thức uống đá xay', 59000, 'https://i.ibb.co/wRng3rG/dao-viet-quat-xay.jpg'),
(33, 'Matcha đá xay', 'Thức uống đá xay', 59000, 'https://i.ibb.co/Tq0mky0/matcha-da-xay.jpg'),
(35, 'Phúc bồn tử cam đá xay', 'Thức uống đá xay', 59000, 'https://i.ibb.co/cC0LZKm/phuc-bon-tu-cam-xay.jpg'),
(36, 'Sinh tố cam xoài', 'Thức uống trái cây', 59000, 'https://i.ibb.co/HGmthdF/sinh-to-cam-xoai.jpg'),
(37, 'Sinh tố việt quất', 'Thức uống trái cây', 59000, 'https://i.ibb.co/w6zP6B1/sinh-to-viet-quat.jpg'),
(38, 'Bánh bông lan trứng muối', 'Bánh & Snack', 29000, 'https://i.ibb.co/Nr7XDLD/image.png'),
(39, 'Bánh chocolate', 'Bánh & Snack', 29000, 'https://product.hstatic.net/1000075078/product/choco_1x1_4faf8c80e6604cad88ce30528e2bd409_large.jpg'),
(40, 'Bánh Croissant', 'Bánh & Snack', 29000, 'https://product.hstatic.net/1000075078/product/sungtrau_1x1_0e9a3e2590794cb9a6ff7ad9d9562c25_large.jpg'),
(41, 'Bánh gấu Chocolate', 'Bánh & Snack', 39000, 'https://i.ibb.co/LRgDyvz/image.png'),
(42, 'Bánh matcha', 'Bánh & Snack', 29000, 'https://i.ibb.co/2ZZ4k1s/image.png'),
(43, 'Bánh mì chà bông phô mai', 'Bánh & Snack', 32000, 'https://i.ibb.co/vH19mV5/banh-pho-mai-tra-xanh.jpg'),
(44, 'Bánh passion cheese', 'Bánh & Snack', 29000, 'https://i.ibb.co/7J0fm05/image.png'),
(45, 'Bánh tiramisu', 'Bánh & Snack', 29000, 'https://i.ibb.co/2W9Vc4B/image.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shifts`
--

CREATE TABLE `shifts` (
  `id` int(6) UNSIGNED NOT NULL,
  `shiftName` varchar(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `dayOfShift` varchar(10) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `empAccount` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL,
  `salaryOfShift` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `shifts`
--

INSERT INTO `shifts` (`id`, `shiftName`, `dayOfShift`, `empAccount`, `salaryOfShift`) VALUES
(103, '3', '5', 'huyen', 100000),
(104, '4', '5', 'huyen', 100000),
(105, '3', '6', 'huyen', 100000),
(106, '4', '6', 'huyen', 100000),
(107, '3', '7', 'huyen', 100000),
(108, '4', '7', 'huyen', 100000),
(109, '1', '2', 'tuongtran', 100000),
(110, '2', '2', 'tuongtran', 100000),
(111, '1', '3', 'tuongtran', 100000),
(112, '2', '3', 'tuongtran', 100000),
(113, '1', '4', 'tuongtran', 100000),
(114, '2', '4', 'tuongtran', 100000),
(115, '1', '5', 'tuongtran', 100000),
(116, '2', '5', 'tuongtran', 100000),
(117, '1', '6', 'tuongtran', 100000),
(118, '2', '6', 'tuongtran', 100000),
(119, '1', '7', 'tuongtran', 100000),
(120, '2', '7', 'tuongtran', 100000),
(121, '1', '8', 'tuongtran', 100000),
(122, '2', '8', 'tuongtran', 100000),
(123, '3', '2', 'luongle', 100000),
(124, '4', '2', 'luongle', 100000),
(125, '3', '3', 'luongle', 100000),
(126, '4', '3', 'luongle', 100000),
(127, '3', '4', 'luongle', 100000),
(128, '4', '4', 'luongle', 100000),
(129, '3', '5', 'luongle', 100000),
(130, '4', '5', 'luongle', 100000),
(131, '3', '6', 'luongle', 100000),
(132, '4', '6', 'luongle', 100000),
(133, '3', '7', 'luongle', 100000),
(134, '4', '7', 'luongle', 100000),
(135, '3', '8', 'luongle', 100000),
(136, '4', '8', 'luongle', 100000),
(137, '1', '5', 'khamnguyen', 100000),
(138, '2', '5', 'khamnguyen', 100000),
(139, '1', '6', 'khamnguyen', 100000),
(140, '2', '6', 'khamnguyen', 100000),
(141, '1', '7', 'khamnguyen', 100000),
(142, '2', '7', 'khamnguyen', 100000),
(143, '3', '2', 'khamnguyen', 100000),
(144, '4', '2', 'khamnguyen', 100000),
(145, '3', '3', 'khamnguyen', 100000),
(146, '4', '3', 'khamnguyen', 100000),
(147, '3', '4', 'khamnguyen', 100000),
(148, '4', '4', 'khamnguyen', 100000),
(149, '1', '8', 'dattran', 100000),
(150, '2', '8', 'dattran', 100000),
(151, '3', '8', 'dattran', 100000),
(152, '4', '8', 'dattran', 100000),
(153, '1', '2', 'khangnguyen', 100000),
(154, '2', '2', 'khangnguyen', 100000),
(155, '3', '2', 'khangnguyen', 100000),
(156, '4', '2', 'khangnguyen', 100000),
(157, '1', '4', 'khangnguyen', 100000),
(158, '2', '4', 'khangnguyen', 100000),
(159, '3', '4', 'khangnguyen', 100000),
(160, '4', '4', 'khangnguyen', 100000),
(161, '1', '6', 'khangnguyen', 100000),
(162, '2', '6', 'khangnguyen', 100000),
(163, '3', '6', 'khangnguyen', 100000),
(164, '4', '6', 'khangnguyen', 100000),
(165, '1', '8', 'khangnguyen', 100000),
(166, '2', '8', 'khangnguyen', 100000),
(167, '3', '8', 'khangnguyen', 100000),
(168, '4', '8', 'khangnguyen', 100000),
(169, '1', '3', 'khoitran', 100000),
(170, '2', '3', 'khoitran', 100000),
(171, '3', '3', 'khoitran', 100000),
(172, '4', '3', 'khoitran', 100000),
(173, '1', '5', 'khoitran', 100000),
(174, '2', '5', 'khoitran', 100000),
(175, '3', '5', 'khoitran', 100000),
(176, '4', '5', 'khoitran', 100000),
(177, '1', '7', 'khoitran', 100000),
(178, '2', '7', 'khoitran', 100000),
(179, '3', '7', 'khoitran', 100000),
(180, '4', '7', 'khoitran', 100000),
(181, '1', '2', 'huyen', 100000),
(182, '1', '3', 'huyen', 100000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `id` int(4) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `phone`, `address`) VALUES
(0, 'Công ty Trọng Quốc', '0378946889', '888 đường Láng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(4) UNSIGNED NOT NULL,
  `material` varchar(20) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `remain` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `warehouse`
--

INSERT INTO `warehouse` (`id`, `material`, `unit`, `remain`) VALUES
(1, 'Cafe', 'kg', '30'),
(2, 'Cafe', 'kg', '40');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empaccount` (`empaccount`);

--
-- Chỉ mục cho bảng `detail_bill`
--
ALTER TABLE `detail_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_bill_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `detail_import`
--
ALTER TABLE `detail_import`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `detail_import_ibfk_2` (`id_supplier`),
  ADD KEY `id_warehouse` (`id_warehouse`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account` (`account`),
  ADD KEY `account_2` (`account`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empAccount` (`empAccount`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `detail_bill`
--
ALTER TABLE `detail_bill`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `detail_import`
--
ALTER TABLE `detail_import`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT cho bảng `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`empaccount`) REFERENCES `employees` (`account`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `detail_bill`
--
ALTER TABLE `detail_bill`
  ADD CONSTRAINT `detail_bill_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_bill_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `detail_import`
--
ALTER TABLE `detail_import`
  ADD CONSTRAINT `detail_import_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_import_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_import_ibfk_3` FOREIGN KEY (`id_warehouse`) REFERENCES `warehouse` (`id`);

--
-- Các ràng buộc cho bảng `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`empAccount`) REFERENCES `employees` (`account`) ON DELETE NO ACTION ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
