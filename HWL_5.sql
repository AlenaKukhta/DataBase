USE shop;

-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»:


-- 1 задание:	Пусть в таблице users поля created_at и updated_at оказались 
-- незаполненными. Заполните их текущими датой и временем.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC users; -- проверка состава граф таблицы 
SELECT * FROM users; -- проверка содержимого таблицы

UPDATE users SET 
	created_at = created_at + NUll,
	updated_at = updated_at + NULL; -- очистили графы created_at и updated_at

UPDATE users SET
	created_at = NOW(),
	updated_at = NOW(); -- заполнили текущей датой и временем графы created_at и updated_at


-- 2 задание:	Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате 20.10.2017 8:10. 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC users; -- проверка состава граф таблицы
SELECT * FROM users; -- проверка содержимого таблицы

ALTER TABLE users MODIFY COLUMN created_at VARCHAR(100) DEFAULT '%d.%m.%Y %k:%i'; -- приведение даты к исходному типу
ALTER TABLE users MODIFY COLUMN updated_at VARCHAR(100) DEFAULT '%d.%m.%Y %k:%i'; -- приведение даты к исходному типу

UPDATE
	users
SET
	created_at = DATE_FORMAT(created_at, '%d.%m.%Y %k:%i'), -- приведение даты к исходному формату
	updated_at = DATE_FORMAT(updated_at, '%d.%m.%Y %k:%i'); -- приведение даты к исходному формату

UPDATE
  users
SET
  created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
  updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i'); -- преобразование строки в дату

ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP; -- приведение даты к требуемому формату DATETIME
ALTER TABLE users MODIFY COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP; -- приведение даты к требуемому формату DATETIME


-- 3 задание:	В таблице складских запасов storehouses_products 
-- в поле value могут встречаться самые разные цифры: 
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились 
-- в порядке увеличения значения value. 
-- Однако нулевые запасы должны выводиться в конце, после всех записей.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC storehouses_products; -- проверка состава граф таблицы
SELECT * FROM storehouses_products; -- проверка содержимого таблицы

INSERT INTO
  storehouses_products (storehouse_id, product_id, value)
VALUES
  (1, 1, 94),
  (1, 2, 662),
  (1, 3, 7),
  (1, 4, 30),
  (1, 5, 0),
  (1, 6, 98724),
  (1, 7, 0);

SELECT * FROM storehouses_products ORDER BY value = 0, value; -- требуемая сортировка


-- 4 задание:	(по желанию) Из таблицы users необходимо извлечь пользователей, 
-- родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august).
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC users; -- проверка состава граф таблицы
SELECT * FROM users; -- проверка содержимого таблицы

SELECT name  
  FROM users
  WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august'); -- извлечение заданных пользователей


-- 5 задание:	(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2);
-- Отсортируйте записи в порядке, заданном в списке IN.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC catalogs; -- проверка состава граф таблицы
SELECT * FROM catalogs; -- проверка содержимого таблицы

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2); -- извлечение заданных разделов магазина




-- Практическое задание по теме «Агрегация данных»

-- 1 задание:	Подсчитайте средний возраст пользователей в таблице users.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC users; -- проверка состава граф таблицы
SELECT * FROM users; -- проверка содержимого таблицы


SELECT
  AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;

 
-- 2 задание:	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC users; -- проверка состава граф таблицы
SELECT * FROM users; -- проверка содержимого таблицы

SELECT
  DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  day
ORDER BY
  total DESC;

 
-- 3 задание:	(по желанию) Подсчитайте произведение чисел в столбце value таблицы catalogs.
-- Задание выполнялось в предложенной для видеоурока базе данных shop.

DESC catalogs; -- проверка состава граф таблицы
SELECT * FROM catalogs; -- проверка содержимого таблицы

SELECT ROUND(EXP(SUM(LN(id)))) FROM catalogs; -- заданное произведение чисел