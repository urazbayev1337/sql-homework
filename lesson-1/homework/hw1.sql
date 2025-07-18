1)Data- это информация любого вида (например в двоичном коде или в виде текста или же рисунки и так далее); Database это хранилище этих самих информаций (например экзель ,папки , файлы ) все что может хранить в себе data является database;Реляционная БД это набор таблиц связанных между собой , которые состоят из строк и столбцов , каждая строка это вся информация про 1 еденицу а каждый столбец это тип данных;Таблица это набор данных который состоит из строк и столбцов.
2)  база данных , СУБД, клиенты посылают задачи на сервер , безопасность и резервное копирование ,SQL Server построен на основе SQL стандартного языка программирования для взаимодействия с реляционными БД.
3)проверка учетных данных WINDOWS и через логин и пароль   специфичные для Sql севера
4)create database SchoolDB
5)create table Students (StudentID int,[name] varchar(50),age int)
6)сервер это хранилище данных куда люди могут подключаться , SSMS это программа для управления базами данных , SQL это язык запросов
7)DDL – Data Definition Language (create , drop, truncate, alter)
DQL – Data Query Language (select)
DML – Data Manipulation Language (insert,update , delete etc)
DCL – Data Control Language (grant,revoke)
TCL - Transaction Control Language (commit, savepoint , rollback etc)
8)insert into Students values(1,'David',22)
insert into Students values(2,'Rose',24)
insert into Students values(3,'Mimi',19)
9)скачать bak файл , потом зайти в SSMS нажать правой кнопкой мыши на базу данных , потом нажать на восстановить базу данных затем выбираем утройство и указываем путь к файлу , потом нажимаем на ОК , обновляем ссмс и должна появится база данных слева в обозревателе.
