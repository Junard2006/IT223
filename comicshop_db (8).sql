-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2026 at 06:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comicshop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comic`
--

CREATE TABLE `comic` (
  `comic_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `comic_title` varchar(100) NOT NULL,
  `comic_description` text DEFAULT NULL,
  `comic_stock` int(11) NOT NULL,
  `comic_price` decimal(6,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comic`
--

INSERT INTO `comic` (`comic_id`, `genre_id`, `comic_title`, `comic_description`, `comic_stock`, `comic_price`, `created_at`) VALUES
(1, 1, 'Young Romance', 'The first dedicated romance comic, featuring stories about relationships and love.', 50, 2500.00, '2026-02-04 13:53:44'),
(2, 5, 'Stay Awake', 'A romantic comic/story about Agatha, a girl with a rare sleeping disorder, and a boy determined to keep her awake, focusing on their \"ill-fated love.', 35, 550.75, '2026-02-05 01:51:18'),
(3, 4, 'Batman', 'Batman is a comic book hero from Gotham City who fights crime without superpowers, using his intelligence, combat skills, and advanced gadgets.', 2, 199.50, '2026-02-05 09:16:02'),
(21, 2, 'The Fade Out', 'Set in 1940s Hollywood, it follows a screenwriter who becomes entangled in a mysterious murder, uncovering secrets, corruption, and the dark side of the film industry.', 45, 600.40, '2026-02-05 11:14:36'),
(22, 3, 'Elfquest', 'Follow the adventures of different elf tribes living in a prehistoric world, exploring themes of survival, identity, and love.', 23, 455.31, '2026-02-05 11:14:36'),
(23, 4, 'X-Men', 'A superhero comic series about a group of mutants born with special powers', 16, 250.00, '2026-02-05 11:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `gender`, `address`, `email`, `created_at`) VALUES
(1, 'Crisanna Boca', 'Female', 'Prk. Chico, Brgy. Sto. Nino, Panabo City', 'bocacrisanna0@gmail.com', '2026-02-04 13:45:23'),
(2, 'Cupcake', 'Female', 'Purok 1, Brgy. Tibungol, Panabo City', 'cupcake@gmail.com', '2026-02-05 06:27:40'),
(3, 'Prince Jerald Andam', 'Male', 'Brgy. Gredu, Panabo City', 'princeandm9@gmail.com', '2026-02-05 11:22:58'),
(4, 'Junard Castroverde', 'Male', 'Checkerd Brgy. Tibungol, Panabo City', 'junardc56@gmail.com', '2026-02-05 11:22:58'),
(5, 'Princess Mae', 'Female', NULL, 'princessxd@gmail.com', '2026-02-05 11:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(100) NOT NULL,
  `genre_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`, `genre_description`) VALUES
(1, 'Romance', 'Stories about love, relationships, and heartfelt moments.'),
(2, 'Mystery', 'Puzzles and detective adventures to solve.'),
(3, 'Fantasy', 'Tales with magic, mythical creatures, and imaginary worlds.'),
(4, 'Action', 'Fast-paced stories with battles, heroes, and daring quests.'),
(5, 'Horror', 'Scary and thrilling stories that give chills.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comic`
--
ALTER TABLE `comic`
  ADD PRIMARY KEY (`comic_id`),
  ADD UNIQUE KEY `comic_title` (`comic_title`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comic`
--
ALTER TABLE `comic`
  MODIFY `comic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comic`
--
ALTER TABLE `comic`
  ADD CONSTRAINT `comic_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
