-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4
-- Время создания: Апр 18 2025 г., 02:12
-- Версия сервера: 8.4.4
-- Версия PHP: 8.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cargo`
--

CREATE TABLE `cargo` (
  `id` int NOT NULL,
  `trip_id` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `sender` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cargo`
--

INSERT INTO `cargo` (`id`, `trip_id`, `weight`, `sender`) VALUES
(1, 1, 5000, 'ООО \"Ромашка\"');

-- --------------------------------------------------------

--
-- Структура таблицы `route`
--

CREATE TABLE `route` (
  `id` int NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `rate` decimal(10,0) NOT NULL,
  `distance` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `route`
--

INSERT INTO `route` (`id`, `name`, `rate`, `distance`) VALUES
(1, 'Москва - Санкт-Петербург', 15000, 700);

-- --------------------------------------------------------

--
-- Структура таблицы `transport`
--

CREATE TABLE `transport` (
  `id` int NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `capacity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `transport`
--

INSERT INTO `transport` (`id`, `brand`, `capacity`) VALUES
(1, 'Volvo Trucks', 20000);

-- --------------------------------------------------------

--
-- Структура таблицы `trip`
--

CREATE TABLE `trip` (
  `id` int NOT NULL,
  `route_id` int DEFAULT NULL,
  `transport_id` int DEFAULT NULL,
  `date_time_out` datetime DEFAULT NULL,
  `date_time_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `trip`
--

INSERT INTO `trip` (`id`, `route_id`, `transport_id`, `date_time_out`, `date_time_in`) VALUES
(1, 1, 1, '2025-05-20 08:00:00', '2025-05-20 20:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Индексы таблицы `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_id` (`transport_id`),
  ADD KEY `route_id` (`route_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `route`
--
ALTER TABLE `route`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Ограничения внешнего ключа таблицы `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`),
  ADD CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
