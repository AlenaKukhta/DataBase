-- Предложение по реализации лайков: каждый информационный объект дополнить 'кнопкой' (признаком) Лайк (активна/не активна)
like CHAR(1) NOT NULL COMMENT "Лайк",

-- Предложение по реализации постов: дополнение профиля ссылкой на пост и добавление таблицы постов
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  gender CHAR(1) NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  city VARCHAR(130) COMMENT "Город проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  post_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пост",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор поста",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который написал пост",
  post VARCHAR(1000000) NOT NULL COMMENT "Cодержание поста",
  like CHAR(1) NOT NULL COMMENT "Лайк",
  media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиаконтент",
  media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип контента",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания поста",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления поста"
) COMMENT "Посты";
