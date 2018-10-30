-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2018 at 03:37 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `fooditem`
--

CREATE TABLE `fooditem` (
  `id` int(11) NOT NULL,
  `finame` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditem`
--

INSERT INTO `fooditem` (`id`, `finame`, `price`, `quantity`, `description`) VALUES
(1, 'Jollof', 500, 27429, 'none'),
(2, 'puncheaon', 2000, 33, 'mdcz cz,xnczx,'),
(7, 'Sundau', 2000, 200, 'asklaj ldjakd jaklsd'),
(8, 'Adenine', 35.3, 20, 'jaskldj akdjakl dja dsla'),
(9, 'Adennas', 2000, 20, 'jaskldj akdjakl dja dsla'),
(10, 'klasdjaksd', 3000, 45, 'kjfks jfs flskjdkls'),
(11, 'Beans', 2000, 23, 'klsakls dk jkls jd'),
(12, 'Demo', 2000, 20, 'sjshajksdhajk dhjkas hdasjkhd asjk'),
(13, 'Demo', 200, 2, 'sjdfs j dhjs kjd'),
(15, 'Sunday', 20000, 23, 'ajdn js nms'),
(16, 'Sunday', 20000, 23, 'ajdn js nms'),
(18, 'sfsdffsdf', 12, 12, 'sf'),
(20, 'klf skflsdk ', 2000, 12, 'jksd njsds'),
(22, 'ksdklsdkl', 6, 6, 'jkjk'),
(23, 'sudakll', 23, 23, 'jsdkz'),
(24, 'demo', 11, 2, 'dskdlakdl;aks'),
(26, 'Potatoes', 400, 5000, 'Potatoe chip');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(10) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `pname`, `price`, `qty`) VALUES
(1, 'Shirts', 2000, 200),
(2, 'sjakdjas', 45, 45);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Manager', 'Manager'),
(3, 'Staff', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(10) NOT NULL,
  `suppliername` varchar(255) NOT NULL,
  `supplierphone` varchar(255) NOT NULL,
  `supplieraddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `suppliername`, `supplierphone`, `supplieraddress`) VALUES
(1, 'fnsj fsjkdfjkjjk', '08098987654', 'kjlksjsdlkajsk'),
(2, 'ksdjalksdjkl', 'kdjaskdjaklsdjl', 'adetokumbo cresent');

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `id` int(10) NOT NULL,
  `itemid` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` double NOT NULL,
  `supplierid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supply`
--

INSERT INTO `supply` (`id`, `itemid`, `quantity`, `price`, `supplierid`) VALUES
(1, 1, 2000, 20, 1),
(2, 7, 20000, 12.5, 2),
(3, 15, 4000, 22.3, 2),
(4, 1, 40, 20.2, 2),
(5, 1, 3000, 23.22, 2),
(6, 1, 45, 22.2, 2),
(7, 1, 4000, 23.22, 1),
(8, 1, 2000, 100.5, 1),
(9, 1, 344, 100.5, 1),
(10, 1, 23000, 220.4, 1),
(11, 26, 5000, 300, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `phone` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `employmentdate` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL,
  `role_id` int(10) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `mname`, `phone`, `email`, `address`, `dob`, `username`, `password`, `employmentdate`, `gender`, `role_id`) VALUES
(1, 'Sunday', 'Adetona', 'Aderinto', 8032452451, 'papasunnee@gmail.com', 'Flat C3 Federal Lowcost, Ogbomoso.', '2010-10-03', 'papasunnee', 'sunday', '2016-03-08', 1, 1),
(2, 'Amos', 'Adeyi', 'adel', 57689768, 'asdasd', 'adasdasd', '2018-10-08', 'daasda', 'asdad', 'dadasd', 1, 3),
(3, 'qeqewqw', 'qeqewqw', 'qeqewqw', 97989898, 'qeqewqw', 'qeqewqw', NULL, 'qeqewqw', 'qeqewqw', NULL, 0, 2),
(4, 'lkdfkjskj', 'kjkljkl', 'kjkljklj', 8789789, 'kjkljklj', 'kkjklj', NULL, 'jhjkhkj', 'jkhjhjk', NULL, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemid` (`itemid`,`supplierid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supply`
--
ALTER TABLE `supply`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
