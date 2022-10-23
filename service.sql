-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 23 2022 г., 04:40
-- Версия сервера: 5.6.51
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `service`
--

-- --------------------------------------------------------

--
-- Структура таблицы `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221020051003', '2022-10-20 07:10:27', 81),
('DoctrineMigrations\\Version20221020105510', '2022-10-20 12:55:22', 84),
('DoctrineMigrations\\Version20221022074705', '2022-10-22 09:47:16', 187);

-- --------------------------------------------------------

--
-- Структура таблицы `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id`, `name`, `cost`, `active`) VALUES
(1, 'Вывоз мусора', 165, 1),
(2, 'Холодная вода', 16, 1),
(3, 'Горячая вода', 24, 1),
(4, 'Электроснабжение', 9, 1),
(5, 'Газоснабжение', 12, 0),
(6, 'Отопление', 20, 0),
(7, 'Содержание общедомового имущества', 136, 1),
(8, 'Содержание лифта', 155, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transdate` date NOT NULL,
  `cost` double NOT NULL,
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `transactions`
--

INSERT INTO `transactions` (`id`, `service`, `transdate`, `cost`, `balance`) VALUES
(1, 'Оплата мусора', '2022-08-04', 56, 62),
(2, 'Вывоз мусора', '2022-10-22', 165, 3265),
(3, 'Холодная вода', '2022-10-22', 16, 3249),
(4, 'Горячая вода', '2022-10-22', 24, 3225),
(5, 'Электроснабжение', '2022-10-22', 9, 3216),
(6, 'Газоснабжение', '2022-10-22', 12, 3204),
(7, 'Отопление', '2022-10-22', 20, 3184),
(8, 'Содержание общедомового имущества', '2022-10-22', 136, 3048),
(9, 'Содержание лифта', '2022-10-22', 155, 2893),
(10, 'Вывоз мусора', '2022-10-22', 165, 2728),
(11, 'Холодная вода', '2022-10-22', 16, 2712),
(12, 'Горячая вода', '2022-10-22', 24, 2688),
(13, 'Электроснабжение', '2022-10-22', 9, 2679),
(14, 'Газоснабжение', '2022-10-22', 12, 2667),
(15, 'Отопление', '2022-10-22', 20, 2647),
(16, 'Содержание общедомового имущества', '2022-10-22', 136, 2511),
(17, 'Содержание лифта', '2022-10-22', 155, 2356),
(18, 'Холодная вода', '2022-10-22', 16, 2340),
(19, 'Горячая вода', '2022-10-22', 24, 2316),
(20, 'Холодная вода', '2022-10-22', 16, 2300),
(21, 'Горячая вода', '2022-10-22', 24, 2276),
(22, 'Холодная вода', '2022-10-22', 16, 2260),
(23, 'Горячая вода', '2022-10-22', 24, 2236),
(24, 'Холодная вода', '2022-10-22', 16, 2220),
(25, 'Горячая вода', '2022-10-22', 24, 2196),
(26, 'Холодная вода', '2022-10-22', 16, 2180),
(27, 'Горячая вода', '2022-10-22', 24, 2156),
(28, 'Холодная вода', '2022-10-22', 16, 2140),
(29, 'Горячая вода', '2022-10-22', 24, 2116),
(30, 'Холодная вода', '2022-10-22', 16, 2100),
(31, 'Горячая вода', '2022-10-22', 24, 2076),
(32, 'Холодная вода', '2022-10-22', 16, 2060),
(33, 'Горячая вода', '2022-10-22', 24, 2036),
(34, 'Вывоз мусора', '2022-10-22', 165, 1871),
(35, 'Холодная вода', '2022-10-22', 16, 1855),
(36, 'Горячая вода', '2022-10-22', 24, 1831),
(37, 'Электроснабжение', '2022-10-22', 9, 1822),
(38, 'Содержание общедомового имущества', '2022-10-22', 136, 1686),
(39, 'Вывоз мусора', '2022-10-22', 165, 1521),
(40, 'Холодная вода', '2022-10-22', 16, 1505),
(41, 'Горячая вода', '2022-10-22', 24, 1481),
(42, 'Электроснабжение', '2022-10-22', 9, 1472),
(43, 'Содержание общедомового имущества', '2022-10-22', 136, 1336),
(44, 'Вывоз мусора', '2022-10-22', 165, 1171),
(45, 'Холодная вода', '2022-10-22', 16, 1155),
(46, 'Горячая вода', '2022-10-22', 24, 1131),
(47, 'Электроснабжение', '2022-10-22', 9, 1122),
(48, 'Содержание общедомового имущества', '2022-10-22', 136, 986),
(49, 'Вывоз мусора', '2022-10-22', 165, 821),
(50, 'Холодная вода', '2022-10-22', 16, 805),
(51, 'Горячая вода', '2022-10-22', 24, 781),
(52, 'Электроснабжение', '2022-10-22', 9, 772),
(53, 'Содержание общедомового имущества', '2022-10-22', 136, 636),
(54, 'Вывоз мусора', '2022-10-22', 165, 471),
(55, 'Холодная вода', '2022-10-22', 16, 455),
(56, 'Горячая вода', '2022-10-22', 24, 431),
(57, 'Электроснабжение', '2022-10-22', 9, 422),
(58, 'Содержание общедомового имущества', '2022-10-22', 136, 286),
(59, 'Вывоз мусора', '2022-10-22', 165, 121),
(60, 'Холодная вода', '2022-10-22', 16, 105),
(61, 'Горячая вода', '2022-10-22', 24, 81),
(62, 'Электроснабжение', '2022-10-22', 9, 72),
(63, 'Содержание общедомового имущества', '2022-10-22', 136, -64),
(64, 'Вывоз мусора', '2022-10-22', 165, 340),
(65, 'Холодная вода', '2022-10-22', 16, 324),
(66, 'Горячая вода', '2022-10-22', 24, 300),
(67, 'Электроснабжение', '2022-10-22', 9, 291),
(68, 'Содержание общедомового имущества', '2022-10-22', 136, 155),
(69, 'Вывоз мусора', '2022-10-22', 165, -10),
(70, 'Холодная вода', '2022-10-22', 16, -26),
(71, 'Горячая вода', '2022-10-22', 24, -50),
(72, 'Электроснабжение', '2022-10-22', 9, -59),
(73, 'Содержание общедомового имущества', '2022-10-22', 136, -195),
(74, 'Вывоз мусора', '2022-10-22', 165, -360),
(75, 'Холодная вода', '2022-10-22', 16, -376),
(76, 'Горячая вода', '2022-10-22', 24, -400),
(77, 'Электроснабжение', '2022-10-22', 9, -409),
(78, 'Содержание общедомового имущества', '2022-10-22', 136, -545),
(79, 'Вывоз мусора', '2022-10-22', 165, -710),
(80, 'Холодная вода', '2022-10-22', 16, -726),
(81, 'Горячая вода', '2022-10-22', 24, -750),
(82, 'Электроснабжение', '2022-10-22', 9, -759),
(83, 'Содержание общедомового имущества', '2022-10-22', 136, -895),
(84, 'Вывоз мусора', '2022-10-22', 165, -1060),
(85, 'Холодная вода', '2022-10-22', 16, -1076),
(86, 'Горячая вода', '2022-10-22', 24, -1100),
(87, 'Электроснабжение', '2022-10-22', 9, -1109),
(88, 'Содержание общедомового имущества', '2022-10-22', 136, -1245);

-- --------------------------------------------------------

--
-- Структура таблицы `usermoney`
--

CREATE TABLE `usermoney` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `usermoney`
--

INSERT INTO `usermoney` (`id`, `login`, `balance`) VALUES
(1, 'user', 8755);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `usermoney`
--
ALTER TABLE `usermoney`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT для таблицы `usermoney`
--
ALTER TABLE `usermoney`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
