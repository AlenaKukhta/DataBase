-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение.

-- Агрегация данных

-- Работаем с БД vk и тестовыми данными, которые сгенерировали ранее:

USE vk;

-- ссылка на ДЗ - https://github.com/AlenaKukhta/DataBase/pull/10/files 

-- 1 задание: Создать и заполнить таблицы лайков и постов.

-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES
  ('messages'),
  ('users'),
  ('media'),
  ('posts'); -- заполнение таблицы типов получателей лайков

INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), -- ссылка на пользователя, который лайк создал
    FLOOR(1 + (RAND() * 100)), -- ссылка на строку объекта, который был лайкнут
    FLOOR(1 + (RAND() * 4)), -- ссылка на таблицу типов получателей лайков
    CURRENT_TIMESTAMP 
  FROM messages; -- заполнение таблицы лайков

SELECT * FROM messages; -- проверка содержимого таблицы
SELECT * FROM likes;

-- Создадим таблицу постов
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- актуализация даты изменения поста в таблице постов
UPDATE posts SET updated_at = NOW() WHERE updated_at < created_at;

DESC posts; -- проверка состава граф таблицы
SELECT * FROM posts; -- проверка содержимого таблицы


-- 2 задание: Создать все необходимые внешние ключи и диаграмму отношений.

SHOW TABLES FROM vk; -- просмотр списка таблиц vk

DESC profiles; -- проверка состава граф таблицы
DESC messages;
DESC communities;
DESC communities_users;
DESC friendship;
DESC friendship_statuses;
DESC likes;
DESC media;
DESC media_types;
DESC posts;
DESC target_types;
DESC users;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE; -- добавление внешнего ключа

ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
   		ON DELETE CASCADE; -- добавление внешних ключей
   		
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT communities_users_user_id_fk
  	FOREIGN KEY (user_id) REFERENCES users(id)
  		ON DELETE CASCADE; -- добавление внешних ключей
  		
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk
  	FOREIGN KEY (user_id) REFERENCES users(id)
  		ON DELETE CASCADE,
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id)
    	ON DELETE CASCADE,
  ADD CONSTRAINT friendship_status_id_fk
  	FOREIGN KEY (status_id) REFERENCES friendship_statuses(id); -- добавление внешних ключей

ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk
  	FOREIGN KEY (user_id) REFERENCES users(id)
  		ON DELETE CASCADE,
  ADD CONSTRAINT likes_target_type_id_fk
  	FOREIGN KEY (target_type_id) REFERENCES target_types(id); -- добавление внешних ключей
--   ADD CONSTRAINT likes_target_id_fk 
--     FOREIGN KEY (target_id) REFERENCES users(id), -- жду следующее занятие, пока не понятно на какую таблицу прописывать ключ

ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk
  	FOREIGN KEY (user_id) REFERENCES users(id)
  		ON DELETE CASCADE,
  ADD CONSTRAINT media_media_type_id_fk
  	FOREIGN KEY (media_type_id) REFERENCES media_types(id); -- добавление внешних ключей 	

ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk
  	FOREIGN KEY (user_id) REFERENCES users(id)
  		ON DELETE CASCADE,
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
    	ON DELETE CASCADE,
  ADD CONSTRAINT posts_media_id_fk
  	FOREIGN KEY (media_id) REFERENCES media(id); -- добавление внешних ключей

-- просмотр диаграммы отношений в DBeaver (ERDiagram) - файл 'HWL_6_Диаграмма_vk.png'


-- 3 задание: Определить кто больше поставил лайков (всего) - мужчины или женщины? 

SELECT
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
	COUNT(*) AS total
    FROM likes
    GROUP BY gender
    ORDER BY total DESC
    LIMIT 1; 

-- 4 задание: Подсчитать общее количество лайков десяти самым молодым пользователям
-- (сколько лайков получили 10 самых молодых пользователей).

SELECT SUM(likes_total) FROM 
	(SELECT
		(SELECT COUNT(target_id) 
		FROM likes 
		WHERE target_id = profiles.user_id AND target_type_id = 2 
		ORDER BY target_id DESC) AS likes_total,
		birthday
	FROM profiles 
	ORDER BY birthday DESC LIMIT 10) AS user_likes
;

-- Другой вариант
SELECT COUNT(*) FROM likes 
  WHERE target_type_id = 2
    AND target_id IN (SELECT * FROM (
      SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) AS sorted_profiles ) 
;


-- 5 задание: Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).
-- Выбранные критерии активности: 1) наименьшее количество лайков, 2) наименьшее количество постов
-- 3) наименьшее количество медиафайлов, 4) наименьшее количество сообщений

SELECT 
	CONCAT_WS(' ', first_name, last_name) AS user,
	(SELECT COUNT(*) FROM likes WHERE user_id = users.id) +
	(SELECT COUNT(*) FROM posts WHERE user_id = users.id) +
	(SELECT COUNT(*) FROM media WHERE user_id = users.id) +
	(SELECT COUNT(*) FROM messages WHERE from_user_id = users.id) AS overall_activity
	FROM users
	ORDER BY overall_activity 
LIMIT 10
;



