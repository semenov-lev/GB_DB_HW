/* Задача 1
 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf,
 задав в нем логин и пароль, который указывался при установке.
*/

-- Готово

/* Задача 2
 Создайте базу данных example, разместите в ней таблицу users,
 состоящую из двух столбцов, числового id и строкового name.
*/

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

/* Задача 3
 Создайте дамп базы данных example из предыдущего задания,
 разверните содержимое дампа в новую базу данных sample.
*/

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
-- Следом, отдельный файл example_dump.sql для разворачивания в созданную БД, из терминала.
