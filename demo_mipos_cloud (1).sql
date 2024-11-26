-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2024 at 09:14 AM
-- Server version: 5.5.52-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_mipos_cloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_brands`
--

CREATE TABLE `db_brands` (
  `id` int(5) NOT NULL,
  `brand_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_brands`
--

INSERT INTO `db_brands` (`id`, `brand_code`, `brand_name`, `description`, `company_id`, `status`) VALUES
(1, 'CT0001', 'Adidas', 'Adidas Brand', NULL, 1),
(2, 'CT0002', 'Raymond', 'Fashionable formal and casual dresses', NULL, 1),
(3, 'CT0003', 'Cosmex Publishers', 'Books Printing Company', NULL, 1),
(4, 'CT0004', 'Vistaprint', 'Books &amp; Card Printing Company', NULL, 1),
(5, 'CT0005', 'Fastrack', 'Fastrack ashion accessory', NULL, 1),
(6, 'CT0006', 'lifebuoy', 'The soaps manufactured today under the Lifebuoy brand do not contain phenol', NULL, 1),
(7, 'CT0007', 'Patanjali', 'Health Care Products', NULL, 1),
(8, 'CT0008', 'Aayur', 'Health Care Products', NULL, 1),
(9, 'CT0009', 'Samsung', 'Brand Description here', NULL, 1),
(10, 'CT0010', 'Lee', 'Brand Description here', NULL, 1),
(11, 'CT0011', 'Mysore Sandal Soap', 'Smell and it&#039;s pretty darn good', NULL, 1),
(12, 'CT0012', 'Colgate', 'Advanced technology. No. 1 toothpaste brand. Protect your smile. Recommended by dentists.', NULL, 1),
(13, 'CT0013', 'Rado Watches', 'Branded &amp; Expensive Watch', NULL, 1),
(14, 'CT0014', 'Signature', 'Branded Dresses', NULL, 1),
(15, 'CT0015', 'Redmi', 'Redmi Mobiles &amp; Accessaries', NULL, 1),
(16, 'CT0016', 'Apple', 'Mobile Accessories', NULL, 1),
(17, 'CT0017', 'Armany', 'Armany description', NULL, 1),
(18, 'CT0018', 'Rolex', 'Branded &amp; Expensive Watch', NULL, 1),
(19, 'CT0019', 'Vistraprint', 'Books &amp; Card Printing Company', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` int(5) NOT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `category_code`, `category_name`, `description`, `company_id`, `status`) VALUES
(1, 'CT0001', 'Body Spray', 'Body Spray', NULL, 1),
(2, 'CT0002', 'Accessories', 'Accessories Description ', NULL, 1),
(3, 'CT0003', 'Watches', 'Men &amp; Women', NULL, 1),
(4, 'CT0004', 'Health Care', 'Health Care items Category', NULL, 1),
(5, 'CT0005', 'Shoes', 'Shoes Description', NULL, 1),
(6, 'CT0006', 'T-Shirts', 'T-Shirts Description', NULL, 1),
(7, 'CT0007', 'Men Wears', 'Men Wears Description', NULL, 1),
(8, 'CT0008', 'Cosmetics', 'Men &amp; Women', NULL, 1),
(9, 'CT0009', 'Kids Zone', 'Kids Accessories', NULL, 1),
(10, 'CT0010', 'Food &amp; Beverage', 'Food &amp; Beverage Details Items', NULL, 1),
(11, 'CT0011', 'Mobile', 'Mobile description', NULL, 1),
(12, 'CT0012', 'Jacket', 'Jacket description', NULL, 1),
(13, 'CT0013', 'Books', 'Books Description', NULL, 1),
(14, 'CT0014', 'Computers', 'Computers Description', NULL, 1),
(15, 'CT0015', 'Home', 'Home', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_cobpayments`
--

CREATE TABLE `db_cobpayments` (
  `id` int(5) NOT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_company`
--

CREATE TABLE `db_company` (
  `id` double DEFAULT NULL,
  `company_code` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` text COLLATE utf8mb4_unicode_ci,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` mediumtext COLLATE utf8mb4_unicode_ci,
  `cid` int(10) DEFAULT NULL,
  `category_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `supplier_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `purchase_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'INITAL CODE',
  `sales_return_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_init` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_view` int(5) DEFAULT NULL COMMENT '1=Standard,2=Indian GST',
  `status` int(1) DEFAULT NULL,
  `sms_status` int(1) DEFAULT NULL COMMENT '1=Enable 0=Disable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_company`
--

INSERT INTO `db_company` (`id`, `company_code`, `company_name`, `company_website`, `mobile`, `phone`, `email`, `website`, `company_logo`, `logo`, `country`, `state`, `city`, `address`, `postcode`, `gst_no`, `vat_no`, `pan_no`, `bank_details`, `cid`, `category_init`, `item_init`, `supplier_init`, `purchase_init`, `purchase_return_init`, `customer_init`, `sales_init`, `sales_return_init`, `expense_init`, `invoice_view`, `status`, `sms_status`) VALUES
(1, '', 'Mysoftheaven Inventory POS', NULL, '01970776606', '0255020230', 'sales@mysoftheaven.com', 'https://www.mysoftheaven.com/', 'company_logo.png', 'logo-0.png', 'Bangladesh', 'Dhaka', 'Dhaka', '19-B/2-C &amp; 2-D, Block-F, 5th Floor, Ring Road, Shamoli', '1207', '', '', '', '', 1, 'CT', 'IT', 'SP', 'PU', 'PR', 'CU', 'SL', 'PR', 'EX', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_country`
--

CREATE TABLE `db_country` (
  `id` int(5) NOT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_country`
--

INSERT INTO `db_country` (`id`, `country_code`, `country`, `added_on`, `company_id`, `status`) VALUES
(2, NULL, 'USA', NULL, NULL, 1),
(3, NULL, 'Bangladesh', NULL, NULL, 1),
(4, NULL, 'Kuwait', NULL, NULL, 1),
(5, NULL, 'Qatar', NULL, NULL, 1),
(6, NULL, 'Saudi Arabia', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_currency`
--

CREATE TABLE `db_currency` (
  `id` int(5) NOT NULL,
  `currency_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` blob,
  `symbol` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_currency`
--

INSERT INTO `db_currency` (`id`, `currency_name`, `currency_code`, `currency`, `symbol`, `status`) VALUES
(1, 'Bulgaria-Bulgarian lev(BGN)', NULL, 0xd0bbd0b2, NULL, 1),
(2, 'Switzerland \r-Swiss franc (CHF)', NULL, 0x434846, NULL, 1),
(3, 'Czechia-Czech koruna(CZK))', NULL, 0x4bc48d20, NULL, 1),
(4, 'Denmark-Danish krone(DKK)', NULL, 0x6b7220, NULL, 1),
(5, 'Euro area countries -Euro(EUR)', NULL, 0xe282ac20, NULL, 1),
(6, 'United Kingdom-Pounds sterling (GBP)', NULL, 0xc2a3, NULL, 1),
(7, 'Croatia -Croatian Kuna (HRK)', NULL, 0x6b6e, NULL, 1),
(8, 'Georgia -Georgian lari (GEL)', NULL, 0x2623383338323b, NULL, 1),
(9, 'Hungary -Hungarian forint (HUF)', NULL, 0x6674, NULL, 1),
(10, 'Norway -Norwegian krone (NOK)', NULL, 0x6b72, NULL, 1),
(11, 'Poland -Polish zloty (PLN)', NULL, 0x7ac58220, NULL, 1),
(12, 'Russia -Russian ruble (RUB)', NULL, 0x2623383338313b20, NULL, 1),
(13, 'Romania -Romanian leu (RON)', NULL, 0x6c6569, NULL, 1),
(14, 'Sweden - Swedish krona (SEK)', NULL, 0x6b72, NULL, 1),
(15, 'Turkey -Turkish lira (TRY)', NULL, 0x2623383337383b20, NULL, 1),
(16, 'Ukraine - Ukrainian hryvna  (UAH)', NULL, 0xe282b420, NULL, 1),
(17, 'UAE -Emirati dirham (AED)', NULL, 0xd8af2ed8a520, NULL, 1),
(18, 'Israel - Israeli shekel (ILS)', NULL, 0x2623383336323b20, NULL, 1),
(19, 'Kenya - Kenyan shilling(KES)', NULL, 0x4b7368, NULL, 1),
(20, 'Morocco - Moroccan dirham (MAD)', NULL, 0x2ed8af2ed98520, NULL, 1),
(21, 'Nigeria - Nigerian naira (NGN)', NULL, 0xe282a620, NULL, 1),
(22, 'South Africa -South african rand** (ZAR)', NULL, 0x52, NULL, 1),
(23, 'Brazil- Brazilian real(BRL)', NULL, 0x5224, NULL, 1),
(24, 'Canada-Canadian dollars (CAD)', NULL, 0x24, NULL, 1),
(25, 'Chile -Chilean peso (CLP)', NULL, 0x24, NULL, 1),
(26, 'Colombia -Colombian peso (COP)', NULL, 0x24, NULL, 1),
(27, 'Mexico - Mexican peso (MXN)', NULL, 0x24, NULL, 1),
(28, 'Peru -Peruvian sol(PEN)', NULL, 0x532f2e20, NULL, 1),
(29, 'USA -US dollar (USD)', NULL, 0x24, NULL, 1),
(30, 'Australia -Australian dollars (AUD)', NULL, 0x24, NULL, 1),
(31, 'Bangladesh -Bangladeshi taka (BDT) ', NULL, 0x2623323534373b20, NULL, 1),
(32, 'China - Chinese yuan (CNY)', NULL, 0x262332303830333b20, NULL, 1),
(33, 'Hong Kong - Hong Kong dollar(HKD)', NULL, 0x262333363b20, NULL, 1),
(34, 'Indonesia - Indonesian rupiah (IDR)', NULL, 0x5270, NULL, 1),
(35, 'India - Indian rupee', 'INR', 0xe282b9, '?', 1),
(36, 'Japan - Japanese yen (JPY)', NULL, 0xc2a5, NULL, 1),
(37, 'Malaysia - Malaysian ringgit (MYR)', NULL, 0x524d, NULL, 1),
(38, 'New Zealand - New Zealand dollar (NZD)', NULL, 0x24, NULL, 1),
(39, 'Philippines- Philippine peso (PHP)', NULL, 0xe282b120, NULL, 1),
(40, 'Pakistan- Pakistani rupee (PKR)', NULL, 0x527320, NULL, 1),
(41, 'Singapore - Singapore dollar (SGD)', NULL, 0x24, NULL, 1),
(42, 'South Korea - South Korean won (KRW)', NULL, 0x2623383336313b20, NULL, 1),
(43, 'Sri Lanka - Sri Lankan rupee (LKR)', NULL, 0x5273, NULL, 1),
(44, 'Thailand- Thai baht (THB)', NULL, 0x2623333634373b20, NULL, 1),
(45, 'Vietnam - Vietnamese dong', 'VND', 0xe282ab, NULL, 1),
(46, 'Bitcoin - BTC or XBT', 'BTC ', 0xe282bf, NULL, 1),
(47, 'Ripples', 'XRP', 0x585250, NULL, 1),
(48, 'Monero', 'XMR', 0xc9b1, NULL, 1),
(49, 'Litecoin', 'LTC', 0xc581, NULL, 1),
(50, 'Ethereum', 'ETH', 0xce9e, NULL, 1),
(51, 'Euro', 'EUR', 0xe282ac, NULL, 1),
(52, 'Pounds sterling', 'GBP', 0xc2a3, NULL, 1),
(53, 'US dollar', 'USD', 0x24, NULL, 1),
(54, 'Japanese yen', 'JPY', 0xc2a5, NULL, 1),
(55, 'Omani rial', 'OMR', 0xd8b12ed8b92e, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_customers`
--

CREATE TABLE `db_customers` (
  `id` int(5) NOT NULL,
  `customer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(10,2) DEFAULT NULL,
  `sales_due` double(10,2) DEFAULT NULL,
  `sales_return_due` double(10,2) DEFAULT NULL,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_customers`
--

INSERT INTO `db_customers` (`id`, `customer_code`, `customer_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `sales_due`, `sales_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 'CU0001', 'Walk-in customer', '', '', '', '', '', NULL, NULL, 0.00, NULL, '', '', NULL, '', '', NULL, NULL, '2019-01-01', '10:55:54 pm', 'admin', NULL, 1),
(2, 'CU0002', 'Vinit Hiremath', '01711123332', '0878787777', 'vinit@gmail.com', 'GST75655', 'TAX76565', NULL, 500.00, 752.00, NULL, '3', '54', 'dhaka', '1213', 'shamoly, ringroad.', '202.133.91.102', '202.133.91.102', '2020-01-23', '12:18:37 pm', 'admin', NULL, 1),
(3, 'CU0003', 'Sundar', '98475454544', '0585454544', 'sunadar@gmail.com', 'GST554544', 'TAX244544', NULL, 0.00, 56647.00, NULL, '2', '52', 'Bella', '594545454', 'Sundar Building NY', '202.133.91.102', '202.133.91.102', '2020-01-23', '12:21:36 pm', 'admin', NULL, 1),
(4, 'CU0004', 'Chris Moris', '845457454545', '081454544', 'chris@gmail.com', 'GST655', 'TAx6555', NULL, 0.00, 400.00, NULL, '2', '52', '', '584444', 'Cris Building,NY', '202.133.91.102', '202.133.91.102', '2020-01-23', '12:22:59 pm', 'admin', NULL, 0),
(5, 'CU0005', 'Sayed Arefin', '01711123335', '', 'arefin@gmail.com', 'GST655', 'TAX76565', NULL, 0.00, 2207.00, NULL, '3', '54', '', '1213', 'Shamoly, adabor Thana, Ringroad', '202.133.91.102', '202.133.91.102', '2020-01-23', '12:25:25 pm', 'admin', NULL, 1),
(6, 'CU0006', 'Monami Gosh', '01711123336', '', 'monami@gmail.com', '', '', NULL, 0.00, 26.00, NULL, '3', '55', '', '', '', '202.133.91.102', '202.133.91.102', '2020-01-23', '12:59:42 pm', 'admin', NULL, 1),
(7, 'CU0007', 'Tahsan Khan', '01711123339', '', 'tahsan34@gmail.com', '', '', NULL, 0.00, NULL, NULL, '3', '54', '', '1213', 'Banani, Dhaka', '202.133.91.102', '202.133.91.102', '2020-01-23', '01:00:51 pm', 'admin', NULL, 1),
(8, 'CU0008', 'Md Kaoser', '01733465465', '', 'kaoser@gmail.com', '', '', NULL, 0.00, 0.00, NULL, '3', '54', '', '', 'Shamoly', '202.133.91.102', '202.133.91.102', '2020-01-23', '05:56:00 pm', 'admin', NULL, 1),
(9, 'CU0009', 'Muktadir hossen', '01733465467', '', 'mukta54@gmail.com', '', '', NULL, 0.00, NULL, NULL, '3', '54', '', '', '', '202.133.91.102', '202.133.91.102', '2020-01-23', '05:57:09 pm', 'admin', NULL, 1),
(10, 'CU0010', 'Mafizur Rahman', '01733465468', '', 'mafiz42@gmail.com', '', '', NULL, 0.00, NULL, NULL, '3', '54', '', '', '', '202.133.91.102', '202.133.91.102', '2020-01-23', '05:58:17 pm', 'admin', NULL, 1),
(11, 'CU0011', 'Zuel Ali', '01733465487', '', 'zuelcse@gmail.com', '', '', NULL, 0.00, 0.00, NULL, '3', '54', '', '', 'kollanpur,dhaka', '202.133.91.102', '202.133.91.102', '2020-01-23', '05:59:01 pm', 'admin', NULL, 1),
(12, 'CU0012', 'Araf islam', '01733465478', '', 'araf@gmail.com', '', '', NULL, 0.00, 0.00, NULL, '3', '54', '', '', 'Shamoly', '202.133.91.102', '202.133.91.102', '2020-01-23', '05:59:42 pm', 'admin', NULL, 1),
(13, 'CU0013', 'Shamim Khan', '01733465476', '', 'shamim@gmail.com', '', '', NULL, 0.00, 0.00, NULL, '3', '54', '', '', 'Collegegate, Dhaka', '202.133.91.102', '202.133.91.102', '2020-01-23', '06:00:44 pm', 'admin', NULL, 1),
(14, 'CU0014', 'Imdad Haque', '01733465445', '', 'imdad@gmail.com', '', '', NULL, 0.00, NULL, NULL, '3', '54', '', '', '', '202.133.91.102', '202.133.91.102', '2020-01-23', '06:01:48 pm', 'admin', NULL, 1),
(15, 'CU0015', 'khaled fawzy', '94052311', '', 'khaledfwzy@gmail.com', '', '', NULL, 0.00, NULL, NULL, '4', NULL, '', '00965', 'Al-Raya Tower 27 floor', '197.46.62.7', 'host-197.46.62.7.tedata.net', '2020-01-25', '02:25:42 pm', 'admin', NULL, 1),
(16, 'CU0016', 'dgsdfh', '', 'h', 'daulatpurpsosk@gmail.com', '', 'shs', NULL, 0.00, NULL, NULL, '3', '54', '', 'dgsdg', 'gsdg', '103.106.236.115', '103-106-236-115.Dhaka.carnival.com.bd', '2022-01-17', '03:24:45 pm', 'admin', NULL, 1),
(17, 'CU0017', 'Sabbir Khan', '01789654789', '2879534123', 'sima@gmail.com', '100', '515', NULL, 0.00, NULL, NULL, '3', '54', '', '1216', 'West Malibagh', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '2022-12-26', '10:14:51 am', 'admin', NULL, 1),
(18, 'CU0018', 'Rajib', '01873462813', '0187346281', 'barajib@gmail.com', '687987654', '2', NULL, 0.00, 0.00, NULL, '3', '54', '', '4200', 'NG', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '2023-01-15', '04:56:28 pm', 'mafizur', NULL, 1),
(19, 'CU0019', 'Mafizur', '01712160871', '880192340', 'rokomariit@gmail.com', '', '', NULL, 0.00, NULL, NULL, '3', '52', '', '12010', '101 Sanford Farm Shpg Center', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '2023-02-07', '05:21:01 pm', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_expense`
--

CREATE TABLE `db_expense` (
  `id` int(5) NOT NULL,
  `expense_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_amt` double(10,2) DEFAULT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_expense`
--

INSERT INTO `db_expense` (`id`, `expense_code`, `category_id`, `expense_date`, `reference_no`, `expense_for`, `expense_amt`, `note`, `created_by`, `created_date`, `created_time`, `system_ip`, `system_name`, `status`) VALUES
(1, 'EX0001', 1, '2020-01-23', '234', 'Dish Bill', 2000.00, 'Dish Bill', 'admin', '2020-01-23', '03:21:17 pm', '202.133.91.102', '202.133.91.102', 1),
(2, 'EX0002', 2, '2020-01-25', '433', 'Snakes', 1200.00, 'Snakes ', 'Purchase', '2020-01-25', '12:06:45 pm', '202.133.91.102', '202.133.91.102', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_expense_category`
--

CREATE TABLE `db_expense_category` (
  `id` int(5) NOT NULL,
  `category_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_expense_category`
--

INSERT INTO `db_expense_category` (`id`, `category_code`, `category_name`, `description`, `created_by`, `status`) VALUES
(1, 'EC0001', 'Utility', 'Utility', 'admin', 1),
(2, 'EC0002', 'Recreation', 'Recreation', 'Purchase', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_items`
--

CREATE TABLE `db_items` (
  `id` int(5) NOT NULL,
  `item_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hsn` varbinary(50) DEFAULT NULL,
  `unit_id` int(10) DEFAULT NULL,
  `alert_qty` int(10) DEFAULT NULL,
  `brand_id` int(5) DEFAULT NULL,
  `lot_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `purchase_price` double(10,2) DEFAULT NULL,
  `tax_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit_margin` double(10,2) DEFAULT NULL,
  `sales_price` double(10,2) DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `item_image` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_items`
--

INSERT INTO `db_items` (`id`, `item_code`, `item_name`, `category_id`, `sku`, `hsn`, `unit_id`, `alert_qty`, `brand_id`, `lot_number`, `expire_date`, `price`, `tax_id`, `purchase_price`, `tax_type`, `profit_margin`, `sales_price`, `stock`, `item_image`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 'IT0001', 'Adidas Deo Body Spray - Ice Dive 150 ml Bottle', 1, 'SKU-125', NULL, 9, 3, 1, '50', '2022-01-25', 195.00, 1, 198.90, 'Inclusive', 23.23, 245.10, 33, 'uploads/items/1579703190.jpg', '202.133.91.102', '202.133.91.102', '2020-01-22', '08:26:29 pm', 'admin', NULL, 1),
(2, 'IT0002', 'Apple Earpods', 2, '7777', NULL, 9, 5, 16, '', NULL, 12000.00, 3, 14160.00, 'Inclusive', 10.00, 15576.00, 12, 'uploads/items/1579770233.jpeg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:03:53 pm', 'admin', NULL, 1),
(3, 'IT0003', 'Shirt', 6, '502', NULL, 9, 5, 2, '12', '2020-02-20', 1500.00, 4, 1575.00, 'Inclusive', 0.00, 1575.00, 15, 'uploads/items/1579770298.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:04:58 pm', 'admin', NULL, 1),
(4, 'IT0004', 'iPhone 11', 2, '878787', NULL, 7, 5, 16, '', NULL, 105000.00, 3, 123900.00, 'Inclusive', 10.00, 136290.00, 9, 'uploads/items/1579770998.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:16:38 pm', 'admin', NULL, 1),
(5, 'IT0005', 'Redmi Pro 7 Mobile', 11, '88777', NULL, 7, 5, 15, '', NULL, 10000.00, 3, 11800.00, 'Inclusive', 10.00, 12980.00, 0, 'uploads/items/1579771210.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:20:10 pm', 'admin', NULL, 1),
(6, 'IT0006', 'Lifebuoy', 4, '77777', NULL, 7, 15, 6, '12', '2019-11-19', 50.00, 4, 52.50, 'Inclusive', 0.00, 52.50, 29, 'uploads/items/1579771506.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:25:06 pm', 'admin', NULL, 1),
(7, 'IT0007', 'Mysore Sandal Soap', 4, '87878', NULL, 7, 12, 11, '', NULL, 120.00, 4, 126.00, 'Inclusive', 0.00, 126.00, 16, 'uploads/items/1579771627.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:27:07 pm', 'admin', NULL, 1),
(8, 'IT0008', 'Rado Watch', 3, '255555', NULL, 9, 15, 13, '10', NULL, 16000.00, 3, 18880.00, 'Inclusive', 0.00, 18880.00, 38, 'uploads/items/1579771766.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:29:26 pm', 'admin', NULL, 1),
(9, 'IT0009', 'Colgate', 4, '8454544', NULL, 7, 15, 12, '13', '2019-10-10', 78.00, 4, 81.90, 'Inclusive', 0.00, 81.90, 14, 'uploads/items/1579771924.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:32:04 pm', 'admin', NULL, 1),
(10, 'IT0010', 'VP Shoes', 5, '656655', NULL, 7, 10, 1, '', NULL, 999.99, 6, 1099.99, 'Inclusive', 0.00, 1099.99, 5, 'uploads/items/1579772070.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:34:30 pm', 'admin', NULL, 1),
(11, 'IT0011', 'Armani jacket', 12, '15454', NULL, 9, 4, 17, '10', NULL, 2500.00, 4, 2625.00, 'Inclusive', 0.00, 2625.00, 18, 'uploads/items/1579772306.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:38:26 pm', 'admin', NULL, 1),
(12, 'IT0012', 'Suits', 7, '6666', NULL, 9, 5, 2, '10', NULL, 1000.00, 6, 1100.00, 'Exclusive', 6.68, 1173.50, 1, NULL, '202.133.91.102', '202.133.91.102', '2020-01-23', '03:41:53 pm', 'admin', NULL, 1),
(13, 'IT0013', 'Rolex', 3, '987545', NULL, 9, 14, 18, '12', NULL, 15000.00, 3, 17700.00, 'Inclusive', 0.00, 17700.00, 24, 'uploads/items/1579772831.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:47:10 pm', 'admin', NULL, 1),
(14, 'IT0014', 'Ramayana', 13, '987777', NULL, 9, 5, 4, '11', NULL, 325.00, 6, 357.50, 'Inclusive', 0.00, 357.50, 13, 'uploads/items/1579773114.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '03:51:54 pm', 'admin', NULL, 1),
(15, 'IT0015', 'Povery shoe', 5, '8887', NULL, 9, 5, 10, '', NULL, 500.00, 3, 590.00, 'Inclusive', 0.00, 590.00, 12, 'uploads/items/1579773622.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:00:22 pm', 'admin', NULL, 1),
(16, 'IT0016', 'Apple Laptop', 14, '545454', NULL, 9, 2, 16, '', NULL, 1000.00, 6, 1100.00, 'Inclusive', 0.00, 1100.00, 4, 'uploads/items/1579773829.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:03:49 pm', 'admin', NULL, 1),
(17, 'IT0017', 'Apple PC', 14, '9897444', NULL, 9, 2, 16, '', NULL, 999.99, 3, 1179.99, 'Inclusive', 0.00, 1179.99, 12, 'uploads/items/1579773954.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:05:54 pm', 'admin', NULL, 1),
(18, 'IT0018', 'I Do What I Do', 13, '984454', NULL, 9, 5, 3, '', NULL, 600.00, 3, 708.00, 'Inclusive', 0.00, 708.00, 18, 'uploads/items/1579774173.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:09:33 pm', 'admin', NULL, 1),
(19, 'IT0019', 'How to Analyze People', 13, '887787', NULL, 9, 5, 3, '', NULL, 500.00, 3, 590.00, 'Inclusive', 0.00, 590.00, 9, 'uploads/items/1579774514.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:15:14 pm', 'admin', NULL, 1),
(20, 'IT0020', 'WM Shoes', 5, '65656565', NULL, 9, 5, 1, '', NULL, 999.99, 5, 1179.99, 'Inclusive', 0.00, 1179.99, 9, 'uploads/items/1579774632.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:17:12 pm', 'admin', NULL, 1),
(21, 'IT0021', 'Rd Shoes', 5, '54565', NULL, 9, 5, 10, '', NULL, 999.99, 3, 1179.99, 'Inclusive', 0.00, 1179.99, 9, 'uploads/items/1579774778.jpg', '202.133.91.102', '202.133.91.102', '2020-01-23', '04:19:38 pm', 'admin', NULL, 1),
(22, 'IT0022', 'Body spray', 1, '', NULL, 9, 0, 1, '', NULL, 200.00, 4, 210.00, 'Exclusive', -4.76, 200.00, 0, NULL, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '2023-08-14', '04:39:45 pm', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_languages`
--

CREATE TABLE `db_languages` (
  `id` int(5) NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_languages`
--

INSERT INTO `db_languages` (`id`, `language`, `status`) VALUES
(1, 'English', 1),
(2, 'Hindi', 1),
(3, 'Kannada', 1),
(4, 'Indonesian', 1),
(5, 'Chinese', 1),
(6, 'Russian', 1),
(7, 'Spanish', 1),
(8, 'Arabic', 1),
(9, 'Albanian', 1),
(10, 'Dutch', 1),
(11, 'Bangla', 1),
(12, 'Urdu', 1),
(13, 'Italian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_paymenttypes`
--

CREATE TABLE `db_paymenttypes` (
  `id` int(5) NOT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_paymenttypes`
--

INSERT INTO `db_paymenttypes` (`id`, `payment_type`, `status`) VALUES
(1, 'Cash', 1),
(2, 'visa/ master /amex card', 1),
(3, 'Paytm', 0),
(4, 'bkash/ nogod/ upay/ sure cash', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_permissions`
--

CREATE TABLE `db_permissions` (
  `id` int(5) NOT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permissions` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_permissions`
--

INSERT INTO `db_permissions` (`id`, `role_id`, `permissions`) VALUES
(1, 2, 'places_add'),
(2, 2, 'places_edit'),
(3, 2, 'places_delete'),
(4, 2, 'places_view'),
(5, 2, 'expense_add'),
(6, 2, 'expense_edit'),
(7, 2, 'expense_delete'),
(8, 2, 'expense_view'),
(9, 2, 'customers_add'),
(10, 2, 'customers_edit'),
(11, 2, 'customers_delete'),
(12, 2, 'customers_view'),
(13, 2, 'sales_add'),
(14, 2, 'sales_edit'),
(15, 2, 'sales_view'),
(16, 2, 'sales_payment_view'),
(17, 2, 'sales_payment_add'),
(18, 2, 'sales_payment_delete'),
(19, 2, 'sales_report'),
(20, 2, 'sales_payments_report'),
(21, 2, 'expense_category_add'),
(22, 2, 'expense_category_edit'),
(23, 2, 'expense_category_delete'),
(24, 2, 'expense_category_view'),
(25, 2, 'dashboard_view'),
(26, 2, 'sales_return_view'),
(27, 3, 'places_add'),
(28, 3, 'places_edit'),
(29, 3, 'places_delete'),
(30, 3, 'places_view'),
(31, 3, 'expense_add'),
(32, 3, 'expense_edit'),
(33, 3, 'expense_delete'),
(34, 3, 'expense_view'),
(35, 3, 'items_add'),
(36, 3, 'items_edit'),
(37, 3, 'items_delete'),
(38, 3, 'items_view'),
(39, 3, 'suppliers_add'),
(40, 3, 'suppliers_edit'),
(41, 3, 'suppliers_delete'),
(42, 3, 'suppliers_view'),
(43, 3, 'purchase_add'),
(44, 3, 'purchase_edit'),
(45, 3, 'purchase_delete'),
(46, 3, 'purchase_view'),
(47, 3, 'purchase_report'),
(48, 3, 'purchase_payments_report'),
(49, 3, 'items_category_add'),
(50, 3, 'items_category_edit'),
(51, 3, 'items_category_delete'),
(52, 3, 'items_category_view'),
(53, 3, 'print_labels'),
(54, 3, 'expense_category_add'),
(55, 3, 'expense_category_edit'),
(56, 3, 'expense_category_delete'),
(57, 3, 'expense_category_view'),
(58, 3, 'dashboard_view'),
(59, 3, 'purchase_return_delete'),
(60, 3, 'purchase_return_view');

-- --------------------------------------------------------

--
-- Table structure for table `db_purchase`
--

CREATE TABLE `db_purchase` (
  `id` int(5) NOT NULL,
  `purchase_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(10,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(10,2) DEFAULT NULL,
  `discount_to_all_input` double(10,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(10,2) DEFAULT NULL,
  `subtotal` double(10,2) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(10,2) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(10,2) DEFAULT NULL,
  `purchase_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Purchase return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchase`
--

INSERT INTO `db_purchase` (`id`, `purchase_code`, `reference_no`, `purchase_date`, `purchase_status`, `supplier_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `purchase_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`, `return_bit`) VALUES
(1, 'PU0001', '1234', '2020-01-23', 'Received', 1, NULL, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 123900.00, NULL, 123900.00, '', 'Paid', 123900.00, '2020-01-23', '03:18:12 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitems`
--

CREATE TABLE `db_purchaseitems` (
  `id` int(5) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `purchase_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `purchase_qty` int(10) DEFAULT NULL,
  `price_per_unit` double(10,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(10,2) DEFAULT NULL,
  `unit_discount_per` double(10,2) DEFAULT NULL,
  `discount_amt` double(10,2) DEFAULT NULL,
  `unit_total_cost` double(10,2) DEFAULT NULL,
  `total_cost` double(10,2) DEFAULT NULL,
  `profit_margin_per` double(10,2) DEFAULT NULL,
  `unit_sales_price` double(10,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchaseitems`
--

INSERT INTO `db_purchaseitems` (`id`, `purchase_id`, `purchase_status`, `item_id`, `purchase_qty`, `price_per_unit`, `tax_id`, `tax_amt`, `unit_discount_per`, `discount_amt`, `unit_total_cost`, `total_cost`, `profit_margin_per`, `unit_sales_price`, `status`) VALUES
(1, 1, 'Received', 4, 1, 105000.00, 3, 18900.00, NULL, 0.00, 123900.00, 123900.00, 10.00, 136290.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchaseitemsreturn`
--

CREATE TABLE `db_purchaseitemsreturn` (
  `id` int(5) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` int(10) DEFAULT NULL,
  `price_per_unit` double(10,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(10,2) DEFAULT NULL,
  `unit_discount_per` double(10,2) DEFAULT NULL,
  `discount_amt` double(10,2) DEFAULT NULL,
  `unit_total_cost` double(10,2) DEFAULT NULL,
  `total_cost` double(10,2) DEFAULT NULL,
  `profit_margin_per` double(10,2) DEFAULT NULL,
  `unit_sales_price` double(10,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepayments`
--

CREATE TABLE `db_purchasepayments` (
  `id` int(5) NOT NULL,
  `purchase_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_purchasepayments`
--

INSERT INTO `db_purchasepayments` (`id`, `purchase_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(1, 1, '2020-01-23', 'Cash', 123900.00, '', '202.133.91.102', '202.133.91.102', '03:18:12', '2020-01-23', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasepaymentsreturn`
--

CREATE TABLE `db_purchasepaymentsreturn` (
  `id` int(5) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_purchasereturn`
--

CREATE TABLE `db_purchasereturn` (
  `id` int(5) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(10,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(10,2) DEFAULT NULL,
  `discount_to_all_input` double(10,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(10,2) DEFAULT NULL,
  `subtotal` double(10,2) DEFAULT NULL COMMENT 'Purchased qty',
  `round_off` double(10,2) DEFAULT NULL COMMENT 'Pending Qty',
  `grand_total` double(10,2) DEFAULT NULL,
  `return_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_roles`
--

CREATE TABLE `db_roles` (
  `id` int(5) NOT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_roles`
--

INSERT INTO `db_roles` (`id`, `role_name`, `description`, `status`) VALUES
(1, 'Admin', 'All Rights Permitted.', 1),
(2, 'Sales', 'Sales Permissions', 1),
(3, 'Purchase', 'Purchase Permissions ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sales`
--

CREATE TABLE `db_sales` (
  `id` int(5) NOT NULL,
  `sales_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_date` date DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(10,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(10,2) DEFAULT NULL,
  `discount_to_all_input` double(10,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(10,2) DEFAULT NULL,
  `subtotal` double(10,2) DEFAULT NULL,
  `round_off` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) DEFAULT NULL,
  `sales_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'sales return raised'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sales`
--

INSERT INTO `db_sales` (`id`, `sales_code`, `reference_no`, `sales_date`, `sales_status`, `customer_id`, `warehouse_id`, `other_charges_input`, `other_charges_tax_id`, `other_charges_amt`, `discount_to_all_input`, `discount_to_all_type`, `tot_discount_to_all_amt`, `subtotal`, `round_off`, `grand_total`, `sales_note`, `payment_status`, `paid_amount`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `pos`, `status`, `return_bit`) VALUES
(1, 'SL0001', NULL, '2020-01-22', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 490.00, 0.00, 490.00, NULL, 'Paid', 490.00, '2020-01-22', '10:38:47 pm', 'admin', '103.76.46.10', '103.76.46.10', NULL, 1, 1, NULL),
(2, 'SL0002', NULL, '2020-01-23', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 3150.00, 0.00, 3150.00, NULL, 'Paid', 3150.00, '2020-01-23', '03:11:32 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(3, 'SL0003', NULL, '2020-01-23', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 735.00, 0.00, 735.00, NULL, 'Paid', 735.00, '2020-01-23', '03:12:22 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(4, 'SL0004', NULL, '2020-01-23', 'Final', 3, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 15576.00, 0.00, 15576.00, NULL, 'Partial', 14576.00, '2020-01-23', '03:13:47 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(5, 'SL0005', NULL, '2020-01-23', 'Final', 4, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 19715.00, 0.00, 19715.00, NULL, 'Paid', 19715.00, '2020-01-23', '04:45:06 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(6, 'SL0006', NULL, '2020-01-23', 'Final', 5, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 358.00, 0.00, 358.00, NULL, 'Paid', 358.00, '2020-01-23', '04:45:43 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(7, 'SL0007', NULL, '2020-01-23', 'Final', 2, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 165752.00, 0.00, 165752.00, NULL, 'Partial', 165000.00, '2020-01-23', '05:28:22 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(8, 'SL0008', NULL, '2020-01-23', 'Final', 6, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 2280.00, 0.00, 2280.00, NULL, 'Paid', 2280.00, '2020-01-23', '05:52:36 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(9, 'SL0009', NULL, '2020-01-23', 'Final', 8, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 4200.00, 0.00, 4200.00, NULL, 'Paid', 4200.00, '2020-01-23', '06:05:02 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(10, 'SL0010', NULL, '2020-01-23', 'Final', 11, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 378.00, 0.00, 378.00, NULL, 'Paid', 378.00, '2020-01-23', '06:07:02 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(11, 'SL0011', NULL, '2020-01-23', 'Final', 12, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 508.00, 0.00, 508.00, NULL, 'Paid', 508.00, '2020-01-23', '06:07:47 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(12, 'SL0012', NULL, '2020-01-23', 'Final', 13, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 453.00, 0.00, 453.00, NULL, 'Paid', 453.00, '2020-01-23', '06:09:22 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(13, 'SL0013', NULL, '2020-01-23', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 37505.00, 0.00, 37505.00, NULL, 'Paid', 37505.00, '2020-01-23', '06:19:27 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(14, 'SL0014', NULL, '2020-01-23', 'Final', 5, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 18880.00, 0.00, 18880.00, NULL, 'Partial', 17000.00, '2020-01-23', '06:22:30 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(15, 'SL0015', NULL, '2020-01-25', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 52811.00, 0.00, 52811.00, NULL, 'Paid', 52811.00, '2020-01-25', '12:10:11 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(16, 'SL0016', NULL, '2020-01-25', 'Final', 3, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 252.00, 0.00, 252.00, NULL, 'Partial', 200.00, '2020-01-25', '12:13:00 pm', 'Sales', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(17, 'SL0017', NULL, '2020-01-25', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 371.00, 0.00, 371.00, NULL, 'Paid', 371.00, '2020-01-25', '07:47:14 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(18, 'SL0018', NULL, '2020-01-25', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 371.00, 0.00, 371.00, NULL, 'Paid', 371.00, '2020-01-25', '07:47:23 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(19, 'SL0019', NULL, '2020-01-25', 'Final', 5, NULL, NULL, NULL, NULL, 2.00, 'in_percentage', 675.00, 33766.00, -675.00, 33091.00, NULL, 'Paid', 33091.00, '2020-01-25', '07:48:41 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(20, 'SL0020', NULL, '2020-01-25', 'Final', 2, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 137470.00, 0.00, 137470.00, NULL, 'Paid', 137470.00, '2020-01-25', '07:56:19 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(21, 'SL0021', NULL, '2020-02-13', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 15576.00, 0.00, 15576.00, NULL, 'Paid', 15576.00, '2020-02-13', '02:32:20 pm', 'admin', '62.215.229.107', '62.215.229.107', NULL, 1, 1, NULL),
(22, 'SL0022', NULL, '2021-01-10', 'Final', 4, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 669.00, 0.00, 669.00, NULL, 'Paid', 669.00, '2021-01-10', '12:25:59 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(23, 'SL0023', NULL, '2021-01-10', 'Final', 6, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 1180.00, 0.00, 1180.00, NULL, 'Paid', 1180.00, '2021-01-10', '12:33:44 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(24, 'SL0024', NULL, '2021-01-10', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 2790.00, 0.00, 2790.00, NULL, 'Paid', 2790.00, '2021-01-10', '12:34:50 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(25, 'SL0025', NULL, '2021-01-10', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 33276.00, 0.00, 33276.00, NULL, 'Paid', 33276.00, '2021-01-10', '01:40:11 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(26, 'SL0026', NULL, '2021-01-10', 'Final', 3, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 143230.00, 0.00, 143230.00, NULL, 'Partial', 122000.00, '2021-01-10', '01:42:03 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1, 1, NULL),
(27, 'SL0027', NULL, '2022-12-26', 'Final', 3, NULL, NULL, NULL, NULL, 10.00, 'in_fixed', 10.00, 17151.00, -10.00, 17141.00, NULL, 'Unpaid', 0.00, '2022-12-26', '06:17:50 pm', 'admin', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(28, 'SL0028', '15012023', '2023-01-15', 'Final', 18, NULL, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 34456.00, NULL, 34456.00, '', 'Paid', 34456.00, '2023-01-15', '05:22:59 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, NULL, 1, NULL),
(29, 'SL0029', '16012023', '2023-01-16', 'Quotation', 1, NULL, 1.00, 4, 1.05, 200.00, 'in_fixed', 200.00, 787.80, 0.15, 589.00, 'test by Rajib', 'Paid', 589.00, '2023-01-16', '04:21:53 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, NULL, 1, NULL),
(30, 'SL0030', '17012023', '2023-01-17', 'Final', 3, NULL, NULL, NULL, NULL, NULL, 'in_percentage', NULL, 17224.35, -0.35, 17224.00, 'test by rajib', 'Unpaid', 0.00, '2023-01-17', '03:16:14 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, NULL, 1, NULL),
(31, 'SL0031', NULL, '2023-01-17', 'Final', 1, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 1360.00, 0.00, 1360.00, NULL, 'Paid', 1360.00, '2023-01-17', '03:20:42 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(32, 'SL0032', NULL, '2023-02-07', 'Final', 2, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 1100.00, 0.00, 1100.00, NULL, 'Paid', 1100.00, '2023-02-07', '05:17:12 pm', 'admin', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(33, 'SL0033', NULL, '2023-05-24', 'Final', 5, NULL, NULL, NULL, NULL, 20.00, 'in_percentage', 989.00, 4945.00, -989.00, 3956.00, NULL, 'Paid', 3956.00, '2023-05-24', '07:39:42 pm', 'admin', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(34, 'SL0034', NULL, '2023-08-14', 'Final', 6, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 75520.00, 0.00, 75520.00, NULL, 'Paid', 75520.00, '2023-08-14', '03:03:20 pm', 'admin', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(35, 'SL0035', NULL, '2023-08-14', 'Final', 6, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 126.00, 0.00, 126.00, NULL, 'Partial', 100.00, '2023-08-14', '03:44:27 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(36, 'SL0036', NULL, '2023-08-14', 'Final', 5, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 2751.00, 0.00, 2751.00, NULL, 'Partial', 2500.00, '2023-08-14', '03:48:00 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(37, 'SL0037', '', '2023-08-14', 'Final', 5, NULL, NULL, NULL, NULL, 500.00, 'in_fixed', 500.00, 16676.00, NULL, 16176.00, '', 'Partial', 16100.00, '2023-08-14', '03:50:54 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, NULL, 1, NULL),
(38, 'SL0038', NULL, '2023-08-14', 'Final', 4, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 2200.00, 0.00, 2200.00, NULL, 'Partial', 2000.00, '2023-08-14', '03:54:59 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL),
(39, 'SL0039', '', '2023-08-14', 'Final', 4, NULL, NULL, NULL, NULL, 100.00, 'in_fixed', 100.00, 1100.00, NULL, 1000.00, '', 'Partial', 800.00, '2023-08-14', '03:57:39 pm', 'mafizur', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, NULL, 1, NULL),
(40, 'SL0040', NULL, '2023-08-16', 'Final', 6, NULL, NULL, NULL, NULL, 0.00, 'in_percentage', 0.00, 1100.00, 0.00, 1100.00, NULL, 'Paid', 1100.00, '2023-08-16', '11:21:18 am', 'admin', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitems`
--

CREATE TABLE `db_salesitems` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `sales_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `sales_qty` int(10) DEFAULT NULL,
  `price_per_unit` double(10,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(10,2) DEFAULT NULL,
  `unit_discount_per` double(10,2) DEFAULT NULL,
  `discount_amt` double(10,2) DEFAULT NULL,
  `unit_total_cost` double(10,2) DEFAULT NULL,
  `total_cost` double(10,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salesitems`
--

INSERT INTO `db_salesitems` (`id`, `sales_id`, `sales_status`, `item_id`, `sales_qty`, `price_per_unit`, `tax_id`, `tax_amt`, `unit_discount_per`, `discount_amt`, `unit_total_cost`, `total_cost`, `status`) VALUES
(1, 1, 'Final', 1, 2, 245.10, 1, 24.03, NULL, NULL, 245.10, 490.20, 1),
(2, 2, 'Final', 3, 2, 1575.00, 4, 150.00, NULL, NULL, 1575.00, 3150.00, 1),
(3, 3, 'Final', 1, 3, 245.10, 1, 22.49, NULL, NULL, 245.10, 735.30, 1),
(4, 4, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(5, 5, 'Final', 8, 1, 18880.00, 3, 1600.00, NULL, NULL, 18880.00, 18880.00, 1),
(6, 5, 'Final', 1, 1, 245.10, 1, 22.49, NULL, NULL, 245.10, 245.10, 1),
(7, 5, 'Final', 15, 1, 590.00, 3, 50.00, NULL, NULL, 590.00, 590.00, 1),
(8, 6, 'Final', 14, 1, 357.50, 6, 32.50, NULL, NULL, 357.50, 357.50, 1),
(9, 7, 'Final', 8, 3, 18880.00, 3, 1600.00, NULL, NULL, 18880.00, 56640.00, 1),
(10, 7, 'Final', 1, 2, 245.10, 1, 22.49, NULL, NULL, 245.10, 490.20, 1),
(11, 7, 'Final', 6, 2, 52.50, 4, 5.00, NULL, NULL, 52.50, 105.00, 1),
(12, 7, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(13, 7, 'Final', 13, 3, 17700.00, 3, 1500.00, NULL, NULL, 17700.00, 53100.00, 1),
(14, 7, 'Final', 11, 2, 2625.00, 4, 250.00, NULL, NULL, 2625.00, 5250.00, 1),
(15, 7, 'Final', 2, 3, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 46728.00, 1),
(16, 7, 'Final', 9, 1, 81.90, 4, 7.80, NULL, NULL, 81.90, 81.90, 1),
(17, 7, 'Final', 15, 1, 590.00, 3, 50.00, NULL, NULL, 590.00, 590.00, 1),
(18, 7, 'Final', 18, 1, 708.00, 3, 60.00, NULL, NULL, 708.00, 708.00, 1),
(19, 7, 'Final', 14, 1, 357.50, 6, 32.50, NULL, NULL, 357.50, 357.50, 1),
(20, 7, 'Final', 3, 1, 1575.00, 4, 150.00, NULL, NULL, 1575.00, 1575.00, 1),
(21, 8, 'Final', 21, 1, 1179.99, 3, 100.00, NULL, NULL, 1179.99, 1179.99, 1),
(22, 8, 'Final', 10, 1, 1099.99, 6, 100.00, NULL, NULL, 1099.99, 1099.99, 1),
(23, 9, 'Final', 11, 1, 2625.00, 4, 250.00, NULL, NULL, 2625.00, 2625.00, 1),
(24, 9, 'Final', 3, 1, 1575.00, 4, 150.00, NULL, NULL, 1575.00, 1575.00, 1),
(25, 10, 'Final', 7, 3, 126.00, 4, 12.00, NULL, NULL, 126.00, 378.00, 1),
(26, 11, 'Final', 6, 5, 52.50, 4, 5.00, NULL, NULL, 52.50, 262.50, 1),
(27, 11, 'Final', 9, 3, 81.90, 4, 7.80, NULL, NULL, 81.90, 245.70, 1),
(28, 12, 'Final', 1, 1, 245.10, 1, 22.49, NULL, NULL, 245.10, 245.10, 1),
(29, 12, 'Final', 9, 1, 81.90, 4, 7.80, NULL, NULL, 81.90, 81.90, 1),
(30, 12, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(31, 13, 'Final', 8, 1, 18880.00, 3, 1600.00, NULL, NULL, 18880.00, 18880.00, 1),
(32, 13, 'Final', 1, 1, 245.10, 1, 22.49, NULL, NULL, 245.10, 245.10, 1),
(33, 13, 'Final', 6, 1, 52.50, 4, 5.00, NULL, NULL, 52.50, 52.50, 1),
(34, 13, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(35, 13, 'Final', 11, 1, 2625.00, 4, 250.00, NULL, NULL, 2625.00, 2625.00, 1),
(36, 13, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(37, 14, 'Final', 8, 1, 18880.00, 3, 1600.00, NULL, NULL, 18880.00, 18880.00, 1),
(38, 15, 'Final', 8, 1, 18880.00, 3, 1600.00, NULL, NULL, 18880.00, 18880.00, 1),
(39, 15, 'Final', 1, 1, 245.10, 1, 22.49, NULL, NULL, 245.10, 245.10, 1),
(40, 15, 'Final', 6, 1, 52.50, 4, 5.00, NULL, NULL, 52.50, 52.50, 1),
(41, 15, 'Final', 13, 1, 17700.00, 3, 1500.00, NULL, NULL, 17700.00, 17700.00, 1),
(42, 15, 'Final', 14, 1, 357.50, 6, 32.50, NULL, NULL, 357.50, 357.50, 1),
(43, 15, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(44, 16, 'Final', 7, 2, 126.00, 4, 12.00, NULL, NULL, 126.00, 252.00, 1),
(45, 17, 'Final', 1, 1, 245.10, 1, 22.49, NULL, NULL, 245.10, 245.10, 1),
(46, 17, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(47, 18, 'Final', 1, 1, 245.10, 1, 22.49, NULL, NULL, 245.10, 245.10, 1),
(48, 18, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(49, 19, 'Final', 1, 2, 245.10, 1, 22.49, NULL, NULL, 245.10, 490.20, 1),
(50, 19, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(51, 19, 'Final', 13, 1, 17700.00, 3, 1500.00, NULL, NULL, 17700.00, 17700.00, 1),
(52, 20, 'Final', 17, 1, 1179.99, 3, 100.00, NULL, NULL, 1179.99, 1179.99, 1),
(53, 20, 'Final', 4, 1, 136290.00, 3, 11550.00, NULL, NULL, 136290.00, 136290.00, 1),
(54, 21, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(55, 22, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(56, 22, 'Final', 6, 1, 52.50, 4, 5.00, NULL, NULL, 52.50, 52.50, 1),
(57, 22, 'Final', 1, 2, 245.10, 1, 22.49, NULL, NULL, 245.10, 490.20, 1),
(58, 23, 'Final', 17, 1, 1179.99, 3, 100.00, NULL, NULL, 1179.99, 1179.99, 1),
(59, 24, 'Final', 16, 1, 1100.00, 6, 100.00, NULL, NULL, 1100.00, 1100.00, 1),
(60, 24, 'Final', 19, 1, 590.00, 3, 50.00, NULL, NULL, 590.00, 590.00, 1),
(61, 24, 'Final', 10, 1, 1099.99, 6, 100.00, NULL, NULL, 1099.99, 1099.99, 1),
(62, 25, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(63, 25, 'Final', 13, 1, 17700.00, 3, 1500.00, NULL, NULL, 17700.00, 17700.00, 1),
(64, 26, 'Final', 11, 2, 2625.00, 4, 250.00, NULL, NULL, 2625.00, 5250.00, 1),
(65, 26, 'Final', 4, 1, 136290.00, 3, 11550.00, NULL, NULL, 136290.00, 136290.00, 1),
(66, 26, 'Final', 15, 1, 590.00, 3, 50.00, NULL, NULL, 590.00, 590.00, 1),
(67, 26, 'Final', 10, 1, 1099.99, 6, 100.00, NULL, NULL, 1099.99, 1099.99, 1),
(68, 27, 'Final', 3, 1, 1575.00, 4, 150.00, NULL, NULL, 1575.00, 1575.00, 1),
(69, 27, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(70, 28, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, 0.00, 15576.00, 15576.00, 1),
(71, 28, 'Final', 8, 1, 18880.00, 3, 1600.00, NULL, 0.00, 18880.00, 18880.00, 1),
(72, 29, 'Quotation', 1, 3, 245.10, 1, 22.49, NULL, NULL, 245.10, 735.30, 1),
(73, 29, 'Quotation', 6, 1, 52.50, 4, 5.00, NULL, NULL, 52.50, 52.50, 1),
(74, 30, 'Final', 12, 1, 1173.50, 6, 117.35, NULL, 0.00, 1290.85, 1290.85, 1),
(75, 30, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, 0.00, 15576.00, 15576.00, 1),
(76, 30, 'Final', 14, 1, 357.50, 6, 32.50, NULL, 0.00, 357.50, 357.50, 1),
(77, 31, 'Final', 9, 1, 81.90, 4, 7.80, NULL, NULL, 81.90, 81.90, 1),
(78, 31, 'Final', 6, 1, 52.50, 4, 5.00, NULL, NULL, 52.50, 52.50, 1),
(79, 31, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(80, 31, 'Final', 10, 1, 1099.99, 6, 100.00, NULL, NULL, 1099.99, 1099.99, 1),
(81, 32, 'Final', 10, 1, 1099.99, 6, 100.00, NULL, NULL, 1099.99, 1099.99, 1),
(82, 33, 'Final', 12, 3, 1290.85, 6, 387.25, NULL, NULL, 1290.85, 3872.55, 1),
(83, 33, 'Final', 14, 3, 357.50, 6, 32.50, NULL, NULL, 357.50, 1072.50, 1),
(84, 34, 'Final', 8, 4, 18880.00, 3, 1600.00, NULL, NULL, 18880.00, 75520.00, 1),
(85, 35, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(86, 36, 'Final', 7, 1, 126.00, 4, 12.00, NULL, NULL, 126.00, 126.00, 1),
(87, 36, 'Final', 11, 1, 2625.00, 4, 250.00, NULL, NULL, 2625.00, 2625.00, 1),
(88, 37, 'Final', 16, 1, 1100.00, 6, 100.00, NULL, NULL, 1100.00, 1100.00, 1),
(89, 37, 'Final', 2, 1, 15576.00, 3, 1320.00, NULL, NULL, 15576.00, 15576.00, 1),
(90, 38, 'Final', 16, 2, 1100.00, 6, 100.00, NULL, NULL, 1100.00, 2200.00, 1),
(91, 39, 'Final', 16, 1, 1100.00, 6, 100.00, NULL, NULL, 1100.00, 1100.00, 1),
(92, 40, 'Final', 16, 1, 1100.00, 6, 100.00, NULL, NULL, 1100.00, 1100.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_salesitemsreturn`
--

CREATE TABLE `db_salesitemsreturn` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `return_qty` int(10) DEFAULT NULL,
  `price_per_unit` double(10,2) DEFAULT NULL,
  `tax_id` int(5) DEFAULT NULL,
  `tax_amt` double(10,2) DEFAULT NULL,
  `unit_discount_per` double(10,2) DEFAULT NULL,
  `discount_amt` double(10,2) DEFAULT NULL,
  `unit_total_cost` double(10,2) DEFAULT NULL,
  `total_cost` double(10,2) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salespayments`
--

CREATE TABLE `db_salespayments` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `change_return` double(10,2) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_salespayments`
--

INSERT INTO `db_salespayments` (`id`, `sales_id`, `payment_date`, `payment_type`, `payment`, `payment_note`, `change_return`, `system_ip`, `system_name`, `created_time`, `created_date`, `created_by`, `status`) VALUES
(1, 1, '2020-01-22', 'Cash', 490.00, '', 0.00, '103.76.46.10', '103.76.46.10', '10:38:47', '2020-01-22', 'admin', 1),
(2, 2, '2020-01-23', 'Cash', 3150.00, '', 0.00, '202.133.91.102', '202.133.91.102', '03:11:32', '2020-01-23', 'admin', 1),
(3, 3, '2020-01-23', 'Card', 735.00, '', 0.00, '202.133.91.102', '202.133.91.102', '03:12:22', '2020-01-23', 'admin', 1),
(4, 4, '2020-01-23', 'Cash', 10000.00, '', 0.00, '202.133.91.102', '202.133.91.102', '03:13:47', '2020-01-23', 'admin', 1),
(5, 4, '2020-01-23', 'Cash', 4576.00, '', NULL, '202.133.91.102', '202.133.91.102', '03:16:17', '2020-01-23', 'admin', 1),
(6, 5, '2020-01-23', 'Cash', 19715.00, '', 285.00, '202.133.91.102', '202.133.91.102', '04:45:06', '2020-01-23', 'Sales', 1),
(7, 6, '2020-01-23', 'Cash', 358.00, '', 42.00, '202.133.91.102', '202.133.91.102', '04:45:43', '2020-01-23', 'Sales', 1),
(8, 7, '2020-01-23', 'Cash', 165000.00, '', 0.00, '202.133.91.102', '202.133.91.102', '05:28:22', '2020-01-23', 'Sales', 1),
(9, 8, '2020-01-23', 'Cash', 2280.00, '', 22720.00, '202.133.91.102', '202.133.91.102', '05:52:36', '2020-01-23', 'Sales', 1),
(10, 9, '2020-01-23', 'Cash', 4200.00, '', 0.00, '202.133.91.102', '202.133.91.102', '06:05:02', '2020-01-23', 'Sales', 1),
(11, 10, '2020-01-23', 'Cash', 378.00, '', 122.00, '202.133.91.102', '202.133.91.102', '06:07:02', '2020-01-23', 'Sales', 1),
(12, 11, '2020-01-23', 'Cash', 508.00, '', 2.00, '202.133.91.102', '202.133.91.102', '06:07:47', '2020-01-23', 'Sales', 1),
(13, 12, '2020-01-23', 'Cash', 453.00, '', 47.00, '202.133.91.102', '202.133.91.102', '06:09:22', '2020-01-23', 'Sales', 1),
(14, 13, '2020-01-23', 'Cash', 37505.00, '', 0.00, '202.133.91.102', '202.133.91.102', '06:19:27', '2020-01-23', 'Sales', 1),
(15, 14, '2020-01-23', 'Cash', 17000.00, '', 0.00, '202.133.91.102', '202.133.91.102', '06:22:30', '2020-01-23', 'Sales', 1),
(16, 15, '2020-01-25', 'Cash', 52811.00, '', 0.00, '202.133.91.102', '202.133.91.102', '12:10:11', '2020-01-25', 'Sales', 1),
(17, 16, '2020-01-25', 'Cash', 200.00, '', 0.00, '202.133.91.102', '202.133.91.102', '12:13:00', '2020-01-25', 'Sales', 1),
(18, 17, '2020-01-25', 'Cash', 371.00, '', 129.00, '202.133.91.102', '202.133.91.102', '07:47:14', '2020-01-25', 'admin', 1),
(19, 18, '2020-01-25', 'Cash', 371.00, '', 129.00, '202.133.91.102', '202.133.91.102', '07:47:23', '2020-01-25', 'admin', 1),
(20, 19, '2020-01-25', 'Cash', 33091.00, '', 9.00, '202.133.91.102', '202.133.91.102', '07:48:41', '2020-01-25', 'admin', 1),
(21, 20, '2020-01-25', 'Cash', 137470.00, '', 0.00, '202.133.91.102', '202.133.91.102', '07:56:19', '2020-01-25', 'admin', 1),
(22, 21, '2020-02-13', 'Cash', 15576.00, '', 0.00, '62.215.229.107', '62.215.229.107', '02:32:20', '2020-02-13', 'admin', 1),
(23, 22, '2021-01-10', 'Cash', 669.00, '', 31.00, '202.133.91.102', '202.133.91.102', '12:25:59', '2021-01-10', 'admin', 1),
(24, 23, '2021-01-10', 'Cash', 1180.00, '', 0.00, '202.133.91.102', '202.133.91.102', '12:33:44', '2021-01-10', 'admin', 1),
(25, 24, '2021-01-10', 'Cash', 2790.00, '', 210.00, '202.133.91.102', '202.133.91.102', '12:34:50', '2021-01-10', 'admin', 1),
(26, 25, '2021-01-10', 'Cash', 33276.00, '', 1724.00, '202.133.91.102', '202.133.91.102', '01:40:11', '2021-01-10', 'admin', 1),
(27, 26, '2021-01-10', 'Cash', 122000.00, '', 0.00, '202.133.91.102', '202.133.91.102', '01:42:03', '2021-01-10', 'admin', 1),
(28, 28, '2023-01-15', 'Cash', 34456.00, 'test by rajib', NULL, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '05:22:59', '2023-01-15', 'mafizur', 1),
(29, 29, '2023-01-16', 'Cash', 589.00, 'test by rajib', NULL, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '04:21:53', '2023-01-16', 'mafizur', 1),
(30, 31, '2023-01-17', 'Cash', 1360.00, 'test by rajib', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:20:42', '2023-01-17', 'mafizur', 1),
(31, 32, '2023-02-07', 'Card', 1100.00, 'gs', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '05:17:12', '2023-02-07', 'admin', 1),
(32, 33, '2023-05-24', 'Cash', 3956.00, 'done', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '07:39:42', '2023-05-24', 'admin', 1),
(33, 34, '2023-08-14', 'Cash', 75520.00, '', 480.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:03:20', '2023-08-14', 'admin', 1),
(34, 35, '2023-08-14', 'Cash', 100.00, '', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:44:27', '2023-08-14', 'mafizur', 1),
(35, 36, '2023-08-14', 'Cash', 2500.00, '', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:48:00', '2023-08-14', 'mafizur', 1),
(36, 37, '2023-08-14', 'Cash', 16100.00, '', NULL, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:50:54', '2023-08-14', 'mafizur', 1),
(37, 38, '2023-08-14', 'Cash', 2000.00, '', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:54:59', '2023-08-14', 'mafizur', 1),
(38, 39, '2023-08-14', 'Cash', 800.00, '', NULL, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '03:57:39', '2023-08-14', 'mafizur', 1),
(39, 40, '2023-08-16', 'Cash', 1100.00, '', 0.00, '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '11:21:18', '2023-08-16', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_salespaymentsreturn`
--

CREATE TABLE `db_salespaymentsreturn` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `change_return` double(10,2) DEFAULT NULL COMMENT 'Refunding the greater amount',
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_salesreturn`
--

CREATE TABLE `db_salesreturn` (
  `id` int(5) NOT NULL,
  `sales_id` int(5) DEFAULT NULL,
  `return_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(5) DEFAULT NULL,
  `warehouse_id` int(5) DEFAULT NULL,
  `other_charges_input` double(10,2) DEFAULT NULL,
  `other_charges_tax_id` int(5) DEFAULT NULL,
  `other_charges_amt` double(10,2) DEFAULT NULL,
  `discount_to_all_input` double(10,2) DEFAULT NULL,
  `discount_to_all_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tot_discount_to_all_amt` double(10,2) DEFAULT NULL,
  `subtotal` double(10,2) DEFAULT NULL,
  `round_off` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) DEFAULT NULL,
  `return_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `pos` int(1) DEFAULT NULL COMMENT '1=yes 0=no',
  `status` int(1) DEFAULT NULL,
  `return_bit` int(1) DEFAULT NULL COMMENT 'Return raised or not 1 or null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_sitesettings`
--

CREATE TABLE `db_sitesettings` (
  `id` int(5) NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `language_id` int(5) DEFAULT NULL,
  `currency_id` int(5) DEFAULT NULL,
  `currency_placement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` int(5) DEFAULT NULL,
  `sales_discount` double(10,2) DEFAULT NULL,
  `site_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` mediumtext COLLATE utf8mb4_unicode_ci,
  `meta_keywords` mediumtext COLLATE utf8mb4_unicode_ci,
  `currencysymbol_id` int(5) DEFAULT NULL,
  `regno_key` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebook_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitter_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtube_url` mediumtext COLLATE utf8mb4_unicode_ci,
  `analytic_code` mediumtext COLLATE utf8mb4_unicode_ci,
  `fav_icon` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `footer_logo` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'path',
  `company_id` int(1) DEFAULT NULL,
  `purchase_code` mediumtext COLLATE utf8mb4_unicode_ci,
  `change_return` int(1) DEFAULT NULL COMMENT 'show in pos',
  `sales_invoice_format_id` int(5) DEFAULT NULL,
  `sales_invoice_footer_text` text COLLATE utf8mb4_unicode_ci,
  `round_off` int(1) DEFAULT NULL COMMENT '1=Enble, 0=Disable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_sitesettings`
--

INSERT INTO `db_sitesettings` (`id`, `version`, `site_name`, `logo`, `language_id`, `currency_id`, `currency_placement`, `timezone`, `date_format`, `time_format`, `sales_discount`, `site_url`, `site_title`, `meta_title`, `meta_desc`, `meta_keywords`, `currencysymbol_id`, `regno_key`, `copyright`, `facebook_url`, `twitter_url`, `youtube_url`, `analytic_code`, `fav_icon`, `footer_logo`, `company_id`, `purchase_code`, `change_return`, `sales_invoice_format_id`, `sales_invoice_footer_text`, `round_off`) VALUES
(1, '1.6.3', 'Mysoftheaven (BD) LTD', 'invenoty_with_POS1.png', 1, 31, 'Left', 'Asia/Dhaka\r\n', 'dd-mm-yyyy', 12, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, ' This is footer text. You can set it from Site Settings.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_smsapi`
--

CREATE TABLE `db_smsapi` (
  `id` int(5) NOT NULL,
  `info` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_value` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smsapi`
--

INSERT INTO `db_smsapi` (`id`, `info`, `key`, `key_value`, `delete_bit`) VALUES
(150, 'url', 'weblink', 'http://www.example.in/api/sendhttp.php', NULL),
(151, 'mobile', 'mobiles', '', NULL),
(152, 'message', 'message', '', NULL),
(153, '', 'authkey', 'xxxxxxxxxxxxxxxxxxxx', NULL),
(154, '', 'sender', 'ULTPOS', NULL),
(155, '', 'route', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_smstemplates`
--

CREATE TABLE `db_smstemplates` (
  `id` int(5) NOT NULL,
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `variables` text COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `undelete_bit` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_smstemplates`
--

INSERT INTO `db_smstemplates` (`id`, `template_name`, `content`, `variables`, `company_id`, `status`, `undelete_bit`) VALUES
(1, 'GREETING TO CUSTOMER ON SALES', 'Hi {{customer_name}},\r\nYour sales Id is {{sales_id}},\r\nSales Date {{sales_date}},\r\nTotal amount  {{sales_amount}},\r\nYou have paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{sales_id}}<br>\r\n{{sales_date}}<br>\r\n{{sales_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', NULL, 1, 1),
(2, 'GREETING TO CUSTOMER ON SALES RETURN', 'Hi {{customer_name}},\r\nYour sales return Id is {{return_id}},\r\nReturn Date {{return_date}},\r\nTotal amount  {{return_amount}},\r\nWe paid  {{paid_amt}},\r\nand due amount is  {{due_amt}}\r\nThank you Visit Again', '{{customer_name}}<br>                          \r\n{{return_id}}<br>\r\n{{return_date}}<br>\r\n{{return_amount}}<br>\r\n{{paid_amt}}<br>\r\n{{due_amt}}<br>\r\n{{company_name}}<br>\r\n{{company_mobile}}<br>\r\n{{company_address}}<br>\r\n{{company_website}}<br>\r\n{{company_email}}<br>', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_sobpayments`
--

CREATE TABLE `db_sobpayments` (
  `id` int(5) NOT NULL,
  `supplier_id` int(5) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(10,2) DEFAULT NULL,
  `payment_note` mediumtext COLLATE utf8mb4_unicode_ci,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_states`
--

CREATE TABLE `db_states` (
  `id` int(5) NOT NULL,
  `state_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(4050) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_states`
--

INSERT INTO `db_states` (`id`, `state_code`, `state`, `country_code`, `country_id`, `country`, `added_on`, `company_id`, `status`) VALUES
(52, NULL, 'New York', NULL, NULL, 'USA', NULL, NULL, 1),
(54, NULL, 'Dhaka', NULL, NULL, 'Bangladesh', NULL, NULL, 1),
(55, NULL, 'Chittagong', NULL, NULL, 'Bangladesh', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_stockentry`
--

CREATE TABLE `db_stockentry` (
  `id` int(5) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_stockentry`
--

INSERT INTO `db_stockentry` (`id`, `entry_date`, `item_id`, `qty`, `status`) VALUES
(1, '2020-01-22', 1, 50, 1),
(2, '2020-01-23', 2, 20, 1),
(3, '2020-01-23', 2, 5, 1),
(4, '2020-01-23', 3, 20, 1),
(5, '2020-01-23', 4, 10, 1),
(6, '2020-01-23', 6, 40, 1),
(7, '2020-01-23', 7, 30, 1),
(8, '2020-01-23', 8, 50, 1),
(9, '2020-01-23', 9, 20, 1),
(10, '2020-01-23', 10, 10, 1),
(11, '2020-01-23', 11, 25, 1),
(12, '2020-01-23', 12, 5, 1),
(13, '2020-01-23', 13, 30, 1),
(14, '2020-01-23', 14, 20, 1),
(15, '2020-01-23', 15, 15, 1),
(16, '2020-01-23', 16, 10, 1),
(17, '2020-01-23', 17, 14, 1),
(18, '2020-01-23', 18, 19, 1),
(19, '2020-01-23', 19, 10, 1),
(20, '2020-01-23', 20, 9, 1),
(21, '2020-01-23', 21, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_suppliers`
--

CREATE TABLE `db_suppliers` (
  `id` int(5) NOT NULL,
  `supplier_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vatin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` double(10,2) DEFAULT NULL,
  `purchase_due` double(10,2) DEFAULT NULL,
  `purchase_return_due` double(10,2) DEFAULT NULL,
  `country_id` int(5) DEFAULT NULL,
  `state_id` int(5) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_suppliers`
--

INSERT INTO `db_suppliers` (`id`, `supplier_code`, `supplier_name`, `mobile`, `phone`, `email`, `gstin`, `tax_number`, `vatin`, `opening_balance`, `purchase_due`, `purchase_return_due`, `country_id`, `state_id`, `city`, `postcode`, `address`, `system_ip`, `system_name`, `created_date`, `created_time`, `created_by`, `company_id`, `status`) VALUES
(1, 'SP0001', 'Jamil Hossain', '251254154', '', 'jamil.test@mysoftheaven.com', '', '', NULL, 0.00, 0.00, NULL, 3, 54, 'Dhaka', '', '', '202.133.91.102', '202.133.91.102', '2020-01-22', '07:27:08 pm', 'admin', NULL, 1),
(2, 'SP0002', 'oneplus', '01631206078', '01775350203', 'shahidullah.mysoftheaven@gmail.com', '111222', '333444', NULL, 0.00, NULL, NULL, 3, 54, '', '', '', '103.239.255.216', '103-239-255-216.Dhaka.carnival.com.bd', '2023-08-16', '11:19:02 am', 'admin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_tax`
--

CREATE TABLE `db_tax` (
  `id` int(5) NOT NULL,
  `tax_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `group_bit` int(1) DEFAULT NULL COMMENT '1=Yes, 0=No',
  `subtax_ids` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tax groups IDs',
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_tax`
--

INSERT INTO `db_tax` (`id`, `tax_name`, `tax`, `group_bit`, `subtax_ids`, `status`) VALUES
(1, 'SGST 9%', 9.00, NULL, NULL, 1),
(2, 'ISGT 9%', 9.00, NULL, NULL, 1),
(3, 'GST 18%', 18.00, 1, '1,2', 1),
(4, 'Vat 5%', 5.00, NULL, NULL, 1),
(5, 'Tax 18%', 18.00, NULL, NULL, 1),
(6, 'Tax 10%', 10.00, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_timezone`
--

CREATE TABLE `db_timezone` (
  `id` int(5) NOT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_timezone`
--

INSERT INTO `db_timezone` (`id`, `timezone`, `status`) VALUES
(1, 'Africa/Abidjan\r', 1),
(2, 'Africa/Accra\r', 1),
(3, 'Africa/Addis_Ababa\r', 1),
(4, 'Africa/Algiers\r', 1),
(5, 'Africa/Asmara\r', 1),
(6, 'Africa/Asmera\r', 1),
(7, 'Africa/Bamako\r', 1),
(8, 'Africa/Bangui\r', 1),
(9, 'Africa/Banjul\r', 1),
(10, 'Africa/Bissau\r', 1),
(11, 'Africa/Blantyre\r', 1),
(12, 'Africa/Brazzaville\r', 1),
(13, 'Africa/Bujumbura\r', 1),
(14, 'Africa/Cairo\r', 1),
(15, 'Africa/Casablanca\r', 1),
(16, 'Africa/Ceuta\r', 1),
(17, 'Africa/Conakry\r', 1),
(18, 'Africa/Dakar\r', 1),
(19, 'Africa/Dar_es_Salaam\r', 1),
(20, 'Africa/Djibouti\r', 1),
(21, 'Africa/Douala\r', 1),
(22, 'Africa/El_Aaiun\r', 1),
(23, 'Africa/Freetown\r', 1),
(24, 'Africa/Gaborone\r', 1),
(25, 'Africa/Harare\r', 1),
(26, 'Africa/Johannesburg\r', 1),
(27, 'Africa/Juba\r', 1),
(28, 'Africa/Kampala\r', 1),
(29, 'Africa/Khartoum\r', 1),
(30, 'Africa/Kigali\r', 1),
(31, 'Africa/Kinshasa\r', 1),
(32, 'Africa/Lagos\r', 1),
(33, 'Africa/Libreville\r', 1),
(34, 'Africa/Lome\r', 1),
(35, 'Africa/Luanda\r', 1),
(36, 'Africa/Lubumbashi\r', 1),
(37, 'Africa/Lusaka\r', 1),
(38, 'Africa/Malabo\r', 1),
(39, 'Africa/Maputo\r', 1),
(40, 'Africa/Maseru\r', 1),
(41, 'Africa/Mbabane\r', 1),
(42, 'Africa/Mogadishu\r', 1),
(43, 'Africa/Monrovia\r', 1),
(44, 'Africa/Nairobi\r', 1),
(45, 'Africa/Ndjamena\r', 1),
(46, 'Africa/Niamey\r', 1),
(47, 'Africa/Nouakchott\r', 1),
(48, 'Africa/Ouagadougou\r', 1),
(49, 'Africa/Porto-Novo\r', 1),
(50, 'Africa/Sao_Tome\r', 1),
(51, 'Africa/Timbuktu\r', 1),
(52, 'Africa/Tripoli\r', 1),
(53, 'Africa/Tunis\r', 1),
(54, 'Africa/Windhoek\r', 1),
(55, 'AKST9AKDT\r', 1),
(56, 'America/Adak\r', 1),
(57, 'America/Anchorage\r', 1),
(58, 'America/Anguilla\r', 1),
(59, 'America/Antigua\r', 1),
(60, 'America/Araguaina\r', 1),
(61, 'America/Argentina/Buenos_Aires\r', 1),
(62, 'America/Argentina/Catamarca\r', 1),
(63, 'America/Argentina/ComodRivadavia\r', 1),
(64, 'America/Argentina/Cordoba\r', 1),
(65, 'America/Argentina/Jujuy\r', 1),
(66, 'America/Argentina/La_Rioja\r', 1),
(67, 'America/Argentina/Mendoza\r', 1),
(68, 'America/Argentina/Rio_Gallegos\r', 1),
(69, 'America/Argentina/Salta\r', 1),
(70, 'America/Argentina/San_Juan\r', 1),
(71, 'America/Argentina/San_Luis\r', 1),
(72, 'America/Argentina/Tucuman\r', 1),
(73, 'America/Argentina/Ushuaia\r', 1),
(74, 'America/Aruba\r', 1),
(75, 'America/Asuncion\r', 1),
(76, 'America/Atikokan\r', 1),
(77, 'America/Atka\r', 1),
(78, 'America/Bahia\r', 1),
(79, 'America/Bahia_Banderas\r', 1),
(80, 'America/Barbados\r', 1),
(81, 'America/Belem\r', 1),
(82, 'America/Belize\r', 1),
(83, 'America/Blanc-Sablon\r', 1),
(84, 'America/Boa_Vista\r', 1),
(85, 'America/Bogota\r', 1),
(86, 'America/Boise\r', 1),
(87, 'America/Buenos_Aires\r', 1),
(88, 'America/Cambridge_Bay\r', 1),
(89, 'America/Campo_Grande\r', 1),
(90, 'America/Cancun\r', 1),
(91, 'America/Caracas\r', 1),
(92, 'America/Catamarca\r', 1),
(93, 'America/Cayenne\r', 1),
(94, 'America/Cayman\r', 1),
(95, 'America/Chicago\r', 1),
(96, 'America/Chihuahua\r', 1),
(97, 'America/Coral_Harbour\r', 1),
(98, 'America/Cordoba\r', 1),
(99, 'America/Costa_Rica\r', 1),
(100, 'America/Creston\r', 1),
(101, 'America/Cuiaba\r', 1),
(102, 'America/Curacao\r', 1),
(103, 'America/Danmarkshavn\r', 1),
(104, 'America/Dawson\r', 1),
(105, 'America/Dawson_Creek\r', 1),
(106, 'America/Denver\r', 1),
(107, 'America/Detroit\r', 1),
(108, 'America/Dominica\r', 1),
(109, 'America/Edmonton\r', 1),
(110, 'America/Eirunepe\r', 1),
(111, 'America/El_Salvador\r', 1),
(112, 'America/Ensenada\r', 1),
(113, 'America/Fort_Wayne\r', 1),
(114, 'America/Fortaleza\r', 1),
(115, 'America/Glace_Bay\r', 1),
(116, 'America/Godthab\r', 1),
(117, 'America/Goose_Bay\r', 1),
(118, 'America/Grand_Turk\r', 1),
(119, 'America/Grenada\r', 1),
(120, 'America/Guadeloupe\r', 1),
(121, 'America/Guatemala\r', 1),
(122, 'America/Guayaquil\r', 1),
(123, 'America/Guyana\r', 1),
(124, 'America/Halifax\r', 1),
(125, 'America/Havana\r', 1),
(126, 'America/Hermosillo\r', 1),
(127, 'America/Indiana/Indianapolis\r', 1),
(128, 'America/Indiana/Knox\r', 1),
(129, 'America/Indiana/Marengo\r', 1),
(130, 'America/Indiana/Petersburg\r', 1),
(131, 'America/Indiana/Tell_City\r', 1),
(132, 'America/Indiana/Vevay\r', 1),
(133, 'America/Indiana/Vincennes\r', 1),
(134, 'America/Indiana/Winamac\r', 1),
(135, 'America/Indianapolis\r', 1),
(136, 'America/Inuvik\r', 1),
(137, 'America/Iqaluit\r', 1),
(138, 'America/Jamaica\r', 1),
(139, 'America/Jujuy\r', 1),
(140, 'America/Juneau\r', 1),
(141, 'America/Kentucky/Louisville\r', 1),
(142, 'America/Kentucky/Monticello\r', 1),
(143, 'America/Knox_IN\r', 1),
(144, 'America/Kralendijk\r', 1),
(145, 'America/La_Paz\r', 1),
(146, 'America/Lima\r', 1),
(147, 'America/Los_Angeles\r', 1),
(148, 'America/Louisville\r', 1),
(149, 'America/Lower_Princes\r', 1),
(150, 'America/Maceio\r', 1),
(151, 'America/Managua\r', 1),
(152, 'America/Manaus\r', 1),
(153, 'America/Marigot\r', 1),
(154, 'America/Martinique\r', 1),
(155, 'America/Matamoros\r', 1),
(156, 'America/Mazatlan\r', 1),
(157, 'America/Mendoza\r', 1),
(158, 'America/Menominee\r', 1),
(159, 'America/Merida\r', 1),
(160, 'America/Metlakatla\r', 1),
(161, 'America/Mexico_City\r', 1),
(162, 'America/Miquelon\r', 1),
(163, 'America/Moncton\r', 1),
(164, 'America/Monterrey\r', 1),
(165, 'America/Montevideo\r', 1),
(166, 'America/Montreal\r', 1),
(167, 'America/Montserrat\r', 1),
(168, 'America/Nassau\r', 1),
(169, 'America/New_York\r', 1),
(170, 'America/Nipigon\r', 1),
(171, 'America/Nome\r', 1),
(172, 'America/Noronha\r', 1),
(173, 'America/North_Dakota/Beulah\r', 1),
(174, 'America/North_Dakota/Center\r', 1),
(175, 'America/North_Dakota/New_Salem\r', 1),
(176, 'America/Ojinaga\r', 1),
(177, 'America/Panama\r', 1),
(178, 'America/Pangnirtung\r', 1),
(179, 'America/Paramaribo\r', 1),
(180, 'America/Phoenix\r', 1),
(181, 'America/Port_of_Spain\r', 1),
(182, 'America/Port-au-Prince\r', 1),
(183, 'America/Porto_Acre\r', 1),
(184, 'America/Porto_Velho\r', 1),
(185, 'America/Puerto_Rico\r', 1),
(186, 'America/Rainy_River\r', 1),
(187, 'America/Rankin_Inlet\r', 1),
(188, 'America/Recife\r', 1),
(189, 'America/Regina\r', 1),
(190, 'America/Resolute\r', 1),
(191, 'America/Rio_Branco\r', 1),
(192, 'America/Rosario\r', 1),
(193, 'America/Santa_Isabel\r', 1),
(194, 'America/Santarem\r', 1),
(195, 'America/Santiago\r', 1),
(196, 'America/Santo_Domingo\r', 1),
(197, 'America/Sao_Paulo\r', 1),
(198, 'America/Scoresbysund\r', 1),
(199, 'America/Shiprock\r', 1),
(200, 'America/Sitka\r', 1),
(201, 'America/St_Barthelemy\r', 1),
(202, 'America/St_Johns\r', 1),
(203, 'America/St_Kitts\r', 1),
(204, 'America/St_Lucia\r', 1),
(205, 'America/St_Thomas\r', 1),
(206, 'America/St_Vincent\r', 1),
(207, 'America/Swift_Current\r', 1),
(208, 'America/Tegucigalpa\r', 1),
(209, 'America/Thule\r', 1),
(210, 'America/Thunder_Bay\r', 1),
(211, 'America/Tijuana\r', 1),
(212, 'America/Toronto\r', 1),
(213, 'America/Tortola\r', 1),
(214, 'America/Vancouver\r', 1),
(215, 'America/Virgin\r', 1),
(216, 'America/Whitehorse\r', 1),
(217, 'America/Winnipeg\r', 1),
(218, 'America/Yakutat\r', 1),
(219, 'America/Yellowknife\r', 1),
(220, 'Antarctica/Casey\r', 1),
(221, 'Antarctica/Davis\r', 1),
(222, 'Antarctica/DumontDUrville\r', 1),
(223, 'Antarctica/Macquarie\r', 1),
(224, 'Antarctica/Mawson\r', 1),
(225, 'Antarctica/McMurdo\r', 1),
(226, 'Antarctica/Palmer\r', 1),
(227, 'Antarctica/Rothera\r', 1),
(228, 'Antarctica/South_Pole\r', 1),
(229, 'Antarctica/Syowa\r', 1),
(230, 'Antarctica/Vostok\r', 1),
(231, 'Arctic/Longyearbyen\r', 1),
(232, 'Asia/Aden\r', 1),
(233, 'Asia/Almaty\r', 1),
(234, 'Asia/Amman\r', 1),
(235, 'Asia/Anadyr\r', 1),
(236, 'Asia/Aqtau\r', 1),
(237, 'Asia/Aqtobe\r', 1),
(238, 'Asia/Ashgabat\r', 1),
(239, 'Asia/Ashkhabad\r', 1),
(240, 'Asia/Baghdad\r', 1),
(241, 'Asia/Bahrain\r', 1),
(242, 'Asia/Baku\r', 1),
(243, 'Asia/Bangkok\r', 1),
(244, 'Asia/Beirut\r', 1),
(245, 'Asia/Bishkek\r', 1),
(246, 'Asia/Brunei\r', 1),
(247, 'Asia/Calcutta\r', 1),
(248, 'Asia/Choibalsan\r', 1),
(249, 'Asia/Chongqing\r', 1),
(250, 'Asia/Chungking\r', 1),
(251, 'Asia/Colombo\r', 1),
(252, 'Asia/Dacca\r', 1),
(253, 'Asia/Damascus\r', 1),
(254, 'Asia/Dhaka\r', 1),
(255, 'Asia/Dili\r', 1),
(256, 'Asia/Dubai\r', 1),
(257, 'Asia/Dushanbe\r', 1),
(258, 'Asia/Gaza\r', 1),
(259, 'Asia/Harbin\r', 1),
(260, 'Asia/Hebron\r', 1),
(261, 'Asia/Ho_Chi_Minh\r', 1),
(262, 'Asia/Hong_Kong\r', 1),
(263, 'Asia/Hovd\r', 1),
(264, 'Asia/Irkutsk\r', 1),
(265, 'Asia/Istanbul\r', 1),
(266, 'Asia/Jakarta\r', 1),
(267, 'Asia/Jayapura\r', 1),
(268, 'Asia/Jerusalem\r', 1),
(269, 'Asia/Kabul\r', 1),
(270, 'Asia/Kamchatka\r', 1),
(271, 'Asia/Karachi\r', 1),
(272, 'Asia/Kashgar\r', 1),
(273, 'Asia/Kathmandu\r', 1),
(274, 'Asia/Katmandu\r', 1),
(275, 'Asia/Kolkata\r', 1),
(276, 'Asia/Krasnoyarsk\r', 1),
(277, 'Asia/Kuala_Lumpur\r', 1),
(278, 'Asia/Kuching\r', 1),
(279, 'Asia/Kuwait\r', 1),
(280, 'Asia/Macao\r', 1),
(281, 'Asia/Macau\r', 1),
(282, 'Asia/Magadan\r', 1),
(283, 'Asia/Makassar\r', 1),
(284, 'Asia/Manila\r', 1),
(285, 'Asia/Muscat\r', 1),
(286, 'Asia/Nicosia\r', 1),
(287, 'Asia/Novokuznetsk\r', 1),
(288, 'Asia/Novosibirsk\r', 1),
(289, 'Asia/Omsk\r', 1),
(290, 'Asia/Oral\r', 1),
(291, 'Asia/Phnom_Penh\r', 1),
(292, 'Asia/Pontianak\r', 1),
(293, 'Asia/Pyongyang\r', 1),
(294, 'Asia/Qatar\r', 1),
(295, 'Asia/Qyzylorda\r', 1),
(296, 'Asia/Rangoon\r', 1),
(297, 'Asia/Riyadh\r', 1),
(298, 'Asia/Saigon\r', 1),
(299, 'Asia/Sakhalin\r', 1),
(300, 'Asia/Samarkand\r', 1),
(301, 'Asia/Seoul\r', 1),
(302, 'Asia/Shanghai\r', 1),
(303, 'Asia/Singapore\r', 1),
(304, 'Asia/Taipei\r', 1),
(305, 'Asia/Tashkent\r', 1),
(306, 'Asia/Tbilisi\r', 1),
(307, 'Asia/Tehran\r', 1),
(308, 'Asia/Tel_Aviv\r', 1),
(309, 'Asia/Thimbu\r', 1),
(310, 'Asia/Thimphu\r', 1),
(311, 'Asia/Tokyo\r', 1),
(312, 'Asia/Ujung_Pandang\r', 1),
(313, 'Asia/Ulaanbaatar\r', 1),
(314, 'Asia/Ulan_Bator\r', 1),
(315, 'Asia/Urumqi\r', 1),
(316, 'Asia/Vientiane\r', 1),
(317, 'Asia/Vladivostok\r', 1),
(318, 'Asia/Yakutsk\r', 1),
(319, 'Asia/Yekaterinburg\r', 1),
(320, 'Asia/Yerevan\r', 1),
(321, 'Atlantic/Azores\r', 1),
(322, 'Atlantic/Bermuda\r', 1),
(323, 'Atlantic/Canary\r', 1),
(324, 'Atlantic/Cape_Verde\r', 1),
(325, 'Atlantic/Faeroe\r', 1),
(326, 'Atlantic/Faroe\r', 1),
(327, 'Atlantic/Jan_Mayen\r', 1),
(328, 'Atlantic/Madeira\r', 1),
(329, 'Atlantic/Reykjavik\r', 1),
(330, 'Atlantic/South_Georgia\r', 1),
(331, 'Atlantic/St_Helena\r', 1),
(332, 'Atlantic/Stanley\r', 1),
(333, 'Australia/ACT\r', 1),
(334, 'Australia/Adelaide\r', 1),
(335, 'Australia/Brisbane\r', 1),
(336, 'Australia/Broken_Hill\r', 1),
(337, 'Australia/Canberra\r', 1),
(338, 'Australia/Currie\r', 1),
(339, 'Australia/Darwin\r', 1),
(340, 'Australia/Eucla\r', 1),
(341, 'Australia/Hobart\r', 1),
(342, 'Australia/LHI\r', 1),
(343, 'Australia/Lindeman\r', 1),
(344, 'Australia/Lord_Howe\r', 1),
(345, 'Australia/Melbourne\r', 1),
(346, 'Australia/North\r', 1),
(347, 'Australia/NSW\r', 1),
(348, 'Australia/Perth\r', 1),
(349, 'Australia/Queensland\r', 1),
(350, 'Australia/South\r', 1),
(351, 'Australia/Sydney\r', 1),
(352, 'Australia/Tasmania\r', 1),
(353, 'Australia/Victoria\r', 1),
(354, 'Australia/West\r', 1),
(355, 'Australia/Yancowinna\r', 1),
(356, 'Brazil/Acre\r', 1),
(357, 'Brazil/DeNoronha\r', 1),
(358, 'Brazil/East\r', 1),
(359, 'Brazil/West\r', 1),
(360, 'Canada/Atlantic\r', 1),
(361, 'Canada/Central\r', 1),
(362, 'Canada/Eastern\r', 1),
(363, 'Canada/East-Saskatchewan\r', 1),
(364, 'Canada/Mountain\r', 1),
(365, 'Canada/Newfoundland\r', 1),
(366, 'Canada/Pacific\r', 1),
(367, 'Canada/Saskatchewan\r', 1),
(368, 'Canada/Yukon\r', 1),
(369, 'CET\r', 1),
(370, 'Chile/Continental\r', 1),
(371, 'Chile/EasterIsland\r', 1),
(372, 'CST6CDT\r', 1),
(373, 'Cuba\r', 1),
(374, 'EET\r', 1),
(375, 'Egypt\r', 1),
(376, 'Eire\r', 1),
(377, 'EST\r', 1),
(378, 'EST5EDT\r', 1),
(379, 'Etc./GMT\r', 1),
(380, 'Etc./GMT+0\r', 1),
(381, 'Etc./UCT\r', 1),
(382, 'Etc./Universal\r', 1),
(383, 'Etc./UTC\r', 1),
(384, 'Etc./Zulu\r', 1),
(385, 'Europe/Amsterdam\r', 1),
(386, 'Europe/Andorra\r', 1),
(387, 'Europe/Athens\r', 1),
(388, 'Europe/Belfast\r', 1),
(389, 'Europe/Belgrade\r', 1),
(390, 'Europe/Berlin\r', 1),
(391, 'Europe/Bratislava\r', 1),
(392, 'Europe/Brussels\r', 1),
(393, 'Europe/Bucharest\r', 1),
(394, 'Europe/Budapest\r', 1),
(395, 'Europe/Chisinau\r', 1),
(396, 'Europe/Copenhagen\r', 1),
(397, 'Europe/Dublin\r', 1),
(398, 'Europe/Gibraltar\r', 1),
(399, 'Europe/Guernsey\r', 1),
(400, 'Europe/Helsinki\r', 1),
(401, 'Europe/Isle_of_Man\r', 1),
(402, 'Europe/Istanbul\r', 1),
(403, 'Europe/Jersey\r', 1),
(404, 'Europe/Kaliningrad\r', 1),
(405, 'Europe/Kiev\r', 1),
(406, 'Europe/Lisbon\r', 1),
(407, 'Europe/Ljubljana\r', 1),
(408, 'Europe/London\r', 1),
(409, 'Europe/Luxembourg\r', 1),
(410, 'Europe/Madrid\r', 1),
(411, 'Europe/Malta\r', 1),
(412, 'Europe/Mariehamn\r', 1),
(413, 'Europe/Minsk\r', 1),
(414, 'Europe/Monaco\r', 1),
(415, 'Europe/Moscow\r', 1),
(416, 'Europe/Nicosia\r', 1),
(417, 'Europe/Oslo\r', 1),
(418, 'Europe/Paris\r', 1),
(419, 'Europe/Podgorica\r', 1),
(420, 'Europe/Prague\r', 1),
(421, 'Europe/Riga\r', 1),
(422, 'Europe/Rome\r', 1),
(423, 'Europe/Samara\r', 1),
(424, 'Europe/San_Marino\r', 1),
(425, 'Europe/Sarajevo\r', 1),
(426, 'Europe/Simferopol\r', 1),
(427, 'Europe/Skopje\r', 1),
(428, 'Europe/Sofia\r', 1),
(429, 'Europe/Stockholm\r', 1),
(430, 'Europe/Tallinn\r', 1),
(431, 'Europe/Tirane\r', 1),
(432, 'Europe/Tiraspol\r', 1),
(433, 'Europe/Uzhgorod\r', 1),
(434, 'Europe/Vaduz\r', 1),
(435, 'Europe/Vatican\r', 1),
(436, 'Europe/Vienna\r', 1),
(437, 'Europe/Vilnius\r', 1),
(438, 'Europe/Volgograd\r', 1),
(439, 'Europe/Warsaw\r', 1),
(440, 'Europe/Zagreb\r', 1),
(441, 'Europe/Zaporozhye\r', 1),
(442, 'Europe/Zurich\r', 1),
(443, 'GB\r', 1),
(444, 'GB-Eire\r', 1),
(445, 'GMT\r', 1),
(446, 'GMT+0\r', 1),
(447, 'GMT0\r', 1),
(448, 'GMT-0\r', 1),
(449, 'Greenwich\r', 1),
(450, 'Hong Kong\r', 1),
(451, 'HST\r', 1),
(452, 'Iceland\r', 1),
(453, 'Indian/Antananarivo\r', 1),
(454, 'Indian/Chagos\r', 1),
(455, 'Indian/Christmas\r', 1),
(456, 'Indian/Cocos\r', 1),
(457, 'Indian/Comoro\r', 1),
(458, 'Indian/Kerguelen\r', 1),
(459, 'Indian/Mahe\r', 1),
(460, 'Indian/Maldives\r', 1),
(461, 'Indian/Mauritius\r', 1),
(462, 'Indian/Mayotte\r', 1),
(463, 'Indian/Reunion\r', 1),
(464, 'Iran\r', 1),
(465, 'Israel\r', 1),
(466, 'Jamaica\r', 1),
(467, 'Japan\r', 1),
(468, 'JST-9\r', 1),
(469, 'Kwajalein\r', 1),
(470, 'Libya\r', 1),
(471, 'MET\r', 1),
(472, 'Mexico/BajaNorte\r', 1),
(473, 'Mexico/BajaSur\r', 1),
(474, 'Mexico/General\r', 1),
(475, 'MST\r', 1),
(476, 'MST7MDT\r', 1),
(477, 'Navajo\r', 1),
(478, 'NZ\r', 1),
(479, 'NZ-CHAT\r', 1),
(480, 'Pacific/Apia\r', 1),
(481, 'Pacific/Auckland\r', 1),
(482, 'Pacific/Chatham\r', 1),
(483, 'Pacific/Chuuk\r', 1),
(484, 'Pacific/Easter\r', 1),
(485, 'Pacific/Efate\r', 1),
(486, 'Pacific/Enderbury\r', 1),
(487, 'Pacific/Fakaofo\r', 1),
(488, 'Pacific/Fiji\r', 1),
(489, 'Pacific/Funafuti\r', 1),
(490, 'Pacific/Galapagos\r', 1),
(491, 'Pacific/Gambier\r', 1),
(492, 'Pacific/Guadalcanal\r', 1),
(493, 'Pacific/Guam\r', 1),
(494, 'Pacific/Honolulu\r', 1),
(495, 'Pacific/Johnston\r', 1),
(496, 'Pacific/Kiritimati\r', 1),
(497, 'Pacific/Kosrae\r', 1),
(498, 'Pacific/Kwajalein\r', 1),
(499, 'Pacific/Majuro\r', 1),
(500, 'Pacific/Marquesas\r', 1),
(501, 'Pacific/Midway\r', 1),
(502, 'Pacific/Nauru\r', 1),
(503, 'Pacific/Niue\r', 1),
(504, 'Pacific/Norfolk\r', 1),
(505, 'Pacific/Noumea\r', 1),
(506, 'Pacific/Pago_Pago\r', 1),
(507, 'Pacific/Palau\r', 1),
(508, 'Pacific/Pitcairn\r', 1),
(509, 'Pacific/Pohnpei\r', 1),
(510, 'Pacific/Ponape\r', 1),
(511, 'Pacific/Port_Moresby\r', 1),
(512, 'Pacific/Rarotonga\r', 1),
(513, 'Pacific/Saipan\r', 1),
(514, 'Pacific/Samoa\r', 1),
(515, 'Pacific/Tahiti\r', 1),
(516, 'Pacific/Tarawa\r', 1),
(517, 'Pacific/Tongatapu\r', 1),
(518, 'Pacific/Truk\r', 1),
(519, 'Pacific/Wake\r', 1),
(520, 'Pacific/Wallis\r', 1),
(521, 'Pacific/Yap\r', 1),
(522, 'Poland\r', 1),
(523, 'Portugal\r', 1),
(524, 'PRC\r', 1),
(525, 'PST8PDT\r', 1),
(526, 'ROC\r', 1),
(527, 'ROK\r', 1),
(528, 'Singapore\r', 1),
(529, 'Turkey\r', 1),
(530, 'UCT\r', 1),
(531, 'Universal\r', 1),
(532, 'US/Alaska\r', 1),
(533, 'US/Aleutian\r', 1),
(534, 'US/Arizona\r', 1),
(535, 'US/Central\r', 1),
(536, 'US/Eastern\r', 1),
(537, 'US/East-Indiana\r', 1),
(538, 'US/Hawaii\r', 1),
(539, 'US/Indiana-Starke\r', 1),
(540, 'US/Michigan\r', 1),
(541, 'US/Mountain\r', 1),
(542, 'US/Pacific\r', 1),
(543, 'US/Pacific-New\r', 1),
(544, 'US/Samoa\r', 1),
(545, 'UTC\r', 1),
(546, 'WET\r', 1),
(547, 'W-SU\r', 1),
(548, 'Zulu\r', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_units`
--

CREATE TABLE `db_units` (
  `id` int(5) NOT NULL,
  `unit_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `company_id` int(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_units`
--

INSERT INTO `db_units` (`id`, `unit_name`, `description`, `company_id`, `status`) VALUES
(7, 'Box', 'Box Information', NULL, 1),
(8, 'Drums', 'Drums Information', NULL, 1),
(9, 'Pieces', 'Pieces Information', NULL, 1),
(10, 'Grams', 'Grams Description', NULL, 1),
(11, 'Packets', 'Packets information', NULL, 1),
(12, 'Unit', 'Unit Description', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_users`
--

CREATE TABLE `db_users` (
  `id` double NOT NULL,
  `username` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` blob,
  `member_of` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(405) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` blob,
  `gender` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(1620) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(1620) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` blob,
  `postcode` varchar(270) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(1350) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(5) DEFAULT NULL,
  `status` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_users`
--

INSERT INTO `db_users` (`id`, `username`, `password`, `member_of`, `firstname`, `lastname`, `mobile`, `email`, `photo`, `gender`, `dob`, `country`, `state`, `city`, `address`, `postcode`, `role_name`, `role_id`, `created_date`, `created_time`, `created_by`, `system_ip`, `system_name`, `company_id`, `status`) VALUES
(1, 'admin', 0x3235643535616432383361613430306166343634633736643731336330376164, '', NULL, NULL, '9845454454', 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2018-11-27', '::1', NULL, NULL, NULL, 1, 1),
(2, 'Sales', 0x6531306164633339343962613539616262653536653035376632306638383365, NULL, NULL, NULL, '24', 'sales@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2020-01-23', '11:47:23 am', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1),
(3, 'Purchase', 0x6531306164633339343962613539616262653536653035376632306638383365, NULL, NULL, NULL, '98454547454', 'purchase@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-01-23', '11:48:18 am', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1),
(5, 'khaled fawzy', 0x6235333261613537333437393236336430626130333661346262323963626634, NULL, NULL, NULL, '0090923', 'khaledfwzy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2020-02-21', '08:21:30 pm', 'admin', '188.71.212.168', '188.71.212.168', NULL, 1),
(6, 'salesman', 0x3839393133323832636165396266306566383939346366633635393133313862, NULL, NULL, NULL, '017665645', 'salesman@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2021-01-10', '01:53:27 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1),
(7, 'rpurchase', 0x6434383439666166666332303939346430343134643332323430353935373336, NULL, NULL, NULL, '0176645231', 'pdepartment@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2021-01-10', '01:59:00 pm', 'admin', '202.133.91.102', '202.133.91.102', NULL, 1),
(8, 'mafizur', 0x3235643535616432383361613430306166343634633736643731336330376164, ' ', NULL, NULL, '01923405632', 'mafizur.mysoftheaven@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-01-17', '12:52:09 pm', NULL, '103.106.236.115', '103-106-236-115.Dhaka.carnival.com.bd', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_warehouse`
--

CREATE TABLE `db_warehouse` (
  `id` int(5) NOT NULL,
  `warehouse_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_holdinvoice`
--

CREATE TABLE `temp_holdinvoice` (
  `id` int(5) NOT NULL,
  `invoice_id` int(5) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `reference_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  `item_qty` int(5) DEFAULT NULL,
  `item_price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_brands`
--
ALTER TABLE `db_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_country`
--
ALTER TABLE `db_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_currency`
--
ALTER TABLE `db_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_customers`
--
ALTER TABLE `db_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_expense`
--
ALTER TABLE `db_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_items`
--
ALTER TABLE `db_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_languages`
--
ALTER TABLE `db_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_permissions`
--
ALTER TABLE `db_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchase`
--
ALTER TABLE `db_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_roles`
--
ALTER TABLE `db_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sales`
--
ALTER TABLE `db_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencysymbol_id` (`currencysymbol_id`);

--
-- Indexes for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_states`
--
ALTER TABLE `db_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_tax`
--
ALTER TABLE `db_tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_timezone`
--
ALTER TABLE `db_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_units`
--
ALTER TABLE `db_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_users`
--
ALTER TABLE `db_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_holdinvoice`
--
ALTER TABLE `temp_holdinvoice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_brands`
--
ALTER TABLE `db_brands`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `db_cobpayments`
--
ALTER TABLE `db_cobpayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_country`
--
ALTER TABLE `db_country`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `db_currency`
--
ALTER TABLE `db_currency`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `db_customers`
--
ALTER TABLE `db_customers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `db_expense`
--
ALTER TABLE `db_expense`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `db_expense_category`
--
ALTER TABLE `db_expense_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `db_items`
--
ALTER TABLE `db_items`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `db_languages`
--
ALTER TABLE `db_languages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `db_paymenttypes`
--
ALTER TABLE `db_paymenttypes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `db_permissions`
--
ALTER TABLE `db_permissions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `db_purchase`
--
ALTER TABLE `db_purchase`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `db_purchaseitems`
--
ALTER TABLE `db_purchaseitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `db_purchaseitemsreturn`
--
ALTER TABLE `db_purchaseitemsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_purchasepayments`
--
ALTER TABLE `db_purchasepayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `db_purchasepaymentsreturn`
--
ALTER TABLE `db_purchasepaymentsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_purchasereturn`
--
ALTER TABLE `db_purchasereturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_roles`
--
ALTER TABLE `db_roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `db_sales`
--
ALTER TABLE `db_sales`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `db_salesitems`
--
ALTER TABLE `db_salesitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `db_salesitemsreturn`
--
ALTER TABLE `db_salesitemsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_salespayments`
--
ALTER TABLE `db_salespayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `db_salespaymentsreturn`
--
ALTER TABLE `db_salespaymentsreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_salesreturn`
--
ALTER TABLE `db_salesreturn`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_sitesettings`
--
ALTER TABLE `db_sitesettings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `db_smsapi`
--
ALTER TABLE `db_smsapi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
--
-- AUTO_INCREMENT for table `db_smstemplates`
--
ALTER TABLE `db_smstemplates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `db_sobpayments`
--
ALTER TABLE `db_sobpayments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_states`
--
ALTER TABLE `db_states`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `db_stockentry`
--
ALTER TABLE `db_stockentry`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `db_suppliers`
--
ALTER TABLE `db_suppliers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `db_tax`
--
ALTER TABLE `db_tax`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `db_timezone`
--
ALTER TABLE `db_timezone`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;
--
-- AUTO_INCREMENT for table `db_units`
--
ALTER TABLE `db_units`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `db_users`
--
ALTER TABLE `db_users`
  MODIFY `id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `db_warehouse`
--
ALTER TABLE `db_warehouse`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `temp_holdinvoice`
--
ALTER TABLE `temp_holdinvoice`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
