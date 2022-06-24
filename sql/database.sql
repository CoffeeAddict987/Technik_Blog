-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 24. Jun 2022 um 14:26
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
(2, 3, 2, 1, 'GeForce RTX 3090 Ti im Test: Ein Blick in die Zukunft'),
(10, 5, 7, 1, 'Ein langweiliger, öder Blogpost'),
(11, 3, 10, 1, 'Commonly Used 3D Priting Softwares'),
(12, 4, 9, 1, 'Raspberry Pi – On-Board LEDs ausschalten'),
(13, 7, 13, 1, 'Die besten Laptops im Frühjahr 2022 - 55 Notebooks im Test'),
(14, 6, 8, 1, 'Problemfall Chipmangel – EU geht in die Offensive'),
(15, 3, 11, 1, 'A Quick Guide to LT Spice'),
(16, 4, 12, 1, 'Ein elf Jahre alter Blog-Eintrag von Elon Musk zeigt, was den Tesla-Chef so erfolgreich macht'),
(17, 6, 14, 1, 'Brother Drucker'),
(18, 5, 15, 1, 'IBM Drucker sind die Besten'),
(19, 5, 16, 9, 'BETRUG UND VERUNTREUUNG - \r\nSkandal in Südkorea schockiert ABB');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `articlesxinterets`
--

CREATE TABLE `articlesxinterets` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `articlesxinterets`
--

