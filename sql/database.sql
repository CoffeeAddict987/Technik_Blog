-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 24. Jun 2022 um 07:24
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `database`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `articles`
--

INSERT INTO `articles` (`id`, `author_id`, `content_id`, `picture_id`, `title`) VALUES
(1, 1, 1, 1, 'Lorem ipsum'),
(2, 3, 2, 1, 'GeForce RTX 3090 Ti im Test: Ein Blick in die Zukunft');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `articlesxinterets`
--

CREATE TABLE `articlesxinterets` (
  `id` int(11) NOT NULL,
  `articleid` int(11) NOT NULL,
  `interestid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `articlesxinterets`
--

INSERT INTO `articlesxinterets` (`id`, `articleid`, `interestid`) VALUES
(1, 1, 3),
(2, 1, 7),
(3, 2, 7),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL,
  `upvote_count` int(11) NOT NULL DEFAULT 0,
  `downvote_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `final` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `content`
--

INSERT INTO `content` (`id`, `content`, `final`) VALUES
(1, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   \r\n\r\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.   \r\n\r\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.   \r\n\r\nNam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.   \r\n\r\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.   \r\n\r\nAt vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.   \r\n\r\nConsetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus.   \r\n\r\nLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.   \r\n\r\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.   \r\n\r\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.   \r\n\r\nNam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo', 1),
(2, 'Wie angekündigt hat ComputerBase Benchmarks der GeForce RTX 3090 Ti in 1.920 × 1.080 sowie 2.560 × 1.440 nachgeholt. Zur Vorstellung hatte sich die Redaktion noch auf die fordernde Ultra-HD-Auflösung konzentriert, da Full HD und WQHD für ein Flaggschiff-Produkt eine weniger wichtige Rolle spielen und die Zeit zum Testen limitiert gewesen ist.\r\n\r\nUpdate 30.03.2022 08:20 Uhr\r\nWie erwartet, ist der Marktstart der GeForce RTX 3090 Ti kurz nach 15 Uhr am Dienstag zu Preisen auf oder nur vergleichsweise geringfügig oberhalb des von Nvidia genannten, bereits sehr hoch angesetzten UVP von 2.249 Euro erfolgt. Von Nvidia direkt über Notebooksbilliger.de verkaufte Founders Editions waren dabei nicht in Sekunden, aber innerhalb der ersten Minuten vergriffen.\r\n\r\nAuf eBay sind sie ab 2.450 Euro zu finden, die meisten Anbieter erhoffen sich allerdings eher 3.000 Euro und damit 750 Euro Marge. In Anbetracht des Marktpreises einer inzwischen sehr gut verfügbaren GeForce RTX 3090 in Höhe von rund 1.900 Euro mutet das absurd an.\r\n\r\nBei über andere Händlern verkauften Custom-Designs sieht es am Mittwochmorgen nicht anders aus, wenngleich beispielsweise Caseking schon für heute den Eingang neuer Ware zu Preisen von 2.249 bis 2.449 Euro* erwartet und Cyberport ein Modell von MSI zum Preis von 2.429 Euro noch ab Lager liefern kann.\r\n\r\nUnter welchen Umständen es sich überhaupt lohnt zur GeForce RTX 3090 Ti und nicht zur GeForce RTX 3090 zu greifen, wenn es denn unbedingt Nvidias Top-Klasse sein muss, klärt der Test.\r\n\r\nDie GeForce RTX 3090 Ti und damit Nvidias neue Flaggschiff-Grafikkarte der Ende 2020 eingeführten Ampere-Generation ist keine einfache Geburt gewesen. In der Gerüchteküche wurde das Modell schon lange behandelt, bevor Nvidia es zur Keynote auf der CES 2022 in Form einer Founders Edition, aber ohne technische Details oder einen Preis offiziell angekündigt hat. Im Januar sollte es noch weitere Informationen geben, doch die blieben aus.\r\n\r\nStattdessen gab es Spekulationen über einen Produktionsstopp. Auch im Februar blieb es daraufhin still um die Grafikkarte, auf der GTC 2022 vor einer Woche war sie Nvidias CEO Huang keine Silbe wert.\r\n\r\nHeute nun erfolgen die finale Präsentation, der Fall des Test-Embargos und der Marktstart parallel: Die GeForce RTX 3090 Ti ist da!\r\n\r\nNvidia hat das Bemustern der Presse dabei allein den Partnern überlassen, eine Founders Edition gab es nicht. Es wird sie allerdings zu kaufen geben. Der Redaktion stand für den Test eine Asus GeForce RTX 3090 Ti TUF Gaming zur Verfügung.', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `interests`
--

INSERT INTO `interests` (`id`, `name`) VALUES
(1, 'Computer'),
(2, 'Drucker'),
(3, 'Hardware'),
(4, 'Software'),
(6, 'Smartphones'),
(7, 'Grafikkarten'),
(8, 'Prozessoren'),
(9, 'Elon Musk'),
(10, 'Intel'),
(11, 'AMD');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `pictures`
--

INSERT INTO `pictures` (`id`, `title`, `path`) VALUES
(1, 'Testaufnahme', 'C:/Users/picutres/test.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'testuser', 'max.mustermann@muster.de', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(2, 'moretest', 'max.musermann2@muster.de', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(3, 'Johawx', 'johannes.neuhaus@curemannheim.de', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
(4, 'SumsiTheBrumsi', 'markus.surma00@web.de', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
(5, 'LutziButzi', 'lutz.heermann@abb.de', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `picture_id` (`picture_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indizes für die Tabelle `articlesxinterets`
--
ALTER TABLE `articlesxinterets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aXi_art_fk` (`articleid`),
  ADD KEY `aXi_int_fk` (`interestid`);

--
-- Indizes für die Tabelle `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indizes für die Tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `articlesxinterets`
--
ALTER TABLE `articlesxinterets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `art_author_fk` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `art_content_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `art_picture_fk` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `articlesxinterets`
--
ALTER TABLE `articlesxinterets`
  ADD CONSTRAINT `aXi_art_fk` FOREIGN KEY (`articleid`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `aXi_int_fk` FOREIGN KEY (`interestid`) REFERENCES `interests` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints der Tabelle `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `com_author_fk` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `com_content_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
