-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Mar 2020, 11:44
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `planner`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autorzy`
--

CREATE TABLE `autorzy` (
  `id` int(11) NOT NULL,
  `stopien_naukowy` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `imie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `formy_studiow`
--

CREATE TABLE `formy_studiow` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupy`
--

CREATE TABLE `grupy` (
  `id` int(11) NOT NULL,
  `kierunek` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `rok_naboru` smallint(6) DEFAULT NULL,
  `numer_grupy` int(11) DEFAULT NULL,
  `liczba_studentow` int(11) DEFAULT NULL,
  `symbol` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `fk_specjalnosc` int(11) DEFAULT NULL,
  `fk_forma_studiow` int(11) DEFAULT NULL,
  `fk_rodzaj_studiow` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jednostki_organizacyjne`
--

CREATE TABLE `jednostki_organizacyjne` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `moduly`
--

CREATE TABLE `moduly` (
  `id` int(11) NOT NULL,
  `godziny_c` int(11) DEFAULT NULL,
  `ects` int(11) DEFAULT NULL,
  `godziny_l` int(11) DEFAULT NULL,
  `godziny_p` int(11) DEFAULT NULL,
  `forma_zal` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `godziny_s` int(11) DEFAULT NULL,
  `semestr` int(11) DEFAULT NULL,
  `godziny_w` int(11) DEFAULT NULL,
  `fk_autor` int(11) DEFAULT NULL,
  `fk_nazwa_przedmiotu` int(11) DEFAULT NULL,
  `fk_rodzaj_modolu` int(11) DEFAULT NULL,
  `fk_specjalnosc` int(11) DEFAULT NULL,
  `fk_forma_studiow` int(11) DEFAULT NULL,
  `fk_rodzaj_studiow` int(11) DEFAULT NULL,
  `fk_jednostka_organizacyjna` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nazwy_przedmiotow`
--

CREATE TABLE `nazwy_przedmiotow` (
  `id` int(11) NOT NULL,
  `kod` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje_modolow`
--

CREATE TABLE `rodzaje_modolow` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje_studiow`
--

CREATE TABLE `rodzaje_studiow` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `specjalnosci`
--

CREATE TABLE `specjalnosci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `symbol` char(1) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKFirstLastName` (`imie`,`nazwisko`);

--
-- Indeksy dla tabeli `formy_studiow`
--
ALTER TABLE `formy_studiow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_studiesForm_name` (`nazwa`);

--
-- Indeksy dla tabeli `grupy`
--
ALTER TABLE `grupy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_symbol` (`symbol`),
  ADD KEY `FK_squadSpec` (`fk_specjalnosc`),
  ADD KEY `FK_squad_sForm` (`fk_forma_studiow`),
  ADD KEY `FK_squad_sType` (`fk_rodzaj_studiow`);

--
-- Indeksy dla tabeli `jednostki_organizacyjne`
--
ALTER TABLE `jednostki_organizacyjne`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_unit_name` (`nazwa`);

--
-- Indeksy dla tabeli `moduly`
--
ALTER TABLE `moduly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKnameSpecSformStype` (`fk_nazwa_przedmiotu`,`fk_specjalnosc`,`fk_forma_studiow`,`fk_rodzaj_studiow`),
  ADD KEY `FK_moduleAuthor` (`fk_autor`),
  ADD KEY `FK_moduleType` (`fk_rodzaj_modolu`),
  ADD KEY `FK_moduleSpec` (`fk_specjalnosc`),
  ADD KEY `FK_moduleSForm` (`fk_forma_studiow`),
  ADD KEY `FK_moduleSType` (`fk_rodzaj_studiow`),
  ADD KEY `FK_moduleUnit` (`fk_jednostka_organizacyjna`);

--
-- Indeksy dla tabeli `nazwy_przedmiotow`
--
ALTER TABLE `nazwy_przedmiotow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_moduleName_name` (`nazwa`);

--
-- Indeksy dla tabeli `rodzaje_modolow`
--
ALTER TABLE `rodzaje_modolow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_moduleType_name` (`nazwa`);

--
-- Indeksy dla tabeli `rodzaje_studiow`
--
ALTER TABLE `rodzaje_studiow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_studiesType_name` (`nazwa`);

--
-- Indeksy dla tabeli `specjalnosci`
--
ALTER TABLE `specjalnosci`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_speciality_name` (`nazwa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `formy_studiow`
--
ALTER TABLE `formy_studiow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `grupy`
--
ALTER TABLE `grupy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `jednostki_organizacyjne`
--
ALTER TABLE `jednostki_organizacyjne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `moduly`
--
ALTER TABLE `moduly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `nazwy_przedmiotow`
--
ALTER TABLE `nazwy_przedmiotow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rodzaje_modolow`
--
ALTER TABLE `rodzaje_modolow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `rodzaje_studiow`
--
ALTER TABLE `rodzaje_studiow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `specjalnosci`
--
ALTER TABLE `specjalnosci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `grupy`
--
ALTER TABLE `grupy`
  ADD CONSTRAINT `FK_squadSpec` FOREIGN KEY (`fk_specjalnosc`) REFERENCES `specjalnosci` (`id`),
  ADD CONSTRAINT `FK_squad_sForm` FOREIGN KEY (`fk_forma_studiow`) REFERENCES `formy_studiow` (`id`),
  ADD CONSTRAINT `FK_squad_sType` FOREIGN KEY (`fk_rodzaj_studiow`) REFERENCES `rodzaje_studiow` (`id`);

--
-- Ograniczenia dla tabeli `moduly`
--
ALTER TABLE `moduly`
  ADD CONSTRAINT `FK_moduleAuthor` FOREIGN KEY (`fk_autor`) REFERENCES `autorzy` (`id`),
  ADD CONSTRAINT `FK_moduleName` FOREIGN KEY (`fk_nazwa_przedmiotu`) REFERENCES `nazwy_przedmiotow` (`id`),
  ADD CONSTRAINT `FK_moduleSForm` FOREIGN KEY (`fk_forma_studiow`) REFERENCES `formy_studiow` (`id`),
  ADD CONSTRAINT `FK_moduleSType` FOREIGN KEY (`fk_rodzaj_studiow`) REFERENCES `rodzaje_studiow` (`id`),
  ADD CONSTRAINT `FK_moduleSpec` FOREIGN KEY (`fk_specjalnosc`) REFERENCES `specjalnosci` (`id`),
  ADD CONSTRAINT `FK_moduleType` FOREIGN KEY (`fk_rodzaj_modolu`) REFERENCES `rodzaje_modolow` (`id`),
  ADD CONSTRAINT `FK_moduleUnit` FOREIGN KEY (`fk_jednostka_organizacyjna`) REFERENCES `jednostki_organizacyjne` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
