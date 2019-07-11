-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 11, 2019 at 09:15 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `valleypoint`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

DROP TABLE IF EXISTS `accommodations`;
CREATE TABLE IF NOT EXISTS `accommodations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `numberOfPax` int(11) NOT NULL DEFAULT '1',
  `numberOfUnits` int(11) NOT NULL DEFAULT '1',
  `userID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accommodation_units`
--

DROP TABLE IF EXISTS `accommodation_units`;
CREATE TABLE IF NOT EXISTS `accommodation_units` (
  `accommodationID` int(10) UNSIGNED NOT NULL,
  `unitID` int(10) UNSIGNED NOT NULL,
  `numberOfPax` int(11) NOT NULL,
  `numberOfBunks` int(11) DEFAULT NULL,
  `checkinDatetime` datetime NOT NULL,
  `checkoutDatetime` datetime NOT NULL,
  `serviceID` int(11) NOT NULL DEFAULT '5',
  `status` enum('ongoing','finished','void') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`accommodationID`,`unitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beverages`
--

DROP TABLE IF EXISTS `beverages`;
CREATE TABLE IF NOT EXISTS `beverages` (
  `productID` int(10) UNSIGNED NOT NULL,
  `drinkSize (mL)` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
CREATE TABLE IF NOT EXISTS `charges` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `serviceID` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` double(8,2) NOT NULL,
  `balance` double(8,2) NOT NULL,
  `remarks` enum('unpaid','partial','full','canceled','corrective','void') COLLATE utf8mb4_unicode_ci NOT NULL,
  `accommodationID` int(10) UNSIGNED DEFAULT NULL,
  `reservationID` int(10) UNSIGNED DEFAULT NULL,
  `unitID` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
