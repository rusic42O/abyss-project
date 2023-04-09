-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2018 at 01:28 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_abyss`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `ActorSQLID` tinyint(5) NOT NULL,
  `ActorSkinID` tinyint(5) NOT NULL,
  `ActorAnimID` tinyint(2) NOT NULL,
  `ActorPos_X` float NOT NULL,
  `ActorPos_Y` float NOT NULL,
  `ActorPos_Z` float NOT NULL,
  `ActorRotation` float NOT NULL,
  `ActorPostavljen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `sSQLID` smallint(5) NOT NULL,
  `sImaVlasnika` tinyint(1) NOT NULL,
  `sVlasnik` varchar(24) NOT NULL,
  `sVrsta` tinyint(1) NOT NULL,
  `sUlazX` float NOT NULL,
  `sUlazY` float NOT NULL,
  `sUlazZ` float NOT NULL,
  `sIzlazX` float NOT NULL,
  `sIzlazY` float NOT NULL,
  `sIzlazZ` float NOT NULL,
  `sLevel` smallint(5) NOT NULL,
  `sCena` int(11) NOT NULL,
  `sKasa` int(11) NOT NULL,
  `sGun` tinyint(2) NOT NULL,
  `sAmmo` smallint(5) NOT NULL,
  `sInt` int(11) NOT NULL,
  `sVW` int(11) NOT NULL,
  `sZatvoreno` tinyint(1) NOT NULL,
  `sNeakt` smallint(5) NOT NULL,
  `sPostavljena` tinyint(1) NOT NULL,
  `sRent` tinyint(1) NOT NULL,
  `sRentCena` smallint(5) NOT NULL,
  `sWC` tinyint(1) NOT NULL,
  `sEat` tinyint(1) NOT NULL,
  `sHealth` tinyint(1) NOT NULL,
  `sArmour` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `atms`
--

