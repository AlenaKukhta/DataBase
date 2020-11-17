USE vk;
SHOW TABLES;

-- просмотр таблицы
SELECT * FROM users;
SELECT * FROM profiles;
SELECT * FROM messages;
SELECT * FROM friendship;
SELECT * FROM friendship_statuses;
SELECT * FROM communities;
SELECT * FROM communities_users;
SELECT * FROM media;
SELECT * FROM media_types;

-- просмотр структуры таблицы
DESC users;
DESC profiles;
DESC messages;
DESC friendship;
DESC friendship_statuses;
DESC communities;
DESC media;
DESC media_types;


-- Доработка 1: удаление излишнего поля в таблице friendship
ALTER TABLE friendship DROP COLUMN requested_at;


-- Доработка 2: для таблицы нужно прописывать FOREIGN KEY (fk) - доработка будет выполнена на следующем уроке


-- Доработка 3: добавление файла в сообщение (поле  media_id)
ALTER TABLE messages ADD COLUMN media_id INT UNSIGNED AFTER body; 


-- Доработка 4: изменение типа данных для поля gender в profiles на ENUM
DESC profiles;
SELECT DISTINCT gender FROM profiles;
ALTER TABLE profiles MODIFY COLUMN gender ENUM('P', 'M', 'D') NOT NULL;


-- Доработка 5: актуализация даты updated_at
UPDATE users SET updated_at = NOW() WHERE  updated_at < created_at;
UPDATE profiles SET updated_at = NOW() WHERE  updated_at < created_at;
UPDATE friendship SET updated_at = NOW() WHERE  updated_at < created_at; 
UPDATE friendship_statuses SET updated_at = NOW() WHERE  updated_at < created_at; 
UPDATE communities SET updated_at = NOW() WHERE  updated_at < created_at;
UPDATE media SET updated_at = NOW() WHERE  updated_at < created_at; 
UPDATE media_types SET updated_at = NOW() WHERE  updated_at < created_at; 
SELECT * FROM users;
SELECT * FROM profiles;
SELECT * FROM friendship;
SELECT * FROM friendship_statuses;
SELECT * FROM communities;
SELECT * FROM media;
SELECT * FROM media_types;


-- Доработка 6: изменение типа данных для графы country таблицы profiles
DESC profiles;
SELECT DISTINCT country FROM profiles;

DROP TEMPORARY TABLE countrys;
CREATE TEMPORARY TABLE countrys (name CHAR(13)) COMMENT "Создание временной таблицы countrys";
INSERT INTO countrys VALUES ('Russia'), ('USA'), ('Canada'), ('Spain'), ('Italy'), 
							('Norway'), ('Estonia'), ('Great Britain'), ('Czech'), ('France');
DESC countrys;
SELECT * FROM countrys;

UPDATE profiles SET country = (SELECT name FROM countrys ORDER BY RAND() LIMIT 1)
					COMMENT "Замена всех значений графы country согласно заданному перечню стран";

SELECT * FROM profiles;


-- Доработка 7: исключение равенства значений в графах from_user_id и to_user_id таблицы messages
DESC messages;
SELECT * FROM messages; -- LIMIT 10;
SELECT * FROM users ORDER BY id DESC; -- определение количества строк в таблице users
UPDATE messages SET 
  from_user_id = FLOOR(1 + RAND() * 100),
  to_user_id = FLOOR(1 + RAND() * 100);
 
 
-- Доработка 8: заполнение графы media_id таблицы messages
DESC messages;
SELECT * FROM messages;
SELECT * FROM media ORDER BY id DESC; -- определение количества строк в таблице media
UPDATE messages SET media_id = FLOOR(1 + RAND() * 100);


-- Доработка 9: обновление графы user_id таблицы media
UPDATE media SET user_id = FLOOR(1 + RAND() * 100);

SELECT * FROM media; -- Проверка
 

-- Доработка 10: обновление графы filename таблицы media
CREATE TEMPORARY TABLE extensions (name VARCHAR(10)) COMMENT "Создание временной таблицы форматов медиафайлов";
INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mpeg'), ('png'); -- Заполнение таблицы


SELECT * FROM extensions; -- Проверка


UPDATE media SET filename = CONCAT(
  	'http://dropbox.net/vk/',
 	filename,
 	'.',
	(SELECT name FROM extensions ORDER BY RAND() LIMIT 1)); -- COMMENT "обновление графы filename таблицы media"

SELECT * FROM media; -- Проверка


-- Доработка 11: обновление графы size таблицы media
UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

SELECT * FROM media; -- Проверка


-- Доработка 12: заполнение графы metadata таблицы media
UPDATE media SET metadata = CONCAT(
	'{"owner":"', 
	(SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = media.user_id),
  	'"}'
);
ALTER TABLE media MODIFY COLUMN metadata JSON;

SELECT * FROM media; -- Проверка
DESC media; -- Проверка


-- Доработка 13: обновление граф user_id и friend_id таблицы friendship
UPDATE friendship SET 
	user_id = FLOOR(1 + RAND() * 100),
	friend_id = FLOOR(1 + RAND() * 100);
UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id;
SELECT * FROM friendship; -- Проверка
DESC friendship; -- Проверка


-- Доработка 14: обновление графы status_id таблицы friendship
SELECT * FROM friendship_statuses; -- Проверка
DESC friendship_statuses; -- Проверка

TRUNCATE friendship_statuses; -- Очищаем таблицу
INSERT INTO friendship_statuses (name) VALUES
	('Requested'),
	('Confirmed'),
	('Rejected'); -- Вставляем значения статусов дружбы

UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3); -- Обновляем ссылки на статус 

SELECT * FROM friendship; -- Проверка
DESC friendship; -- Проверка


-- Доработка 15: актуализация даты в графе confirmed_at таблицы friendship
UPDATE friendship SET confirmed_at = NOW() WHERE confirmed_at < created_at;
DESC friendship;
SELECT * FROM friendship;


-- Доработка 16: обновление графы status_id таблицы communities
DESC communities; -- Смотрим структуру таблицы групп
SELECT * FROM communities; -- Анализируем данные
DELETE FROM communities WHERE id > 10; -- Удаляем часть групп

SELECT COUNT(*) FROM  communities_users;
DELETE FROM communities_users WHERE community_id > 100;


SELECT * FROM communities_users; -- Анализируем таблицу связи пользователей и групп

UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 10); -- Обновляем значения community_id