CREATE TABLE IF NOT EXISTS `guests` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactNumber` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accommodationID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ingredientCategory` enum('meatAndPoultry','produce','groceryAndDry','beerAndLiquor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `ingredientCategory`, `ingredientName`, `created_at`, `updated_at`) VALUES
(1, 'meatAndPoultry', 'Pork Liempo', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(2, 'meatAndPoultry', 'Chicken Legs', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(3, 'meatAndPoultry', 'Chicken Wings', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(4, 'meatAndPoultry', 'Ground Beef', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(5, 'meatAndPoultry', 'Sukiyaki Beef', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(6, 'meatAndPoultry', 'Tofu', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(7, 'meatAndPoultry', 'Tuna Flakes', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(8, 'meatAndPoultry', 'Boneless Bangus', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(9, 'meatAndPoultry', 'Bangus', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(10, 'meatAndPoultry', 'Lechon Kawali', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(11, 'produce', 'Potato', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(12, 'produce', 'Cabbage', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(13, 'produce', 'Long beans', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(14, 'produce', 'Eggplant', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(15, 'produce', 'Okra', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(16, 'produce', 'Bittermelon', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(17, 'produce', 'Cucumber', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(18, 'produce', 'Tomato', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(19, 'produce', 'Chili Pepper', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(20, 'produce', 'Long Chili', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(21, 'produce', 'Mixed Veggie', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(22, 'produce', 'Strawberry', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(23, 'produce', 'Banana', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(24, 'produce', 'Mango', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(25, 'produce', 'Calamansi', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(26, 'produce', 'Onion', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(27, 'groceryAndDry', 'Sausage', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(28, 'groceryAndDry', 'Tocino', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(29, 'groceryAndDry', 'Bacon', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(30, 'groceryAndDry', 'Mushroom', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(31, 'groceryAndDry', 'String beans', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(32, 'groceryAndDry', 'Squash', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(33, 'groceryAndDry', 'Radish', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(34, 'groceryAndDry', 'Baguio Beans', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(35, 'groceryAndDry', 'Strawberry Syrup', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(36, 'groceryAndDry', 'Chocolate Syrup', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(37, 'groceryAndDry', 'Egg', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(38, 'groceryAndDry', 'Spam', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(39, 'groceryAndDry', 'Lumpiang Shanghai', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(40, 'groceryAndDry', 'Pork Sisig', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(41, 'groceryAndDry', 'Prawn Crackers', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(42, 'groceryAndDry', 'Nachos Chips', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(43, 'groceryAndDry', 'Bread', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(44, 'groceryAndDry', 'Ham', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(45, 'groceryAndDry', 'Pasta', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(46, 'groceryAndDry', 'Kikiam', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(47, 'groceryAndDry', 'Tea Bag', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(48, 'groceryAndDry', 'Coke Products', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(49, 'groceryAndDry', 'Butter', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(50, 'groceryAndDry', 'Fries', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(51, 'groceryAndDry', 'Cheese', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(52, 'groceryAndDry', 'Bihon Pasta', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(53, 'groceryAndDry', 'Canton Pasta', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(54, 'groceryAndDry', 'Banana Blossom', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(55, 'groceryAndDry', 'Peanut Butter', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(56, 'groceryAndDry', 'Sinigang Mix', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(57, 'groceryAndDry', 'Iced Tea', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(58, 'groceryAndDry', 'Coffee', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(59, 'groceryAndDry', 'Milk', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(60, 'beerAndLiquor', 'San Mig Light', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(61, 'beerAndLiquor', 'San Mig Apple', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(62, 'beerAndLiquor', 'Red Horse', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(63, 'beerAndLiquor', 'Pale Pilsen', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(64, 'beerAndLiquor', 'Brew Kettle', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(65, 'beerAndLiquor', 'Smirnoff Mule', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(66, 'beerAndLiquor', 'Heineken', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(67, 'beerAndLiquor', 'Ginebra San Miguel', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(68, 'beerAndLiquor', 'Jinro', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(69, 'beerAndLiquor', 'Fundador Lights', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(70, 'beerAndLiquor', 'Mojito Gold', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(71, 'beerAndLiquor', 'Mojito Silver', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(72, 'beerAndLiquor', 'Johnnie Walker (Double Black)', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(73, 'beerAndLiquor', 'Johnnie Walker (Black Label)', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(74, 'beerAndLiquor', 'Bacardi Gold', '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(75, 'beerAndLiquor', 'Bacardi Silver', '2019-07-10 05:34:21', '2019-07-10 05:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ingredientID` int(10) UNSIGNED NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `orderID` int(10) UNSIGNED NOT NULL,
  `productID` int(10) UNSIGNED NOT NULL,
  `shiftID` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` double(8,2) NOT NULL,
  `paymentStatus` enum('pending','paid','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`orderID`, `productID`, `shiftID`, `quantity`, `totalPrice`, `paymentStatus`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 220.00, 'pending', '2019-07-10 06:05:43', '2019-07-10 06:05:43'),
(1, 8, 0, 1, 260.00, 'pending', '2019-07-10 06:05:43', '2019-07-10 06:05:43'),
(1, 6, 0, 1, 220.00, 'pending', '2019-07-10 06:05:43', '2019-07-10 06:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_21_095518_create_accommodations_table', 1),
(4, '2019_02_21_090029_create_guests_table', 1),
(5, '2019_02_21_094002_create_units_table', 1),
(6, '2019_02_21_101436_create_shifts_table', 1),
(7, '2019_02_21_101720_create_ingredients_table', 1),
(8, '2019_02_21_102631_create_orders_table', 1),
(9, '2019_02_22_012206_create_items_table', 1),
(10, '2019_02_22_013053_create_sales_table', 1),
(11, '2019_02_22_013945_create_recipes_table', 1),
(12, '2019_02_28_132238_create_products_table', 1),
(13, '2019_02_28_132751_create_beverages_table', 1),
(14, '2019_03_05_072504_create_services_table', 1),
(15, '2019_03_14_023935_create_reservations_table', 1),
(16, '2019_03_14_024656_create_accommodation_units_table', 1),
(17, '2019_03_14_025216_create_charges_table', 1),
(18, '2019_03_14_025753_create_payments_table', 1),
(19, '2019_03_18_044003_create_reservation_units_table', 1),
(20, '2019_05_21_162434_create_restaurant_tables_table', 1),
(21, '2019_05_24_144217_create_inventories_table', 1),
(22, '2019_05_31_115359_create_void_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queueNumber` int(11) DEFAULT NULL,
  `tableNumber` int(11) DEFAULT NULL,
  `totalBill` double(8,2) NOT NULL,
  `discountAmount` double(8,2) DEFAULT NULL,
  `status` enum('ongoing','finished','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderDatetime` datetime NOT NULL,
  `shiftID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `queueNumber`, `tableNumber`, `totalBill`, `discountAmount`, `status`, `orderDatetime`, `shiftID`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 700.00, 0.00, 'ongoing', '2019-07-10 14:05:43', 1, '2019-07-10 06:05:43', '2019-07-10 06:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paymentDatetime` datetime NOT NULL,
  `amount` double(8,2) NOT NULL,
  `changeDue` double(8,2) NOT NULL,
  `paymentStatus` enum('partial','full','void') COLLATE utf8mb4_unicode_ci NOT NULL,
  `chargeID` int(10) UNSIGNED DEFAULT NULL,
  `orderID` int(10) UNSIGNED DEFAULT NULL,
  `referenceNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `productCategory` enum('appetizer','bread','breakfast','groupMeal','noodles','riceBowl','soup','specialRiceMeal','extra','beverage','liquor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `guestPrice` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productCategory`, `productName`, `price`, `guestPrice`, `created_at`, `updated_at`) VALUES
(1, 'appetizer', 'Sizzling Pork Sisig', 220.00, 170.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(2, 'appetizer', 'Sizzling Tuna', 220.00, 170.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(3, 'appetizer', 'Sizzling Tofu', 220.00, 170.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 'appetizer', 'Nachos', 150.00, 150.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(5, 'appetizer', 'Dynamite', 220.00, 170.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(6, 'appetizer', 'Lumpiang Shanghai', 220.00, 170.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(7, 'appetizer', 'Besuto', 50.00, 50.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(8, 'appetizer', 'Wings', 260.00, 210.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(9, 'bread', 'Egg Sandwich w/ Fries', 120.00, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 'bread', 'Tuna Sandwich w/ Fries', 120.00, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 'bread', 'Ham & Cheese Sandwich w/ Fries', 120.00, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(12, 'breakfast', 'Tapsilog', 175.00, 175.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(13, 'breakfast', 'Tosilog', 175.00, 175.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(14, 'breakfast', 'Bangsilog', 175.00, 175.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(15, 'breakfast', 'Porksilog', 175.00, 175.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(16, 'breakfast', 'Spamsilog', 175.00, 175.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(17, 'breakfast', 'Longsilog', 175.00, 175.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(18, 'noodles', 'Carbonara', 180.00, 140.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(19, 'noodles', 'Bihon', 210.00, 160.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(20, 'noodles', 'Canton', 210.00, 160.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(21, 'noodles', 'Bihon & Canton', 210.00, 160.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(22, 'riceBowl', 'Special Fried Rice', 130.00, 110.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(23, 'riceBowl', 'Lumpia Fried Rice', 180.00, 140.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(24, 'riceBowl', 'Porkchop Fried Rice', 200.00, 160.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(25, 'riceBowl', 'Chicken Fried Rice', 200.00, 200.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(26, 'groupMeal', 'Creamy Adobo', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(27, 'groupMeal', 'Crispy Kare-Kare', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 'groupMeal', 'Pinakbet w/ Lechon Kawali', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(29, 'groupMeal', 'Lechon Kawali', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(30, 'groupMeal', 'Bicol Express Liempo', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(31, 'groupMeal', 'Pork Binagoongan', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(32, 'specialRiceMeal', 'Valleypoint Rice', 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(33, 'specialRiceMeal', 'Lechon Kawali Rice', 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(34, 'specialRiceMeal', 'Sizzling Sisig Rice', 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(35, 'specialRiceMeal', 'Binagoongan Rice', 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(36, 'specialRiceMeal', 'Bicol Express Rice', 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 'soup', 'Sinigang na Baboy', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(38, 'soup', 'Nilagang Baboy', 375.00, 375.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(39, 'extra', 'Plain Rice', 20.00, 20.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(40, 'extra', 'Garlic Rice', 30.00, 30.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(41, 'beverage', 'Iced Tea (Glass)', 35.00, 35.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(42, 'beverage', 'Iced Tea (Pitcher)', 80.00, 80.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(43, 'beverage', 'Coke', 60.00, 60.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(44, 'beverage', 'Royal', 60.00, 60.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(45, 'beverage', 'Sprite', 60.00, 60.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(46, 'beverage', 'Coke Zero', 60.00, 60.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(47, 'beverage', 'Bottomless Coffee', 100.00, 100.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(48, 'beverage', 'Hot Tea', 75.00, 75.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(49, 'beverage', 'Strawberry Shake', 110.00, 110.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(50, 'beverage', 'Banana Shake', 110.00, 110.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(51, 'beverage', 'Mango Shake', 110.00, 110.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(52, 'liquor', 'Beer (Per Bucket)', 350.00, 350.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(53, 'liquor', 'Special Beer (Per Bucket)', 400.00, 400.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(54, 'liquor', 'San Mig Light', 70.00, 70.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(55, 'liquor', 'San Mig Apple', 70.00, 70.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(56, 'liquor', 'Red Horse', 70.00, 70.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(57, 'liquor', 'Pale Pilsen', 70.00, 70.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(58, 'liquor', 'Brew Kettle', 75.00, 75.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(59, 'liquor', 'Smirnoff Mule', 75.00, 75.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(60, 'liquor', 'Heineken', 75.00, 75.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(61, 'liquor', 'Ginebra San Miguel', 180.00, 180.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(62, 'liquor', 'Jinro', 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(63, 'liquor', 'Fundador Lights', 850.00, 850.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(64, 'liquor', 'Mojito Gold', 850.00, 850.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(65, 'liquor', 'Mojito Silver', 600.00, 600.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(66, 'liquor', 'Johnnie Walker (Double Black)', 3500.00, 3500.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(67, 'liquor', 'Johnnie Walker (Black Label)', 2200.00, 2200.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(68, 'liquor', 'Bacardi Gold', 1000.00, 1000.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(69, 'liquor', 'Bacardi Silver', 800.00, 800.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `productID` int(10) UNSIGNED NOT NULL,
  `ingredientID` int(10) UNSIGNED NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`productID`, `ingredientID`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 40, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(1, 19, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(1, 25, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(1, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(1, 49, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(2, 7, 2.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(2, 19, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(3, 6, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(3, 19, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 12, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 18, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 17, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 1, 100.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 42, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(5, 20, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(5, 1, 100.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(5, 51, 100.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(6, 39, 100.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(7, 41, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(8, 3, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(9, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(9, 49, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(9, 43, 4.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 7, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 37, 2.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 49, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 43, 4.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 50, 50.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 44, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 41, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 43, 4.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 50, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(12, 5, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(12, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(12, 25, 4.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(13, 28, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(13, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(14, 8, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(14, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(15, 1, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(15, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(16, 38, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(16, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(17, 27, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(17, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(18, 45, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(18, 49, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(18, 29, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(18, 44, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(18, 43, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(19, 52, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(19, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(19, 46, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(20, 53, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(20, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(20, 46, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(21, 52, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(21, 53, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(21, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(21, 46, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(22, 44, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(22, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(22, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(23, 39, 8.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(23, 44, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(23, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(23, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(24, 1, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(24, 44, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(24, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(24, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(25, 44, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(25, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(25, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(25, 2, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(26, 11, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(26, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(26, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(27, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(27, 13, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(27, 54, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(27, 14, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(27, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 34, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 15, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 18, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 14, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 32, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(28, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(29, 10, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(30, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(30, 31, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(30, 20, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(31, 31, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(31, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(32, 2, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(32, 1, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(32, 21, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(32, 37, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(33, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(34, 40, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(34, 49, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(34, 19, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(34, 25, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(34, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(35, 31, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(35, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(36, 31, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(36, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(36, 20, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 31, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 15, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 14, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 18, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 33, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(37, 56, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(38, 10, 120.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(38, 12, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(38, 34, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(38, 11, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(38, 26, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(41, 57, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(42, 57, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(43, 48, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(44, 48, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(45, 48, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(46, 48, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(47, 58, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(48, 47, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(49, 22, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(49, 59, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(49, 35, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(50, 23, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(50, 59, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(50, 36, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(51, 59, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(51, 36, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(51, 24, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(54, 60, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(55, 61, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(56, 62, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(57, 63, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(58, 64, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(59, 65, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(60, 66, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(61, 67, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(62, 68, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(63, 69, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(64, 70, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(65, 71, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(66, 72, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(67, 73, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(68, 74, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(69, 75, 1.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfPax` int(11) NOT NULL DEFAULT '1',
  `numberOfUnits` int(11) NOT NULL DEFAULT '1',
  `contactNumber` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_units`
--

DROP TABLE IF EXISTS `reservation_units`;
CREATE TABLE IF NOT EXISTS `reservation_units` (
  `reservationID` int(10) UNSIGNED NOT NULL,
  `unitID` int(10) UNSIGNED NOT NULL,
  `status` enum('reserved','checkedin','canceled','void') COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfPax` int(11) NOT NULL,
  `numberOfBunks` int(11) DEFAULT NULL,
  `checkinDatetime` datetime NOT NULL,
  `checkoutDatetime` datetime NOT NULL,
  `serviceID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reservationID`,`unitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_tables`
--

DROP TABLE IF EXISTS `restaurant_tables`;
CREATE TABLE IF NOT EXISTS `restaurant_tables` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tableNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('occupied','available') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_tables`
--

INSERT INTO `restaurant_tables` (`id`, `tableNumber`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Table 1', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(2, 'Table 2', 'occupied', '2019-07-10 05:34:22', '2019-07-10 06:05:43'),
(3, 'Table 3', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(4, 'Table 4', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(5, 'Table 5', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(6, 'Table 6', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(7, 'Table 7', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(8, 'Table 8', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(9, 'Table 9', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(10, 'Table 10', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(11, 'Table 11', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22'),
(12, 'Table 12', 'available', '2019-07-10 05:34:22', '2019-07-10 05:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `paymentDatetime` datetime NOT NULL,
  `amount` double(8,2) NOT NULL,
  `paymentCategory` enum('lodging','restobar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderID` int(10) UNSIGNED DEFAULT NULL,
  `accommodationID` int(10) UNSIGNED DEFAULT NULL,
  `serviceID` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `serviceType` enum('package','service','damage','extra') COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `leanPrice` double(8,2) NOT NULL,
  `peakPrice` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `serviceType`, `serviceName`, `price`, `leanPrice`, `peakPrice`, `created_at`, `updated_at`) VALUES
(1, 'package', 'Glamping Solo', 1350.00, 1350.00, 1350.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(2, 'package', 'Glamping 2 pax', 1250.00, 1250.00, 1250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(3, 'package', 'Glamping 3 pax', 1000.00, 1000.00, 1000.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(4, 'package', 'Glamping 4 pax', 850.00, 850.00, 850.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(5, 'package', 'Backpacker', 750.00, 750.00, 750.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(6, 'service', 'Airsoft', 500.00, 500.00, 500.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(7, 'service', 'Archery', 500.00, 500.00, 500.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(8, 'damage', 'Shoe box', 500.00, 500.00, 500.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(9, 'damage', 'Pillow case', 250.00, 250.00, 250.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(10, 'damage', 'Pillow', 500.00, 500.00, 500.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(11, 'damage', 'Blanket', 1000.00, 1000.00, 1000.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(12, 'damage', 'Bedsheet', 1000.00, 1000.00, 1000.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(13, 'damage', 'Foam', 5000.00, 5000.00, 5000.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(14, 'damage', 'Tent', 8000.00, 8000.00, 8000.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(15, 'extra', 'Pillow', 100.00, 100.00, 100.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(16, 'extra', 'Bedsheet', 200.00, 200.00, 200.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21'),
(17, 'extra', 'Blanket', 150.00, 150.00, 150.00, '2019-07-10 05:34:21', '2019-07-10 05:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
CREATE TABLE IF NOT EXISTS `shifts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shiftStart` datetime NOT NULL,
  `shiftEnd` datetime NOT NULL,
  `cashStart` double(8,2) NOT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unitType` enum('room','bed','tent','table') COLLATE utf8mb4_unicode_ci NOT NULL,
  `unitNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT '1',
  `partOf` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unitType`, `unitNumber`, `capacity`, `partOf`, `created_at`, `updated_at`) VALUES
(1, 'tent', 'Tent1', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(2, 'tent', 'Tent2', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(3, 'tent', 'Tent3', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(4, 'tent', 'Tent4', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(5, 'tent', 'Tent5', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(6, 'tent', 'Tent6', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(7, 'tent', 'Tent7', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(8, 'tent', 'Tent8', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(9, 'tent', 'Tent9', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(10, 'tent', 'Tent10', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(11, 'tent', 'Tent11', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(12, 'tent', 'Tent12', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(13, 'tent', 'Tent13', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(14, 'tent', 'Tent14', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(15, 'tent', 'Tent15', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(16, 'tent', 'Tent16', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(17, 'tent', 'Tent17', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(18, 'tent', 'Tent18', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(19, 'tent', 'Tent19', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(20, 'tent', 'Tent20', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(21, 'room', 'Room1', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(22, 'room', 'Room2', 6, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(23, 'room', 'Room3', 10, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(24, 'room', 'Room4', 4, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(25, 'room', 'Room5', 5, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(26, 'room', 'Room6', 3, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(27, 'room', 'Room7', 10, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(28, 'room', 'Room8', 6, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(29, 'room', 'Room9', 3, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(30, 'bed', 'Bed1', 1, 21, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(31, 'bed', 'Bed2', 1, 21, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(32, 'bed', 'Bed3', 1, 21, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(33, 'bed', 'Bed4', 1, 21, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(34, 'bed', 'Bed5', 1, 22, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(35, 'bed', 'Bed6', 1, 22, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(36, 'bed', 'Bed7', 1, 22, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(37, 'bed', 'Bed8', 1, 22, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(38, 'bed', 'Bed9', 1, 22, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(39, 'bed', 'Bed10', 1, 22, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(40, 'bed', 'Bed11', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(41, 'bed', 'Bed12', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(42, 'bed', 'Bed13', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(43, 'bed', 'Bed14', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(44, 'bed', 'Bed15', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(45, 'bed', 'Bed16', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(46, 'bed', 'Bed17', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(47, 'bed', 'Bed18', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(48, 'bed', 'Bed19', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(49, 'bed', 'Bed20', 1, 23, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(50, 'bed', 'Bed21', 1, 24, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(51, 'bed', 'Bed22', 1, 24, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(52, 'bed', 'Bed23', 1, 24, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(53, 'bed', 'Bed24', 1, 24, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(54, 'bed', 'Bed25', 1, 25, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(55, 'bed', 'Bed26', 1, 25, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(56, 'bed', 'Bed27', 1, 25, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(57, 'bed', 'Bed28', 1, 25, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(58, 'bed', 'Bed29', 1, 25, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(59, 'bed', 'Bed30', 1, 26, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(60, 'bed', 'Bed31', 1, 26, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(61, 'bed', 'Bed32', 1, 26, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(62, 'bed', 'Bed33', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(63, 'bed', 'Bed34', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(64, 'bed', 'Bed35', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(65, 'bed', 'Bed36', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(66, 'bed', 'Bed37', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(67, 'bed', 'Bed38', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(68, 'bed', 'Bed39', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(69, 'bed', 'Bed40', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(70, 'bed', 'Bed41', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(71, 'bed', 'Bed42', 1, 27, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(72, 'bed', 'Bed43', 1, 28, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(73, 'bed', 'Bed44', 1, 28, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(74, 'bed', 'Bed45', 1, 28, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(75, 'bed', 'Bed46', 1, 28, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(76, 'bed', 'Bed47', 1, 28, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(77, 'bed', 'Bed48', 1, 28, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(78, 'bed', 'Bed49', 1, 29, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(79, 'bed', 'Bed50', 1, 29, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(80, 'bed', 'Bed51', 1, 29, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(81, 'table', 'Table1', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(82, 'table', 'Table2', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(83, 'table', 'Table3', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(84, 'table', 'Table4', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(85, 'table', 'Table5', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(86, 'table', 'Table6', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(87, 'table', 'Table7', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(88, 'table', 'Table8', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(89, 'table', 'Table9', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(90, 'table', 'Table10', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(91, 'table', 'Table11', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(92, 'table', 'Table12', 1, NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','general','lodging','cashier') COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `role`, `contactNumber`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'lodging', 'JP Aquino', 'lodging', '09178504634', 'jpaquino@valleypoint.com', NULL, '$2y$10$X51DHoNsx6ZDFxg.31LsI.71TYYFXmgKqzw3lG3nGOZVE6nflEqk2', 'ltw9UcjFnZzWryKh2cj9nOU21BvE69gbuupd2cPgNGsCneCg4JRJrceN3v5n', '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(2, 'admin', 'Jhaypee', 'admin', '09177777634', 'jhaypee@valleypoint.com', NULL, '$2y$10$GnXiego4xPIRXNidKag4AeU4y1ykcAXLi0qNk0Tn8PMuyuwtSzsEm', NULL, '2019-07-10 05:34:20', '2019-07-10 05:34:20'),
(3, 'cashier', 'Jay', 'cashier', '09112347634', 'cashier@valleypoint.com', NULL, '$2y$10$XyMbd62oEss/DzUiX0VQ0.5JsRajV6ckOkfEFuN5E6hayft2ZPE/O', '8Zjnjjeq0BzsgxD95R05vHC0gzufYsc7vvZhkKIcebp8fsejTDd0qOkIjht6', '2019-07-10 05:34:20', '2019-07-10 05:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `void_transactions`
--

DROP TABLE IF EXISTS `void_transactions`;
CREATE TABLE IF NOT EXISTS `void_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `accommodationID` int(10) UNSIGNED DEFAULT NULL,
  `reservationID` int(10) UNSIGNED DEFAULT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
