DROP DATABASE if exists projectapollo;
CREATE DATABASE projectapollo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE projectapollo;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectapollo`
--

-- --------------------------------------------------------

--
-- Table structure for table `bme280`
--

CREATE TABLE users(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255),
password VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table `bme280`
--

CREATE TABLE `bme280` (
  `id` int(11) NOT NULL,
  `launchId` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `pressure` float NOT NULL,
  `approxAltitude` float NOT NULL,
  `humidity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gygps6mv2`
--

CREATE TABLE `gygps6mv2` (
  `id` int(11) NOT NULL,
  `launchId` int(11) NOT NULL,
  `latitude` int(11) NOT NULL,
  `longitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hy521`
--

CREATE TABLE `hy521` (
  `id` int(11) NOT NULL,
  `launchId` int(11) NOT NULL,
  `accelerateX` float NOT NULL,
  `accelerateY` float NOT NULL,
  `accelerateZ` float NOT NULL,
  `gyroX` float NOT NULL,
  `gyroY` float NOT NULL,
  `gyroZ` float NOT NULL,
  `temperature` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `launchmeasurements`
--

CREATE TABLE `launchmeasurements` (
  `id` int(11) NOT NULL,
  `launchNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bme280`
--
ALTER TABLE `bme280`
  ADD PRIMARY KEY (`id`),
  ADD KEY `launchId` (`launchId`);

--
-- Indexes for table `gygps6mv2`
--
ALTER TABLE `gygps6mv2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `launchId` (`launchId`);

--
-- Indexes for table `hy521`
--
ALTER TABLE `hy521`
  ADD PRIMARY KEY (`id`),
  ADD KEY `launchId` (`launchId`);

--
-- Indexes for table `launchmeasurements`
--
ALTER TABLE `launchmeasurements`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bme280`
--
ALTER TABLE `bme280`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gygps6mv2`
--
ALTER TABLE `gygps6mv2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hy521`
--
ALTER TABLE `hy521`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `launchmeasurements`
--
ALTER TABLE `launchmeasurements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bme280`
--
ALTER TABLE `bme280`
  ADD CONSTRAINT `bme280_ibfk_1` FOREIGN KEY (`launchId`) REFERENCES `launchmeasurements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gygps6mv2`
--
ALTER TABLE `gygps6mv2`
  ADD CONSTRAINT `gygps6mv2_ibfk_1` FOREIGN KEY (`launchId`) REFERENCES `launchmeasurements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hy521`
--
ALTER TABLE `hy521`
  ADD CONSTRAINT `hy521_ibfk_1` FOREIGN KEY (`launchId`) REFERENCES `launchmeasurements` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;