-- Переписать запросы, заданые к ДЗ урока 6, с использованием JOIN

USE vk;

-- 3 задание: Определить кто больше поставил лайков (всего) - мужчины или женщины? 

SELECT
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
	COUNT(*) AS total
    FROM likes
    GROUP BY gender
    ORDER BY total DESC
    LIMIT 1;

SELECT 
	gender, 
	COUNT(l.id) AS total 
FROM likes AS l
	JOIN profiles AS p
		ON l.user_id = p.user_id
GROUP BY p.gender
ORDER BY total DESC
LIMIT 1; 
	

-- 4 задание: Подсчитать общее количество лайков десяти самым молодым пользователям
-- (сколько лайков получили 10 самых молодых пользователей).

SELECT SUM(likes_total) AS likes_young
FROM 
	(SELECT
		(SELECT COUNT(target_id) 
		FROM likes 
		WHERE target_id = profiles.user_id AND target_type_id = 2 
		ORDER BY target_id DESC) 
		AS likes_total,
	birthday
	FROM profiles 
	ORDER BY birthday DESC LIMIT 10) AS user_likes; -- 1 вариант без JOIN

SELECT SUM(likes_total) AS likes_young
FROM (SELECT COUNT(l.target_id) AS likes_total
			FROM likes AS l
				RIGHT JOIN profiles AS p
					ON l.target_type_id = 2   
						AND l.target_id = p.user_id
			GROUP BY p.user_id
			ORDER BY p.birthday DESC LIMIT 10) AS lt; -- 1 вариант c JOIN
	
SELECT COUNT(*) AS likes_young
FROM likes 
  WHERE target_type_id = 2
    AND target_id IN (SELECT * FROM (
      SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) AS sorted_profiles); -- 2 вариант без JOIN

SELECT COUNT(tl) AS likes_young
FROM (SELECT l.target_id AS tl
	FROM likes AS l
		RIGHT JOIN profiles AS p
			ON l.target_type_id = 2
				AND l.target_id = p.user_id
	ORDER BY p.birthday DESC LIMIT 10) AS lt; -- 2 вариант c JOIN


-- 5 задание: Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).
-- Выбранные критерии активности: 1) наименьшее количество лайков, 2) наименьшее количество постов
-- 3) наименьшее количество медиафайлов, 4) наименьшее количество сообщений

SELECT 
	CONCAT_WS(' ', id, first_name, last_name) AS user,
	(SELECT COUNT(*) FROM likes WHERE user_id = users.id) +
	(SELECT COUNT(*) FROM posts WHERE user_id = users.id) +
	(SELECT COUNT(*) FROM media WHERE user_id = users.id) +
	(SELECT COUNT(*) FROM messages WHERE from_user_id = users.id) AS overall_activity
FROM users
ORDER BY overall_activity 
LIMIT 10; -- вариант без JOIN

	
SELECT DISTINCT
	CONCAT_WS(' ', u.id, u.first_name, u.last_name) AS user,
	COUNT(DISTINCT l.id) + 
	COUNT(DISTINCT p.id) + 
	COUNT(DISTINCT m.id) + 
	COUNT(DISTINCT ms.id) AS overall_activity
FROM users AS u
	LEFT JOIN likes AS l
		ON u.id = l.user_id 
	LEFT JOIN posts AS p
		ON u.id = p.user_id 
	LEFT JOIN media AS m
		ON u.id = m.user_id 
	LEFT JOIN messages AS ms
		ON u.id = ms.from_user_id
GROUP BY u.id 
ORDER BY overall_activity 
LIMIT 10; -- вариант c JOIN

