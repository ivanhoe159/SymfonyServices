-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 26 2022 г., 08:28
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
  `active` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `maximvalue` int(11) NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id`, `name`, `cost`, `active`, `value`, `maximvalue`, `unit`) VALUES
(1, 'Вывоз мусора', 165, 1, 1, 1, '-'),
(2, 'Холодная вода', 16, 1, 33, 1000, 'м3'),
(3, 'Горячая вода', 24, 1, 200, 1000, 'м3'),
(4, 'Электроснабжение', 9, 1, 1, 10000, 'кв'),
(5, 'Газоснабжение', 12, 0, 1, 1000, 'м3'),
(6, 'Отопление', 30, 0, 1, 10000, 'Гкл'),
(7, 'Содержание общедомового имущества', 136, 0, 1, 1, '-'),
(8, 'Содержание лифта', 155, 0, 1, 1, '-');

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transdate` date NOT NULL,
  `cost` double NOT NULL,
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `transactions`
--

INSERT INTO `transactions` (`id`, `service`, `transname`, `transdate`, `cost`, `balance`) VALUES
(205, 'Отопление', 'Подписка на услугу', '2022-10-26', -4.839, 94659.613),
(206, 'Отопление', 'Отписка от услуги', '2022-10-26', 4.839, 94664.452),
(207, 'Вывоз мусора', 'Подписка на услугу', '2022-10-26', -26.613, 94637.839),
(208, 'Вывоз мусора', 'Отписка от услуги', '2022-10-26', 26.613, 94664.452),
(209, 'Вывоз мусора', 'Подписка на услугу', '2022-10-26', -26.613, 94637.839),
(210, 'Вывоз мусора', 'Отписка от услуги', '2022-10-26', 26.613, 94664.452),
(211, 'Вывоз мусора', 'Подписка на услугу', '2022-10-26', -798.387, 93866.065),
(212, 'Вывоз мусора', 'Отписка от услуги', '2022-10-26', 798.387, 94664.452),
(213, 'Пополнение счета', 'Зачисление денег', '2022-10-26', 10000, 10001),
(214, 'Вывоз мусора', 'Подписка на услугу', '2022-10-26', -26.613, 9974.387),
(215, 'Холодная вода', 'Подписка на услугу', '2022-10-26', -80, 9894.387),
(216, 'Пополнение счета', 'Зачисление денег', '2022-10-26', 896, 10790.387),
(217, 'Холодная вода', 'Отписка от услуги', '2022-10-26', 80, 10870.387),
(218, 'Вывоз мусора', 'Отписка от услуги', '2022-10-26', 26.613, 10897),
(219, 'Вывоз мусора', 'Подписка на услугу', '2022-10-26', -26.613, 10870.387),
(220, 'Вывоз мусора', 'Плата за услуги', '2022-10-26', -165, 10705.387),
(221, 'Холодная вода', 'Подписка на услугу', '2022-10-26', -85.161, 10620.226),
(222, 'Горячая вода', 'Подписка на услугу', '2022-10-26', -774.194, 9846.032),
(223, 'Вывоз мусора', 'Плата за услуги', '2022-10-26', -165, 9681.032),
(224, 'Холодная вода', 'Плата за услуги', '2022-10-26', -528, 9153.032),
(225, 'Горячая вода', 'Плата за услуги', '2022-10-26', -4800, 4353.032),
(226, 'Вывоз мусора', 'Плата за услуги', '2022-10-26', -165, 4188.032),
(227, 'Холодная вода', 'Плата за услуги', '2022-10-26', -528, 3660.032),
(228, 'Горячая вода', 'Плата за услуги', '2022-10-26', -4800, -1139.968),
(229, 'Пополнение счета', 'Зачисление денег', '2022-10-26', 1000, -139.968),
(230, 'Пополнение счета', 'Зачисление денег', '2022-10-26', 10000, 9860.032),
(231, 'Электроснабжение', 'Подписка на услугу', '2022-10-26', -1.452, 0.548);

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
(1, 'user', 0.548);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT для таблицы `usermoney`
--
ALTER TABLE `usermoney`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
