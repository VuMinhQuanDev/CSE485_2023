-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 30 Mai 2023 à 16:29
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cse485`
--

-- --------------------------------------------------------

--
-- Structure de la table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `is_absent` tinyint(1) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `attendance`
--

INSERT INTO `attendance` (`id`, `course_id`, `student_id`, `is_absent`, `date`, `class_id`) VALUES
(1, 1, 1, 0, '2023-05-16', 1),
(2, 1, 2, 0, '2023-05-16', 1),
(3, 1, 3, 0, '2023-05-16', 1),
(4, 1, 4, 0, '2023-05-16', 1),
(5, 1, 1, 0, '2023-05-18', 1),
(6, 1, 1, 0, '2023-05-20', 1),
(7, 1, 1, 0, '2023-05-21', 1),
(8, 1, 1, 0, '2023-05-29', 1),
(9, 1, 1, 0, '2023-05-29', 1),
(10, 1, 3, 0, '2023-05-30', 1),
(11, 1, 3, 0, '2023-05-30', 1),
(12, 1, 3, 0, '2023-05-30', 1),
(13, 1, 3, 0, '2023-05-30', 1),
(14, 1, 3, 0, '2023-05-30', 1),
(15, 1, 3, 0, '2023-05-30', 1),
(16, 1, 3, 0, '2023-05-30', 1),
(17, 1, 3, 0, '2023-05-30', 1),
(18, 1, 3, 0, '2023-05-30', 1);

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `semester` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `classes`
--

INSERT INTO `classes` (`id`, `course_id`, `name`, `date_start`, `date_end`, `semester`) VALUES
(1, 1, '61PM1', '2023-04-17', '2023-06-18', 2),
(2, 1, '61THVA', '2023-04-17', '2023-06-18', 2),
(3, 2, '61CNTT', '2023-04-17', '2023-06-18', 2),
(4, 3, '61HTTT', '2023-02-15', '2023-06-18', 1);

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`) VALUES
(1, 'Web', 'lap trinh php co ban de tao ra website,app'),
(2, 'Hoc may', 'nghien cuu cac giai thuat,chien luoc bang nhung ngon ngu co ban: Phython'),
(3, 'Lap trinh phan tan', 'Tu duy lap trinh c++');

-- --------------------------------------------------------

--
-- Structure de la table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contact` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `lecturers`
--

INSERT INTO `lecturers` (`id`, `name`, `user_id`, `contact`) VALUES
(0, 'Kiều Tuấn Dũng', 1, '09615828821');

-- --------------------------------------------------------

--
-- Structure de la table `lecture_classes`
--

CREATE TABLE `lecture_classes` (
  `id` int(16) NOT NULL,
  `lecture_id` int(16) NOT NULL,
  `class_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `lecture_classes`
--

INSERT INTO `lecture_classes` (`id`, `lecture_id`, `class_id`) VALUES
(0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birth` date NOT NULL,
  `contact` varchar(100) NOT NULL,
  `user_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `students`
--

INSERT INTO `students` (`id`, `name`, `birth`, `contact`, `user_id`) VALUES
(1, 'Vu Thi Lan', '2023-05-01', '09752739273', 2),
(2, 'Vu Minh Hieu', '2023-05-17', '097153762963', 3),
(3, 'Ha Tuan Kien', '2023-05-22', '01628526222', 4),
(4, 'Dinh Van Nam', '2023-05-27', '0962852611', 5);

-- --------------------------------------------------------

--
-- Structure de la table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `student_classes`
--

INSERT INTO `student_classes` (`id`, `class_id`, `student_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`) VALUES
(1, 'lanvuthi@gmail.com', 'lanvuthi', 2),
(2, 'lanlankk135@gmail.com', 'lanlan', 3),
(3, 'tuantrung@e.tlu.edu.vn', 'tuantrung', 3),
(4, 'hamanhdat@gmail.com', 'hamanhdat', 3),
(5, 'dinhtungduy@gmail.com', 'dinhtungduy', 3);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attendance_courses` (`course_id`),
  ADD KEY `fk_attendance_student` (`student_id`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_classes_courses` (`course_id`);

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `lecture_classes`
--
ALTER TABLE `lecture_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_id` (`lecture_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_classes_ibfk_1` (`class_id`),
  ADD KEY `student_classes_ibfk_2` (`student_id`);

--
-- Index pour la table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `fk_attendance_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Contraintes pour la table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_classes_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Contraintes pour la table `lecturers`
--
ALTER TABLE `lecturers`
  ADD CONSTRAINT `lecturers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `lecture_classes`
--
ALTER TABLE `lecture_classes`
  ADD CONSTRAINT `lecture_classes_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lecturers` (`id`),
  ADD CONSTRAINT `lecture_classes_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Contraintes pour la table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `student_classes`
--
ALTER TABLE `student_classes`
  ADD CONSTRAINT `student_classes_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `student_classes_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Contraintes pour la table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
