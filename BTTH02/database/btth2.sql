-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 25 Mai 2023 à 17:48
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `btth2`
--

-- --------------------------------------------------------

--
-- Structure de la table `bao_cao`
--

CREATE TABLE `bao_cao` (
  `ID_bao_cao` int(11) NOT NULL,
  `ID_khoa_hoc` int(11) DEFAULT NULL,
  `ID_sinh_vien` int(11) DEFAULT NULL,
  `So_lieu_thong_ke` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `giang_vien`
--

CREATE TABLE `giang_vien` (
  `ID_giang_vien` int(11) NOT NULL,
  `Ten_giang_vien` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Thong_tin_lien_he` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `giang_vien`
--

INSERT INTO `giang_vien` (`ID_giang_vien`, `Ten_giang_vien`, `Email`, `Thong_tin_lien_he`) VALUES
(1, 'Le Van X', 'levanx@gmail.com', '0912345678'),
(2, 'Pham Thi Y', 'phamthiy@gmail.com', '0987654321');

-- --------------------------------------------------------

--
-- Structure de la table `khoa_hoc`
--

CREATE TABLE `khoa_hoc` (
  `ID_khoa_hoc` int(11) NOT NULL,
  `Ma_khoa_hoc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tieu_de` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mo_ta` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `khoa_hoc`
--

INSERT INTO `khoa_hoc` (`ID_khoa_hoc`, `Ma_khoa_hoc`, `Tieu_de`, `Mo_ta`) VALUES
(1, NULL, 'Toan cao cap', 'Khoa hoc ve toan co ban'),
(2, NULL, 'Lap trinh C++', 'Khoa hoc ve lap trinh C++');

-- --------------------------------------------------------

--
-- Structure de la table `lop_hoc_phan`
--

CREATE TABLE `lop_hoc_phan` (
  `ID_lop_hoc_phan` int(11) NOT NULL,
  `ID_khoa_hoc` int(11) DEFAULT NULL,
  `ID_giang_vien` int(11) DEFAULT NULL,
  `Khoang_thoi_gian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `lop_hoc_phan`
--

INSERT INTO `lop_hoc_phan` (`ID_lop_hoc_phan`, `ID_khoa_hoc`, `ID_giang_vien`, `Khoang_thoi_gian`) VALUES
(1, 1, 1, 'Thứ 2, 8:00 - 10:00'),
(2, 2, 2, 'Thứ 3, 10:00 - 12:00');

-- --------------------------------------------------------

--
-- Structure de la table `sinh_vien`
--

CREATE TABLE `sinh_vien` (
  `ID_sinh_vien` int(11) NOT NULL,
  `Ten_sinh_vien` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ngay_sinh` date DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Thong_tin_lien_he` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `sinh_vien`
--

INSERT INTO `sinh_vien` (`ID_sinh_vien`, `Ten_sinh_vien`, `Ngay_sinh`, `Email`, `Thong_tin_lien_he`) VALUES
(1, 'Nguyen Van A', '1990-01-01', 'nguyenvana@gmail.com', '0987654321'),
(2, 'Tran Thi B', '1992-05-10', 'tranthib@gmail.com', '0123456789');

-- --------------------------------------------------------

--
-- Structure de la table `su_tham_du`
--

CREATE TABLE `su_tham_du` (
  `Ngay` date DEFAULT NULL,
  `ID_lop_hoc_phan` int(11) NOT NULL,
  `ID_sinh_vien` int(11) NOT NULL,
  `Trang_thai_tham_du` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `su_tham_du`
--

INSERT INTO `su_tham_du` (`Ngay`, `ID_lop_hoc_phan`, `ID_sinh_vien`, `Trang_thai_tham_du`) VALUES
('2023-05-01', 1, 1, 'Co mat'),
('2023-05-02', 1, 2, 'Co mat'),
('2023-05-01', 2, 1, 'Vang mat');

-- --------------------------------------------------------

--
-- Structure de la table `xac_thuc_uy_quyen`
--

CREATE TABLE `xac_thuc_uy_quyen` (
  `ID_nguoi_dung` int(11) NOT NULL,
  `Ten_Dang_Nhap` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mat_Khau` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vai_Tro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `xac_thuc_uy_quyen`
--

INSERT INTO `xac_thuc_uy_quyen` (`ID_nguoi_dung`, `Ten_Dang_Nhap`, `Mat_Khau`, `Vai_Tro`) VALUES
(1, 'admin', 'admin123', 'Phong dao tao'),
(2, 'teacher', 'teacher123', 'Giang vien');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD PRIMARY KEY (`ID_bao_cao`),
  ADD KEY `ID_khoa_hoc` (`ID_khoa_hoc`),
  ADD KEY `ID_sinh_vien` (`ID_sinh_vien`);

--
-- Index pour la table `giang_vien`
--
ALTER TABLE `giang_vien`
  ADD PRIMARY KEY (`ID_giang_vien`);

--
-- Index pour la table `khoa_hoc`
--
ALTER TABLE `khoa_hoc`
  ADD PRIMARY KEY (`ID_khoa_hoc`);

--
-- Index pour la table `lop_hoc_phan`
--
ALTER TABLE `lop_hoc_phan`
  ADD PRIMARY KEY (`ID_lop_hoc_phan`),
  ADD KEY `ID_khoa_hoc` (`ID_khoa_hoc`),
  ADD KEY `ID_giang_vien` (`ID_giang_vien`);

--
-- Index pour la table `sinh_vien`
--
ALTER TABLE `sinh_vien`
  ADD PRIMARY KEY (`ID_sinh_vien`);

--
-- Index pour la table `su_tham_du`
--
ALTER TABLE `su_tham_du`
  ADD PRIMARY KEY (`ID_lop_hoc_phan`,`ID_sinh_vien`),
  ADD KEY `ID_sinh_vien` (`ID_sinh_vien`);

--
-- Index pour la table `xac_thuc_uy_quyen`
--
ALTER TABLE `xac_thuc_uy_quyen`
  ADD PRIMARY KEY (`ID_nguoi_dung`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bao_cao`
--
ALTER TABLE `bao_cao`
  MODIFY `ID_bao_cao` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD CONSTRAINT `bao_cao_ibfk_1` FOREIGN KEY (`ID_khoa_hoc`) REFERENCES `khoa_hoc` (`ID_khoa_hoc`),
  ADD CONSTRAINT `bao_cao_ibfk_2` FOREIGN KEY (`ID_sinh_vien`) REFERENCES `sinh_vien` (`ID_sinh_vien`);

--
-- Contraintes pour la table `lop_hoc_phan`
--
ALTER TABLE `lop_hoc_phan`
  ADD CONSTRAINT `lop_hoc_phan_ibfk_1` FOREIGN KEY (`ID_khoa_hoc`) REFERENCES `khoa_hoc` (`ID_khoa_hoc`),
  ADD CONSTRAINT `lop_hoc_phan_ibfk_2` FOREIGN KEY (`ID_giang_vien`) REFERENCES `giang_vien` (`ID_giang_vien`);

--
-- Contraintes pour la table `su_tham_du`
--
ALTER TABLE `su_tham_du`
  ADD CONSTRAINT `su_tham_du_ibfk_1` FOREIGN KEY (`ID_lop_hoc_phan`) REFERENCES `lop_hoc_phan` (`ID_lop_hoc_phan`),
  ADD CONSTRAINT `su_tham_du_ibfk_2` FOREIGN KEY (`ID_sinh_vien`) REFERENCES `sinh_vien` (`ID_sinh_vien`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