INSERT INTO `articlesxinterets` (`id`, `article_id`, `interest_id`) VALUES
(1, 1, 3),
(2, 1, 7),
(3, 2, 7),
(4, 2, 3),
(26, 10, 10),
(27, 10, 6),
(28, 11, 3),
(29, 12, 3),
(30, 13, 5),
(31, 13, 1),
(32, 14, 3),
(33, 14, 8),
(34, 13, 10),
(35, 13, 11),
(36, 14, 11),
(37, 14, 10),
(38, 15, 4),
(39, 15, 8),
(40, 16, 9),
(41, 16, 1),
(42, 18, 2),
(43, 18, 3),
(44, 17, 2),
(45, 17, 10),
(46, 19, 3),
(47, 19, 6);

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
(2, 'Wie angekündigt hat ComputerBase Benchmarks der GeForce RTX 3090 Ti in 1.920 × 1.080 sowie 2.560 × 1.440 nachgeholt. Zur Vorstellung hatte sich die Redaktion noch auf die fordernde Ultra-HD-Auflösung konzentriert, da Full HD und WQHD für ein Flaggschiff-Produkt eine weniger wichtige Rolle spielen und die Zeit zum Testen limitiert gewesen ist.\r\n\r\nUpdate 30.03.2022 08:20 Uhr\r\nWie erwartet, ist der Marktstart der GeForce RTX 3090 Ti kurz nach 15 Uhr am Dienstag zu Preisen auf oder nur vergleichsweise geringfügig oberhalb des von Nvidia genannten, bereits sehr hoch angesetzten UVP von 2.249 Euro erfolgt. Von Nvidia direkt über Notebooksbilliger.de verkaufte Founders Editions waren dabei nicht in Sekunden, aber innerhalb der ersten Minuten vergriffen.\r\n\r\nAuf eBay sind sie ab 2.450 Euro zu finden, die meisten Anbieter erhoffen sich allerdings eher 3.000 Euro und damit 750 Euro Marge. In Anbetracht des Marktpreises einer inzwischen sehr gut verfügbaren GeForce RTX 3090 in Höhe von rund 1.900 Euro mutet das absurd an.\r\n\r\nBei über andere Händlern verkauften Custom-Designs sieht es am Mittwochmorgen nicht anders aus, wenngleich beispielsweise Caseking schon für heute den Eingang neuer Ware zu Preisen von 2.249 bis 2.449 Euro* erwartet und Cyberport ein Modell von MSI zum Preis von 2.429 Euro noch ab Lager liefern kann.\r\n\r\nUnter welchen Umständen es sich überhaupt lohnt zur GeForce RTX 3090 Ti und nicht zur GeForce RTX 3090 zu greifen, wenn es denn unbedingt Nvidias Top-Klasse sein muss, klärt der Test.\r\n\r\nDie GeForce RTX 3090 Ti und damit Nvidias neue Flaggschiff-Grafikkarte der Ende 2020 eingeführten Ampere-Generation ist keine einfache Geburt gewesen. In der Gerüchteküche wurde das Modell schon lange behandelt, bevor Nvidia es zur Keynote auf der CES 2022 in Form einer Founders Edition, aber ohne technische Details oder einen Preis offiziell angekündigt hat. Im Januar sollte es noch weitere Informationen geben, doch die blieben aus.\r\n\r\nStattdessen gab es Spekulationen über einen Produktionsstopp. Auch im Februar blieb es daraufhin still um die Grafikkarte, auf der GTC 2022 vor einer Woche war sie Nvidias CEO Huang keine Silbe wert.\r\n\r\nHeute nun erfolgen die finale Präsentation, der Fall des Test-Embargos und der Marktstart parallel: Die GeForce RTX 3090 Ti ist da!\r\n\r\nNvidia hat das Bemustern der Presse dabei allein den Partnern überlassen, eine Founders Edition gab es nicht. Es wird sie allerdings zu kaufen geben. Der Redaktion stand für den Test eine Asus GeForce RTX 3090 Ti TUF Gaming zur Verfügung.', 1),
(5, 'Lorem ipsum', 1),
(6, 'Lorem ipsum', 1),
(7, 'Dieser Text hier dient lediglich der Unterhaltung und dem Testen. Er hat nicht mit dem eigentlichen Blog zu tun und sollte auch nicht als Teil dieses gesehen werden.\r\nDieser Text soll nur ein paar Zeilen mit etwas anderem als Lorem ipsum füllen, damit auch mal was interessantes zu sehen ist. Hoffentlich kann ich bald aufhören diesen unfassbar schlechten und langweiligen Text zu schreiben und mich einfach in eine Eistonne mit einem kühlen Bier legen und muss nicht mehr diese Website programmieren. Heute ist ein schöner Tag lalalalalaaaaaa.', 1),
(8, 'Auch wenn zahlreiche Industriezweige vom aktuellen Chipmangel betroffen sind, leidet das Fahrzeugsegment besonders stark unter diesem Mangel. Der stetige Chipmangel hat zur Folge, dass die Produktion immer wieder gekürzt oder gar eingestellt werden muss.\r\nDieser Problematik soll eine milliardenschwere Offensive der EU Abhilfe schaffen. Doch sind mit der Offensive verbundene Ziele auch tatsächlich realistisch?\r\n\r\nZukünftig soll ein milliardenschwerer Plan der EU in Zukunft dem Mikrochipmangel entgegenwirken. Eine wichtige Ansprechpartnerin ist Kommissionschefin Ursula von der Leyen, die aktiv an der Erstellung des Chips Act beteiligt war.\r\n\r\nInformationen des Binnenmarktkommissars Thierry Breton zufolge sollen über 40 Milliarden Euro zur Umsetzung dieses Ziels eingesetzt werden.\r\n\r\nAuf Verbraucher wirkt sich die aktuelle Chipkrise beispielsweise insofern aus, als dass sie lange Wartezeiten für neue Fahrzeuge oder Lieferschwierigkeiten bei Spielkonsolen in Kauf nehmen müssen.\r\n\r\nKampf gegen Mikrochipmangel\r\nZukünftig soll ein milliardenschwerer Plan der EU in Zukunft dem Mikrochipmangel entgegenwirken – Bild: © Gorodenkoff #264619020 – stock.adobe.com\r\nVereinbarungen im Chips Act\r\nDer Chips Act soll dazu beitragen, dass sich Europa nicht von Konkurrenz-Märkten aus Asien oder Amerika abhängen lässt. Schließlich investieren große Wirtschaftsstaaten wie China oder die USA ebenfalls in den Industriezweig. In Bezug auf US-Pläne geht die EU-Kommission von Zuweisungen in Höhe von etwa 52 Milliarden Dollar bzw. 45 Milliarden Euro aus. Schätzungen zufolge investiert China ungefähr 150 Milliarden bis zum Ende dieses Jahrzehnts.\r\n\r\nAn diesen Trend möchte die EU nunmehr anknüpfen. Laut Plan sind Investitionen von zwölf Milliarden Euro für Forschung und Entwicklung sowie 30 Milliarden Euro für die Erbauung großer Produktionsanlagen geplant. Schon Mitte September sprach sich von der Leyen dafür aus, ein europaweites Wirtschaftssystem für Mikrochips zu errichten. Dieser Mangel wirkt sich beispielsweise auf die Fahrzeugindustrie aus.\r\n\r\nHoch gesteckte Ziele\r\nDie Ziele sind hoch gesteckt. Auf dem Weltmarkt soll der EU-Anteil für Chips nach Informationen der Kommission um 20 Prozent ansteigen und sich dadurch verdoppeln. Allerdings müsste die Produktion dann das Vierfache des bisherigen Stands erreichen. Schließlich gehen Wirtschaftsexperten davon aus, dass sich der Markt bis 2030 ohnehin verdoppeln wird.\r\n\r\nIn der heutigen digitalen Welt gilt Mikroelektronik als Schlüsseltechnologie.\r\n\r\nEine wichtige technische Basis sind dabei Halbleiter. Das große Ziel dieser Maßnahme sei es deshalb, ein eigenes europäisches Mikroelektronik-Ökosystem zu kreieren. Dieses Ökosystem soll Produktion sowie Design einschließen. Im Gegenzug ist es wichtig, auch zukünftig gegenüber dem Weltmarkt offen zu sein.\r\n\r\nEU-Anteil an Chips soll sich verdoppeln\r\nAuf dem Weltmarkt soll der EU-Anteil für Chips nach Informationen der Kommission um 20 Prozent ansteigen und sich dadurch verdoppeln – Bild: © sdecoret #244004782 – stock.adobe.com\r\nEinflussnahme durch mehrere Kommissionsmitglieder\r\nDiesen Anspruch haben insbesondere zwei Kommissionsmitglieder beeinflusst – die den Wettbewerb vorantreibende Kommissarin Margrethe Vestager sowie Binnenmarktkommissar Breton. Dennoch berichteten die Medien immer wieder über Konflikten zwischen den beiden Visionären.\r\nDer einstige Manager Breton setzt sich für ein traditionelles und staatlich dominiertes Wirtschaftsmodell ein. Im Gegensatz dazu gehört Vestager der liberalen Gruppierung Renew Europe an, die sich eher für einen weniger staatlichen Einfluss auf die Wirtschaft einsetzt.\r\n\r\nEine Priorisierung von EU-Interessen\r\nDie dänische Kommissarin wies bereits vor Monaten darauf hin, dass Unternehmen die Macht besäßen, mehrere Länder aufgrund etwaiger Zuschüsse gegeneinander auszuspielen. Demgegenüber warnte Breton schon Mitte September davor, dass die Europäische Union aufgrund der hohen Investitionen durch andere Länder in den Schatten gestellt werden könnte. Breton teilt übrigens nicht die Ansicht, dass die EU im Kampf um Subventionen das Nachsehen haben könnte.\r\nAußerdem sollen alle Unternehmen bestimmte Regeln auferlegt bekommen, die eine staatliche Förderung erhalten. Bei entsprechendem Bedarf ist es auch nicht ausgeschlossen, dass EU-Interessen priorisiert werden. Schließlich könnte jeder industriepolitische Eingriff durch die EU letztendlich auch zu einer Wettbewerbsverzerrung führen. Diesen Effekt dürften individuelle Förderungen nach Aussagen des Präsidenten Achim Wambach vom Leibniz-Zentrum für Europäische Wirtschaftsforschung nicht auslösen.', 1),
(9, 'Je nach Projekt habt ihr euch sicher schon mal gefragt, ob man die Status LEDs eures Raspberry Pis nicht ausschalten könnte. Diese verbrauchen bei manchen Projekten nur unnötig Strom, oder sie stören euch einfach nur (Schlafzimmer). Daher werden wir uns heute ansehen, wie wir sämtliche On-Board LEDs unseres Pis deaktivieren können.\r\n\r\nKonfigurationsdatei öffnen\r\nDamit die LEDs nicht beim nächsten Reboot wieder an gehen, müssen wir die Anpassungen direkt in der Konfigurationsdatei machen.\r\n\r\nUm die Konfigurationsdatei zu öffnen geben wir folgenden Befehl in die Konsole ein:\r\n\r\nsudo nano /boot/config.txt\r\nPower-LED ausschalten (ROT)\r\nAls ersten werden wir die rote Power-LED des Raspberry Pis mit folgenden Zeilen deaktiveren. (am Ender der Konfigurationsdatei)\r\n\r\n#Power-LED ausschalten\r\ndtparam=pwr_led_trigger=none\r\ndtparam=pwr_led_activelow=off\r\nStatus-LED ausschalten (GRÜN)\r\nDie nächste LED die wir deaktivieren ist die grüne Status LED.\r\n\r\n#Status-LED ausschalten\r\ndtparam=act_led_trigger=none\r\ndtparam=act_led_activelow=off\r\nNetzwerkbuche-LEDs ausschalten (LAN LINK-LEDs)\r\nMöchtet ihr auch die LEDs an der Netzwerkbuche müsst ihr folgenden Zeilen ergänzen.\r\n\r\nRaspberry Pi 3+:\r\n\r\n#LAN-LEDs ausschalten Pi3+\r\ndtparam=eth_led0=14\r\ndtparam=eth_led1=14\r\nRaspberry Pi 4:\r\n\r\n#LAN-LEDs ausschalten Pi4\r\ndtparam=eth_led0=4\r\ndtparam=eth_led1=4\r\nKonfigurationsdatei speichern & schließen\r\nNatürlich müssen wir die Konfigurationsdatei auch noch speichern. Das machen wir mit folgenden Befehlen.\r\n\r\nDatei speichern: Strg+O (Windows); Control+O (MacOS)\r\nDatei schließen: Strg+X (Windows); Control+X (MacOS)\r\nRaspberry Pi rebooten\r\nDamit die Änderungen übernommen werden, müssen wir den Raspberry Pi noch mit sudo reboot neu starten.', 1),
(10, '1.Solidworks\r\n\r\nSolideworks is a modeling software that industrial designers often use.\r\n\r\n\r\n\r\nAdvantage: simple to use, be able to deal with complex models and is widely used in industrial design.\r\n\r\nDisadvantage: only supports Microsoft Windows system.\r\n\r\n\r\n\r\n\r\n\r\n2.Rhino\r\n\r\nRhino is a commercial 3D computer graphics and aided design software available for Microsoft Windows system and MacOS.\r\n\r\n\r\n\r\nAdvantage: supports both Windows and Mac, rigorous parametric model is used, and Rhino can be widely applied.\r\n\r\nDisadvantage: a little difficult to operate.\r\n\r\n\r\n\r\n\r\n\r\n3.SketchUp\r\n\r\nSketchUp is a 3D modeling software for drawing applications, mainly used in architecture, product design, mechanical engineering, film and game design. it requires the user to render surfaces and supports third-party plug-ins.\r\n\r\n\r\n\r\nAdvantage: there is a free version for users, rich in recources and easy to operate, support both Windows and Mac.\r\n\r\nDisadvantage: Not very common in industrial design.\r\n\r\n\r\n\r\n\r\n\r\n4.AutoCAD\r\n\r\nAutoCAD has a long history and owns a large number of users. It is suitable for architectural design, industrial design, engineering and graphic design.\r\n\r\n\r\n\r\nAdvantage: professional and be widely used, supports both Windows and Mac.\r\n\r\nDisadvantage: difficult to get started, and the design of the system is not clear.\r\n\r\n\r\n\r\n\r\n\r\n5.ZBrush\r\n\r\nCompletely subvert the working mode of traditional 3D design tools and respect the designer\'s creative inspiration and work habits.\r\n\r\n\r\n\r\nAdvantage: has high degree of freedom of operation and easy to make complex models.\r\n\r\nDisadvantage: not very suitable for industrial design.\r\n\r\n\r\n\r\n\r\n\r\n6.3Ds Max\r\n\r\n3DMax, as a classic of Autodesk\'s 3D modeling software, is quite popular in video game development, art field, architectural visualization, and industrial design. Sophisticated particle and light simulations and its own script design make it an indispensable software for 3D modeling.\r\n\r\n\r\n\r\nAdvantage: can be widely used and easy to operate.\r\n\r\nDisadvantage: only supports Windows.\r\n\r\n\r\n\r\n\r\n\r\n7.Maya\r\n\r\nMaya is also the top 3D software produced by Autodesk, which is more professional and more powerful than 3Ds Max. It is mainly used in television advertising, animation and film special effects.\r\n\r\n\r\n\r\nAdvantage: powerful, realistic rendering.\r\n\r\nDisadvantage: too professional and difficult to get started.\r\n\r\n\r\n\r\n\r\n\r\n8.CATIA\r\n\r\nCIATIA is mainly used in automotive design, shipbuilding, architectural design and industrial design.\r\n\r\nThe multi-platform applications in it generally have three layers:\r\n\r\nThe first is 3D CAD software, followed by computer-aided manufacturing (CAM) software, finally is the Computer Aided Engineering (CAE) software suite.\r\n\r\n\r\n\r\nAdvantage: very professional.\r\n\r\nDisadvantage: supports Windows only and is very expensive.\r\n\r\n\r\n\r\n\r\n\r\n9.Autodesk Fusion 360\r\n\r\nFusion 360 is a professional 3D modeling software with powerful parametric tools and analytical mesh tools for industrial design and architectural design.\r\n\r\n\r\n\r\nAdvantage: powerful and professional, supports both Windows and Mac.\r\n\r\nDisadvantage: difficult to operate.\r\n\r\n\r\n\r\n\r\n\r\n10.123D Design\r\n\r\n123D Design is professional and easy to operate, and can be connected to 3D printers on the market.\r\n\r\n\r\n\r\nAdvantage: professional and easy to operate, supports both Windows and Mac.\r\n\r\nDisadvantage: not so well known.', 1),
(11, 'What is LTSPICE®?\r\nLTSpice® is a free simulation tool from Analog Devices, that runs on both Windows and Mac. It’s an invaluable tool for electronic engineers, helping them develop a good understanding of a circuit’s behaviour prior to committing to manufacture. This article will look at some of the features of LTspice®, along with tools that can enhance the use of LTspice® in today’s designs.\r\n\r\nWhat is SPICE?\r\nSPICE is the acronym for “Simulation Program with Integrated Circuit Emphasis” and is a simulation environment designed to replace the need to breadboard designs, which has become increasingly difficult as design complexities have grown. The first version of SPICE was released in the early 1970s and came out of development at the University of California, Berkley started in the 1960s. There are several versions of SPICE in the marketplace, with LTspice® being the most widely distributed version, becoming the industry standard. LTspice® was developed by Linear Technology, is now owned by Analog Devices, and is free to download.\r\n\r\nLTspice® enables a circuit to be modeled, probed, and run through various analyses prior to committing a board to manufacture. This not only saves expensive mistakes that could render a board non-functional; it also enables issues to be tracked down easily, and design iterations to be made and verified quickly. Using LTspice® reduces the project costs, increases time to market, and therefore increases the productivity and ROI of the project overall.\r\n\r\nThe ability to simulate a circuit’s behaviour prior to committing to a board-run has become so key, that most large IC manufacturers create SPICE models for their components, knowing this increases the likelihood of a designer selecting their component for a design.\r\n\r\nWhat does LTspice® provide to designers?\r\nMany circuit designs include analog circuits as well as digital processing and digital control systems. Systems that might be thought of as purely digital, such as sensors, controllers, and multimedia interfaces, all include analog circuits, continuing to drive the need for a simulation tool such as LTspice®. Here are some of the common analyses available in LTspice®.\r\n\r\nTransient analysis – The behaviour of a circuit in the time domain is sometimes more important than a steady state. If a circuit is transitioning between two states, such as on power-up, this will help identify if the start-up behaviour is as expected and within design margins, and allow the designer to make and verify changes if needed.\r\n\r\nAC Analysis – The small signal response of a circuit allows the designer to see gain and phase versus frequency. This can also be used to sweep a parameter value, for a single frequency, enabling a clearer picture of how one component behaves within the circuit.\r\n\r\nDC Sweep – This feature enables a source or parameter to be increased, over a range, in small steps. One common use for this is to find the safe operating range of a circuit.\r\n\r\nNoise Analysis – The noise analysis tool in LTSpice® enables the designer to investigate the frequency components of the noise within a circuit. Knowing the frequency of the noise enables filters to be added at the appropriate frequency band, alternatively, the designer can employ techniques to move the noise to a less sensitive frequency. Rerunning the simulation will provide validation of the solutions employed.\r\n\r\nMonte Carlo Analysis – This function in LTspice® allows the effect of component tolerances to be investigated. It refers to a cluster of simulations run together, often providing worst-case data, that enables a designer to see if the existing component tolerances are sufficient to keep the circuit function in spec, or whether those tolerances are adding up and creating conditions that are outside of the desired range. This enables the designer to change out components, and increase or decrease tolerances on critical components, to bring the design as a whole back into spec.\r\n\r\nThese are a few of the more commonly used functions within LTspice®. As design systems become more complex, companies, such as Zuken, have created solutions (eCADSTAR Schematic ) that build upon LTspice® adding value and improving the user experience.\r\n\r\nTake LTspice® to the next level with eCADSTAR from Zuken\r\nLTspice® is its own simulation environment, where a circuit is created in order to run simulations and is not usually connected to design software. This requires the designer to recreate the circuit from their design environment, copying it into LTspice®, which creates the potential for errors. Likewise, any changes and refinements made as a result of simulations in LTspice® need to be re-created back in the design environment. Naturally, this creates some opportunity for errors as the simulation isn’t run on the exact design file.\r\n\r\nLTspice and SPICE Controller\r\n\r\nThe SPICE Controller within the eCADSTAR Schematic Editor builds on the trusted and reliable functions of LTspice® and brings the analog simulation right into the design flow, creating a more reliable process. LTspice® can be launched from inside the Schematic Editor. Having the simulations and schematics tied together makes analog circuits much easier to manage, review and re-use. Keeping the setup with the design data and closely linked to it, makes tasks like AC analysis and corner case checking part of an integrated process. This also makes the designs and simulation results easier to share with the whole team.\r\n\r\nMany analog engineers prefer to create separate mini designs in the Schematic Editor that can be used as design building blocks, together with their simulation setups. These can be imported into different schematic designs while keeping the reference copies of the analog designs separate. If a designer enhances one of these circuits, it will be available as an upgrade to all designs that use it.\r\n\r\nLTspice analysis\r\n\r\neCADSTAR enables the designer to explore operating ranges and passive component values dynamically, even if production parts have not yet been assigned. This can help the designer decide on the tolerances, wattages, etc. that will be needed to make the design both economical and robust.\r\n\r\nThe SPICE controller for the Schematic editor is available in several different eCADSTAR product bundles, enabling you to select the best set of tools for you and your team. To learn more get in touch with an eCADSTAR representative today.', 1),
(12, 'Paypal, Tesla, SpaceX, Hyperloop — Elon Musk ist einer der erfolgreichsten Unternehmer der Welt. Dieser Erfolg fiel ihm nicht in den Schoß — er ist das Resultat von jahrelanger harter Arbeit und Planung, wie ein elf Jahre alter Blog-Post von Musk zeigt, auf den das Wirtschaftsmagazin „Inc“ kürzlich gestoßen ist. Er trägt den Titel: „Der geheime Tesla-Motors-Masterplan (zwischen euch und mir).“\r\n\r\nDarin schreibt Musk: \r\n\r\n„Wie Sie wissen, ist das ursprüngliche Produkt von Tesla ein hochleistungsfähiger, elektrischer Sportwagen namens Tesla Roadster. Allerdings scheint den meisten Lesern nicht bewusst zu sein, dass unser langfristiger Plan ein breites Angebot an Modellen ist, das unter anderem ein bezahlbares Familienauto enthalten soll. Der Grund: Das allumfassende Ziel von Tesla Motors (und dem Grund, warum ich das Unternehmen finanziere) ist es, zu helfen, den Schritt von einer von fossilen Brennstoffen betriebenen zu einer solarbetriebenen Wirtschaft zu beschleunigen. Das ist meiner Meinung nach die wichtigste, aber nicht einzige nachhaltige Lösung.“\r\n\r\nSein Plan war erfolgreich\r\nUnd dieser Plan ging auf. Der Roadster ist zwar seit 2011 nicht mehr verfügbar, doch wenig später führte Tesla das Model S ein. 2015 folgte das Model X, ein elektrischer Allrad-SUV, gefolgt vom Model 3, das Ende 2017 verfügbar sein soll. Um seine Ziele zu erreichen, ging Musk sogar so weit, dass er 2008 sein gesamtes Privatvermögen in Tesla und SpaceX investierte, um diesen Unternehmen die besten Überlebenschancen zu ermöglichen. \r\n\r\nMusk war also bereit, alles zu riskieren, um seine Ziele zu erreichen und langfristig in Technologien zu investieren, die vielleicht erst Jahre später rentabel werden. Auch wenn man nicht über ein Vermögen von mehr als 15 Milliarden Dollar verfügt, sollte man sich selbst die Frage stellen, wo man sich in zehn Jahren sieht — und ob man bereit ist, alles dafür zu riskieren. \r\n\r\nMusks Pläne für die Zukunft\r\nWas Elon Musk betrifft: Seine Pläne für die Zukunft sind noch ambitionierter als vor elf Jahren. Er will (unter anderem) die Möglichkeiten künstlicher Intelligenz weiter erforschen, den Mars besiedeln und das Hochgeschwindigkeitstransportsystem Hyperloop marktreif machen. Betrachtet man Musks Ziele von 2006, sollte man seine Ambitionen nicht als lächerlich abstempeln. \r\n\r\n„Einen Sportwagen bauen. Das Geld benutzen, um ein bezahlbares Auto zu bauen. Das Geld davon benutzen, um ein noch bezahlbareres Auto zu bauen. Währenddessen emissionsfreie Möglichkeiten zur Stromversorgung anbieten. Sagt es niemandem.“ ', 1),
(13, 'Die besten Laptops im Frühjahr 2022 - 55 Notebooks im Test\r\nAlle aktuellen Laptop-Tests im Vergleich. Insgesamt 55 Notebooks verschiedenster Kategorien stellten sich in den vergangenen drei Monaten unseren Messungen. Mit dabei Laptops mit den neuen Intel Alder-Lake-H und AMD Rembrandt-CPUs (Zen3+), sowie Gaming Notebooks mit den leistungsstarken RTX 3070Ti und 3080Ti Grafikchips. Hier findest du die Besten ihrer Klasse und die Empfehlungen der Redaktion.\r\nJ. Simon Leitner, 20.04.2022 🇺🇸 🇷🇺\r\nLaptop / Notebook Charts Deal\r\n\r\nLenovo Legion 5 Laptop 43,9 cm (17,3 Zoll, 1920x1080, Full \r\nLenovo Legion 5 Laptop 43,9 cm (17,3 Zoll, 1920x1080, Full\r\n1 799,00 EUR (Amazon)\r\nAcer Nitro 5 (AN517-54-743Q) Gaming Laptop 17 Zoll Windows 10 \r\nAcer Nitro 5 (AN517-54-743Q) Gaming Laptop 17 Zoll Windows 10\r\n1 498,00 EUR (Amazon)\r\nAcer Swift 3 (SF314-43-R1XT) Ultrathin / Laptop 14 Zoll Windows \r\nAcer Swift 3 (SF314-43-R1XT) Ultrathin / Laptop 14 Zoll Windows\r\n789,00 EUR (Amazon)\r\nASUS ROG Phone 5 ZS673KS Smartphone 16/256GB Phantom Black Android \r\nASUS ROG Phone 5 ZS673KS Smartphone 16/256GB Phantom Black Android\r\n1 049,00 EUR (Amazon)\r\nIm Rahmen der diesjährigen CES in Las Vegas wurden von Intel die neuen Alder Lake-H, -U und -P-Prozessoren für Notebooks vorgestellt. Wichtigstes Merkmal ist ihre Hybrid-Architektur, die schnelle Rechenkerne (Performance-Cores) mit besonders energiesparenden Kernen (Efficiency-Cores) kombiniert. Je nach Prozessormodell sind diese in Anzahl und Eigenschaften unterschiedlich gestaltet, womit ein besonders breites Anwendungsspektrum ermöglicht wird. Die Alder Lake-H-Modelle werden bevorzugt in Notebooks mit sehr hohen Leistungsanforderungen zum Einsatz kommen. Die ersten Gaming-Laptops mit der neuen Prozessorgeneration konnten wir schon testen.\r\n\r\nNeues gibt es aber auch von AMD: So wurde die Ryzen 6000 Mobile Prozessor-Palette vorgestellt, die auf der Zen 3+-Architektur bzw. der RDNA 2-Architektur bei der eingesetzten integrierten Grafikeinheit basieren. Auch bei den dedizierten Grafikchips setzt AMD nach. Mit den neuen Radeon RX 6000 GPUs will man im Bereich der Mittel- und Oberklasse zu Nvidia aufschließen. Spannend: Erste Gaming-Laptops die vollends auf Komponenten von AMD setzen sind stehen schon in den Regalen und wurden auch bereits von uns getestet.\r\n\r\nTeam Green aka. Nvidia ließ sich allerdings nicht lumpen und brachte mit den Geforce RTX 3070Ti und RTX 3080Ti Grafikchips zwei aufgebohrte Versionen ihrer High-End Gaming-Grafikkarten auf den Markt und unterstreicht damit den Anspruch auf die Krone im GPU-Segment. Bis zu 20% Performancezuwachs konnten wir in unseren Tests beobachten.\r\n\r\nDie Testsieger: Diese Laptops erhielten im Test Bestnoten\r\nUnter allen getesteten Notebooks im letzten Quartal konnten sich zwei Geräte mit einem Top-Score von 90% an die Spitze setzen: Das Lenovo ThinkPad T14s G2, getestet als AMD-Variante mit Ryzen 7 5850U und Vega 8 Grafik, ist als mobiler Powerhorse für professionelle User konzipiert. In unserem Test konnte der Laptop über weite Strecken überzeugen, sei es mit der hohen Systemleistung, der langen Akkulaufzeit oder dem guten Display. Verfügbar ist das Gerät ab rund 2.000 Euro, bei einer Qualifikation für etwaigen Bildungsrabatt kann das ThinkPad T14s schon um rund 1.500 Euro erworben werden.\r\nHPs ZBook Fury G8 gehört zur Kategorie der großen und leistungsstarken mobile Workstation Laptops. In unserer Testkonfiguration mit Intel i9-Prozessor und Nvidia RTX A3000-Grafiklösung konnte das Gerät zeigen was es kann. Ob stabiles und widerstandsfähiges Gehäuse, hervorragende Leistungswerte, ausgezeichnete Eingabegeräte, DreamColor Display mit Bilddarstellung auf höchstem Niveau oder der umfangreichen Schnittstellenausstattung, Creator mit höchsten Ansprüchen können beim ZBook Fury G8 fündig werden.\r\n\r\nLenovo ThinkPad T14s G2 (90%)\r\nLenovo ThinkPad T14s G2 (90%)\r\nHP ZBook Fury 17 G8 (90%)\r\nHP ZBook Fury 17 G8 (90%)\r\nMit einem hervorragenden Gesamtscore von 89% konnten sechs weitere Geräte sich unsere Testhöchstnote \"Sehr Gut\" sichern: Das Asus ExpertBook B7 Flip ist ein hochwertiges Convertible-Notebook das sich in erster Linie an professionelle Nutzer richtet, die auf der Suche nach einem überaus flexiblen und mobilen täglichen Begleiter sind. Das Notebook bietet einen universell nutzbaren Touchscreen mit Stiftunterstützung, zwei Thunderbolt-Ports sowie ein integriertes 5G-Modem. Lenovos ThinkPad P1 G4 ist für Nutzer mit besonders hohen Ansprüchen in puncto Performance eine interessante Option. Verfügbar in zahlreichen verschiedenen Konfigurationen liefert das Notebook Performance nahe Workstation-Level und bleibt dabei dennoch gut mobil einsetzbar. Das Razer Blade 15 in der aktuellen Early 2022-Version setzt bereits auf Intels Alder-Lake-Prozessoren und die neusten GPUs von Nvidia, etwa die RTX 3080Ti in unserer Testausstattung. Den Spagat zwischen Mobilität und maximaler Gaming-Performance schafft aktuell kaum ein anderes Modell so gut wie das Razer Blade 15.\r\nWenn es darum geht innovative Geräte auf den Markt zu bringen ist Microsoft stets mit von der Partie. Der Surface Laptop Studio ist mit einem besonderen Displayscharnier ausgestattet, welches das Display näher an den Nutzer bringen kann und zudem die Bedienung durch Touch-Eingabe erleichtert. Aber auch darüber hinaus bringt das innovative Notebook viel Technik für Enthusiasten mit. Mit Huawei versucht ein vergleichsweise junger Player am Laptop-Mark weiter Anteile zu gewinnen. Das neue MateBook 13s ist ein besonders kompaktes Notebook mit 13,4-Zoll Display im 3:2-Format. Unser Test bescheinigt dem ultramobilen Rechner zahlreiche Benefits, vom hochwertigem Aluminium-Gehäuse über hohe Leistungsreserven bis hin zum sehr guten Display und der langen Akkulaufzeit. Das Lenovo ThinkPad X1 Titanium Yoga ist für professionelle User auf der Suche nach einem ultramobilen und flexiblen Begleiter mit minimaler Kompromissbereitschaft konzipiert und kann auch in unserem Test weitestgehend überzeugen. \r\n\r\nAsus ExpertBook B7 Flip (89%)\r\nAsus ExpertBook B7 Flip (89%)\r\nLenovo ThinkPad P1 G4 (89%)\r\nLenovo ThinkPad P1 G4 (89%)\r\nRazer Blade 15 2022 (89%)\r\nRazer Blade 15 2022 (89%)\r\nMicrosoft Surface Laptop Studio (89%)\r\nMicrosoft Surface Laptop Studio (89%)\r\nHuawei MateBook 13s (89%)\r\nHuawei MateBook 13s (89%)\r\nLenovo ThinkPad X1 Titanium Yoga G1 (89%)\r\nLenovo ThinkPad X1 Titanium Yoga G1 (89%)\r\nDamit aber nicht genug. Im Feld der bestbewerteten Laptops in den letzten drei Monaten findet sich weiter Lenovos ThinkPad L13 Yoga G2. Dieses kombiniert die Vielseitigkeit der Yoga-Convertibles mit den Qualitäten klassischer Thinkpad-Laptops und ist dank Einsparungsmaßnahmen der L-Serie bereits um rund 1.200 Euro zu haben, mit Zugang zum Campus-Programm sogar bereits ab unter 1.000 Euro. Ebenso im preisbewussten Segment ist das Acer Swift 3 SF314 zu finden, ein kompaktes Subnotebook mit 14-Zoll-Display, das im Test durch sein gutes Display, lange Akkulaufzeiten und ein flinkes System auf sich aufmerksam machte. Bereits ab rund 700 Euro ist man dabei. Für Gaming-Fans stellt das Lenovo Legion 5 Pro 16 G7 eine spannende Option dar. Ausgestattet mit Intel Alder Lake-H-Prozessor und schneller Nvidia RTX 3070Ti Grafikkarte bewältigt das Notebook selbst neuste Computerspiele auf höchsten Detailstufen mühelos. Im Test konnten auch die Eingabegeräte und das WQHD-Display beeindrucken. Das ThinkBook 13s G3 in der AMD-Ausstattung überzeugte im Test mit einem attraktiven Paket aus wertigem Chassis, gutem Display, langen Akkulaufzeiten und hohen Leistungsreserven. Schenkers Vision 14 ist ein besonders kompaktes und zugleich leistungsstarkes Notebook, welches die Bereiche Subnotebook, Multimedia und Gaming zu verbinden versucht. In unserem Test klappt das über weite Strecken recht gut, lediglich bei der Akkulaufzeit wäre noch Luft nach oben. Gaming ohne Kompromisse verspricht MSIs GE76, ausgestattet mit Intel Alder Lake-H-CPU, RTX 3080Ti-Grafikchip und 360-Hz-Display. In unserem Test konnte der Bolide seine Qualitäten unter Beweis stellen, im Segment der High-End Gaming-Laptops führt zur Zeit kaum ein Weg an dem MSI GE76 vorbei. Last but not least vermochte auch das Lenovo ThinkPad L13 G2 in der getesteten AMD-Konfiguration zu überzeugen und sicherte sich im Test die Gesamtnote \"Sehr Gut\".\r\n\r\nLenovo ThinkPad L13 Yoga G2 (88%)\r\nLenovo ThinkPad L13 Yoga G2 (88%)\r\nAcer Swift 3 SF314 (88%)\r\nAcer Swift 3 SF314 (88%)\r\nLenovo Legion 5 Pro 16 G7 (88%)\r\nLenovo Legion 5 Pro 16 G7 (88%)\r\nLenovo ThinkBook 13s G3 (88%)\r\nLenovo ThinkBook 13s G3 (88%)\r\nSchenker Vision 14 (88%)\r\nSchenker Vision 14 (88%)\r\nMSI GE76 Raider (88%)\r\nMSI GE76 Raider (88%)\r\nLenovo ThinkPad L13 G2 (88%)\r\nLenovo ThinkPad L13 G2 (88%)\r\n  \r\nUnsere Favoriten - Editors Choice Awards Frühling 2022\r\nAuf Basis unserer Testergebnisse im Betrachtungszeitraum führen wir im Kreis der Senior-Autoren ein Redaktionsvoting durch und vergeben im Anschluss den Editors Choice Award. Gesondert ausgezeichnet werden jene Laptops, die sich durch ihr gelungenes Gesamtpaket, absolute Topleistungen in speziellen Wertungsbereichen oder aber ein besonders gutes Preis-Leistungs-Verhältnis hervortun und für unsere Redakteure eine attraktive Kaufoption in der jeweiligen Kategorie darstellen. \r\n\r\nLenovo Legion 5 Pro 16 G7\r\nMit dem Upgrade auf die neuesten Intel Alder Lake-Prozessoren verpasst Lenovo dem Legion 5 Pro 16 einen enormen Leistungsschub. Nicht nur bei der CPU, auch bei der eingesetzten Grafiklösung wird aufgerüstet. Die Nvidia Geforce RTX 3070Ti kann die Non-Ti-Variante um rund 20% überflügeln. Das Legion 5 Pro stößt in dieser Ausstattung in das High-End Gaming-Segment vor und kann praktisch alle aktuellen Spieletitel in maximalen Detailstufen flüssig auf das Display zaubern. Apropos Display: Das eingesetzte 16-Zoll WQHD-Panel (2.560 x 1.600) ist fein aufgelöst, zeigt im Test eine überaus gute Helligkeit (rund 500 cd/m2), einen hohen Kontrast und akkurate Farben. Darüber hinaus sind die Reaktionszeiten vergleichsweise niedrig und das Display unterstützt zudem eine Bildwiederholfrequenz von 165 Hertz und G-Sync. Selbst ausgewachsenen Gaming-Boliden steht das Legion 5 Pro damit um nichts nach. Der Preis für das System bewegt sich mit rund 2.200 Euro (verfügbar etwa bei Amazon) in einem angesichts des gebotenen Pakets attraktiven Rahmen. Bei Zugang zum Lenovo Campus-Programm (Schüler und Studenten) können nochmal ein paar hundert Euro gespart werden.\r\n\r\nEditors Choice Award Frühjahr 2022: Lenovo Legion 5 Pro 16 G7\r\nEditors Choice Award Frühjahr 2022: Lenovo Legion 5 Pro 16 G7\r\n\r\nHuawei MateBook 13s\r\nHuawei schnürt mit dem MateBook 13s ein überaus attraktives Bundle, nicht zuletzt aufgrund des aufgerufenen Preises. Das von uns kürzlich getestete MateBook 13s verfügt über eine Intel Core i5-11300H CPU (Tiger Lake H35), 16 GB Arbeitsspeicher und eine SSD mit 512 GB Datenspeicher. Exakt diese Konfiguration ist aktuell im HUAWEI Shop im Angebot und statt 1.149 (Liste) um nur 799 Euro verfügbar. Unser Test attestiert dem mobilen Laptop mit einem Gesamtgewicht von rund 1,3 Kilogramm und nur rund 16 Millimetern Dicke ein überaus wertiges Metallgehäuse, gute Eingabegeräte, einen sehr guten Bildschirm mit hoher Auflösung (2.520 x 1.860 Pixel), hoher Helligkeit und Bildkontrast, eine akkurate Farbdarstellung auf dem insbesondere für Office-Applikationen vorteilhaften 3:2 Format, sowie eine hervorragende Systemleistung. Damit aber nicht genug. Mit Akkulaufzeiten von 9 bis 11 Stunden im Praxiseinsatz (Surfen, Videowiedergabe) wird das MateBook auch den Erwartungen hinsichtlich Mobilität gerecht. In Anbetracht des aktuellen Angebots bekommt das MateBook 13s eine klare Kaufempfehlung.\r\n\r\nEditors Choice Award Frühjahr 2022: Huawei MateBook 13s\r\nEditors Choice Award Frühjahr 2022: Huawei MateBook 13s\r\n\r\nLenovo ThinkPad L13 G2 AMD\r\nRobust, kompakt und durchhaltestark, so präsentiert sich das ThinkPad L13 G2 AMD in unserem Test. Zwar merkt und sieht man dem Gehäuse die Abstammung aus der günstigeren L-Serie an, nichts desto trotz bietet das Notebook eine gute Stabilität und sollte auch einem mehrjährigen intensiven Einsatz standhalten. Die Eingabegeräte spielen auf ThinkPad-Niveau und sind für Vielschreiber gut geeignet. Überzeugen konnte das Modell mit AMD-Ausstattung im Test auch durch seine guten Leistungswerte, wobei die Akkulaufzeit von 10 bis 15 Stunden im Praxiseinsatz nicht leiden muss und auch die Emissionen im Test sehr niedrig waren. Einziges Manko bleibt der in unserem Testmuster eingesetzte Full-HD-Bildschirm, dessen Helligkeit im Schnitt nur rund 270 cd/m2 erreichte und eher für Text- und Recherchearbeiten (matte Displayoberfläche) geeignet erscheint als zur Darstellung farbenprächtiger Bilder. Das Thinkpad L13 G2 AMD ist ab rund 1.000 Euro verfügbar, Lenovo Campus-Modelle sind bereits unter 1.000 Euro zu haben.', 1),
(14, 'Die Brother Philosophie\r\nKundenzufriedenheit wird großgeschrieben bei einem serviceorientierten Unternehmen wie Brother. Das Firmenmotto lautet konsequenter Weise „At your side / Immer an Ihrer Seite“. So ist es für Brother wichtig, bei Defekten an einem Kundendrucker im zentralen Ersatzteillager das passende Teil oder die passenden Brother Toner und Druckerpatronen für alle aktuellen, aber auch die älteren Drucker auf Vorrat zu haben. Brother hat sich als Unternehmen ganz der Kundenzufriedenheit verschrieben. Deshalb hat man sich dem vor allem im Business-Bereich wachsenden Trend verschrieben, nicht einfach Drucker zu verkaufen, sondern den Kunden individuelle Lösungen anzubieten.\r\nBrother Druckerpatronen, Toner und Tintenpatronen günstig kaufen\r\nNicht nur die Drucker, auch die passenden Brother Druckerpatronen sind von hoher Qualität, diese hat aber ihren Preis. Doch auch bei den Druckkosten kann ohne Qualitätseinbußen beim Druckergebnis gespart werden. Kompatible Toner und Druckerpatronen von Drittherstellern können Sie hier im Online-Shop günstig kaufen und das in geprüfter Qualität sowohl für Tintenstrahldrucker, als auch für Laserdrucker.\r\nDie Brother Druckerserien\r\nZu den Arbeitsplatzdruckern zählt die HL-Serie von Brother. Deren Modellpalette reicht von kompakten, monochromen Laserdruckern der Einstiegsklasse, wie es z.B.: der Brother HL 2030 ist, bis hinauf zu leistungsfähigen, üppig ausgestatteten Druckern für Arbeitsgruppen wie dem Brother HL-L 6400 DW . Die Drucker der Brother DCP Reihe gibt es sowohl als Tintenstrahl- als auch als Laserdrucker und sind je nach Modell sowohl für den Privatanwenderbereich als auch fürs Büro geeignet.\r\n\r\nDiese Multifunktionsgeräte können nicht nur drucken, sondern auch scannen, kopieren und faxen. Sehr weit verbreitet sind Geräte wie Brother DCP-L 2500 Series oder das Brother DCP-L 6600 DW . Multifunktionsgeräte sind auch die Modelle der Brother MFC Druckerreihe. Diese verfügen neben der reinen Druckfunktion über integrierte Scanner, Faxgeräte und Kopierer und sorgen für einen schnellen, reibungslosen Ablauf im Büro. Auch unter den Faxgeräten findet jeder Anwender bei Brother das für sein Kopiervolumen passende Gerät, ob es das Tintenstrahlfax Brother Fax 1835 C für das kleine Volumen ist, oder das Brother Fax 2820, dass auch dem Dauerbetrieb gewachsen ist.\r\nFazit:\r\nBrother bietet ein umfangreiches Sortiment von verschiedenen Druckgeräten und Druckerpatronen. Vom kompakten Drucker am Arbeitsplatz über das praktische Multifunktionsgerät bis hin zum Hochleistungsdrucker für viele Bedürfnisse.', 1),
(15, 'IBM Druckerpatronen und Tonerkartuschen günstig kaufen\r\nSie möchten viel Geld für Toner und Patronen für IBM Drucker sparen? Dann können Sie schnell und unkompliziert hier im Online-Shop von DUCARIS IBM Druckerpatronen und Tonerkartuschen günstig bestellen!\r\n\r\nProfitieren Sie von einem umfassenden Warenangebot und senken Sie Ihre Druckkosten. Wir verstehen uns als großen Versandhandel, der über das Internet beliefert. Im Gegenzug können wir Patronen permanent günstiger anbieten. Die meisten Produkte sind kurzfristig lieferbar. Unsere Tiefst-Preise werden Sie kaum in Ladengeschäften finden!\r\n\r\nIBM – Garant für Innovationen im IT-Bereich\r\nIBM ist einer der ältesten Großen im Bereich Informationstechnologie. Das Unternehmen war bereits ein Konzern, als Bill Gates noch ein kleines Garagenunternehmen führte. Es erreichte 2012 einen Umsatz von 104,5 Milliarden US-Dollar und zählt damit zu den größten Anbietern in Bereich Hard- und Software, IT-Services und B2B-Lösungen. In über 170 Ländern beschäftigt der Konzern mehr als 400.000 Mitarbeiter. Das Unternehmen hat sich trotz seiner beeindruckenden Größe in seiner Geschichte immer wieder neu definiert und der Branche in jeder Phase Impulse und Innovationen geliefert. Seine ersten Personal Computer revolutionierten den Büroalltag. Seine Thinkpads, legendär stabile Notebooks, legten dem Grundstein für die heutige mobile Arbeitskultur. Der breiten Öffentlichkeit weniger bekannt sind die Leistungen auf dem B2B-Sektor, wo der aktuelle Fokus der Aktivitäten des Konzerns angesiedelt ist.\r\n\r\nInnovationen von IBM auch im Bereich Open Source\r\nNachhaltiges Wachstum und nachhaltige Entwicklung gehören neben Innovation zum Selbstverständnis des Konzerns. Das Budget seiner Abteilungen für Forschung und Entwicklung erreicht Jahr für Jahr Milliardenhöhe. Ebenso engagiert sich das Unternehmen im Open Source Bereich - durch hohe Spenden an zukunftsträchtige Open Source Projekte und durch Bemühung um Interoperabilität der eigenen Lösungen. Viele seiner eigenen Softwarepatente hat das Unternehmen zudem unter freie Lizenzen gestellt, um der Innovation im Open Source Bereich keine juristischen Hürden in den Weg zu stellen. Beim LiMux-Projekt der Landeshauptstadt München spielt IBM eine federführende Rolle.\r\n\r\nIBM Drucker - Verkauf der Druckerdivision an Lexmark\r\nIm Zuge der Konzentration auf Kernkompetenzen hat das Unternehmen in den Neunziger Jahren sowohl Fertigung von Thinkpads als auch von Druckern auf- bzw. weitergegeben. Thinkpads werden heute von Lenovo gebaut. Aus der gesamten Druckerdivision entstand unter dem Namen Lexmark ein neues Unternehmen. IBM Drucker werden daher heute von Lexmark hergestellt und vertrieben. Im Unternehmen verblieben sind lediglich Spezialgeräte, beispielsweise Bon-Drucker für Kassensysteme unter der Marke SureMark. Die klassischen Laser- und Tintenstrahldrucker stehen zwar nicht länger im Zentrum der öffentlichen Wahrnehmung, erfreuen sich jedoch aufgrund ihrer Stabilität und Zuverlässigkeit nach wie vor großer Beliebtheit bei den Konsumenten. Nach wie vor ist eine beeindruckende Modellvielfalt am Markt, für die es allesamt Ersatzteile, IBM Druckerpatronen und IBM Toner zu kaufen gibt.\r\n\r\nIBM Druckerpatronen für viele Serien\r\nBis heute überzeugen besonders die Modelle der Serien Infoprint und Infoprint Color durch relativ günstige Anschaffungskosten und hervorragende Eigenschaften. Die Serie ist für kleine und mittelgroße Arbeitsgruppen oder Büros geeignet und besticht durch kompakte Bauweise, einfache Wartbarkeit und schnelle Druckeigenschaften. So kann zum Beispiel der netzwerkfähige Infoprint 1852dn bis zu 48 Seiten pro Minute ausgeben. Dieses Modell empfiehlt sich als robustes Arbeitstier für Einsatzzwecke, in denen vor allem große Mengen an monochromen Drucken gefragt sind.', 1);
INSERT INTO `content` (`id`, `content`, `final`) VALUES
(16, 'Bei ABB hat es in Südkorea Fälle von Unterschlagung und Veruntreuung von Geldern in erheblichem Ausmaß gegeben. Das wird auch den Gewinn des Schweizer Anlagenbauers belasten. Der Konzern steht unter Schock.\r\n\r\nDer Schweizer Elektrokonzern ABB wird von einem 100 Millionen Dollar schweren Betrugsfall in Südkorea erschüttert. Dort habe ein mittlerweile verschwundener Finanzdirektor mutmaßlich Firmengelder veruntreut und Unterlagen gefälscht, erklärte der Konzern am Mittwoch. Es ist der zweite Skandal innerhalb weniger Wochen, der für Schlagzeilen sorgt: Erst Anfang Februar waren Korruptionsermittlungen gegen die britische ABB-Tochter und deren Mitarbeiter bekanntgeworden.\r\n\r\nABB-Chef Ulrich Spiesshofer sprach in einem Reuters vorliegenden Brief an die Mitarbeiter über den neuen Fall von „schockierenden Nachrichten“. Der Ruf von ABB könne Schaden nehmen. „In den kommenden Wochen und Monaten müssen wir mit kritischer Berichterstattung rechnen - und auch mit kritischen Fragen unserer Kunden.“ Dabei hatte ABB jüngst dank der zum ersten Mal seit zwei Jahren wieder anziehenden Aufträge noch Morgenluft gewittert.\r\n\r\nDie Erklärung von ABB zu dem Vorfall in Südkorea liest sich wie ein Kriminalroman: Am 7. Februar sei der Finanzdirektor der dortigen Tochter verschwunden. Zwei Tage später habe ABB Unstimmigkeiten entdeckt und nachgeforscht. Dabei seien kriminelle Machenschaften ans Licht gekommen: So wird der Finanzverantwortliche verdächtigt, gemeinsam mit anderen Personen Firmengelder gestohlen zu haben. ABB sei daraus voraussichtlich ein Schaden von 100 Millionen Dollar vor Steuern entstanden, der noch in der Bilanz für 2016 verbucht wird. Der Konzern hofft nun, einen Teil der Summe über Versicherungen zurückerstattet zu bekommen. Neben der lokalen Polizei sei auch Interpol involviert.\r\n\r\nABB-Chef Spiesshofer macht für den Konzern einen Aufwärtstrend aus. Die Dividende klettert zum siebten Mal in Folge. Hoffnungen setzt Spiesshofer auf die USA, wo die Regierung eine Infrastrukturoffensive angekündigt hat.\r\n\r\nNach Einschätzung der Analysten von Morgan Stanley könnte der Fall auch Zweifel an den internen Anti-Betrugs-Richtlinien von ABB aufkommen lassen. Die Schlagzeilen seien offensichtlich nicht gut und es könnte einige legitime Fragen von Investoren über die interne Aufsicht geben, schrieben die Experten. Sie erwarten für das laufende Jahr mögliche weitere Belastungen von etwa zehn Millionen Dollar.', 1);

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
(5, 'Laptop'),
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
(1, 'Testaufnahme', 'C:/Users/picutres/test.png'),
(2, 'Elon Musk - Gott in seiner reinen Form', 'data/img/elon.jpg'),
(3, 'Symbolbild für den weltweiten Chipmangel', 'data/img/chipmangel.jpg'),
(4, 'Frau mit VR Brille auf dem Fahrrad', 'data/img/AR.jpg'),
(5, 'Eine Schallplatte', 'data/img/Bild1.jpg'),
(6, 'Ein paar SMD Komponenten auf einem PCB', 'data/img/Bild3.jpg'),
(7, 'Eine Ladebuchse vom IPhone', 'data/img/IPhone.jpg'),
(8, 'Ein Handy mit in Ear Kopfhörern', 'data/img/Samsung.jpg'),
(9, 'Eine Smartwatch', 'data/img/Uhr.jpg');

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
(5, 'LutziButzi', 'lutz.heermann@abb.de', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
(6, 'PhilliBoi', 'phillip.rederat@siemens.com', 'admin'),
(7, 'PratoBrato', 'fabio.prota@web.de', 'admin');

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
  ADD KEY `aXi_art_fk` (`article_id`),
  ADD KEY `aXi_int_fk` (`interest_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `articlesxinterets`
--
ALTER TABLE `articlesxinterets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `aXi_art_fk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `aXi_int_fk` FOREIGN KEY (`interest_id`) REFERENCES `interests` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