CREATE TABLE `atms` (
  `aSQLID` tinyint(3) NOT NULL,
  `aAtmX` float NOT NULL,
  `aAtmY` float NOT NULL,
  `aAtmZ` float NOT NULL,
  `aRotX` float NOT NULL,
  `aRotY` float NOT NULL,
  `aRotZ` float NOT NULL,
  `aPostavljen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `zSQLID` smallint(5) NOT NULL,
  `zZgradaX` float NOT NULL,
  `zZgradaY` float NOT NULL,
  `zZgradaZ` float NOT NULL,
  `zIntX` float NOT NULL,
  `zIntY` float NOT NULL,
  `zIntZ` float NOT NULL,
  `zVW` int(11) NOT NULL,
  `zInt` int(11) NOT NULL,
  `zPostavljena` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bussines`
--

CREATE TABLE `bussines` (
  `bSQLID` smallint(5) NOT NULL,
  `bImaVlasnika` tinyint(1) NOT NULL DEFAULT '0',
  `bVlasnik` varchar(24) NOT NULL,
  `bVrsta` tinyint(3) NOT NULL,
  `bNaziv` varchar(30) NOT NULL,
  `bUlazX` float NOT NULL,
  `bUlazY` float NOT NULL,
  `bUlazZ` float NOT NULL,
  `bLevel` smallint(5) NOT NULL,
  `bCena` int(10) NOT NULL,
  `bKasa` int(10) NOT NULL,
  `bPostavljena` tinyint(1) NOT NULL,
  `bNeakt` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c4`
--

CREATE TABLE `c4` (
  `c4_SQLID` smallint(5) NOT NULL,
  `c4_Vlasnik` varchar(24) NOT NULL,
  `c4_VehID` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `callboxs`
--

CREATE TABLE `callboxs` (
  `goSQLID` tinyint(3) NOT NULL,
  `goPosX` float NOT NULL,
  `goPosY` float NOT NULL,
  `goPosZ` float NOT NULL,
  `goRotX` float NOT NULL,
  `goRotY` float NOT NULL,
  `goRotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `chSQLID` smallint(5) NOT NULL,
  `chID` tinyint(5) NOT NULL DEFAULT '0',
  `chVlasnik` varchar(24) NOT NULL,
  `chPassword` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `containers`
--

CREATE TABLE `containers` (
  `koSQLID` tinyint(3) NOT NULL,
  `koObjPos_X` float NOT NULL,
  `koObjPos_Y` float NOT NULL,
  `koObjPos_Z` float NOT NULL,
  `koObjRot_X` float NOT NULL,
  `koObjRot_Y` float NOT NULL,
  `koObjRot_Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cotagges`
--

CREATE TABLE `cotagges` (
  `vSQLID` smallint(5) NOT NULL,
  `vImaVlasnika` tinyint(1) NOT NULL,
  `vVlasnik` varchar(24) NOT NULL,
  `vUlazX` float NOT NULL,
  `vUlazY` float NOT NULL,
  `vUlazZ` float NOT NULL,
  `vIzlazX` float NOT NULL,
  `vIzlazY` float NOT NULL,
  `vIzlazZ` float NOT NULL,
  `vLevel` smallint(5) NOT NULL,
  `vCena` int(11) NOT NULL,
  `vKasa` int(11) NOT NULL,
  `vGun` tinyint(2) NOT NULL,
  `vAmmo` smallint(5) NOT NULL,
  `vInt` int(11) NOT NULL,
  `vVW` int(11) NOT NULL,
  `vZatvoreno` tinyint(1) NOT NULL,
  `vNeakt` smallint(5) NOT NULL,
  `vPostavljena` tinyint(1) NOT NULL,
  `vRent` tinyint(1) NOT NULL,
  `vRentCena` smallint(5) NOT NULL,
  `vWC` tinyint(1) NOT NULL,
  `vEat` tinyint(1) NOT NULL,
  `vHealth` tinyint(1) NOT NULL,
  `vArmour` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `DilerSQLID` tinyint(5) NOT NULL,
  `DilerSkinID` tinyint(5) NOT NULL,
  `DilerAnimID` tinyint(2) NOT NULL,
  `DilerZone` smallint(3) NOT NULL,
  `DilerPos_X` float NOT NULL,
  `DilerPos_Y` float NOT NULL,
  `DilerPos_Z` float NOT NULL,
  `DilerRotation` float NOT NULL,
  `DilerPostavljen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `droped_items`
--

CREATE TABLE `droped_items` (
  `diSQLID` mediumint(8) NOT NULL,
  `diItem` tinyint(2) NOT NULL,
  `diWeaponType` tinyint(2) NOT NULL DEFAULT '-1',
  `diDrugType` tinyint(2) NOT NULL DEFAULT '-1',
  `diAmount` mediumint(8) NOT NULL,
  `diPosX` float NOT NULL,
  `diPosY` float NOT NULL,
  `diPosZ` float NOT NULL,
  `diVW` int(11) NOT NULL,
  `diInt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drug_plants`
--

CREATE TABLE `drug_plants` (
  `dSQLID` smallint(5) NOT NULL,
  `dVlasnik` varchar(24) NOT NULL,
  `dVrijeme` tinyint(2) NOT NULL,
  `dPosX` float NOT NULL,
  `dPosY` float NOT NULL,
  `dPosZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_upgrades`
--

CREATE TABLE `event_upgrades` (
  `nSQLID` tinyint(3) NOT NULL,
  `nNaziv` varchar(30) NOT NULL,
  `nVrsta` tinyint(2) NOT NULL,
  `nPosX` float NOT NULL,
  `nPosY` float NOT NULL,
  `nPosZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `oSQLID` smallint(3) NOT NULL,
  `oName` varchar(30) NOT NULL,
  `oPreFix` varchar(5) NOT NULL,
  `oColor` varchar(10) NOT NULL,
  `oTip` tinyint(2) NOT NULL,
  `oSuspended` tinyint(1) NOT NULL,
  `oSkin1` smallint(5) NOT NULL,
  `oSkin2` smallint(5) NOT NULL,
  `oSkin3` smallint(5) NOT NULL,
  `oSkin4` smallint(5) NOT NULL,
  `oSkin5` smallint(5) NOT NULL,
  `oSkin6` smallint(5) NOT NULL,
  `oZSkin1` smallint(5) NOT NULL,
  `oZSkin2` smallint(5) NOT NULL,
  `oZSkin3` smallint(5) NOT NULL,
  `oZSkin4` smallint(5) NOT NULL,
  `oZSkin5` smallint(5) NOT NULL,
  `oZSkin6` smallint(5) NOT NULL,
  `oRank1` varchar(20) NOT NULL,
  `oRank2` varchar(20) NOT NULL,
  `oRank3` varchar(20) NOT NULL,
  `oRank4` varchar(20) NOT NULL,
  `oRank5` varchar(20) NOT NULL,
  `oRank6` varchar(20) NOT NULL,
  `oPozExtX` float NOT NULL,
  `oPozExtY` float NOT NULL,
  `oPozExtZ` float NOT NULL,
  `oPozIntX` float NOT NULL,
  `oPozIntY` float NOT NULL,
  `oPozIntZ` float NOT NULL,
  `oSavez` smallint(3) NOT NULL DEFAULT '-1',
  `oSafePosX` float NOT NULL,
  `oSafePosY` float NOT NULL,
  `oSafePosZ` float NOT NULL,
  `oSafeMoney` int(10) NOT NULL,
  `oSafeSupst` int(10) NOT NULL,
  `oSafeMats` int(10) NOT NULL,
  `oPostavljena` tinyint(1) NOT NULL,
  `oInt` int(10) NOT NULL,
  `oVw` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `firms`
--

CREATE TABLE `firms` (
  `fSQLID` int(11) NOT NULL,
  `fImaVlasnika` int(11) NOT NULL,
  `fVlasnik` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `fVrsta` int(11) NOT NULL,
  `fNaziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `fIznuda` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `fUlazX` float NOT NULL,
  `fUlazY` float NOT NULL,
  `fUlazZ` float NOT NULL,
  `fIzlazX` float NOT NULL,
  `fIzlazY` float NOT NULL,
  `fIzlazZ` float NOT NULL,
  `fLevel` int(11) NOT NULL,
  `fCena` int(11) NOT NULL,
  `fKasa` int(11) NOT NULL,
  `fInt` int(11) NOT NULL,
  `fZatvoreno` int(11) NOT NULL,
  `fProizvodi` int(11) NOT NULL,
  `fMaxProizvodi` int(11) NOT NULL,
  `fVW` int(11) NOT NULL,
  `fPostavljena` int(11) NOT NULL,
  `fNeakt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gangzones`
--

CREATE TABLE `gangzones` (
  `gSQLID` smallint(3) NOT NULL,
  `gZoneTaken` tinyint(1) NOT NULL,
  `gZoneTakeable` tinyint(1) NOT NULL,
  `gZoneGangID` smallint(3) NOT NULL,
  `gZoneTime` tinyint(3) NOT NULL,
  `gZoneMaxX` float NOT NULL,
  `gZoneMaxY` float NOT NULL,
  `gZoneMinX` float NOT NULL,
  `gZoneMinY` float NOT NULL,
  `gZoneColor` int(10) NOT NULL,
  `gZonePickupPos_X` float NOT NULL,
  `gZonePickupPos_Y` float NOT NULL,
  `gZonePickupPos_Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `garages`
--

CREATE TABLE `garages` (
  `gaSQLID` smallint(5) NOT NULL,
  `gaImaVlasnika` tinyint(1) NOT NULL,
  `gaVlasnik` varchar(24) NOT NULL,
  `gaGarazaX` float NOT NULL,
  `gaGarazaY` float NOT NULL,
  `gaGarazaZ` float NOT NULL,
  `gaIntX` float NOT NULL,
  `gaIntY` float NOT NULL,
  `gaIntZ` float NOT NULL,
  `gaVW` int(11) NOT NULL,
  `gaPostavljena` tinyint(1) NOT NULL,
  `gaCena` int(11) NOT NULL,
  `gaLevel` smallint(5) NOT NULL,
  `gaNeakt` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `gateSQLID` smallint(5) NOT NULL,
  `gateOwner` varchar(24) NOT NULL,
  `gateModel` smallint(5) NOT NULL,
  `gateFor` tinyint(2) NOT NULL,
  `gateOrgID` tinyint(2) NOT NULL,
  `gateSpeed` float NOT NULL,
  `gateRadius` float NOT NULL,
  `gateTime` tinyint(2) NOT NULL,
  `gatePosX` float NOT NULL,
  `gatePosY` float NOT NULL,
  `gatePosZ` float NOT NULL,
  `gateRotX` float NOT NULL,
  `gateRotY` float NOT NULL,
  `gateRotZ` float NOT NULL,
  `gateInterior` int(11) NOT NULL,
  `gateWorld` int(11) NOT NULL,
  `gateMoveX` float NOT NULL,
  `gateMoveY` float NOT NULL,
  `gateMoveZ` float NOT NULL,
  `gateMRotX` float NOT NULL,
  `gateMRotY` float NOT NULL,
  `gateMRotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gold_machines`
--

CREATE TABLE `gold_machines` (
  `zSQLID` tinyint(3) NOT NULL,
  `zPosX` float NOT NULL,
  `zPosY` float NOT NULL,
  `zPosZ` float NOT NULL,
  `zRotX` float NOT NULL,
  `zRotY` float NOT NULL,
  `zRotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gps`
--

CREATE TABLE `gps` (
  `gpsSQLID` tinyint(3) NOT NULL,
  `gpsName` varchar(50) NOT NULL,
  `gpsPos_X` int(11) NOT NULL,
  `gpsPos_Y` int(11) NOT NULL,
  `gpsPos_Z` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `graffiti`
--

CREATE TABLE `graffiti` (
  `gSQLID` tinyint(3) NOT NULL,
  `gText` varchar(20) NOT NULL,
  `gPrefarban` tinyint(1) NOT NULL,
  `gGraffitX` float NOT NULL,
  `gGraffitY` float NOT NULL,
  `gGraffitZ` float NOT NULL,
  `gRotX` float NOT NULL,
  `gRotY` float NOT NULL,
  `gRotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `hSQLID` smallint(5) NOT NULL,
  `hImaVlasnika` tinyint(1) NOT NULL,
  `hVlasnik` varchar(24) NOT NULL,
  `hVrsta` tinyint(1) NOT NULL,
  `hUlazX` float NOT NULL,
  `hUlazY` float NOT NULL,
  `hUlazZ` float NOT NULL,
  `hIzlazX` float NOT NULL,
  `hIzlazY` float NOT NULL,
  `hIzlazZ` float NOT NULL,
  `hLevel` smallint(5) NOT NULL,
  `hCena` int(11) NOT NULL,
  `hKasa` int(11) NOT NULL,
  `hGun` tinyint(2) NOT NULL,
  `hAmmo` smallint(5) NOT NULL,
  `hInt` int(11) NOT NULL,
  `hVW` int(11) NOT NULL,
  `hZatvoreno` tinyint(1) NOT NULL,
  `hNeakt` smallint(5) NOT NULL,
  `hPostavljena` tinyint(1) NOT NULL,
  `hRent` tinyint(1) NOT NULL,
  `hRentCena` smallint(5) NOT NULL,
  `hWC` tinyint(1) NOT NULL,
  `hEat` tinyint(1) NOT NULL,
  `hHealth` tinyint(1) NOT NULL,
  `hArmour` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mine`
--

CREATE TABLE `mine` (
  `mSQLID` smallint(5) NOT NULL,
  `mVlasnik` varchar(24) NOT NULL,
  `mObjPos_X` float NOT NULL,
  `mObjPos_Y` float NOT NULL,
  `mObjPos_Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsstands`
--

CREATE TABLE `newsstands` (
  `tSQLID` smallint(5) NOT NULL,
  `tImaVlasnika` tinyint(1) NOT NULL,
  `tVlasnik` varchar(24) NOT NULL,
  `tTrafX` float NOT NULL,
  `tTrafY` float NOT NULL,
  `tTrafZ` float NOT NULL,
  `tRotX` float NOT NULL,
  `tRotY` float NOT NULL,
  `tRotZ` float NOT NULL,
  `tPickX` float NOT NULL,
  `tPickY` float NOT NULL,
  `tPickZ` float NOT NULL,
  `tLevel` smallint(5) NOT NULL,
  `tCena` int(11) NOT NULL,
  `tKasa` int(11) NOT NULL,
  `tNeakt` smallint(5) NOT NULL,
  `tPostavljena` tinyint(1) NOT NULL,
  `tProizvodi` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `port_other`
--

CREATE TABLE `port_other` (
  `OtherPortSQLID` tinyint(3) NOT NULL,
  `OtherPortName` varchar(30) NOT NULL,
  `OtherPortPos_X` float NOT NULL,
  `OtherPortPos_Y` float NOT NULL,
  `OtherPortPos_Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `port_other`
--

INSERT INTO `port_other` (`OtherPortSQLID`, `OtherPortName`, `OtherPortPos_X`, `OtherPortPos_Y`, `OtherPortPos_Z`) VALUES
(1, 'Planinska baza', -2301.41, -1674.07, 483.627),
(2, 'Spawn', 289.853, -1638.16, 33.1484),
(3, 'Opstina', 1478.7, -1732.34, 13.3828),
(4, 'Maze Bank', 1603.3, -1300.68, 17.2812),
(5, 'Clouds Bank', 1470.65, -1045.95, 23.8324),
(6, 'Bolnica', 1204.93, -1397.97, 13.2911),
(7, 'Zlatara', 1714.78, -1342.93, 13.3828),
(8, 'Galerija', 1271.53, -924.976, 42.1268),
(9, 'Lutrija', 1357.88, -985.421, 29.8796),
(10, 'Oglasi', 1324.7, -1148.88, 23.6484),
(11, 'Hangar', -53.9679, -1597.78, 2.69392),
(12, 'DeathMatch Zona', 2681.29, -1685.13, 9.4153);

-- --------------------------------------------------------

--
-- Table structure for table `port_staff`
--

CREATE TABLE `port_staff` (
  `StaffPortSQLID` tinyint(3) NOT NULL,
  `StaffPortName` varchar(30) NOT NULL,
  `StaffPortPos_X` float NOT NULL,
  `StaffPortPos_Y` float NOT NULL,
  `StaffPortPos_Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `port_staff`
--

INSERT INTO `port_staff` (`StaffPortSQLID`, `StaffPortName`, `StaffPortPos_X`, `StaffPortPos_Y`, `StaffPortPos_Z`) VALUES
(1, 'Ostrvska baza', 4273.62, 3004.97, 4.34217),
(2, 'Planinska baza', -2301.41, -1674.07, 483.627),
(3, 'Spawn', 289.853, -1638.16, 33.1484),
(4, 'Opstina', 1478.7, -1732.34, 13.3828),
(5, 'Maze Bank', 1603.3, -1300.68, 17.2812),
(6, 'Clouds Bank', 1470.65, -1045.95, 23.8324),
(7, 'Bolnica', 1204.93, -1397.97, 13.2911),
(8, 'Zlatara', 1714.78, -1342.93, 13.3828),
(9, 'Galerija', 1271.53, -924.976, 42.1269),
(10, 'Lutrija', 1357.88, -985.421, 29.8795),
(11, 'Oglasi', 1324.7, -1148.88, 23.6484),
(12, 'Hangar', -53.9679, -1597.78, 2.69394),
(13, 'DeathMatch Zona', 2681.29, -1685.13, 9.41528);

-- --------------------------------------------------------

--
-- Table structure for table `radars`
--

CREATE TABLE `radars` (
  `rSQLID` tinyint(3) NOT NULL,
  `rRadarX` float NOT NULL,
  `rRadarY` float NOT NULL,
  `rRadarZ` float NOT NULL,
  `rRotX` float NOT NULL,
  `rRotY` float NOT NULL,
  `rRotZ` float NOT NULL,
  `rBrzina` tinyint(3) NOT NULL,
  `rKazna` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ranchs`
--

CREATE TABLE `ranchs` (
  `iSQLID` smallint(5) NOT NULL,
  `iImaVlasnika` tinyint(1) NOT NULL,
  `iVlasnik` varchar(24) NOT NULL,
  `iImanjeX` float NOT NULL,
  `iImanjeY` float NOT NULL,
  `iImanjeZ` float NOT NULL,
  `iLevel` smallint(5) NOT NULL,
  `iCena` int(11) NOT NULL,
  `iNeakt` smallint(5) NOT NULL,
  `iPostavljeno` tinyint(1) NOT NULL,
  `iRadius` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ranchs_tress`
--

CREATE TABLE `ranchs_tress` (
  `dSQLID` smallint(5) NOT NULL,
  `dDrvoX` float NOT NULL,
  `dDrvoY` float NOT NULL,
  `dDrvoZ` float NOT NULL,
  `dVrsta` tinyint(2) NOT NULL,
  `dRast` tinyint(2) NOT NULL,
  `dRastVoca` tinyint(2) NOT NULL,
  `dPostavljeno` tinyint(1) NOT NULL,
  `dIDImanja` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shopboxes`
--

CREATE TABLE `shopboxes` (
  `sbSQLID` tinyint(3) NOT NULL,
  `sbPosX` float NOT NULL,
  `sbPosY` float NOT NULL,
  `sbPosZ` float NOT NULL,
  `sbRotX` float NOT NULL,
  `sbRotY` float NOT NULL,
  `sbRotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stands`
--

CREATE TABLE `stands` (
  `s_SQLID` tinyint(3) NOT NULL,
  `s_S_ObjPos_X` float NOT NULL,
  `s_S_ObjPos_Y` float NOT NULL,
  `s_S_ObjPos_Z` float NOT NULL,
  `s_S_ObjRot_X` float NOT NULL,
  `s_S_ObjRot_Y` float NOT NULL,
  `s_S_ObjRot_Z` float NOT NULL,
  `s_H_ObjPos_X` float NOT NULL,
  `s_H_ObjPos_Y` float NOT NULL,
  `s_H_ObjPos_Z` float NOT NULL,
  `s_H_ObjRot_X` float NOT NULL,
  `s_H_ObjRot_Y` float NOT NULL,
  `s_H_ObjRot_Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `uSQLID` tinyint(3) NOT NULL,
  `uUlicaX` float NOT NULL,
  `uUlicaY` float NOT NULL,
  `uUlicaZ` float NOT NULL,
  `uIme` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `pSQLID` mediumint(8) NOT NULL,
  `pNick` varchar(24) NOT NULL,
  `pOnline` tinyint(1) NOT NULL DEFAULT '0',
  `pPassword` int(50) NOT NULL,
  `pReg` tinyint(1) NOT NULL DEFAULT '0',
  `pCash` int(11) NOT NULL DEFAULT '0',
  `pBank` int(11) NOT NULL DEFAULT '0',
  `pLevel` mediumint(9) DEFAULT '1',
  `pExp` int(11) NOT NULL DEFAULT '0',
  `pSatiIgre` smallint(5) NOT NULL DEFAULT '0',
  `pProveoInGame` tinyint(2) NOT NULL DEFAULT '0',
  `pNajviseOnline` tinyint(2) NOT NULL DEFAULT '0',
  `pSkin` smallint(5) DEFAULT '0',
  `pSpawn` tinyint(2) NOT NULL DEFAULT '0',
  `pMail` varchar(128) NOT NULL,
  `pPol` tinyint(1) NOT NULL,
  `pDrzava` tinyint(1) NOT NULL DEFAULT '0',
  `pGodine` tinyint(2) NOT NULL,
  `pAAS` tinyint(1) DEFAULT '0',
  `pAASCode` smallint(4) NOT NULL DEFAULT '0',
  `pSupporter` tinyint(1) NOT NULL DEFAULT '0',
  `pSPoeni` smallint(5) NOT NULL DEFAULT '0',
  `pPromoter` tinyint(1) NOT NULL DEFAULT '0',
  `pVIP` tinyint(1) NOT NULL DEFAULT '0',
  `pVIPMinuta` int(11) NOT NULL DEFAULT '0',
  `pRacunar` tinyint(1) NOT NULL DEFAULT '0',
  `pScriptRank` tinyint(1) NOT NULL DEFAULT '0',
  `pLider` tinyint(2) NOT NULL DEFAULT '0',
  `pClan` tinyint(2) NOT NULL DEFAULT '0',
  `pRank` tinyint(1) NOT NULL DEFAULT '0',
  `pVozilo1` smallint(4) NOT NULL DEFAULT '9999',
  `pVozilo2` smallint(4) NOT NULL DEFAULT '9999',
  `pVozilo3` smallint(4) NOT NULL DEFAULT '9999',
  `pVozilo4` smallint(4) NOT NULL DEFAULT '9999',
  `pSlot3` tinyint(1) NOT NULL DEFAULT '0',
  `pSlot4` tinyint(1) NOT NULL DEFAULT '0',
  `pKljucKuce` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucStana` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucVikendice` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucGaraze` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucFirme` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucBiznisa` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucImanja` smallint(4) NOT NULL DEFAULT '9999',
  `pKljucTrafike` smallint(4) NOT NULL DEFAULT '9999',
  `pJailed` tinyint(1) NOT NULL DEFAULT '0',
  `pJailTime` smallint(4) NOT NULL DEFAULT '0',
  `pBorbeniStil` tinyint(1) NOT NULL DEFAULT '0',
  `pOtkaz` smallint(1) NOT NULL DEFAULT '0',
  `pGunDoz` smallint(3) NOT NULL DEFAULT '0',
  `pKolaDoz` smallint(3) NOT NULL DEFAULT '0',
  `pMotorDoz` smallint(3) NOT NULL DEFAULT '0',
  `pKamionDoz` smallint(3) NOT NULL DEFAULT '0',
  `pFlyDoz` smallint(3) NOT NULL DEFAULT '0',
  `pBrodDoz` smallint(3) NOT NULL DEFAULT '0',
  `pCigare` tinyint(2) NOT NULL DEFAULT '0',
  `pUpaljac` tinyint(1) NOT NULL DEFAULT '0',
  `pKanap` tinyint(1) DEFAULT '0',
  `pZlocin` mediumint(9) NOT NULL DEFAULT '0',
  `pSat` smallint(1) NOT NULL DEFAULT '0',
  `pLottoNumber` mediumint(4) NOT NULL DEFAULT '0',
  `pKazna` int(11) NOT NULL DEFAULT '0',
  `pMobilni` mediumint(6) NOT NULL DEFAULT '0',
  `pMobKredit` mediumint(9) NOT NULL DEFAULT '0',
  `pImenik` tinyint(1) NOT NULL DEFAULT '0',
  `pKills` mediumint(9) NOT NULL DEFAULT '0',
  `pDeaths` mediumint(9) NOT NULL DEFAULT '0',
  `pJob` tinyint(2) NOT NULL DEFAULT '0',
  `pGKartica` tinyint(1) NOT NULL DEFAULT '0',
  `pZlato` smallint(5) NOT NULL DEFAULT '0',
  `pSrebro` smallint(5) NOT NULL DEFAULT '0',
  `pATMKartica` tinyint(1) NOT NULL DEFAULT '0',
  `pPoklon` smallint(5) NOT NULL DEFAULT '0',
  `pLek` smallint(5) DEFAULT '0',
  `pRadio` tinyint(1) NOT NULL DEFAULT '0',
  `pBolest` tinyint(1) NOT NULL DEFAULT '0',
  `pArrested` smallint(5) NOT NULL DEFAULT '0',
  `pGorivo` smallint(5) NOT NULL DEFAULT '0',
  `pInvWeapon` tinyint(2) NOT NULL DEFAULT '0',
  `pInvAmmo` smallint(5) NOT NULL DEFAULT '0',
  `pInvWeapon2` tinyint(2) NOT NULL DEFAULT '0',
  `pInvAmmo2` smallint(5) NOT NULL DEFAULT '0',
  `pInvWeapon3` tinyint(2) NOT NULL DEFAULT '0',
  `pInvAmmo3` smallint(5) NOT NULL DEFAULT '0',
  `pMats` mediumint(9) NOT NULL DEFAULT '0',
  `pWarns` tinyint(1) NOT NULL DEFAULT '0',
  `pGPS` tinyint(1) NOT NULL DEFAULT '0',
  `pTorba` tinyint(1) NOT NULL DEFAULT '0',
  `pHleb` smallint(5) NOT NULL DEFAULT '0',
  `pPizza` smallint(5) NOT NULL DEFAULT '0',
  `pCocaCola` smallint(5) NOT NULL DEFAULT '0',
  `pMleko` smallint(5) NOT NULL DEFAULT '0',
  `pSendvic` smallint(5) NOT NULL DEFAULT '0',
  `pBankKredit` mediumint(7) NOT NULL DEFAULT '0',
  `pWanted` smallint(3) NOT NULL DEFAULT '0',
  `pGlad` tinyint(3) NOT NULL DEFAULT '0',
  `pWC` tinyint(3) NOT NULL DEFAULT '0',
  `pLTA` tinyint(1) DEFAULT '0',
  `pSuspend` tinyint(1) NOT NULL DEFAULT '0',
  `pKaciga` tinyint(1) NOT NULL DEFAULT '0',
  `pOgrlice` smallint(5) NOT NULL DEFAULT '0',
  `pSlike` smallint(5) NOT NULL DEFAULT '0',
  `pMute` tinyint(1) NOT NULL DEFAULT '0',
  `pVMute` smallint(5) NOT NULL DEFAULT '0',
  `pNovcanik` tinyint(2) NOT NULL DEFAULT '0',
  `pSwat` tinyint(1) NOT NULL DEFAULT '0',
  `pKruska` smallint(5) NOT NULL DEFAULT '0',
  `pJabuka` smallint(5) NOT NULL DEFAULT '0',
  `pSljiva` smallint(5) NOT NULL DEFAULT '0',
  `pDrvoKruska` smallint(4) NOT NULL DEFAULT '0',
  `pDrvoJabuka` smallint(4) NOT NULL DEFAULT '0',
  `pDrvoSljiva` smallint(4) NOT NULL DEFAULT '0',
  `pGrebGr` smallint(5) NOT NULL DEFAULT '0',
  `pPosX` float NOT NULL DEFAULT '0',
  `pPosY` float NOT NULL DEFAULT '0',
  `pPosZ` float NOT NULL DEFAULT '0',
  `pPosAngle` float NOT NULL DEFAULT '0',
  `pPosVW` int(11) NOT NULL DEFAULT '0',
  `pPosInt` int(11) NOT NULL DEFAULT '0',
  `pPosUsao` tinyint(1) NOT NULL DEFAULT '0',
  `pGun1` tinyint(2) NOT NULL DEFAULT '0',
  `pGun2` tinyint(2) NOT NULL DEFAULT '0',
  `pGun3` tinyint(2) NOT NULL DEFAULT '0',
  `pGun4` tinyint(2) NOT NULL DEFAULT '0',
  `pAmmo1` smallint(5) NOT NULL DEFAULT '0',
  `pAmmo2` smallint(5) NOT NULL DEFAULT '0',
  `pAmmo3` smallint(5) NOT NULL DEFAULT '0',
  `pAmmo4` smallint(5) NOT NULL DEFAULT '0',
  `pCrash` tinyint(1) DEFAULT '0',
  `pMarried` tinyint(1) NOT NULL DEFAULT '0',
  `pMarriedTo` varchar(25) NOT NULL DEFAULT 'Niko',
  `pReaction` smallint(5) NOT NULL DEFAULT '0',
  `pAPoints` tinyint(4) NOT NULL DEFAULT '0',
  `pZica` tinyint(1) NOT NULL DEFAULT '0',
  `pUgovor` tinyint(2) NOT NULL DEFAULT '0',
  `pRobbing` tinyint(4) NOT NULL DEFAULT '0',
  `pJackPot` int(11) NOT NULL DEFAULT '0',
  `pFirmaUsao` smallint(4) NOT NULL DEFAULT '0',
  `pNY` tinyint(1) NOT NULL DEFAULT '0',
  `pACode` smallint(5) NOT NULL DEFAULT '0',
  `pSemenke` smallint(5) NOT NULL DEFAULT '0',
  `pSupstances` smallint(5) NOT NULL DEFAULT '0',
  `pDroga` smallint(5) NOT NULL DEFAULT '0',
  `pKaznaWarn` tinyint(1) NOT NULL DEFAULT '0',
  `pRChan` smallint(5) NOT NULL DEFAULT '0',
  `pNewRadio` tinyint(1) NOT NULL DEFAULT '0',
  `pRAdmin` smallint(5) NOT NULL DEFAULT '0',
  `pHangar` tinyint(2) NOT NULL DEFAULT '0',
  `pMobVrsta` tinyint(2) NOT NULL DEFAULT '0',
  `pSlusalice` tinyint(1) NOT NULL DEFAULT '0',
  `pPP` tinyint(1) NOT NULL DEFAULT '0',
  `pTogWarns` tinyint(1) NOT NULL DEFAULT '0',
  `pCHP` float NOT NULL DEFAULT '0',
  `pCArmour` float NOT NULL DEFAULT '0',
  `pSvercer` tinyint(1) NOT NULL DEFAULT '0',
  `pBoje` tinyint(1) NOT NULL DEFAULT '0',
  `pObjekat0` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat1` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat2` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat3` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat4` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat5` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat6` smallint(5) NOT NULL DEFAULT '0',
  `pObjekat0Set` tinyint(1) NOT NULL DEFAULT '0',
  `pObjekat1Set` tinyint(1) DEFAULT '0',
  `pObjekat2Set` tinyint(1) NOT NULL DEFAULT '0',
  `pObjekat3Set` tinyint(1) NOT NULL DEFAULT '0',
  `pObjekat4Set` tinyint(1) NOT NULL DEFAULT '0',
  `pObjekat5Set` tinyint(1) DEFAULT '0',
  `pObjekat6Set` tinyint(1) NOT NULL DEFAULT '0',
  `pOChat` tinyint(2) NOT NULL DEFAULT '0',
  `pRent` smallint(4) NOT NULL DEFAULT '9999',
  `pRentVrsta` tinyint(1) NOT NULL DEFAULT '0',
  `pTogAnimChat` tinyint(1) NOT NULL DEFAULT '0',
  `pTogRandMsg` tinyint(1) NOT NULL DEFAULT '0',
  `pTogTutMsg` tinyint(1) NOT NULL DEFAULT '0',
  `pTogPM` tinyint(1) NOT NULL DEFAULT '0',
  `pTogAD` tinyint(1) NOT NULL DEFAULT '0',
  `pTogOOC` tinyint(1) NOT NULL DEFAULT '0',
  `pTogAEG` tinyint(1) NOT NULL DEFAULT '0',
  `pTogPhone` tinyint(1) NOT NULL DEFAULT '0',
  `pReason` varchar(64) NOT NULL,
  `pOdradio` tinyint(2) NOT NULL DEFAULT '0',
  `pTrackingD` smallint(4) NOT NULL DEFAULT '9999',
  `pTDReset` tinyint(2) NOT NULL DEFAULT '0',
  `pAdBlock` tinyint(1) NOT NULL DEFAULT '0',
  `pABTime` smallint(4) NOT NULL DEFAULT '0',
  `pFAK` tinyint(1) NOT NULL DEFAULT '0',
  `pWForbid` tinyint(1) NOT NULL DEFAULT '0',
  `pMP3` tinyint(1) NOT NULL DEFAULT '0',
  `pRankDM` tinyint(2) NOT NULL DEFAULT '0',
  `pKillsDM` int(11) NOT NULL DEFAULT '0',
  `pDeathsDM` int(11) NOT NULL DEFAULT '0',
  `pKaznjen` tinyint(1) NOT NULL DEFAULT '0',
  `pHideNumber` tinyint(1) NOT NULL DEFAULT '0',
  `pAProm` tinyint(1) NOT NULL DEFAULT '0',
  `pALead` tinyint(1) NOT NULL DEFAULT '0',
  `pAGame` tinyint(1) NOT NULL DEFAULT '0',
  `pKazneni` smallint(5) DEFAULT '0',
  `pKazneniVec` tinyint(2) NOT NULL DEFAULT '0',
  `pSkate` tinyint(1) NOT NULL DEFAULT '0',
  `pALive` tinyint(1) NOT NULL DEFAULT '0',
  `pTogMusic` tinyint(1) NOT NULL DEFAULT '0',
  `pUnjail` tinyint(1) NOT NULL DEFAULT '0',
  `pZavoj` tinyint(1) NOT NULL DEFAULT '0',
  `pDron` tinyint(1) NOT NULL DEFAULT '0',
  `pLaptop` tinyint(1) NOT NULL DEFAULT '0',
  `pLaptopVirus` tinyint(1) NOT NULL DEFAULT '0',
  `pZauzimanjeVreme` tinyint(2) NOT NULL DEFAULT '0',
  `pAlat` tinyint(1) NOT NULL DEFAULT '0',
  `pMina` tinyint(1) NOT NULL DEFAULT '0',
  `pC4` tinyint(1) NOT NULL DEFAULT '0',
  `pInvArmor` tinyint(1) NOT NULL DEFAULT '0',
  `pBanned` tinyint(1) NOT NULL DEFAULT '0',
  `pBanAdmin` varchar(24) NOT NULL,
  `pBanReason` varchar(15) NOT NULL,
  `pBanType` tinyint(1) NOT NULL DEFAULT '0',
  `pBanTime` int(11) NOT NULL DEFAULT '0',
  `pBanDate` varchar(25) NOT NULL,
  `pLocked` tinyint(1) NOT NULL DEFAULT '0',
  `pLockAdmin` varchar(24) NOT NULL,
  `pLockReason` varchar(15) NOT NULL DEFAULT 'None',
  `pLockDate` varchar(25) NOT NULL,
  `pInArea` tinyint(1) NOT NULL DEFAULT '0',
  `pAreaAdmin` varchar(24) NOT NULL,
  `pAreaDays` tinyint(2) NOT NULL DEFAULT '0',
  `pAreaReason` varchar(15) NOT NULL,
  `pInPrison` tinyint(1) NOT NULL DEFAULT '0',
  `pPrisonAdmin` varchar(24) NOT NULL,
  `pPrisonHours` mediumint(8) NOT NULL DEFAULT '0',
  `pPrisonReason` varchar(15) NOT NULL,
  `pLastLogin` varchar(25) NOT NULL,
  `pRegDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`pSQLID`, `pNick`, `pOnline`, `pPassword`, `pReg`, `pCash`, `pBank`, `pLevel`, `pExp`, `pSatiIgre`, `pProveoInGame`, `pNajviseOnline`, `pSkin`, `pSpawn`, `pMail`, `pPol`, `pDrzava`, `pGodine`, `pAAS`, `pAASCode`, `pSupporter`, `pSPoeni`, `pPromoter`, `pVIP`, `pVIPMinuta`, `pRacunar`, `pScriptRank`, `pLider`, `pClan`, `pRank`, `pVozilo1`, `pVozilo2`, `pVozilo3`, `pVozilo4`, `pSlot3`, `pSlot4`, `pKljucKuce`, `pKljucStana`, `pKljucVikendice`, `pKljucGaraze`, `pKljucFirme`, `pKljucBiznisa`, `pKljucImanja`, `pKljucTrafike`, `pJailed`, `pJailTime`, `pBorbeniStil`, `pOtkaz`, `pGunDoz`, `pKolaDoz`, `pMotorDoz`, `pKamionDoz`, `pFlyDoz`, `pBrodDoz`, `pCigare`, `pUpaljac`, `pKanap`, `pZlocin`, `pSat`, `pLottoNumber`, `pKazna`, `pMobilni`, `pMobKredit`, `pImenik`, `pKills`, `pDeaths`, `pJob`, `pGKartica`, `pZlato`, `pSrebro`, `pATMKartica`, `pPoklon`, `pLek`, `pRadio`, `pBolest`, `pArrested`, `pGorivo`, `pInvWeapon`, `pInvAmmo`, `pInvWeapon2`, `pInvAmmo2`, `pInvWeapon3`, `pInvAmmo3`, `pMats`, `pWarns`, `pGPS`, `pTorba`, `pHleb`, `pPizza`, `pCocaCola`, `pMleko`, `pSendvic`, `pBankKredit`, `pWanted`, `pGlad`, `pWC`, `pLTA`, `pSuspend`, `pKaciga`, `pOgrlice`, `pSlike`, `pMute`, `pVMute`, `pNovcanik`, `pSwat`, `pKruska`, `pJabuka`, `pSljiva`, `pDrvoKruska`, `pDrvoJabuka`, `pDrvoSljiva`, `pGrebGr`, `pPosX`, `pPosY`, `pPosZ`, `pPosAngle`, `pPosVW`, `pPosInt`, `pPosUsao`, `pGun1`, `pGun2`, `pGun3`, `pGun4`, `pAmmo1`, `pAmmo2`, `pAmmo3`, `pAmmo4`, `pCrash`, `pMarried`, `pMarriedTo`, `pReaction`, `pAPoints`, `pZica`, `pUgovor`, `pRobbing`, `pJackPot`, `pFirmaUsao`, `pNY`, `pACode`, `pSemenke`, `pSupstances`, `pDroga`, `pKaznaWarn`, `pRChan`, `pNewRadio`, `pRAdmin`, `pHangar`, `pMobVrsta`, `pSlusalice`, `pPP`, `pTogWarns`, `pCHP`, `pCArmour`, `pSvercer`, `pBoje`, `pObjekat0`, `pObjekat1`, `pObjekat2`, `pObjekat3`, `pObjekat4`, `pObjekat5`, `pObjekat6`, `pObjekat0Set`, `pObjekat1Set`, `pObjekat2Set`, `pObjekat3Set`, `pObjekat4Set`, `pObjekat5Set`, `pObjekat6Set`, `pOChat`, `pRent`, `pRentVrsta`, `pTogAnimChat`, `pTogRandMsg`, `pTogTutMsg`, `pTogPM`, `pTogAD`, `pTogOOC`, `pTogAEG`, `pTogPhone`, `pReason`, `pOdradio`, `pTrackingD`, `pTDReset`, `pAdBlock`, `pABTime`, `pFAK`, `pWForbid`, `pMP3`, `pRankDM`, `pKillsDM`, `pDeathsDM`, `pKaznjen`, `pHideNumber`, `pAProm`, `pALead`, `pAGame`, `pKazneni`, `pKazneniVec`, `pSkate`, `pALive`, `pTogMusic`, `pUnjail`, `pZavoj`, `pDron`, `pLaptop`, `pLaptopVirus`, `pZauzimanjeVreme`, `pAlat`, `pMina`, `pC4`, `pInvArmor`, `pBanned`, `pBanAdmin`, `pBanReason`, `pBanType`, `pBanTime`, `pBanDate`, `pLocked`, `pLockAdmin`, `pLockReason`, `pLockDate`, `pInArea`, `pAreaAdmin`, `pAreaDays`, `pAreaReason`, `pInPrison`, `pPrisonAdmin`, `pPrisonHours`, `pPrisonReason`, `pLastLogin`, `pRegDate`) VALUES
(1, '.X.', 0, 177144391, 1, 5320356, 21073645, 100, 5000, 279, 25, 11, 294, 3, 'muma@dev.net', 1, 6, 21, 6, 1, 0, 77, 0, 0, 0, 1, 1, 0, 0, 0, 1, 2, 9999, 9999, 1, 0, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 9999, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 19, 3, 0, 7070, 12449, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 18, -81.1054, -1054.99, 19.076, 182.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No-one', 4, 0, 0, 0, 127, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98, 98, 0, 0, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 9999, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 9999, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, '', 'None', '', 0, '', 0, '', 0, '', 0, '', '05/08/2018 - 21:04:08', '2018-02-28 19:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `cSQLID` smallint(5) NOT NULL,
  `cVehID` smallint(5) NOT NULL,
  `cModel` smallint(3) NOT NULL,
  `cPosX` float NOT NULL,
  `cPosY` float NOT NULL,
  `cPosZ` float NOT NULL,
  `cAngle` float NOT NULL,
  `cBoja1` tinyint(3) NOT NULL,
  `cBoja2` tinyint(3) NOT NULL,
  `cVlasnik` varchar(24) NOT NULL,
  `cIme` varchar(30) NOT NULL,
  `cCena` int(10) NOT NULL,
  `cTablice` varchar(10) NOT NULL,
  `cKupljen` tinyint(1) NOT NULL,
  `cZakljucan` tinyint(1) NOT NULL,
  `cPostavljen` tinyint(1) NOT NULL,
  `cDroga` mediumint(8) NOT NULL,
  `cGun1` tinyint(2) NOT NULL,
  `cAmmo1` mediumint(8) NOT NULL,
  `cGun2` tinyint(2) NOT NULL,
  `cAmmo2` mediumint(8) NOT NULL,
  `cGun3` tinyint(2) NOT NULL,
  `cAmmo3` mediumint(8) NOT NULL,
  `cNovac` int(11) NOT NULL DEFAULT '0',
  `cMats` mediumint(8) NOT NULL,
  `cVW` int(11) NOT NULL,
  `cNeakt` smallint(5) NOT NULL,
  `cTuned` tinyint(1) NOT NULL,
  `cSpoiler` smallint(5) NOT NULL,
  `cHood` mediumint(5) NOT NULL,
  `cRoof` mediumint(5) NOT NULL,
  `cSkirt` mediumint(5) NOT NULL,
  `cLamps` mediumint(5) NOT NULL,
  `cNitro` mediumint(5) NOT NULL,
  `cExhaust` mediumint(5) NOT NULL,
  `cWheels` mediumint(5) NOT NULL,
  `cStereo` mediumint(5) NOT NULL,
  `cHydraulics` mediumint(5) NOT NULL,
  `cFrontBumper` smallint(5) NOT NULL,
  `cRearBumper` smallint(5) NOT NULL,
  `cVents` smallint(5) NOT NULL,
  `cPaintJob` tinyint(1) NOT NULL,
  `cXMR` tinyint(1) NOT NULL,
  `cTDevice` smallint(5) NOT NULL,
  `cGorivo` tinyint(3) NOT NULL,
  `cUsage` tinyint(1) NOT NULL,
  `cOrg` tinyint(3) NOT NULL,
  `cOrgSQLID` tinyint(2) NOT NULL DEFAULT '-1',
  `cJob` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_rents`
--

CREATE TABLE `vehicle_rents` (
  `vrSQLID` tinyint(3) NOT NULL,
  `vrLiP_Pos_X` float NOT NULL,
  `vrLiP_Pos_Y` float NOT NULL,
  `vrLiP_Pos_Z` float NOT NULL,
  `vrSpawn_Pos_X` float NOT NULL,
  `vrSpawn_Pos_Y` float NOT NULL,
  `vrSpawn_Pos_Z` float NOT NULL,
  `vrSpawn_Pos_A` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xmas_gifts`
--

CREATE TABLE `xmas_gifts` (
  `poSQLID` smallint(5) NOT NULL,
  `poPoklonX` float NOT NULL,
  `poPoklonY` float NOT NULL,
  `poPoklonZ` float NOT NULL,
  `poRotX` float NOT NULL,
  `poRotY` float NOT NULL,
  `poRotZ` float NOT NULL,
  `poUzet` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xmas_trees`
--

CREATE TABLE `xmas_trees` (
  `jSQLID` smallint(4) NOT NULL,
  `jJelkaX` float NOT NULL,
  `jJelkaY` float NOT NULL,
  `jJelkaZ` float NOT NULL,
  `jRotX` float NOT NULL,
  `jRotY` float NOT NULL,
  `jRotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `_aasmenu`
--

CREATE TABLE `_aasmenu` (
  `amSQLID` tinyint(1) NOT NULL,
  `amKonekt` tinyint(1) NOT NULL DEFAULT '1',
  `amTajmeri` tinyint(1) NOT NULL DEFAULT '1',
  `amAdvert` tinyint(1) NOT NULL DEFAULT '1',
  `amLevel` tinyint(2) NOT NULL DEFAULT '1',
  `amBolest` tinyint(1) NOT NULL DEFAULT '1',
  `amNovac` mediumint(8) NOT NULL DEFAULT '10000',
  `amCProvera` tinyint(1) NOT NULL DEFAULT '1',
  `amSurfovanje` tinyint(1) NOT NULL DEFAULT '1',
  `amRAC` tinyint(1) NOT NULL DEFAULT '1',
  `amOrgLevel` tinyint(2) NOT NULL DEFAULT '10',
  `amRekSpam` tinyint(1) NOT NULL DEFAULT '1',
  `amRadar` tinyint(1) NOT NULL DEFAULT '1',
  `amOldPos` tinyint(1) DEFAULT '1',
  `amOfflineDeleteVar` tinyint(1) NOT NULL DEFAULT '1',
  `amWeather` tinyint(2) NOT NULL DEFAULT '1',
  `amStream` tinyint(1) NOT NULL DEFAULT '1',
  `amIme` tinyint(1) NOT NULL DEFAULT '1',
  `amLog` tinyint(1) NOT NULL DEFAULT '1',
  `amJackPot` mediumint(8) NOT NULL DEFAULT '100000',
  `amNewbie` tinyint(1) NOT NULL DEFAULT '1',
  `amDoubleExperience` tinyint(1) NOT NULL DEFAULT '0',
  `amKupovinaVozila` tinyint(1) NOT NULL DEFAULT '0',
  `amActorsLabels` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_aasmenu`
--

INSERT INTO `_aasmenu` (`amSQLID`, `amKonekt`, `amTajmeri`, `amAdvert`, `amLevel`, `amBolest`, `amNovac`, `amCProvera`, `amSurfovanje`, `amRAC`, `amOrgLevel`, `amRekSpam`, `amRadar`, `amOldPos`, `amOfflineDeleteVar`, `amWeather`, `amStream`, `amIme`, `amLog`, `amJackPot`, `amNewbie`, `amDoubleExperience`, `amKupovinaVozila`, `amActorsLabels`) VALUES
(1, 1, 1, 1, 1, 1, 15000, 1, 1, 1, 10, 1, 1, 0, 1, 1, 1, 1, 1, 100000, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_anticheat`
--

CREATE TABLE `_anticheat` (
  `acSQLID` tinyint(1) NOT NULL,
  `acMoneyHack` tinyint(1) NOT NULL DEFAULT '1',
  `acAmmoHack` tinyint(1) NOT NULL DEFAULT '1',
  `acRestrictedWeapons` tinyint(1) NOT NULL DEFAULT '1',
  `acJetPackHack` tinyint(1) NOT NULL DEFAULT '1',
  `acTeleportHack` tinyint(1) NOT NULL DEFAULT '1',
  `acWeaponHack` tinyint(1) NOT NULL DEFAULT '1',
  `acSpeedHack` tinyint(1) NOT NULL DEFAULT '1',
  `acArmourHack` tinyint(1) NOT NULL DEFAULT '1',
  `acFlyHack` tinyint(1) NOT NULL DEFAULT '1',
  `acRepairHack` tinyint(1) NOT NULL DEFAULT '1',
  `acHealthHack` tinyint(1) NOT NULL DEFAULT '1',
  `acFakeKill` tinyint(1) NOT NULL DEFAULT '1',
  `acMaxPing` smallint(4) NOT NULL DEFAULT '750',
  `acAntiCleo` tinyint(1) NOT NULL DEFAULT '1',
  `acNoReload` tinyint(1) NOT NULL DEFAULT '1',
  `acAntiSobeit` tinyint(1) NOT NULL DEFAULT '1',
  `acTeleportCPHack` tinyint(1) NOT NULL DEFAULT '1',
  `acNoFuel` tinyint(1) NOT NULL DEFAULT '1',
  `acInvalidCam` tinyint(1) NOT NULL DEFAULT '1',
  `acBulletCrasher` tinyint(1) NOT NULL DEFAULT '1',
  `acWeaponCrasher` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_anticheat`
--

INSERT INTO `_anticheat` (`acSQLID`, `acMoneyHack`, `acAmmoHack`, `acRestrictedWeapons`, `acJetPackHack`, `acTeleportHack`, `acWeaponHack`, `acSpeedHack`, `acArmourHack`, `acFlyHack`, `acRepairHack`, `acHealthHack`, `acFakeKill`, `acMaxPing`, `acAntiCleo`, `acNoReload`, `acAntiSobeit`, `acTeleportCPHack`, `acNoFuel`, `acInvalidCam`, `acBulletCrasher`, `acWeaponCrasher`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 650, 1, 1, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `_fuel`
--

CREATE TABLE `_fuel` (
  `pSQLID` tinyint(1) NOT NULL,
  `Pumpa1` smallint(5) NOT NULL DEFAULT '1000',
  `Pumpa2` smallint(5) NOT NULL DEFAULT '1000',
  `Pumpa3` smallint(5) NOT NULL DEFAULT '1000',
  `Pumpa4` smallint(5) NOT NULL DEFAULT '1000',
  `Pumpa5` smallint(5) NOT NULL DEFAULT '1000',
  `Pumpa6` smallint(5) NOT NULL DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_fuel`
--

INSERT INTO `_fuel` (`pSQLID`, `Pumpa1`, `Pumpa2`, `Pumpa3`, `Pumpa4`, `Pumpa5`, `Pumpa6`) VALUES
(1, 1000, 1000, 1000, 1000, 1000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `_notifys`
--

CREATE TABLE `_notifys` (
  `aNotifySQLID` tinyint(2) NOT NULL,
  `aNotifyText` varchar(128) NOT NULL DEFAULT 'Nema',
  `aNotifyExist` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_notifys`
--

INSERT INTO `_notifys` (`aNotifySQLID`, `aNotifyText`, `aNotifyExist`) VALUES
(1, 'U toku je beta verzija gamemode-a!', 1),
(2, 'Svaki bug/gresku prijavite Skripteru X/Muma!', 1),
(3, 'Nema', 0),
(4, 'Nema', 0),
(5, 'Nema', 0),
(6, 'Nema', 0),
(7, 'Nema', 0),
(8, 'Nema', 0),
(9, 'Nema', 0),
(10, 'Nema', 0);

-- --------------------------------------------------------

--
-- Table structure for table `_salary`
--

CREATE TABLE `_salary` (
  `pltSQLID` tinyint(1) NOT NULL,
  `DPizzePlata` smallint(5) NOT NULL DEFAULT '6000',
  `BolnicarPlata` smallint(5) NOT NULL DEFAULT '6500',
  `TaksistaPlata` smallint(5) NOT NULL DEFAULT '2500',
  `RudarPlata` tinyint(2) NOT NULL DEFAULT '8',
  `SmecarPlata` smallint(5) NOT NULL DEFAULT '7500',
  `DGorivaPlata` smallint(5) NOT NULL DEFAULT '8000',
  `MehanicarPlata` smallint(5) NOT NULL DEFAULT '3000',
  `PilotPlata` smallint(5) NOT NULL DEFAULT '7600',
  `VozacBusaPlata` smallint(5) NOT NULL DEFAULT '9000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_salary`
--

INSERT INTO `_salary` (`pltSQLID`, `DPizzePlata`, `BolnicarPlata`, `TaksistaPlata`, `RudarPlata`, `SmecarPlata`, `DGorivaPlata`, `MehanicarPlata`, `PilotPlata`, `VozacBusaPlata`) VALUES
(1, 6000, 6500, 2500, 8, 7500, 8000, 3000, 7600, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `_statistic`
--

CREATE TABLE `_statistic` (
  `ssSQLID` tinyint(1) NOT NULL,
  `ssRekord` smallint(4) NOT NULL DEFAULT '0',
  `ssRegistrovano` mediumint(8) NOT NULL DEFAULT '0',
  `ssPosjetaServeru` mediumint(8) NOT NULL DEFAULT '0',
  `ssBanovi` mediumint(8) NOT NULL DEFAULT '0',
  `ssKikovi` mediumint(8) NOT NULL DEFAULT '0',
  `ssArea` mediumint(8) NOT NULL DEFAULT '0',
  `ssJail` mediumint(8) NOT NULL DEFAULT '0',
  `ssMute` mediumint(8) NOT NULL DEFAULT '0',
  `ssEventi` mediumint(8) NOT NULL DEFAULT '0',
  `ssUnbanovi` mediumint(8) NOT NULL DEFAULT '0',
  `ssNameovi` mediumint(8) NOT NULL DEFAULT '0',
  `ssWarnovi` mediumint(8) NOT NULL DEFAULT '0',
  `ssBrojVozila` smallint(4) NOT NULL DEFAULT '0',
  `ssReactionTime` smallint(5) NOT NULL DEFAULT '6000',
  `ssReactionName` varchar(24) NOT NULL DEFAULT 'Script'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_statistic`
--

INSERT INTO `_statistic` (`ssSQLID`, `ssRekord`, `ssRegistrovano`, `ssPosjetaServeru`, `ssBanovi`, `ssKikovi`, `ssArea`, `ssJail`, `ssMute`, `ssEventi`, `ssUnbanovi`, `ssNameovi`, `ssWarnovi`, `ssBrojVozila`, `ssReactionTime`, `ssReactionName`) VALUES
(1, 1, 0, 72, 0, 1, 0, 0, 0, 4, 0, 0, 0, 0, 6000, 'Script');

-- --------------------------------------------------------

--
-- Table structure for table `_vehs`
--

CREATE TABLE `_vehs` (
  `lapVehSQLID` tinyint(1) NOT NULL,
  `lapVehID_400` smallint(3) NOT NULL DEFAULT '400',
  `lapVehKol_400` tinyint(2) NOT NULL,
  `lapVehID_401` smallint(3) NOT NULL DEFAULT '401',
  `lapVehKol_401` tinyint(2) NOT NULL,
  `lapVehID_402` smallint(3) NOT NULL DEFAULT '402',
  `lapVehKol_402` tinyint(2) NOT NULL,
  `lapVehID_404` smallint(3) NOT NULL DEFAULT '404',
  `lapVehKol_404` tinyint(2) NOT NULL,
  `lapVehID_405` smallint(3) NOT NULL DEFAULT '405',
  `lapVehKol_405` tinyint(2) NOT NULL,
  `lapVehID_410` smallint(3) NOT NULL DEFAULT '410',
  `lapVehKol_410` tinyint(2) NOT NULL,
  `lapVehID_411` smallint(3) NOT NULL DEFAULT '411',
  `lapVehKol_411` tinyint(2) NOT NULL,
  `lapVehID_412` smallint(3) NOT NULL DEFAULT '412',
  `lapVehKol_412` tinyint(2) NOT NULL,
  `lapVehID_413` smallint(3) NOT NULL DEFAULT '413',
  `lapVehKol_413` tinyint(2) NOT NULL,
  `lapVehID_415` smallint(3) NOT NULL DEFAULT '415',
  `lapVehKol_415` tinyint(2) NOT NULL,
  `lapVehID_418` smallint(3) NOT NULL DEFAULT '418',
  `lapVehKol_418` tinyint(2) NOT NULL,
  `lapVehID_419` smallint(3) NOT NULL DEFAULT '419',
  `lapVehKol_419` tinyint(2) NOT NULL,
  `lapVehID_421` smallint(3) NOT NULL DEFAULT '421',
  `lapVehKol_421` tinyint(2) NOT NULL,
  `lapVehID_422` smallint(3) NOT NULL DEFAULT '422',
  `lapVehKol_422` tinyint(2) NOT NULL,
  `lapVehID_424` smallint(3) NOT NULL DEFAULT '424',
  `lapVehKol_424` tinyint(2) NOT NULL,
  `lapVehID_426` smallint(3) NOT NULL DEFAULT '426',
  `lapVehKol_426` tinyint(2) NOT NULL,
  `lapVehID_429` smallint(3) NOT NULL DEFAULT '429',
  `lapVehKol_429` tinyint(2) NOT NULL,
  `lapVehID_434` smallint(3) NOT NULL DEFAULT '434',
  `lapVehKol_434` tinyint(2) NOT NULL,
  `lapVehID_436` smallint(3) NOT NULL DEFAULT '436',
  `lapVehKol_436` tinyint(2) NOT NULL,
  `lapVehID_439` smallint(3) NOT NULL DEFAULT '439',
  `lapVehKol_439` tinyint(2) NOT NULL,
  `lapVehID_445` smallint(3) NOT NULL DEFAULT '445',
  `lapVehKol_445` tinyint(2) NOT NULL,
  `lapVehID_446` smallint(3) NOT NULL DEFAULT '446',
  `lapVehKol_446` tinyint(2) NOT NULL,
  `lapVehID_447` smallint(3) NOT NULL DEFAULT '447',
  `lapVehKol_447` tinyint(2) NOT NULL,
  `lapVehID_451` smallint(3) NOT NULL DEFAULT '451',
  `lapVehKol_451` tinyint(2) NOT NULL,
  `lapVehID_452` smallint(3) NOT NULL DEFAULT '452',
  `lapVehKol_452` tinyint(2) NOT NULL,
  `lapVehID_453` smallint(3) DEFAULT '453',
  `lapVehKol_453` tinyint(2) NOT NULL,
  `lapVehID_454` smallint(3) NOT NULL DEFAULT '454',
  `lapVehKol_454` tinyint(2) NOT NULL,
  `lapVehID_458` smallint(3) NOT NULL DEFAULT '458',
  `lapVehKol_458` tinyint(2) NOT NULL,
  `lapVehID_460` smallint(3) NOT NULL DEFAULT '460',
  `lapVehKol_460` tinyint(2) NOT NULL,
  `lapVehID_461` smallint(3) NOT NULL DEFAULT '461',
  `lapVehKol_461` tinyint(2) NOT NULL,
  `lapVehID_462` smallint(3) NOT NULL DEFAULT '462',
  `lapVehKol_462` tinyint(2) NOT NULL,
  `lapVehID_463` smallint(3) NOT NULL DEFAULT '463',
  `lapVehKol_463` tinyint(2) NOT NULL,
  `lapVehID_466` smallint(3) NOT NULL DEFAULT '466',
  `lapVehKol_466` tinyint(2) NOT NULL,
  `lapVehID_467` smallint(3) NOT NULL DEFAULT '467',
  `lapVehKol_467` tinyint(2) NOT NULL,
  `lapVehID_468` smallint(3) NOT NULL DEFAULT '468',
  `lapVehKol_468` tinyint(2) NOT NULL,
  `lapVehID_469` smallint(3) NOT NULL DEFAULT '469',
  `lapVehKol_469` tinyint(2) NOT NULL,
  `lapVehID_471` smallint(3) NOT NULL DEFAULT '471',
  `lapVehKol_471` tinyint(2) NOT NULL,
  `lapVehID_473` smallint(3) NOT NULL DEFAULT '473',
  `lapVehKol_473` tinyint(2) NOT NULL,
  `lapVehID_474` smallint(3) NOT NULL DEFAULT '474',
  `lapVehKol_474` tinyint(2) NOT NULL,
  `lapVehID_475` smallint(3) NOT NULL DEFAULT '475',
  `lapVehKol_475` tinyint(2) NOT NULL,
  `lapVehID_477` smallint(3) NOT NULL DEFAULT '477',
  `lapVehKol_477` tinyint(2) NOT NULL,
  `lapVehID_479` smallint(3) NOT NULL DEFAULT '479',
  `lapVehKol_479` tinyint(2) NOT NULL,
  `lapVehID_480` smallint(3) NOT NULL DEFAULT '480',
  `lapVehKol_480` tinyint(2) NOT NULL,
  `lapVehID_481` smallint(3) NOT NULL DEFAULT '481',
  `lapVehKol_481` tinyint(2) NOT NULL,
  `lapVehID_482` smallint(3) NOT NULL DEFAULT '482',
  `lapVehKol_482` tinyint(2) NOT NULL,
  `lapVehID_483` smallint(3) NOT NULL DEFAULT '483',
  `lapVehKol_483` tinyint(2) NOT NULL,
  `lapVehID_484` smallint(3) NOT NULL DEFAULT '484',
  `lapVehKol_484` tinyint(2) NOT NULL,
  `lapVehID_487` smallint(3) NOT NULL DEFAULT '487',
  `lapVehKol_487` tinyint(2) NOT NULL,
  `lapVehID_489` smallint(3) NOT NULL DEFAULT '489',
  `lapVehKol_489` tinyint(2) NOT NULL,
  `lapVehID_491` smallint(3) NOT NULL DEFAULT '491',
  `lapVehKol_491` tinyint(2) NOT NULL,
  `lapVehID_492` smallint(3) NOT NULL DEFAULT '492',
  `lapVehKol_492` tinyint(2) NOT NULL,
  `lapVehID_493` smallint(3) NOT NULL DEFAULT '493',
  `lapVehKol_493` tinyint(2) NOT NULL,
  `lapVehID_495` smallint(3) NOT NULL DEFAULT '495',
  `lapVehKol_495` tinyint(2) NOT NULL,
  `lapVehID_496` smallint(3) NOT NULL DEFAULT '496',
  `lapVehKol_496` tinyint(2) NOT NULL,
  `lapVehID_500` smallint(3) NOT NULL DEFAULT '500',
  `lapVehKol_500` tinyint(2) NOT NULL,
  `lapVehID_506` smallint(3) NOT NULL DEFAULT '506',
  `lapVehKol_506` tinyint(2) NOT NULL,
  `lapVehID_507` smallint(3) NOT NULL DEFAULT '507',
  `lapVehKol_507` tinyint(2) NOT NULL,
  `lapVehID_509` smallint(3) NOT NULL DEFAULT '509',
  `lapVehKol_509` tinyint(2) NOT NULL,
  `lapVehID_510` smallint(3) NOT NULL DEFAULT '510',
  `lapVehKol_510` tinyint(2) NOT NULL,
  `lapVehID_513` smallint(3) NOT NULL DEFAULT '513',
  `lapVehKol_513` tinyint(2) NOT NULL,
  `lapVehID_516` smallint(3) NOT NULL DEFAULT '516',
  `lapVehKol_516` tinyint(2) NOT NULL,
  `lapVehID_517` smallint(3) NOT NULL DEFAULT '517',
  `lapVehKol_517` tinyint(2) NOT NULL,
  `lapVehID_518` smallint(3) NOT NULL DEFAULT '518',
  `lapVehKol_518` tinyint(2) NOT NULL,
  `lapVehID_519` smallint(3) NOT NULL DEFAULT '519',
  `lapVehKol_519` tinyint(2) NOT NULL,
  `lapVehID_521` smallint(3) NOT NULL DEFAULT '521',
  `lapVehKol_521` tinyint(2) NOT NULL,
  `lapVehID_522` smallint(3) NOT NULL DEFAULT '522',
  `lapVehKol_522` tinyint(2) NOT NULL,
  `lapVehID_526` smallint(3) NOT NULL DEFAULT '526',
  `lapVehKol_526` tinyint(2) NOT NULL,
  `lapVehID_527` smallint(3) NOT NULL DEFAULT '527',
  `lapVehKol_527` tinyint(2) NOT NULL,
  `lapVehID_529` smallint(3) NOT NULL DEFAULT '529',
  `lapVehKol_529` tinyint(2) NOT NULL,
  `lapVehID_533` smallint(3) NOT NULL DEFAULT '533',
  `lapVehKol_533` tinyint(2) NOT NULL,
  `lapVehID_534` smallint(3) NOT NULL DEFAULT '534',
  `lapVehKol_534` tinyint(2) NOT NULL,
  `lapVehID_535` smallint(3) NOT NULL DEFAULT '535',
  `lapVehKol_535` tinyint(2) NOT NULL,
  `lapVehID_536` smallint(3) NOT NULL DEFAULT '536',
  `lapVehKol_536` tinyint(2) NOT NULL,
  `lapVehID_540` smallint(3) NOT NULL DEFAULT '540',
  `lapVehKol_540` tinyint(2) NOT NULL,
  `lapVehID_541` smallint(3) NOT NULL DEFAULT '541',
  `lapVehKol_541` tinyint(2) NOT NULL,
  `lapVehID_542` smallint(3) NOT NULL DEFAULT '542',
  `lapVehKol_542` tinyint(2) NOT NULL,
  `lapVehID_543` smallint(3) NOT NULL DEFAULT '543',
  `lapVehKol_543` tinyint(2) NOT NULL,
  `lapVehID_545` smallint(3) NOT NULL DEFAULT '545',
  `lapVehKol_545` tinyint(2) NOT NULL,
  `lapVehID_546` smallint(3) NOT NULL DEFAULT '546',
  `lapVehKol_546` tinyint(2) NOT NULL,
  `lapVehID_547` smallint(3) NOT NULL DEFAULT '547',
  `lapVehKol_547` tinyint(2) NOT NULL,
  `lapVehID_549` smallint(3) NOT NULL DEFAULT '549',
  `lapVehKol_549` tinyint(2) NOT NULL,
  `lapVehID_550` smallint(3) NOT NULL DEFAULT '550',
  `lapVehKol_550` tinyint(2) NOT NULL,
  `lapVehID_551` smallint(3) NOT NULL DEFAULT '551',
  `lapVehKol_551` tinyint(2) NOT NULL,
  `lapVehID_554` smallint(3) NOT NULL DEFAULT '554',
  `lapVehKol_554` tinyint(2) NOT NULL,
  `lapVehID_555` smallint(3) NOT NULL DEFAULT '555',
  `lapVehKol_555` tinyint(2) NOT NULL,
  `lapVehID_558` smallint(3) NOT NULL DEFAULT '558',
  `lapVehKol_558` tinyint(2) NOT NULL,
  `lapVehID_559` smallint(3) NOT NULL DEFAULT '559',
  `lapVehKol_559` tinyint(2) NOT NULL,
  `lapVehID_560` smallint(3) NOT NULL DEFAULT '560',
  `lapVehKol_560` tinyint(2) NOT NULL,
  `lapVehID_561` smallint(3) NOT NULL DEFAULT '561',
  `lapVehKol_561` tinyint(2) NOT NULL,
  `lapVehID_562` smallint(3) NOT NULL DEFAULT '562',
  `lapVehKol_562` tinyint(2) NOT NULL,
  `lapVehID_565` smallint(3) NOT NULL DEFAULT '565',
  `lapVehKol_565` tinyint(2) NOT NULL,
  `lapVehID_566` smallint(3) NOT NULL DEFAULT '566',
  `lapVehKol_566` tinyint(2) NOT NULL,
  `lapVehID_567` smallint(3) NOT NULL DEFAULT '567',
  `lapVehKol_567` tinyint(2) NOT NULL,
  `lapVehID_575` smallint(3) NOT NULL DEFAULT '575',
  `lapVehKol_575` tinyint(2) NOT NULL,
  `lapVehID_576` smallint(3) NOT NULL DEFAULT '576',
  `lapVehKol_576` tinyint(2) NOT NULL,
  `lapVehID_579` smallint(3) NOT NULL DEFAULT '579',
  `lapVehKol_579` tinyint(2) NOT NULL,
  `lapVehID_580` smallint(3) NOT NULL DEFAULT '580',
  `lapVehKol_580` tinyint(2) NOT NULL,
  `lapVehID_581` smallint(3) NOT NULL DEFAULT '581',
  `lapVehKol_581` tinyint(2) NOT NULL,
  `lapVehID_585` smallint(3) NOT NULL DEFAULT '585',
  `lapVehKol_585` tinyint(2) NOT NULL,
  `lapVehID_586` smallint(3) NOT NULL DEFAULT '586',
  `lapVehKol_586` tinyint(2) NOT NULL,
  `lapVehID_587` smallint(3) NOT NULL DEFAULT '587',
  `lapVehKol_587` tinyint(2) NOT NULL,
  `lapVehID_589` smallint(3) NOT NULL DEFAULT '589',
  `lapVehKol_589` tinyint(2) NOT NULL,
  `lapVehID_593` smallint(3) NOT NULL DEFAULT '593',
  `lapVehKol_593` tinyint(2) NOT NULL,
  `lapVehID_600` smallint(3) NOT NULL DEFAULT '600',
  `lapVehKol_600` tinyint(2) NOT NULL,
  `lapVehID_602` smallint(3) NOT NULL DEFAULT '602',
  `lapVehKol_602` tinyint(2) NOT NULL,
  `lapVehID_603` smallint(3) NOT NULL DEFAULT '603',
  `lapVehKol_603` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_vehs`
--

INSERT INTO `_vehs` (`lapVehSQLID`, `lapVehID_400`, `lapVehKol_400`, `lapVehID_401`, `lapVehKol_401`, `lapVehID_402`, `lapVehKol_402`, `lapVehID_404`, `lapVehKol_404`, `lapVehID_405`, `lapVehKol_405`, `lapVehID_410`, `lapVehKol_410`, `lapVehID_411`, `lapVehKol_411`, `lapVehID_412`, `lapVehKol_412`, `lapVehID_413`, `lapVehKol_413`, `lapVehID_415`, `lapVehKol_415`, `lapVehID_418`, `lapVehKol_418`, `lapVehID_419`, `lapVehKol_419`, `lapVehID_421`, `lapVehKol_421`, `lapVehID_422`, `lapVehKol_422`, `lapVehID_424`, `lapVehKol_424`, `lapVehID_426`, `lapVehKol_426`, `lapVehID_429`, `lapVehKol_429`, `lapVehID_434`, `lapVehKol_434`, `lapVehID_436`, `lapVehKol_436`, `lapVehID_439`, `lapVehKol_439`, `lapVehID_445`, `lapVehKol_445`, `lapVehID_446`, `lapVehKol_446`, `lapVehID_447`, `lapVehKol_447`, `lapVehID_451`, `lapVehKol_451`, `lapVehID_452`, `lapVehKol_452`, `lapVehID_453`, `lapVehKol_453`, `lapVehID_454`, `lapVehKol_454`, `lapVehID_458`, `lapVehKol_458`, `lapVehID_460`, `lapVehKol_460`, `lapVehID_461`, `lapVehKol_461`, `lapVehID_462`, `lapVehKol_462`, `lapVehID_463`, `lapVehKol_463`, `lapVehID_466`, `lapVehKol_466`, `lapVehID_467`, `lapVehKol_467`, `lapVehID_468`, `lapVehKol_468`, `lapVehID_469`, `lapVehKol_469`, `lapVehID_471`, `lapVehKol_471`, `lapVehID_473`, `lapVehKol_473`, `lapVehID_474`, `lapVehKol_474`, `lapVehID_475`, `lapVehKol_475`, `lapVehID_477`, `lapVehKol_477`, `lapVehID_479`, `lapVehKol_479`, `lapVehID_480`, `lapVehKol_480`, `lapVehID_481`, `lapVehKol_481`, `lapVehID_482`, `lapVehKol_482`, `lapVehID_483`, `lapVehKol_483`, `lapVehID_484`, `lapVehKol_484`, `lapVehID_487`, `lapVehKol_487`, `lapVehID_489`, `lapVehKol_489`, `lapVehID_491`, `lapVehKol_491`, `lapVehID_492`, `lapVehKol_492`, `lapVehID_493`, `lapVehKol_493`, `lapVehID_495`, `lapVehKol_495`, `lapVehID_496`, `lapVehKol_496`, `lapVehID_500`, `lapVehKol_500`, `lapVehID_506`, `lapVehKol_506`, `lapVehID_507`, `lapVehKol_507`, `lapVehID_509`, `lapVehKol_509`, `lapVehID_510`, `lapVehKol_510`, `lapVehID_513`, `lapVehKol_513`, `lapVehID_516`, `lapVehKol_516`, `lapVehID_517`, `lapVehKol_517`, `lapVehID_518`, `lapVehKol_518`, `lapVehID_519`, `lapVehKol_519`, `lapVehID_521`, `lapVehKol_521`, `lapVehID_522`, `lapVehKol_522`, `lapVehID_526`, `lapVehKol_526`, `lapVehID_527`, `lapVehKol_527`, `lapVehID_529`, `lapVehKol_529`, `lapVehID_533`, `lapVehKol_533`, `lapVehID_534`, `lapVehKol_534`, `lapVehID_535`, `lapVehKol_535`, `lapVehID_536`, `lapVehKol_536`, `lapVehID_540`, `lapVehKol_540`, `lapVehID_541`, `lapVehKol_541`, `lapVehID_542`, `lapVehKol_542`, `lapVehID_543`, `lapVehKol_543`, `lapVehID_545`, `lapVehKol_545`, `lapVehID_546`, `lapVehKol_546`, `lapVehID_547`, `lapVehKol_547`, `lapVehID_549`, `lapVehKol_549`, `lapVehID_550`, `lapVehKol_550`, `lapVehID_551`, `lapVehKol_551`, `lapVehID_554`, `lapVehKol_554`, `lapVehID_555`, `lapVehKol_555`, `lapVehID_558`, `lapVehKol_558`, `lapVehID_559`, `lapVehKol_559`, `lapVehID_560`, `lapVehKol_560`, `lapVehID_561`, `lapVehKol_561`, `lapVehID_562`, `lapVehKol_562`, `lapVehID_565`, `lapVehKol_565`, `lapVehID_566`, `lapVehKol_566`, `lapVehID_567`, `lapVehKol_567`, `lapVehID_575`, `lapVehKol_575`, `lapVehID_576`, `lapVehKol_576`, `lapVehID_579`, `lapVehKol_579`, `lapVehID_580`, `lapVehKol_580`, `lapVehID_581`, `lapVehKol_581`, `lapVehID_585`, `lapVehKol_585`, `lapVehID_586`, `lapVehKol_586`, `lapVehID_587`, `lapVehKol_587`, `lapVehID_589`, `lapVehKol_589`, `lapVehID_593`, `lapVehKol_593`, `lapVehID_600`, `lapVehKol_600`, `lapVehID_602`, `lapVehKol_602`, `lapVehID_603`, `lapVehKol_603`) VALUES
(1, 400, 7, 401, 5, 402, 7, 404, 5, 405, 7, 410, 5, 411, 3, 412, 6, 413, 5, 415, 4, 418, 5, 419, 5, 421, 7, 422, 5, 424, 3, 426, 7, 429, 5, 434, 4, 436, 6, 439, 5, 445, 5, 446, 5, 447, 3, 451, 4, 452, 3, 453, 3, 454, 3, 458, 5, 460, 3, 461, 5, 462, 5, 463, 5, 466, 5, 467, 5, 468, 3, 469, 5, 471, 3, 473, 3, 474, 5, 475, 5, 477, 5, 479, 5, 480, 5, 481, 10, 482, 5, 483, 5, 484, 5, 487, 3, 489, 5, 491, 5, 492, 5, 493, 3, 495, 3, 496, 5, 500, 5, 506, 5, 507, 5, 509, 10, 510, 10, 513, 3, 516, 5, 517, 5, 518, 5, 519, 2, 521, 4, 522, 3, 526, 4, 527, 4, 529, 4, 533, 5, 534, 4, 535, 4, 536, 5, 540, 4, 541, 4, 542, 5, 543, 4, 545, 4, 546, 4, 547, 4, 549, 4, 550, 5, 551, 4, 554, 4, 555, 4, 558, 5, 559, 5, 560, 3, 561, 5, 562, 4, 565, 5, 566, 4, 567, 5, 575, 4, 576, 4, 579, 4, 580, 5, 581, 5, 585, 4, 586, 4, 587, 4, 589, 5, 593, 3, 600, 4, 602, 4, 603, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`ActorSQLID`),
  ADD UNIQUE KEY `ActorSQLID` (`ActorSQLID`);

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`sSQLID`),
  ADD UNIQUE KEY `hSQLID` (`sSQLID`);

--
-- Indexes for table `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`aSQLID`),
  ADD UNIQUE KEY `aSQLID_2` (`aSQLID`),
  ADD KEY `aSQLID` (`aSQLID`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`zSQLID`),
  ADD UNIQUE KEY `zSQLID` (`zSQLID`);

--
-- Indexes for table `bussines`
--
ALTER TABLE `bussines`
  ADD PRIMARY KEY (`bSQLID`),
  ADD UNIQUE KEY `bSQLID` (`bSQLID`);

--
-- Indexes for table `c4`
--
ALTER TABLE `c4`
  ADD PRIMARY KEY (`c4_SQLID`),
  ADD UNIQUE KEY `c4_SQLID` (`c4_SQLID`);

--
-- Indexes for table `callboxs`
--
ALTER TABLE `callboxs`
  ADD PRIMARY KEY (`goSQLID`),
  ADD UNIQUE KEY `goSQLID` (`goSQLID`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`chSQLID`),
  ADD UNIQUE KEY `chSQLID` (`chSQLID`);

--
-- Indexes for table `containers`
--
ALTER TABLE `containers`
  ADD PRIMARY KEY (`koSQLID`),
  ADD UNIQUE KEY `koSQLID` (`koSQLID`);

--
-- Indexes for table `cotagges`
--
ALTER TABLE `cotagges`
  ADD PRIMARY KEY (`vSQLID`),
  ADD UNIQUE KEY `hSQLID` (`vSQLID`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`DilerSQLID`),
  ADD UNIQUE KEY `dealersQLID` (`DilerSQLID`);

--
-- Indexes for table `droped_items`
--
ALTER TABLE `droped_items`
  ADD PRIMARY KEY (`diSQLID`),
  ADD UNIQUE KEY `diSQLID` (`diSQLID`);

--
-- Indexes for table `drug_plants`
--
ALTER TABLE `drug_plants`
  ADD PRIMARY KEY (`dSQLID`),
  ADD UNIQUE KEY `dSQLID` (`dSQLID`);

--
-- Indexes for table `event_upgrades`
--
ALTER TABLE `event_upgrades`
  ADD PRIMARY KEY (`nSQLID`),
  ADD UNIQUE KEY `nSQLID` (`nSQLID`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`oSQLID`),
  ADD UNIQUE KEY `oSQLID` (`oSQLID`);

--
-- Indexes for table `firms`
--
ALTER TABLE `firms`
  ADD PRIMARY KEY (`fSQLID`),
  ADD UNIQUE KEY `fSQLID_UNIQUE` (`fSQLID`);

--
-- Indexes for table `gangzones`
--
ALTER TABLE `gangzones`
  ADD PRIMARY KEY (`gSQLID`),
  ADD UNIQUE KEY `gSQLID` (`gSQLID`);

--
-- Indexes for table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`gaSQLID`),
  ADD UNIQUE KEY `gaSQLID` (`gaSQLID`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`gateSQLID`),
  ADD UNIQUE KEY `gateSQLID` (`gateSQLID`);

--
-- Indexes for table `gold_machines`
--
ALTER TABLE `gold_machines`
  ADD PRIMARY KEY (`zSQLID`),
  ADD UNIQUE KEY `aSQLID_2` (`zSQLID`),
  ADD KEY `aSQLID` (`zSQLID`);

--
-- Indexes for table `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`gpsSQLID`),
  ADD UNIQUE KEY `gpsSLQID` (`gpsSQLID`);

--
-- Indexes for table `graffiti`
--
ALTER TABLE `graffiti`
  ADD PRIMARY KEY (`gSQLID`),
  ADD UNIQUE KEY `gSQLID` (`gSQLID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`hSQLID`),
  ADD UNIQUE KEY `hSQLID` (`hSQLID`);

--
-- Indexes for table `mine`
--
ALTER TABLE `mine`
  ADD PRIMARY KEY (`mSQLID`),
  ADD UNIQUE KEY `mSQLID` (`mSQLID`);

--
-- Indexes for table `newsstands`
--
ALTER TABLE `newsstands`
  ADD PRIMARY KEY (`tSQLID`),
  ADD UNIQUE KEY `tSQLID` (`tSQLID`);

--
-- Indexes for table `port_other`
--
ALTER TABLE `port_other`
  ADD PRIMARY KEY (`OtherPortSQLID`),
  ADD UNIQUE KEY `OtherPortSQLID` (`OtherPortSQLID`);

--
-- Indexes for table `port_staff`
--
ALTER TABLE `port_staff`
  ADD PRIMARY KEY (`StaffPortSQLID`),
  ADD UNIQUE KEY `StaffPortSQLID` (`StaffPortSQLID`);

--
-- Indexes for table `radars`
--
ALTER TABLE `radars`
  ADD PRIMARY KEY (`rSQLID`),
  ADD UNIQUE KEY `rSQLID` (`rSQLID`);

--
-- Indexes for table `ranchs`
--
ALTER TABLE `ranchs`
  ADD PRIMARY KEY (`iSQLID`),
  ADD UNIQUE KEY `iSQLID` (`iSQLID`);

--
-- Indexes for table `ranchs_tress`
--
ALTER TABLE `ranchs_tress`
  ADD PRIMARY KEY (`dSQLID`),
  ADD UNIQUE KEY `dSQLID` (`dSQLID`);

--
-- Indexes for table `shopboxes`
--
ALTER TABLE `shopboxes`
  ADD PRIMARY KEY (`sbSQLID`),
  ADD UNIQUE KEY `aSQLID_2` (`sbSQLID`),
  ADD KEY `aSQLID` (`sbSQLID`);

--
-- Indexes for table `stands`
--
ALTER TABLE `stands`
  ADD PRIMARY KEY (`s_SQLID`),
  ADD UNIQUE KEY `s_SQLID` (`s_SQLID`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`uSQLID`),
  ADD UNIQUE KEY `uSQLID` (`uSQLID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pSQLID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`cSQLID`),
  ADD UNIQUE KEY `cSQLID` (`cSQLID`);

--
-- Indexes for table `vehicle_rents`
--
ALTER TABLE `vehicle_rents`
  ADD PRIMARY KEY (`vrSQLID`),
  ADD UNIQUE KEY `vrSQLID` (`vrSQLID`);

--
-- Indexes for table `xmas_gifts`
--
ALTER TABLE `xmas_gifts`
  ADD PRIMARY KEY (`poSQLID`),
  ADD UNIQUE KEY `poSQLID` (`poSQLID`);

--
-- Indexes for table `xmas_trees`
--
ALTER TABLE `xmas_trees`
  ADD PRIMARY KEY (`jSQLID`),
  ADD UNIQUE KEY `jSQLID` (`jSQLID`);

--
-- Indexes for table `_aasmenu`
--
ALTER TABLE `_aasmenu`
  ADD PRIMARY KEY (`amSQLID`),
  ADD UNIQUE KEY `amSQLID` (`amSQLID`);

--
-- Indexes for table `_anticheat`
--
ALTER TABLE `_anticheat`
  ADD PRIMARY KEY (`acSQLID`),
  ADD UNIQUE KEY `acSQLID` (`acSQLID`);

--
-- Indexes for table `_fuel`
--
ALTER TABLE `_fuel`
  ADD PRIMARY KEY (`pSQLID`),
  ADD UNIQUE KEY `pSQLID` (`pSQLID`);

--
-- Indexes for table `_notifys`
--
ALTER TABLE `_notifys`
  ADD PRIMARY KEY (`aNotifySQLID`),
  ADD UNIQUE KEY `aNotifySQLID` (`aNotifySQLID`);

--
-- Indexes for table `_salary`
--
ALTER TABLE `_salary`
  ADD PRIMARY KEY (`pltSQLID`),
  ADD UNIQUE KEY `pltSQLID` (`pltSQLID`);

--
-- Indexes for table `_statistic`
--
ALTER TABLE `_statistic`
  ADD PRIMARY KEY (`ssSQLID`),
  ADD UNIQUE KEY `ssSQLID` (`ssSQLID`);

--
-- Indexes for table `_vehs`
--
ALTER TABLE `_vehs`
  ADD PRIMARY KEY (`lapVehSQLID`),
  ADD UNIQUE KEY `lapVehSQLID` (`lapVehSQLID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `ActorSQLID` tinyint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `sSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atms`
--
ALTER TABLE `atms`
  MODIFY `aSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `zSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bussines`
--
ALTER TABLE `bussines`
  MODIFY `bSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `c4`
--
ALTER TABLE `c4`
  MODIFY `c4_SQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callboxs`
--
ALTER TABLE `callboxs`
  MODIFY `goSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `chSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `containers`
--
ALTER TABLE `containers`
  MODIFY `koSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cotagges`
--
ALTER TABLE `cotagges`
  MODIFY `vSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `DilerSQLID` tinyint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `droped_items`
--
ALTER TABLE `droped_items`
  MODIFY `diSQLID` mediumint(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drug_plants`
--
ALTER TABLE `drug_plants`
  MODIFY `dSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_upgrades`
--
ALTER TABLE `event_upgrades`
  MODIFY `nSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `oSQLID` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `firms`
--
ALTER TABLE `firms`
  MODIFY `fSQLID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gangzones`
--
ALTER TABLE `gangzones`
  MODIFY `gSQLID` smallint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `garages`
--
ALTER TABLE `garages`
  MODIFY `gaSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `gateSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gold_machines`
--
ALTER TABLE `gold_machines`
  MODIFY `zSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gps`
--
ALTER TABLE `gps`
  MODIFY `gpsSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `graffiti`
--
ALTER TABLE `graffiti`
  MODIFY `gSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `hSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mine`
--
ALTER TABLE `mine`
  MODIFY `mSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsstands`
--
ALTER TABLE `newsstands`
  MODIFY `tSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `port_other`
--
ALTER TABLE `port_other`
  MODIFY `OtherPortSQLID` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `port_staff`
--
ALTER TABLE `port_staff`
  MODIFY `StaffPortSQLID` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `radars`
--
ALTER TABLE `radars`
  MODIFY `rSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranchs`
--
ALTER TABLE `ranchs`
  MODIFY `iSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranchs_tress`
--
ALTER TABLE `ranchs_tress`
  MODIFY `dSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopboxes`
--
ALTER TABLE `shopboxes`
  MODIFY `sbSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stands`
--
ALTER TABLE `stands`
  MODIFY `s_SQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streets`
--
ALTER TABLE `streets`
  MODIFY `uSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `pSQLID` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `cSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_rents`
--
ALTER TABLE `vehicle_rents`
  MODIFY `vrSQLID` tinyint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xmas_gifts`
--
ALTER TABLE `xmas_gifts`
  MODIFY `poSQLID` smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xmas_trees`
--
ALTER TABLE `xmas_trees`
  MODIFY `jSQLID` smallint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `_aasmenu`
--
ALTER TABLE `_aasmenu`
  MODIFY `amSQLID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_anticheat`
--
ALTER TABLE `_anticheat`
  MODIFY `acSQLID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_fuel`
--
ALTER TABLE `_fuel`
  MODIFY `pSQLID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_notifys`
--
ALTER TABLE `_notifys`
  MODIFY `aNotifySQLID` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `_salary`
--
ALTER TABLE `_salary`
  MODIFY `pltSQLID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_statistic`
--
ALTER TABLE `_statistic`
  MODIFY `ssSQLID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `_vehs`
--
ALTER TABLE `_vehs`
  MODIFY `lapVehSQLID` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
