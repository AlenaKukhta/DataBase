-- Задания на БД vk:
-- 1 задание: Проанализировать какие запросы могут выполняться наиболее
-- часто в процессе работы приложения и добавить необходимые индексы.

SHOW INDEX FROM users;

SHOW INDEX FROM posts;

SHOW INDEX FROM communities;

CREATE INDEX users_first_name_idx ON users(first_name);

CREATE INDEX users_last_name_idx ON users(last_name);

CREATE INDEX users_first_name_last_name_idx ON users(first_name, last_name);

CREATE UNIQUE INDEX users_phone_idx ON users(phone);
    
CREATE INDEX users_email_idx ON users(email);

CREATE INDEX posts_head_idx ON posts(head);

CREATE INDEX communities_name_idx ON communities(name);


-- 2 задание: Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы;
-- среднее количество пользователей в группах;
-- самый молодой пользователь в группе;
-- самый старший пользователь в группе;
-- общее количество пользователей в группе;
-- всего пользователей в системе;
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100.

DESC communities;
SELECT * FROM communities;
DESC communities_users;
SELECT * FROM communities_users;
DESC users;
SELECT * FROM users;

SELECT COUNT(community_id) FROM communities_users;

SELECT AVG(av) 
FROM(SELECT DISTINCT 
	communities.id, 
	communities.name, 
	COUNT(communities_users.user_id) OVER w1 AS av
	FROM (communities_users 
	JOIN communities 
		ON communities_users.community_id = communities.id)
		WINDOW w1 AS (PARTITION BY communities.name)) AS a; -- среднее количество пользователей в группе


SELECT DISTINCT 
	communities.id, communities.name,
	COUNT(communities_users.user_id) OVER (PARTITION BY communities.name) AS average, -- среднее количество пользователей в группах
	FIRST_VALUE(profiles.birthday) OVER w AS junior, -- самый молодой пользователь в группе
	LAST_VALUE(profiles.birthday) OVER (PARTITION BY LEFT(birthday, 11)
    					RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS older, -- самый старший пользователь в группе
	COUNT(communities_users.user_id) OVER w AS total_communities, -- общее количество пользователей в группе
	COUNT(users.id) OVER () AS total_users, -- всего пользователей в системе
	COUNT(communities_users.user_id) OVER w / COUNT(users.id) OVER () * 100 AS "%%" -- (общее количество пользователей в группе / всего пользователей в системе) * 100
FROM (communities_users 
	JOIN communities 
		ON communities_users.community_id = communities.id
	JOIN users 
		ON communities_users.user_id = users.id
	JOIN profiles 
		ON communities_users.user_id = profiles.user_id)
		WINDOW w AS (PARTITION BY LEFT(profiles.birthday, 11) ORDER BY profiles.birthday, communities_users.user_id);
