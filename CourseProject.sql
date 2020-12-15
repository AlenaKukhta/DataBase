-- Курсовой проект по курсу Базы данных:

-- 1 требование: Составить общее текстовое описание БД и решаемых ею задач.

-- За основу взята модель хранения данных веб-сайта medsi.ru.
-- Указанный сайт обслуживает запросы сети клиник МЕДСИ в России и предусматривает, 
-- в частности следующие блоки информации:
-- 1) Данные о работающих в сети клиник МЕДСИ врачах,
-- 2) Данные личных кабинетов пациентов / врачей (данные анализов, протоколы приемов и т.д.),
-- 3) Данные об оказываемых услугах и ценах на них,
-- 4) Данные о клиниках сети МЕДСИ,
-- 5) Данные о выполняемых в клиниках оздоровительных (диагностических) программах,
-- 6) Данные о проходящих в клиниках акциях,
-- 7) Сервисы вызова скорой помощи / врача/ медсестры,
-- 8) Сервис записи на прием ко врачу клиники,
-- 9) Данные об отзывах пациентов,
-- 10) Новостная лента.

DROP DATABASE ms; -- контроль отсутствия базы данных ms

CREATE DATABASE ms; -- создаём ms

USE ms; -- делаем ms текущей базой данных

-- 2 требование: Минимальное количество таблиц - 10.

-- 1) Создаём таблицу пользователей
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  status ENUM('Doctor', 'Patient', 'Doctor-Patient') NOT NULL COMMENT "Статус",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";

-- 2) Таблица профилей пользователей в личном кабинете
CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  middle_name VARCHAR(100) NOT NULL COMMENT "Отчество пользователя",
  gender ENUM('M', 'F') NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  city VARCHAR(130) COMMENT "Город проживания",
  address VARCHAR(130) COMMENT "Адрес проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили"; 

-- 3) Таблица специализации врачей
CREATE TABLE specializations (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  job VARCHAR(130) COMMENT "Должность",
  age_category ENUM('Adult', 'Children') NOT NULL COMMENT "Категория возраста пациента",
  doc_category ENUM('Professor', 
  			'Doctor medical sciences', 
  			'Associate professor', 
  			'Candidate of medical sciences',
  			'Honored doctor jf the RF',
  			'Doctor of the highest qualification category') NOT NULL COMMENT "Категория врача",
  specialization ENUM('Accident and emergency medicine', 'Allergology', 'Anesthetics', 
  			'Cardiology', 'Child psychiatry', 'Clinical biology', 'Clinical chemistry', 
  			'Clinical', 'Microbiology', 'Clinical neurophysiology', 'Craniofacial surgery', 
  			'Dermatology', 'Endocrinology', 'Family and General medicine', 'Gastroenterological surgery', 
			'Gastroenterology', 'General practice', 'General surgery', 'Geriatrics', 'Hematology', 
			'Immunology', 'Infectious diseases internal medicine', 'Laboratory medicine', 'Nephrology', 
			'Neuropsychiatry', 'Neurology', 'Neurosurgery', 'Nuclear medicine', 
			'Obstetrics and Gynecology occupational', 'Medicine', 'Oncology ophthalmology', 
			'Maxillofacial surgery', 'Orthopedics', 'Otorhinolaryngology', 'Pediatric surgery', 
			'Pediatrics', 'Pathology', 'Pharmacology', 'Physical medicine and rehabilitation', 
			'Plastic surgery', 'Orthopedic surgery', 'Preventive medicine', 'Psychiatry', 'Health care', 
			'Radiation', 'Oncology', 'Radiology', 'Respiratory medicine', 'Rheumatology', 'Dentistry', 
			'Thoracic surgery', 'Tropical medicine', 'Urology', 'Vascular surgery', 'Venereology', 
			'Medical specialty') NOT NULL COMMENT "Специализация врача", -- https://ru.qaz.wiki/wiki/Medical_specialty
  education VARCHAR(130) COMMENT "Наименование учебного заведения",
  еxperience DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Начало стажа",  
  resume TEXT COMMENT "Резюме врача",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Специализация врачей"; 

-- 4) Таблица клиник сети МЕДСИ
CREATE TABLE clinics (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название клиники",
  city VARCHAR(130) COMMENT "Город клиники",
  metro VARCHAR(130) COMMENT "Ближайшее метро",
  address VARCHAR(130) COMMENT "Адрес клиники",
  country VARCHAR(130) COMMENT "Страна клиники",
  work_schedule VARCHAR(130) COMMENT "График работы",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Клиники";

-- 5) Таблица услуг клиники
CREATE TABLE services (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  program_id INT UNSIGNED COMMENT "Ссылка на программу",
  serv_category ENUM('Allergology-immunology vaccination', 
  			'Assisted reproductive technologies issuing certificates', 'Calling a doctor at home', 
  			'Gastroenterology', 'Hematology', 'Genetics', 'Hepatology', 'Gynecology', 'Hospitalization', 
  			'Dermatovenerology', 'Dermatology', 'Diagnostics', 'Dietology medical', 'Examination', 
  			'Cardiology', 'Cosmetology physical', 'Therapy speech', 'Therapy', 'Mammology', 'Urology',
  			'Manual therapy', 'Massage', 'Medical rehabilitation', 'Neurology', 'Neurophysiology', 
  			'Neurosurgery', 'Nephrology', 'Oncology', 'Osteopathy', 'Otoneurology', 'Phoniatry', 
  			'Otorhinolaryngology (throat)', 'Ophthalmology', 'Pediatrics', 'Thoracic surgery', 
  			'Plastic surgery proctology psychotherapy', 'Pulmonology work in the Chi system', 'Dentistry', 
  			'Rheumatology x-ray', 'Surgery', 'Spa treatment', 'Somnology', 'Traumatology and orthopedics', 
  			'Physiotherapy', 'Phlebology', 'Functional diagnostics', 'Extracorporeal methods of treatment', 
  			'Endoscopic research') NOT NULL COMMENT "Категория услуги",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название услуги",
  preparation VARCHAR(150) NOT NULL UNIQUE COMMENT "Описание услуги",
  price DECIMAL (11,2) COMMENT "Цена",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Услуги";

-- 6) Таблица программ клиник сети МЕДСИ
CREATE TABLE programs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название программы",
  age ENUM('Adult', 'Children') NOT NULL COMMENT "Возрастная категория",
  discount_id INT UNSIGNED COMMENT "Ссылка на акции",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Клиники";
-- ALTER TABLE programs 
--   ADD CONSTRAINT programs_discount_id_fk 
--     FOREIGN KEY (discount_id) REFERENCES discounts(id)
--    		ON DELETE CASCADE; -- добавление внешнего ключа
ALTER TABLE programs DROP COLUMN discount_id; -- удаление излишнего поля в таблице programs

-- 7) Таблица акций (скидок)
CREATE TABLE discounts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",  
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название акции",
  program_id INT UNSIGNED COMMENT "Ссылка на программу",
  clinic_id INT UNSIGNED COMMENT "Ссылка на клинику",
  user_id INT UNSIGNED COMMENT "Ссылка на пользователя",
  service_id INT UNSIGNED COMMENT "Ссылка на услугу",
  discount FLOAT UNSIGNED COMMENT "Величина скидки от 0.0 до 1.0",
  started_at DATETIME COMMENT "Начало акции",
  finished_at DATETIME COMMENT "Конец акции",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки", 
  KEY index_of_user_id(user_id),
  KEY index_of_service_id(service_id)
) COMMENT "Акции (скидки)";

-- 8) Таблица связи пользователей и услуг клиник сети МЕДСИ
CREATE TABLE services_users (
  clinic_id INT UNSIGNED NOT NULL COMMENT "Ссылка на клинику",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  service_id INT UNSIGNED NOT NULL COMMENT "Ссылка на услугу",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки", 
  PRIMARY KEY (clinic_id, user_id, service_id) COMMENT "Составной первичный ключ"
) COMMENT "Связь между пользователями и клиниками";

-- 9) Таблица результатов анализов (исследований)
CREATE TABLE research_users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  clinic_id INT UNSIGNED NOT NULL COMMENT "Ссылка на клинику",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  service_id INT UNSIGNED NOT NULL COMMENT "Ссылка на услугу",
  referenc_id INT UNSIGNED NOT NULL COMMENT "Ссылка на исследованный параметр",
  unit_id INT UNSIGNED NOT NULL COMMENT "Ссылка на единицы измерения",
  indicat DECIMAL (11,3) COMMENT "Показатель измерения",
  research_at DATETIME COMMENT "Дата забора биоматериала (проведения исследования)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
 ) COMMENT "Результаты анализов";

-- 10) Таблица единиц измерения, отдельно от референосв, поскольку должен будет еще быть 
-- предусмотрен механизм пересчета (приведения) различных единиц изменерия
CREATE TABLE unit (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название единицы измерения",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Единицы измерения";

-- 11) Таблица референсов
CREATE TABLE referenc (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название исследованного параметра",
  unit_id INT UNSIGNED NOT NULL COMMENT "Ссылка на единицы измерения",
  ref_from_optimal DECIMAL (11,3) COMMENT "Показатель начала оптимального референса",
  ref_to_optimal DECIMAL (11,3) COMMENT "Показатель конца оптимального референса",
  ref_from DECIMAL (11,3) COMMENT "Показатель начала референса",
  ref_to DECIMAL (11,3) COMMENT "Показатель конца референса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Референсы";

-- 3 требование: Скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами).

ALTER TABLE discounts 
  ADD CONSTRAINT discounts_program_id_fk 
    FOREIGN KEY (program_id) REFERENCES programs(id),
  ADD CONSTRAINT discounts_clinic_id_fk 
    FOREIGN KEY (clinic_id) REFERENCES clinics(id),
  ADD CONSTRAINT discounts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT discounts_service_id_fk 
    FOREIGN KEY (service_id) REFERENCES services(id)
   		ON DELETE CASCADE; -- добавление внешних ключей
   		
ALTER TABLE profiles 
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
   		ON DELETE CASCADE; -- добавление внешнего ключа
   		
ALTER TABLE referenc
  ADD CONSTRAINT referenc_unit_id_fk 
    FOREIGN KEY (unit_id) REFERENCES unit(id)
   		ON DELETE CASCADE; -- добавление внешнего ключа

ALTER TABLE research_users 
  ADD CONSTRAINT research_users_clinic_id_fk 
    FOREIGN KEY (clinic_id) REFERENCES clinics(id),
  ADD CONSTRAINT research_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT research_users_service_id_fk 
    FOREIGN KEY (service_id) REFERENCES services(id),
  ADD CONSTRAINT research_users_referenc_id_fk 
    FOREIGN KEY (referenc_id) REFERENCES referenc(id),
  ADD CONSTRAINT research_users_unit_id_fk 
    FOREIGN KEY (unit_id) REFERENCES unit(id)
   		ON DELETE CASCADE; -- добавление внешних ключей

ALTER TABLE services 
  ADD CONSTRAINT services_program_id_fk 
    FOREIGN KEY (program_id) REFERENCES programs(id)
   		ON DELETE CASCADE; -- добавление внешнего ключа

ALTER TABLE services_users 
  ADD CONSTRAINT services_users_clinic_id_fk 
    FOREIGN KEY (clinic_id) REFERENCES clinics(id),
  ADD CONSTRAINT services_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT services_users_service_id_fk 
    FOREIGN KEY (service_id) REFERENCES services(id)
   		ON DELETE CASCADE; -- добавление внешних ключей

ALTER TABLE specializations 
  ADD CONSTRAINT specializations_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
   		ON DELETE CASCADE; -- добавление внешнего ключа
 		
CREATE INDEX users_first_name_idx ON users(first_name); -- добавление индекса

CREATE INDEX users_last_name_idx ON users(last_name); -- добавление индекса

CREATE INDEX users_first_name_last_name_idx ON users(first_name, last_name); -- добавление индекса

CREATE INDEX services_serv_category_idx ON services(serv_category); -- добавление индекса

CREATE INDEX specializations_age_category_idx ON specializations(age_category); -- добавление индекса

CREATE INDEX specializations_doc_category_idx ON specializations(doc_category); -- добавление индекса

CREATE INDEX specializations_specialization_idx ON specializations(specialization); -- добавление индекса

CREATE INDEX referenc_name_idx ON referenc(name); -- добавление индекса

-- 4 требование: Создать ERDiagram для БД - Файл "CourseProject_ERDiagram.png".

-- 5 требование: Скрипты наполнения БД данными.

-- Для наполнения БД данными был использоан ресурс - http://filldb.info

#
# TABLE STRUCTURE FOR: clinics
#

DROP TABLE IF EXISTS `clinics`;

CREATE TABLE `clinics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название клиники',
  `city` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город клиники',
  `metro` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ближайшее метро',
  `address` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Адрес клиники',
  `country` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна клиники',
  `work_schedule` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'График работы',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Клиники';

INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (1, 'excepturi', 'Bobbieport', 'cum', '42862 Stephen Ferry Apt. 001\nWest Emelieville, MI 70119', 'Honduras', ' 09-18', '1959-08-16 05:24:54', '2020-11-18 04:37:55');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (2, 'distinctio', 'North Sybleborough', 'et', '1091 Shaun Bypass Suite 858\nPort Efrainbury, MD 94219', 'Afghanistan', ' 09-18', '1966-01-08 06:42:48', '2020-11-20 05:36:07');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (3, 'optio', 'North Gilbertostad', 'asperiores', '053 Rath Mount\nSylvesterview, MS 72694', 'Bolivia', ' 09-18', '1980-08-01 21:08:48', '2020-12-09 10:55:45');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (4, 'eligendi', 'Rahulton', 'deserunt', '4917 Schowalter Drive Suite 614\nNicholehaven, NM 02587', 'Nigeria', ' 09-18', '2016-12-12 20:36:50', '2020-11-18 02:07:59');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (5, 'architecto', 'Port Pink', 'rerum', '6884 Rhett Centers Apt. 721\nLeuschkechester, NJ 18852', 'Cambodia', '07-21', '2006-03-09 21:34:42', '2020-11-20 18:20:10');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (6, 'sequi', 'Myriamborough', 'illum', '47427 Leffler Wall\nKshlerinland, TN 32676-1534', 'Yemen', '07-21', '1937-03-15 10:21:43', '2020-12-03 15:47:21');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (7, 'rerum', 'Schmidtmouth', 'adipisci', '8410 Bahringer Neck\nWest Melba, WY 91898', 'Belgium', '07-21', '1984-07-06 02:46:48', '2020-12-05 19:42:02');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (8, 'sit', 'East Jackson', 'similique', '190 Lamar Common Apt. 305\nWest Ludwig, FL 74542', 'Afghanistan', ' 09-18', '1972-09-26 11:39:34', '2020-11-19 16:29:56');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (9, 'impedit', 'Davismouth', 'repudiandae', '65519 Sanford Fort\nAlantown, OH 37712', 'Iran', ' 09-18', '1946-07-13 17:17:45', '2020-11-22 20:50:53');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (10, 'velit', 'New Boyd', 'nihil', '44688 Green Circles\nLake Peggie, MO 29870-5881', 'Albania', ' 09-18', '2012-10-23 01:55:27', '2020-11-18 16:45:04');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (11, 'sed', 'Deshawnview', 'dicta', '51670 Wuckert Stream\nProsaccofurt, UT 85177-6726', 'Rwanda', '07-21', '1944-07-14 07:34:17', '2020-12-11 02:48:48');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (12, 'ducimus', 'Lake Rachael', 'aut', '840 Vincenzo Hollow Apt. 590\nZenaville, MI 41032-5369', 'Guatemala', ' 09-18', '1957-12-17 03:47:07', '2020-12-05 04:47:52');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (13, 'iusto', 'East Scottie', 'iste', '937 Deanna River\nWest Dion, DE 37728', 'Trinidad and Tobago', ' 09-18', '2020-08-19 09:08:53', '2020-11-20 13:22:44');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (14, 'vel', 'New Toreytown', 'architecto', '41174 Felicia Fields\nCronaside, MA 32214-3774', 'Monaco', '07-21', '1933-06-06 13:25:10', '2020-11-29 17:46:46');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (15, 'aspernatur', 'Glennieland', 'excepturi', '7311 Hand Gateway\nSouth Susana, UT 85361-2315', 'Bhutan', ' 09-18', '1964-03-05 16:35:57', '2020-11-21 01:28:45');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (16, 'voluptatem', 'Orenmouth', 'officiis', '520 Arnold Manor Apt. 927\nLake Demond, AL 13468', 'Congo', '07-21', '1958-09-06 21:49:49', '2020-11-23 22:23:40');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (17, 'necessitatibus', 'South Garretport', 'assumenda', '4075 Brekke Trafficway\nNew Elijahstad, TX 09698-5343', 'Saint Kitts and Nevis', '07-21', '1993-06-30 06:43:27', '2020-11-15 04:53:59');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (18, 'tempore', 'New Brandyn', 'qui', '8662 Hills Forks Suite 774\nEast Eldontown, DE 93743-7451', 'United States Virgin Islands', '07-21', '1996-09-23 12:27:45', '2020-12-08 13:11:29');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (19, 'eum', 'New Vance', 'ut', '253 Sebastian Meadows\nRowlandhaven, VA 32956-5982', 'San Marino', ' 09-18', '2003-08-28 18:16:23', '2020-12-10 02:52:09');
INSERT INTO `clinics` (`id`, `name`, `city`, `metro`, `address`, `country`, `work_schedule`, `created_at`, `updated_at`) VALUES (20, 'qui', 'Leilachester', 'perspiciatis', '76456 Savanna Trail\nAlanborough, IA 30170-8886', 'Hungary', ' 09-18', '2012-07-21 04:38:09', '2020-12-06 16:31:56');


#
# TABLE STRUCTURE FOR: discounts
#

DROP TABLE IF EXISTS `discounts`;

CREATE TABLE `discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название акции',
  `program_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на программу',
  `clinic_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на клинику',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на пользователя',
  `service_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на услугу',
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL COMMENT 'Начало акции',
  `finished_at` datetime DEFAULT NULL COMMENT 'Конец акции',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_service_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Акции (скидки)';

INSERT INTO `discounts` (`id`, `name`, `program_id`, `clinic_id`, `user_id`, `service_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES (1, 'quidem', 1, 1, 1, 201, '20', '2020-05-10 15:58:32', '2020-12-07 10:38:41', '2020-02-17 23:06:46', '2020-11-27 13:54:33');
INSERT INTO `discounts` (`id`, `name`, `program_id`, `clinic_id`, `user_id`, `service_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES (2, 'reprehenderit', 2, 2, 2, 202, '20', '2020-09-06 09:12:26', '2020-12-07 12:32:18', '2020-05-14 07:32:48', '2020-11-14 16:20:13');
INSERT INTO `discounts` (`id`, `name`, `program_id`, `clinic_id`, `user_id`, `service_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES (3, 'modi', 3, 3, 3, 203, '10', '2020-06-25 16:43:26', '2020-11-22 23:02:49', '2020-01-20 22:21:51', '2020-11-17 12:44:07');
INSERT INTO `discounts` (`id`, `name`, `program_id`, `clinic_id`, `user_id`, `service_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES (4, 'vero', 4, 4, 4, 204, '5', '2020-05-22 05:22:43', '2020-12-13 01:28:01', '2020-02-13 22:54:58', '2020-12-11 15:11:14');
INSERT INTO `discounts` (`id`, `name`, `program_id`, `clinic_id`, `user_id`, `service_id`, `discount`, `started_at`, `finished_at`, `created_at`, `updated_at`) VALUES (5, 'eveniet', 5, 5, 5, 205, '10', '2020-02-13 02:00:59', '2020-11-28 17:24:23', '2020-11-02 15:02:05', '2020-11-18 11:11:12');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `middle_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Отчество пользователя',
  `gender` enum('M','F') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `address` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Адрес проживания',
  `country` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Профили';

INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (1, 'voluptates', 'M', '2019-05-19', 'Nicolasport', '483 Abner Orchard\nWest Bernhardton, PA 23680-9343', 'Montserrat', '1926-03-25 21:55:38', '2020-11-16 09:22:38');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (2, 'nobis', 'F', '1989-02-13', 'Alizaville', '626 Fisher Lodge\nKaitlynmouth, NJ 04421', 'Norway', '2002-03-24 04:50:27', '2020-11-27 07:57:45');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (3, 'reprehenderit', 'M', '1979-06-30', 'North Eunaton', '680 Laurence Point\nLilianeside, CA 11688-5552', 'Fiji', '1930-11-01 06:18:10', '2020-11-30 09:06:25');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (4, 'necessitatibus', 'M', '2002-11-02', 'Jenkinsland', '00414 Malcolm Point\nLeannonfort, SD 50877-9275', 'Trinidad and Tobago', '1992-11-28 02:47:54', '2020-12-06 05:09:35');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (5, 'qui', 'M', '2016-06-26', 'Gleasontown', '5658 Glover Mews Apt. 388\nWest Shyanne, TN 38222', 'Romania', '2015-07-13 06:11:57', '2020-11-22 09:12:44');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (6, 'quis', 'M', '1984-01-28', 'South Meaghanshire', '946 Kaitlyn Extension\nDuBuqueside, MA 69630', 'China', '1981-08-07 13:53:20', '2020-11-24 23:20:31');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (7, 'beatae', 'F', '2017-11-18', 'Lenorefurt', '44635 Anais Walks Apt. 773\nPort Amira, NC 91330-2049', 'Greenland', '1935-10-27 04:39:06', '2020-11-14 10:50:09');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (8, 'magni', 'F', '1997-07-27', 'Wuckertchester', '0963 Marcelle Summit\nSouth Ludwigland, DC 85452', 'Liberia', '1980-02-13 23:55:21', '2020-11-22 17:09:01');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (9, 'est', 'M', '2018-01-24', 'South Kane', '22325 White Square\nScarlettfurt, UT 54740', 'Pitcairn Islands', '1924-08-29 02:59:04', '2020-12-12 22:49:01');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (10, 'et', 'M', '1976-07-10', 'Boyerbury', '60565 Desmond Ridges Apt. 537\nLebsacktown, MN 59222', 'Morocco', '1950-10-24 03:20:09', '2020-12-03 18:16:00');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (11, 'molestias', 'F', '1998-10-24', 'Keelingview', '5173 Bruen Spring\nPort Marianshire, NY 32273', 'Seychelles', '1923-05-01 17:11:27', '2020-12-05 07:42:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (12, 'beatae', 'M', '1980-04-16', 'Maynardfurt', '7010 Adah Shoals\nPort Kyleeborough, MO 53823', 'Mauritania', '1996-06-07 06:38:14', '2020-11-22 05:01:02');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (13, 'iusto', 'M', '1990-06-11', 'Hannahshire', '697 Quincy Station Suite 127\nWest Karaland, KS 48473', 'Netherlands', '1983-05-01 14:41:17', '2020-11-23 21:41:53');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (14, 'facere', 'M', '2013-03-15', 'Lake Elwinberg', '841 Skiles Road\nBrianaborough, SC 00125-2192', 'Rwanda', '1941-04-28 16:24:24', '2020-11-27 12:49:30');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (15, 'facilis', 'M', '1997-01-19', 'New Emieberg', '867 Nico Mountains Suite 779\nGeorgettefurt, AR 17353', 'Slovenia', '1958-02-05 07:13:20', '2020-11-16 02:33:00');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (16, 'nam', 'F', '2020-02-13', 'West Laviniabury', '5829 Ritchie Unions\nWolffburgh, GA 71834-7991', 'Montenegro', '1923-06-19 14:35:00', '2020-11-28 23:50:37');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (17, 'exercitationem', 'M', '1977-07-12', 'Lake Ford', '8743 O\'Hara Drives Apt. 948\nElberttown, NM 95089-5138', 'Guadeloupe', '1979-02-25 03:36:43', '2020-11-28 12:06:48');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (18, 'et', 'M', '2000-09-20', 'Corkeryside', '94281 Ratke Village Apt. 152\nNorth Briannemouth, NH 28524', 'Hungary', '1966-05-24 03:15:24', '2020-12-03 01:43:07');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (19, 'rem', 'M', '1977-01-18', 'East Albina', '0400 Name Mount Apt. 475\nWest Reinhold, GA 02766', 'United States Virgin Islands', '1953-01-20 02:22:22', '2020-11-17 12:17:20');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (20, 'consectetur', 'F', '1972-09-20', 'South Keaton', '9795 Titus Crescent\nWest Dino, CT 26572', 'Nauru', '1931-08-26 15:08:07', '2020-12-08 11:16:36');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (21, 'doloribus', 'M', '2007-09-29', 'Gaylordberg', '970 Francesco Center\nJuliemouth, MS 48444-5037', 'Kenya', '1951-09-17 10:26:31', '2020-12-09 08:12:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (22, 'porro', 'F', '2002-03-02', 'Ethanside', '3121 Ayla Pass Suite 697\nWeimannland, GA 27474', 'Zimbabwe', '1974-10-21 23:53:52', '2020-12-01 11:56:47');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (23, 'voluptas', 'M', '1982-01-23', 'Homenickmouth', '218 Cartwright Squares Suite 728\nNorth Tommouth, AK 09566', 'Zambia', '2017-03-12 20:17:10', '2020-12-07 16:30:27');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (24, 'cumque', 'F', '1991-09-12', 'Sibylborough', '554 Boris Estates Suite 899\nNorth Jacksonfort, AR 88933', 'Mali', '1933-04-01 12:17:51', '2020-11-14 10:15:07');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (25, 'sed', 'M', '1973-02-17', 'Andrewchester', '93321 Hayes Parkway\nPort Barrettberg, UT 98922-3660', 'Georgia', '1980-12-09 18:18:53', '2020-11-18 12:10:40');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (26, 'ratione', 'F', '1972-10-06', 'Zoieberg', '835 Littel Stream Apt. 474\nSouth Nathan, LA 15046-0277', 'Sao Tome and Principe', '2002-10-06 08:22:17', '2020-11-28 05:35:29');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (27, 'est', 'F', '1980-05-07', 'South Vita', '76848 Kihn Gateway\nLake Jaquelineshire, MO 92676', 'Lesotho', '1921-11-15 22:12:02', '2020-12-04 15:39:45');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (28, 'vitae', 'M', '1995-07-23', 'Jalontown', '93553 Haley Vista\nLake Cullenborough, NJ 92263-6914', 'Burundi', '1923-10-12 09:59:23', '2020-12-04 19:23:53');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (29, 'est', 'F', '1984-09-09', 'Kilbackland', '46651 Schamberger Mountains\nSouth Gersonborough, MD 71845', 'Faroe Islands', '1944-11-08 15:39:03', '2020-12-05 11:30:54');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (30, 'natus', 'M', '2003-08-19', 'Langworthport', '71380 O\'Kon Turnpike Suite 737\nNew Alexanderville, GA 08996-0735', 'Egypt', '1945-01-03 17:54:22', '2020-11-15 05:46:36');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (31, 'aut', 'M', '1987-04-11', 'Huelsmouth', '8217 Mills Fall Suite 209\nNorth Mathiasville, KS 12795-1277', 'Timor-Leste', '1981-11-07 13:15:23', '2020-11-16 00:48:15');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (32, 'sed', 'F', '2020-04-14', 'New Marcia', '760 Dooley Union Suite 801\nLake Rupertland, DE 71781-3089', 'Cyprus', '1963-03-09 02:47:01', '2020-11-25 23:37:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (33, 'incidunt', 'M', '1977-10-15', 'Savannashire', '8733 Renner Glen Apt. 500\nLake Kacie, IN 96305-8858', 'Togo', '2017-06-22 09:10:42', '2020-11-15 16:49:52');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (34, 'quasi', 'M', '1982-02-01', 'Lake Tedview', '985 Wilkinson Junction Apt. 713\nJaclynton, NC 10292-0531', 'Greece', '1975-08-05 01:28:51', '2020-12-07 13:27:40');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (35, 'reprehenderit', 'F', '1971-10-05', 'Guadalupeport', '13523 Oberbrunner Highway\nKerlukemouth, AZ 72407', 'Cuba', '1964-01-27 19:57:24', '2020-12-09 13:41:40');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (36, 'et', 'M', '1975-08-20', 'South Giovanifort', '448 Elnora Expressway Suite 091\nSawaynview, ME 19373-0884', 'Puerto Rico', '1985-11-17 12:46:48', '2020-11-17 04:23:17');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (37, 'rem', 'M', '2009-08-26', 'West Aditya', '718 O\'Kon Plains Suite 866\nFavianbury, DE 62139-7810', 'Palestinian Territory', '1981-04-25 09:56:29', '2020-12-02 23:39:17');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (38, 'deleniti', 'M', '2011-10-03', 'East Woodrow', '96747 Bogisich Brooks Suite 522\nWest Violetteberg, NM 32626-4023', 'Macedonia', '1988-03-14 02:49:33', '2020-11-19 16:01:13');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (39, 'quibusdam', 'F', '1988-08-27', 'Estefaniaport', '7967 Kerluke Crescent\nPfefferfurt, MA 00720', 'Montenegro', '1963-11-02 03:11:12', '2020-11-23 13:33:08');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (40, 'non', 'F', '2010-03-27', 'Larueville', '09083 Reece Squares Apt. 892\nNew Trevionstad, AZ 29879-8098', 'Colombia', '1936-01-24 04:14:29', '2020-11-30 06:00:09');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (41, 'numquam', 'F', '2018-05-14', 'East Catherineton', '15263 Bradley Union\nNew Henriette, DE 04717-9780', 'Dominican Republic', '1929-10-03 00:13:27', '2020-11-29 09:48:57');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (42, 'perspiciatis', 'M', '2003-03-05', 'Virginiaville', '50811 Peter Extension Apt. 545\nWest Maxwell, ND 78298', 'Sao Tome and Principe', '1998-03-23 04:06:36', '2020-12-10 18:05:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (43, 'et', 'F', '2019-07-31', 'Lake Malachiborough', '9749 Bins Mills Suite 400\nEast Giovani, NY 12488', 'Egypt', '1935-12-19 21:51:07', '2020-12-12 13:51:02');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (44, 'nobis', 'M', '1974-03-21', 'Ferryfort', '909 Felicia Curve\nWymanshire, VT 46960-1193', 'Finland', '1938-01-28 00:16:14', '2020-11-23 00:58:33');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (45, 'qui', 'M', '2015-05-11', 'Lake Pearlineland', '639 Pascale Mill Suite 431\nBrucechester, AK 11971', 'Greenland', '1959-09-11 17:03:27', '2020-12-02 22:30:02');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (46, 'provident', 'M', '1998-11-09', 'North Kristoferside', '4349 Treutel Trail Apt. 166\nAntonettashire, NH 49566', 'Bangladesh', '1943-03-22 05:49:23', '2020-12-13 14:35:26');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (47, 'dolor', 'F', '1989-10-04', 'Port Loriport', '2042 Jessyca Alley\nPricebury, RI 14312-5007', 'Uzbekistan', '1947-09-07 17:08:35', '2020-12-11 18:15:18');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (48, 'unde', 'M', '2014-03-25', 'Port Pablo', '87659 Walter Fords Suite 268\nNorth Shany, AR 02380', 'Niger', '1983-08-05 15:43:55', '2020-11-24 09:50:19');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (49, 'totam', 'F', '2001-07-18', 'Oberbrunnerland', '5304 Graham Creek Apt. 304\nWest Elroybury, DC 79875-4878', 'Guernsey', '1931-02-17 07:52:20', '2020-11-27 11:44:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (50, 'iusto', 'F', '1999-03-22', 'Lake Cassandre', '45474 Peter Parkways\nHermanville, NE 98506', 'Turkey', '1947-10-17 09:13:06', '2020-11-16 00:11:37');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (51, 'ut', 'M', '1980-04-07', 'Wilbermouth', '123 Lucinda Curve Suite 871\nCaylaburgh, WV 68389-9687', 'Belize', '1949-02-28 16:02:27', '2020-12-09 05:48:56');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (52, 'delectus', 'F', '2010-05-10', 'Lake Deionmouth', '5819 Quentin Park Suite 587\nGunnertown, ID 64462', 'Guadeloupe', '1953-01-25 17:28:58', '2020-11-27 09:56:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (53, 'et', 'F', '1975-10-06', 'Christiansenhaven', '665 Lacy Via Apt. 696\nMaiyaland, MN 45190', 'Jersey', '1997-03-29 16:49:35', '2020-12-09 10:35:08');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (54, 'rerum', 'M', '2001-12-12', 'Port Ken', '45719 Olson Circles\nGusikowskitown, LA 65144', 'Northern Mariana Islands', '1985-09-23 18:29:29', '2020-11-22 16:28:47');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (55, 'beatae', 'M', '2004-06-24', 'Archbury', '5270 Hilll Parkways\nNorth Abigail, AK 61996', 'Costa Rica', '2001-02-09 19:48:40', '2020-11-25 11:50:46');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (56, 'doloremque', 'M', '1982-12-21', 'Buddymouth', '946 Wehner Islands Suite 927\nLavinaville, ND 71033', 'Saint Lucia', '2006-05-01 21:38:17', '2020-11-21 23:42:17');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (57, 'molestiae', 'M', '1987-01-05', 'Lake Jarvis', '6622 Schaefer Fork\nWest Everetteville, AL 63923', 'Gambia', '1935-09-01 01:06:06', '2020-11-15 01:13:52');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (58, 'quia', 'F', '1992-04-15', 'Lavonnestad', '32841 Kuhic Isle Apt. 220\nCalistamouth, WI 79257', 'United States Minor Outlying Islands', '1935-09-05 08:56:01', '2020-12-13 07:13:14');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (59, 'non', 'F', '1999-01-24', 'Boydville', '9037 King Vista\nEdythside, DE 36984', 'Cameroon', '2018-08-29 02:58:02', '2020-12-02 15:20:02');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (60, 'saepe', 'M', '1983-08-16', 'Hayeston', '693 Emmie Ranch\nWest Jordanehaven, MT 32564-1601', 'Cote d\'Ivoire', '1945-07-19 02:28:27', '2020-11-14 18:35:42');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (61, 'natus', 'M', '2008-01-11', 'South Olatown', '216 Jayden Mount\nGissellestad, KY 67218-1531', 'Guyana', '1963-12-11 15:39:01', '2020-11-22 13:51:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (62, 'placeat', 'M', '1973-03-12', 'South Mabelview', '633 Hilll Branch Suite 800\nLake Benedict, MA 66878', 'Liberia', '1985-08-26 08:12:20', '2020-11-24 03:24:01');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (63, 'voluptatem', 'F', '1998-01-12', 'North Lonnie', '53956 Turcotte Greens Suite 274\nSouth Aurelie, NJ 50604-6936', 'Gabon', '2007-01-30 13:36:29', '2020-12-07 01:26:29');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (64, 'ullam', 'F', '1982-08-30', 'South Rachelberg', '942 Pfannerstill Brook Apt. 376\nNew Dayna, MI 86666', 'Lebanon', '1994-12-22 08:39:25', '2020-11-27 10:05:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (65, 'sit', 'M', '1996-03-27', 'North Kareemview', '859 Beth Drives Suite 658\nDesireestad, MA 82939-7271', 'Saint Helena', '1957-09-01 12:08:17', '2020-12-04 20:45:07');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (66, 'ut', 'F', '2018-10-18', 'Isidrobury', '2448 Wuckert Mission Apt. 612\nSchmidtville, AZ 19566-4393', 'Benin', '1979-11-30 22:57:05', '2020-11-20 08:36:05');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (67, 'quae', 'M', '2015-12-17', 'West Milan', '403 Kunde Stravenue\nNitzscheville, IA 36270-8157', 'Singapore', '2009-01-15 21:26:28', '2020-12-12 09:13:23');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (68, 'libero', 'M', '1978-01-08', 'Macejkovicbury', '6696 Natalia Rest\nStarkview, DE 30068', 'Turks and Caicos Islands', '1982-10-30 15:57:11', '2020-11-30 05:05:38');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (69, 'assumenda', 'F', '1992-08-30', 'Brooksville', '310 Vallie Stravenue Suite 628\nConnhaven, ID 63305', 'Samoa', '1970-11-09 14:45:03', '2020-12-11 18:14:34');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (70, 'optio', 'M', '2018-05-19', 'Stoltenbergtown', '8863 Macie Mountain Apt. 327\nRubenbury, DE 42783', 'Burkina Faso', '1951-08-01 23:21:04', '2020-11-14 09:16:08');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (71, 'iure', 'M', '2006-08-21', 'East Marquis', '93402 Anderson Spur\nBreitenbergchester, AZ 29362', 'Afghanistan', '2008-07-12 12:51:13', '2020-11-23 17:58:09');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (72, 'adipisci', 'F', '2015-09-06', 'Strackeberg', '374 Brendon Shoals\nRathshire, AK 28148-6304', 'New Zealand', '1977-03-07 01:23:30', '2020-11-21 23:18:46');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (73, 'numquam', 'M', '1986-04-16', 'Oraport', '3272 Padberg Spur Suite 004\nSouth Estevanberg, WY 97941-3320', 'Bouvet Island (Bouvetoya)', '1996-11-27 00:50:09', '2020-12-12 12:53:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (74, 'officiis', 'F', '2007-04-21', 'Gislasonton', '0360 Bernier Divide\nNoemiton, WV 81855-2415', 'New Zealand', '1928-10-01 00:34:41', '2020-11-27 02:49:38');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (75, 'et', 'M', '2013-04-02', 'Jacobiport', '518 Aaron Square Apt. 641\nEast Bellehaven, TX 38297', 'Antarctica (the territory South of 60 deg S)', '1930-03-10 09:21:48', '2020-12-07 11:36:51');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (76, 'consequuntur', 'F', '2007-01-02', 'Hettingerstad', '7299 Emilio Valley\nPort Providenci, MO 72698', 'Korea', '1939-06-13 00:09:00', '2020-11-16 15:30:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (77, 'consectetur', 'F', '2007-11-05', 'East Evangelinefort', '931 Harber Port Apt. 984\nNorth Arnaldoberg, CA 03315-1499', 'Thailand', '2016-02-08 05:53:25', '2020-11-15 23:24:23');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (78, 'quisquam', 'M', '2012-08-16', 'South Ricardo', '7302 Daryl Lane Suite 879\nEnoston, DC 95652', 'Grenada', '1951-02-05 18:48:06', '2020-11-26 04:21:00');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (79, 'enim', 'F', '2010-10-09', 'North Cassidyhaven', '057 McClure Plains Suite 605\nNew Corrineville, AK 18309', 'Croatia', '2018-04-04 09:03:03', '2020-11-14 22:19:55');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (80, 'vitae', 'F', '2003-12-20', 'Westtown', '3135 Zemlak Wells\nSouth Rudolphstad, MO 40580-1879', 'United States Virgin Islands', '1922-11-09 06:17:24', '2020-11-17 02:31:33');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (81, 'veniam', 'F', '1997-07-28', 'Port Macyville', '1450 Kessler Curve Suite 696\nDanteport, MN 41245-1495', 'Algeria', '1959-01-24 02:10:49', '2020-12-03 22:00:44');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (82, 'optio', 'F', '2012-07-12', 'West Pinkieton', '9641 Urban Knolls Apt. 395\nKasandrahaven, NE 00338', 'Gibraltar', '2011-01-31 09:40:41', '2020-11-16 14:28:52');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (83, 'id', 'F', '2007-12-30', 'Susiefort', '3209 Hollie Walks\nKorymouth, GA 81477-8420', 'Turks and Caicos Islands', '1956-05-24 06:26:43', '2020-12-09 01:25:17');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (84, 'cum', 'F', '2009-04-29', 'Carrollmouth', '402 Cortney Trace\nNew Lulashire, AK 58716-5025', 'Bahamas', '1960-05-19 02:19:44', '2020-11-18 20:35:09');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (85, 'dicta', 'M', '1987-09-27', 'New Moisesburgh', '21667 Modesta Gardens\nLake Johnny, KS 11654', 'Montserrat', '2009-02-10 17:28:04', '2020-11-27 17:12:24');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (86, 'et', 'M', '2018-11-10', 'West Bennieborough', '077 Brakus Wall\nNelsonmouth, MD 51466-0027', 'Cook Islands', '2003-04-06 06:23:16', '2020-11-14 20:02:18');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (87, 'pariatur', 'M', '2013-11-17', 'North Citlallitown', '684 Adriana Village Suite 840\nPort Jaquelintown, NM 53392-2778', 'Hungary', '1989-11-10 01:23:50', '2020-11-18 13:13:50');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (88, 'ipsam', 'M', '2019-04-28', 'Murielborough', '28774 Andreane Turnpike Suite 696\nSouth Wendyshire, NE 13588', 'Cook Islands', '1991-03-08 13:27:46', '2020-11-28 14:24:41');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (89, 'nostrum', 'F', '2001-05-04', 'Christineberg', '865 Wunsch Underpass Apt. 170\nLake Sam, MN 74956-6890', 'Morocco', '2011-10-05 12:36:45', '2020-12-04 10:53:28');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (90, 'animi', 'F', '2017-11-19', 'South Erica', '7205 Torp Lock\nLake Bennettfurt, IL 16117', 'Slovenia', '1922-12-28 04:34:19', '2020-12-10 13:02:20');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (91, 'est', 'F', '1975-12-12', 'Anaisburgh', '275 Gabriel Plaza\nLittelland, AZ 11986-9024', 'Netherlands', '1974-03-27 20:22:37', '2020-11-30 20:40:40');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (92, 'quo', 'M', '1997-10-26', 'Denesikmouth', '28937 Kohler Oval\nJeremyton, MT 01841', 'Korea', '1954-04-16 16:38:17', '2020-11-26 16:48:48');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (93, 'ut', 'F', '1987-12-20', 'Port Clydeview', '9947 Block Skyway Apt. 787\nEast Elissa, NE 56888', 'Moldova', '2016-04-09 22:57:20', '2020-11-30 21:04:56');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (94, 'qui', 'F', '1989-03-10', 'West Stephanieport', '7902 Denesik Cliffs Apt. 993\nGracielachester, NH 35717-2251', 'Denmark', '1976-08-11 06:27:14', '2020-11-22 16:28:25');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (95, 'perspiciatis', 'M', '1990-11-02', 'South Neoma', '538 Romaguera Station Apt. 654\nNorth Chandlertown, AL 98764-8144', 'Cyprus', '1971-04-15 06:30:06', '2020-11-22 04:36:20');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (96, 'pariatur', 'F', '2007-12-06', 'Kassulkeview', '358 Koch Bypass Suite 408\nSouth Yazmin, DE 25162-6879', 'Armenia', '2007-10-02 20:36:50', '2020-11-15 21:50:20');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (97, 'ex', 'M', '1980-11-08', 'Fredymouth', '106 Anderson Overpass Apt. 169\nDemondtown, WY 56451', 'Pakistan', '1993-07-04 14:23:05', '2020-12-09 18:27:44');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (98, 'repudiandae', 'M', '1989-08-19', 'Efrainfurt', '7983 Dee Ways\nFeeneyview, AK 07893', 'Cambodia', '1920-12-20 04:43:59', '2020-11-15 08:43:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (99, 'molestiae', 'M', '1975-01-08', 'Lake Raleigh', '3739 Asia Forges Apt. 127\nNew Kitty, CO 31141-3322', 'Burkina Faso', '1924-07-06 02:13:24', '2020-12-05 03:18:13');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (100, 'aut', 'F', '2006-01-18', 'Justineport', '955 Harry Key\nDonnellyland, DC 17014', 'Azerbaijan', '1988-10-31 14:05:49', '2020-12-05 02:29:48');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (101, 'sed', 'F', '1975-08-17', 'New Estevan', '50005 Yessenia Circles\nHellerside, OK 30883', 'Macao', '1998-02-03 01:33:33', '2020-11-18 12:44:46');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (102, 'laborum', 'M', '1999-09-21', 'Dareville', '1749 Howe Union Suite 272\nWardmouth, CT 30643-4026', 'Sri Lanka', '2019-08-17 21:26:41', '2020-12-01 05:35:30');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (103, 'nostrum', 'M', '2016-09-22', 'New Kelli', '91867 Yadira Villages\nMuellerfort, AL 21984-9777', 'Belarus', '1946-02-16 02:48:56', '2020-12-06 21:12:42');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (104, 'non', 'F', '1973-07-15', 'West Stan', '36427 Ondricka Freeway Suite 745\nDesmondbury, OH 16561-1833', 'Mayotte', '1939-11-25 02:18:35', '2020-11-27 21:55:36');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (105, 'quo', 'M', '1973-07-01', 'Rippinton', '21006 Cathy Keys\nEast Elijahberg, KY 32975', 'Paraguay', '2010-07-20 21:51:09', '2020-12-02 17:43:10');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (106, 'reiciendis', 'F', '2015-12-02', 'West Raymond', '850 Beier Vista\nNew Irvingview, WY 32134-0500', 'Saint Pierre and Miquelon', '2009-10-26 09:32:35', '2020-12-07 19:55:04');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (107, 'alias', 'F', '2014-11-25', 'Hassanburgh', '34027 Eveline Estates\nRogahnshire, CO 28294-6438', 'Antigua and Barbuda', '2017-04-22 10:31:32', '2020-11-16 05:36:47');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (108, 'aut', 'F', '1997-03-24', 'Port Willmouth', '346 Schulist Shore Suite 928\nSouth Hermina, LA 19581', 'Netherlands', '1941-10-28 15:52:45', '2020-12-11 11:56:53');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (109, 'rerum', 'M', '2002-01-28', 'West Nathenborough', '75032 Watsica Highway Suite 187\nRohanchester, MA 08723-9547', 'Gibraltar', '1974-12-30 01:46:01', '2020-11-19 05:34:55');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (110, 'possimus', 'M', '1998-07-06', 'New Jaclyntown', '428 Carroll Avenue Suite 380\nLake Bernardo, RI 54905-9140', 'Canada', '1927-08-25 22:42:31', '2020-11-23 06:12:20');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (111, 'nam', 'M', '1973-12-24', 'Kendrickhaven', '297 Emard Springs\nDelphiamouth, MT 20016-7921', 'Kyrgyz Republic', '1962-07-07 10:58:44', '2020-12-01 01:35:49');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (112, 'tempore', 'M', '2002-11-01', 'Port Evie', '990 Gerhold Station Apt. 714\nEast Edmond, VA 43061', 'British Indian Ocean Territory (Chagos Archipelago)', '1928-12-27 17:16:48', '2020-11-22 09:54:10');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (113, 'voluptas', 'F', '2018-09-01', 'South Vivienne', '965 Virgil Estate\nNorth Jamel, IL 12422', 'Georgia', '2002-10-02 08:08:50', '2020-11-17 07:49:25');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (114, 'quos', 'F', '1978-03-26', 'Port Gustbury', '114 Bosco Lodge Apt. 605\nLexietown, NM 65537-8619', 'Ecuador', '1921-04-09 09:29:46', '2020-12-03 17:01:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (115, 'debitis', 'F', '2005-01-29', 'Lake Alishaton', '83823 Ethan Island Apt. 854\nHeloiseshire, AZ 29594-7722', 'Mauritius', '2019-02-20 16:08:47', '2020-11-23 17:49:38');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (116, 'reprehenderit', 'M', '1998-09-10', 'Yasmeenberg', '089 Brenda Shores Suite 755\nFraneckishire, WV 33881-2813', 'Malta', '1967-11-11 03:06:55', '2020-11-21 14:09:29');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (117, 'nihil', 'M', '1995-02-25', 'South Alanmouth', '43710 Burnice Crest\nWest Celestino, ND 08508-6839', 'French Polynesia', '2018-02-22 21:16:00', '2020-12-11 00:23:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (118, 'excepturi', 'F', '2014-10-17', 'New Amberport', '786 Duane Port Suite 799\nWest Gregorio, GA 32326-5038', 'Papua New Guinea', '1999-03-04 16:49:39', '2020-11-24 15:02:06');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (119, 'recusandae', 'F', '1992-07-31', 'Kevinside', '73871 Rebecca Falls\nWest Sydnie, OK 26326-8073', 'Saudi Arabia', '1937-12-24 13:50:51', '2020-11-26 22:36:50');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (120, 'enim', 'F', '1989-05-18', 'Lake Shea', '56622 Mark Land\nZiemannbury, VT 81924', 'Germany', '1989-11-20 00:52:08', '2020-11-26 09:57:40');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (121, 'magnam', 'F', '2006-07-27', 'Pacochaborough', '3588 Alana Viaduct\nLoweland, AL 08756-2781', 'Mozambique', '2018-06-26 17:55:40', '2020-12-11 17:52:38');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (122, 'molestiae', 'F', '1970-07-03', 'East Leonoraborough', '08941 Alexandra Stravenue Suite 218\nCandidaville, MS 08581-6697', 'Barbados', '1985-12-18 10:23:37', '2020-12-07 23:16:29');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (123, 'voluptatem', 'M', '2009-04-04', 'East Otto', '36346 Boyle Square Suite 970\nNew Rogertown, CT 42710-5975', 'Bahamas', '1945-04-23 08:08:03', '2020-12-03 18:30:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (124, 'odio', 'M', '1974-01-06', 'Elinorchester', '9919 Daisha Isle\nAlainaside, MT 23226', 'Cocos (Keeling) Islands', '1924-10-18 19:57:13', '2020-12-09 00:41:43');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (125, 'dolorum', 'F', '1982-12-24', 'New Ciceroton', '24840 Jenkins Freeway\nEast Olaf, AK 49934', 'Saint Pierre and Miquelon', '1921-05-29 09:42:41', '2020-11-22 12:16:17');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (126, 'tenetur', 'F', '2012-06-07', 'East Nevamouth', '92130 Nyah Extensions\nNorth Antonette, MO 01966-0667', 'Saint Barthelemy', '1972-04-14 22:34:20', '2020-11-17 02:11:50');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (127, 'fugit', 'F', '2015-10-16', 'Yundtborough', '77045 Bogan Overpass\nNew Sage, NJ 05267-4623', 'Latvia', '1936-06-15 13:35:46', '2020-11-22 19:06:48');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (128, 'atque', 'M', '2016-07-18', 'Kamronfort', '6868 Lockman Forest\nOkunevatown, AR 15029-3836', 'Pitcairn Islands', '2012-12-07 10:41:35', '2020-12-04 22:11:51');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (129, 'in', 'F', '1970-05-16', 'East Oswaldo', '4544 Block Fork\nArmandoville, MN 12178', 'United States of America', '2016-01-09 00:10:07', '2020-11-16 22:24:52');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (130, 'et', 'F', '1998-01-20', 'Brockside', '599 Danial Forks\nRobynbury, TX 08772-5321', 'Kiribati', '1996-12-24 02:28:58', '2020-11-23 18:39:43');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (131, 'autem', 'M', '1997-07-11', 'North Lauretta', '8869 Tillman Cliffs\nJesusview, MN 24180-2581', 'Venezuela', '1986-04-08 04:02:42', '2020-12-05 03:47:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (132, 'et', 'F', '1986-01-17', 'West Zoeystad', '37667 Emmy Track Apt. 773\nKautzerside, IL 85413-2946', 'Finland', '2002-03-30 02:04:56', '2020-12-06 13:30:03');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (133, 'sunt', 'M', '1980-11-14', 'North Winifredstad', '311 Kassulke Wells Apt. 463\nBartolettistad, ME 28438', 'Czech Republic', '1993-08-16 00:47:07', '2020-12-06 13:12:57');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (134, 'id', 'F', '1990-12-25', 'New Reese', '865 Stoltenberg Brooks\nChristophestad, MO 91482', 'Luxembourg', '2008-07-28 01:30:18', '2020-11-26 23:54:50');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (135, 'autem', 'M', '2007-09-13', 'Winifredside', '133 Rosalyn Keys Suite 906\nBodeborough, HI 66729', 'Azerbaijan', '1953-11-12 01:42:56', '2020-11-15 03:12:35');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (136, 'sunt', 'M', '2015-02-14', 'Port Santino', '5567 Roberts Landing\nArnaldoburgh, MT 74688', 'Sweden', '1974-03-29 04:52:19', '2020-12-11 19:49:37');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (137, 'praesentium', 'F', '1984-04-09', 'South Dale', '48558 Wisozk Square Apt. 420\nBradtkebury, CT 42130-1978', 'Spain', '1995-04-10 02:39:14', '2020-11-27 16:04:18');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (138, 'dolores', 'F', '1995-04-17', 'Batzmouth', '2991 Emard Underpass Suite 470\nWest Marcelleshire, MA 84243-2616', 'Gambia', '1951-08-24 17:50:33', '2020-12-05 18:37:36');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (139, 'dolor', 'F', '2001-10-07', 'South Deliatown', '613 Shawna Extensions Suite 296\nMcClureberg, MD 71501-2650', 'Faroe Islands', '1933-07-22 21:05:56', '2020-12-10 00:41:42');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (140, 'culpa', 'F', '2004-01-20', 'West Paxtonton', '459 Collins Knolls\nNew Tyrell, IL 05025', 'Chad', '1997-08-03 00:00:16', '2020-11-16 05:26:08');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (141, 'accusamus', 'M', '1970-10-26', 'New Virgilstad', '04712 Francisca Station\nEleazarview, HI 71689', 'Japan', '1967-08-23 13:19:02', '2020-12-05 13:41:33');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (142, 'deserunt', 'M', '2016-06-16', 'Stantonberg', '2281 Harber Cove\nLoisview, MO 55645', 'Togo', '1935-02-11 03:27:09', '2020-11-28 16:08:13');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (143, 'aut', 'M', '1996-11-08', 'Bergemouth', '831 Strosin Summit Apt. 550\nPort Presley, DE 61228-5309', 'Madagascar', '1938-11-11 03:19:27', '2020-11-21 03:07:40');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (144, 'animi', 'M', '2016-10-16', 'Lindgrenstad', '3770 Omari Harbor\nMarionborough, RI 79637-8644', 'Cocos (Keeling) Islands', '1929-02-15 02:47:34', '2020-11-14 12:30:25');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (145, 'rerum', 'F', '1999-10-25', 'Andersonberg', '425 Janie Valleys\nCaroleland, MD 68041-7444', 'United Arab Emirates', '2001-07-30 07:03:14', '2020-12-04 10:40:11');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (146, 'labore', 'F', '1980-12-17', 'Hammesfurt', '2573 Prohaska Island\nJohnsonville, WV 11723-4196', 'Tokelau', '1933-03-13 09:23:38', '2020-11-22 03:07:01');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (147, 'similique', 'F', '1997-10-02', 'East Miracle', '51992 Raynor Knolls Suite 033\nWest Jarret, MT 43069', 'Philippines', '2013-07-23 01:24:19', '2020-11-16 22:47:00');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (148, 'commodi', 'M', '1981-05-25', 'North Elizabethhaven', '268 Glover Key\nNew Cyril, DC 66647-2429', 'Anguilla', '2018-04-08 15:55:06', '2020-12-01 07:12:11');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (149, 'optio', 'M', '1978-09-07', 'North Aureliochester', '350 McDermott Drives Suite 726\nWuckertfurt, WA 21696', 'Faroe Islands', '1988-04-07 10:10:56', '2020-11-26 23:18:34');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (150, 'quia', 'M', '1982-01-26', 'Gislasonburgh', '72403 Kreiger Hill\nPort Hadleyshire, AK 59717-1169', 'Burkina Faso', '1938-01-10 13:26:14', '2020-12-06 16:19:39');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (151, 'qui', 'F', '1976-05-03', 'South Scotberg', '41219 Alicia Wall Suite 663\nBaileyhaven, CA 74260-6092', 'Bahrain', '1990-12-13 12:18:33', '2020-12-11 00:00:39');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (152, 'facere', 'F', '1991-02-10', 'Creminside', '9688 Hodkiewicz Drives\nKundemouth, NY 46706', 'Mayotte', '1956-11-10 06:35:29', '2020-11-21 20:51:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (153, 'aliquid', 'M', '1989-08-11', 'Fabianview', '79221 Maritza Cove Apt. 120\nBeahanberg, RI 93171', 'Northern Mariana Islands', '1960-09-30 03:59:22', '2020-11-22 13:23:54');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (154, 'cupiditate', 'M', '2012-02-22', 'Feltonton', '9062 Williamson Spurs Apt. 668\nLake Florine, DE 56029-4171', 'French Southern Territories', '1966-10-25 14:24:52', '2020-12-12 21:29:45');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (155, 'iusto', 'M', '1982-02-22', 'Veummouth', '73899 Chase Bypass\nSusanamouth, AR 25586-4724', 'Malta', '1936-08-20 11:58:08', '2020-12-01 03:24:53');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (156, 'dolores', 'M', '2006-09-08', 'Keyonton', '453 Mertie Mountains Suite 977\nSouth Meggieland, MO 04115', 'Nigeria', '1952-01-15 10:13:41', '2020-12-08 15:54:55');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (157, 'doloremque', 'M', '2002-06-08', 'Port Jessikaburgh', '425 Lee Village Suite 988\nLake Verona, UT 81737', 'Grenada', '2017-09-14 08:42:22', '2020-12-07 00:02:13');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (158, 'corporis', 'M', '2009-02-22', 'Lake Geo', '25100 Huels Rapid Apt. 771\nNorth Arjun, DE 93428', 'Marshall Islands', '1995-09-27 00:45:24', '2020-12-11 10:53:26');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (159, 'iusto', 'F', '2017-08-16', 'New Nicolette', '87521 Alisa Path\nEast Zariaport, LA 32760-5410', 'Guinea', '1962-02-27 14:09:05', '2020-12-11 11:53:04');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (160, 'nam', 'M', '1971-03-28', 'Lake Urbanmouth', '59750 Adelbert Terrace\nChristinamouth, CO 93099-1828', 'Vanuatu', '1943-09-30 02:53:46', '2020-11-15 04:53:21');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (161, 'qui', 'M', '1988-01-14', 'Mantefurt', '41935 Gina Glen\nJastside, MT 23287-8526', 'Malawi', '1996-05-28 18:24:02', '2020-11-22 02:04:57');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (162, 'explicabo', 'M', '1985-01-15', 'Shanyberg', '2661 Leif Extensions Suite 999\nNonatown, GA 27982', 'Timor-Leste', '1990-10-14 09:16:22', '2020-11-28 18:39:34');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (163, 'nisi', 'M', '2010-08-19', 'Ritchieview', '3190 Feeney Ranch Apt. 487\nElinoreborough, WV 51521', 'Iceland', '1940-12-13 05:33:46', '2020-12-09 13:24:14');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (164, 'et', 'F', '1991-02-09', 'South Alexysmouth', '633 Jude Well\nKassulkefurt, AL 29469', 'Trinidad and Tobago', '1968-11-07 11:38:47', '2020-12-06 06:00:33');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (165, 'laboriosam', 'F', '2007-06-26', 'Bernierfort', '7525 Oswaldo Estates Suite 168\nPort Stewartfort, IL 29118', 'Eritrea', '1941-01-12 13:25:08', '2020-11-26 07:19:26');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (166, 'incidunt', 'F', '1980-07-07', 'Connellyland', '45513 Makenna Stravenue\nZiemannstad, MD 21111', 'Romania', '2009-05-25 18:12:23', '2020-12-01 16:04:48');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (167, 'officiis', 'F', '1993-12-15', 'Pfefferborough', '4232 Cheyenne Burgs Suite 531\nEast Madisynville, GA 25466-4127', 'Estonia', '1934-04-11 14:38:26', '2020-11-19 06:48:29');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (168, 'officiis', 'F', '1972-08-29', 'Konopelskihaven', '293 Carter Square\nNorth Frankie, MS 06914', 'Malta', '2007-03-15 11:50:07', '2020-11-28 01:48:10');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (169, 'iure', 'F', '1986-10-20', 'West Delaneyshire', '48572 Ledner Forks Apt. 777\nRhodachester, WI 37636', 'Fiji', '1972-06-02 17:12:52', '2020-12-09 05:45:02');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (170, 'et', 'F', '2018-10-31', 'East Enriqueland', '079 Summer Port Suite 797\nWalshton, IA 04724-7383', 'Dominica', '1928-01-07 22:49:55', '2020-11-13 18:06:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (171, 'provident', 'M', '2019-11-04', 'Marquisetown', '7183 Jones Haven\nUrbanside, NH 01156', 'Northern Mariana Islands', '2002-01-29 11:14:54', '2020-12-05 00:15:08');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (172, 'ab', 'M', '2013-06-28', 'Jeramieland', '4442 Laron Parks\nLurlineport, NV 63855', 'Norfolk Island', '1958-04-06 21:24:50', '2020-12-08 15:41:27');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (173, 'consequatur', 'F', '2009-10-08', 'Lake Keonland', '72227 Medhurst Overpass\nEast Brandochester, LA 38735-1291', 'Suriname', '1975-11-01 11:52:42', '2020-11-23 01:27:29');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (174, 'est', 'M', '1986-07-22', 'Ebertmouth', '601 Marietta Harbors\nLake Eugeniabury, VA 97002-5445', 'Panama', '1958-08-23 22:10:03', '2020-12-03 19:24:41');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (175, 'ad', 'M', '1976-08-07', 'Lake Easter', '86487 Fadel Mews Apt. 845\nLake Eddie, IN 93856-1163', 'Malaysia', '1998-02-08 01:55:48', '2020-11-18 02:52:14');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (176, 'quo', 'F', '1983-05-13', 'New Jordan', '5638 Jeramy Isle Apt. 900\nCarrieton, RI 87748-4846', 'Serbia', '1969-08-11 22:52:02', '2020-12-10 21:15:11');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (177, 'nihil', 'F', '2005-03-19', 'North Lamont', '514 Sylvia Viaduct Suite 749\nNorth Jasperland, WI 37458', 'Iran', '2012-05-12 11:12:36', '2020-12-02 10:06:28');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (178, 'quibusdam', 'M', '1980-12-06', 'Lake Cristobalshire', '91702 Martin Track Suite 032\nDevonteview, ID 61552-0046', 'Peru', '1974-11-16 17:22:24', '2020-12-07 13:33:58');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (179, 'quo', 'M', '2016-08-26', 'Port Katarinaview', '22860 Aufderhar Turnpike\nSouth Trenton, FL 51440', 'Uganda', '1994-06-01 06:48:45', '2020-12-05 20:16:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (180, 'possimus', 'F', '1979-07-13', 'Kerlukeland', '985 Pedro Ramp\nJamalview, SD 40108-6650', 'Palestinian Territory', '2014-03-27 19:01:49', '2020-11-14 06:08:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (181, 'molestias', 'F', '2007-12-19', 'West Shayna', '25363 Chelsie Ports Apt. 771\nDoylefort, MD 88104', 'Somalia', '1973-04-08 15:35:55', '2020-11-20 15:21:01');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (182, 'eum', 'F', '2013-04-12', 'East Cristopher', '5519 Max Ports Apt. 534\nRorybury, LA 74076', 'Turkey', '1949-12-31 10:52:23', '2020-11-30 11:00:19');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (183, 'impedit', 'F', '2013-05-31', 'East Emilioport', '96852 Efrain Passage\nBeaushire, SD 43120', 'Georgia', '1962-01-15 03:12:22', '2020-12-08 02:58:02');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (184, 'a', 'M', '2011-03-14', 'North Jerryshire', '02828 Wyman Spurs Apt. 914\nSouth Conor, IL 79584', 'Vanuatu', '1946-01-29 14:49:29', '2020-11-30 02:27:21');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (185, 'ea', 'M', '2012-06-13', 'North Jonathan', '85138 Ruecker Roads Suite 766\nJoeburgh, AK 22620-3926', 'Mauritius', '1995-03-25 08:36:55', '2020-12-06 01:55:18');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (186, 'corrupti', 'M', '1994-01-16', 'Katherineview', '127 Zakary Square\nMurphyport, OH 23175', 'Afghanistan', '1995-05-28 07:27:30', '2020-12-07 08:08:00');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (187, 'asperiores', 'M', '1987-01-05', 'Bruenbury', '053 Schumm Island\nNew Alverta, NJ 83823-2034', 'Montenegro', '1927-04-02 13:00:18', '2020-11-17 08:15:08');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (188, 'necessitatibus', 'M', '2004-03-13', 'East Chelseytown', '228 Marcella Radial Apt. 762\nSouth Yasmeenborough, MT 60086', 'Lebanon', '1924-01-23 18:17:46', '2020-11-25 23:58:34');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (189, 'est', 'M', '2019-08-12', 'Freddyberg', '23536 Jonathan Locks Suite 917\nCatalinahaven, NM 27802-9052', 'Italy', '1934-09-18 06:42:25', '2020-12-04 12:22:59');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (190, 'beatae', 'F', '1983-12-17', 'Lake Ubaldo', '40107 Powlowski Cliff Apt. 384\nAbernathyland, SC 51926', 'Slovenia', '1957-09-18 14:59:17', '2020-12-09 10:50:10');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (191, 'explicabo', 'M', '1999-03-04', 'Predovicfort', '3568 Lang Mall Suite 352\nConorton, ID 66031-9701', 'Morocco', '1968-08-19 07:17:30', '2020-11-26 00:52:00');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (192, 'numquam', 'F', '1997-05-26', 'North Myrl', '3898 Jones Trail Apt. 947\nHoweside, RI 05180', 'Timor-Leste', '1968-12-25 21:08:06', '2020-11-23 03:17:12');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (193, 'in', 'M', '1974-10-24', 'Karleymouth', '8945 Williamson Freeway\nPort Kaleborough, DE 90338', 'Ireland', '1984-12-21 10:18:54', '2020-11-14 18:58:41');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (194, 'repudiandae', 'F', '2006-12-22', 'Lake Dejuan', '0062 Rossie Meadows Apt. 829\nKovacekville, AL 89055', 'Cape Verde', '1971-10-09 18:35:04', '2020-11-20 00:47:19');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (195, 'quia', 'F', '2016-02-09', 'Port Mabel', '57715 Jacobson Harbor\nLake Maryseborough, AK 17966', 'Zimbabwe', '2002-02-24 13:33:10', '2020-12-09 14:51:57');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (196, 'necessitatibus', 'M', '1981-10-07', 'West Justine', '4937 Koelpin Cape Apt. 952\nLockmanfort, NC 71146-8983', 'Papua New Guinea', '1993-06-20 03:19:19', '2020-11-15 21:38:54');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (197, 'quo', 'M', '1985-02-16', 'Abbottburgh', '63619 Cameron Crossroad Suite 281\nEast Ernaville, ID 62305', 'Malaysia', '1985-07-13 11:05:27', '2020-11-27 19:56:22');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (198, 'eligendi', 'F', '1976-12-29', 'Beerborough', '16448 Schuster Manors Suite 342\nStrosinton, OR 57111', 'South Africa', '1930-01-09 12:49:32', '2020-12-11 12:50:11');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (199, 'ut', 'M', '1984-10-11', 'Lake Maxwellfort', '6233 Mya Flat Suite 288\nLarsonfort, PA 94947', 'Dominican Republic', '1945-03-05 19:03:34', '2020-11-18 11:06:47');
INSERT INTO `profiles` (`user_id`, `middle_name`, `gender`, `birthday`, `city`, `address`, `country`, `created_at`, `updated_at`) VALUES (200, 'fugiat', 'F', '1998-06-25', 'Monahanland', '117 Lenore Rest Suite 076\nAddiemouth, WA 11399', 'United Arab Emirates', '1937-04-06 21:06:14', '2020-11-16 23:31:21');


#
# TABLE STRUCTURE FOR: programs
#

DROP TABLE IF EXISTS `programs`;

CREATE TABLE `programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название программы',
  `age` enum('Adult','Children') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Возрастная категория',
  `discount_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на акции',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Клиники';

INSERT INTO `programs` (`id`, `name`, `age`, `discount_id`, `created_at`, `updated_at`) VALUES (1, 'earum', 'Children', 0, '1969-02-11 22:32:37', '2020-11-26 20:51:47');
INSERT INTO `programs` (`id`, `name`, `age`, `discount_id`, `created_at`, `updated_at`) VALUES (2, 'eius', 'Adult', 0, '1984-05-05 10:20:03', '2020-11-19 15:20:50');
INSERT INTO `programs` (`id`, `name`, `age`, `discount_id`, `created_at`, `updated_at`) VALUES (3, 'consequatur', 'Adult', 0, '1937-10-02 12:45:31', '2020-12-10 05:45:46');
INSERT INTO `programs` (`id`, `name`, `age`, `discount_id`, `created_at`, `updated_at`) VALUES (4, 'laboriosam', 'Adult', 0, '2015-05-27 12:02:36', '2020-12-10 22:29:58');
INSERT INTO `programs` (`id`, `name`, `age`, `discount_id`, `created_at`, `updated_at`) VALUES (5, 'est', 'Adult', 0, '1934-08-04 02:33:08', '2020-12-12 15:18:45');


#
# TABLE STRUCTURE FOR: referenc
#

DROP TABLE IF EXISTS `referenc`;

CREATE TABLE `referenc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название исследованного параметра',
  `unit_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на единицы измерения',
  `ref_from_optimal` decimal(11,3) DEFAULT NULL COMMENT 'Показатель начала оптимального референса',
  `ref_to_optimal` decimal(11,3) DEFAULT NULL COMMENT 'Показатель конца оптимального референса',
  `ref_from` decimal(11,3) DEFAULT NULL COMMENT 'Показатель начала референса',
  `ref_to` decimal(11,3) DEFAULT NULL COMMENT 'Показатель конца референса',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Референсы';

INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (1, 'dolor', 1, '749.990', '2110.024', '4089.975', '4.495', '1989-06-17 16:47:02', '2020-11-26 04:41:22');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (2, 'magni', 2, '99999999.999', '8084605.007', '280856.000', '47299909.634', '2014-08-15 04:22:23', '2020-12-11 01:59:23');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (3, 'eligendi', 3, '0.000', '3263.043', '155312.425', '1322.672', '1934-02-05 12:38:48', '2020-11-25 05:28:05');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (4, 'et', 4, '99999999.999', '22409.583', '2.828', '1549.600', '2009-05-10 09:42:56', '2020-11-26 23:42:14');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (5, 'laudantium', 5, '2909.900', '6.915', '29.654', '2758488.764', '2003-11-19 02:00:33', '2020-12-06 05:47:48');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (6, 'mollitia', 6, '2236.000', '99999999.999', '0.000', '0.000', '1998-05-28 07:16:07', '2020-12-05 20:57:36');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (7, 'doloremque', 7, '19559.148', '44.227', '10579.814', '99999999.999', '2011-06-15 04:58:02', '2020-12-01 02:29:40');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (8, 'impedit', 8, '0.000', '0.000', '159307.600', '99999999.999', '1931-02-17 14:31:24', '2020-11-25 22:49:47');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (9, 'iusto', 9, '6755.889', '33133.886', '0.000', '27.752', '1981-09-21 11:01:05', '2020-12-03 04:50:31');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (10, 'eveniet', 10, '3.500', '275138.882', '30126273.006', '1285760.371', '2008-08-06 05:12:32', '2020-12-10 15:36:30');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (11, 'aspernatur', 11, '99999999.999', '0.000', '2704.154', '8395.869', '1925-01-01 01:59:52', '2020-11-14 13:49:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (12, 'labore', 12, '0.000', '0.000', '289406.258', '0.626', '1978-02-24 19:07:17', '2020-12-10 11:12:36');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (13, 'magnam', 13, '17.384', '139138.300', '25285946.993', '0.642', '2016-02-12 03:10:44', '2020-12-01 20:26:30');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (14, 'adipisci', 14, '0.000', '361154.898', '13.126', '181991.105', '2019-01-26 16:23:18', '2020-11-29 21:01:11');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (15, 'sapiente', 15, '27271.855', '41459.800', '99999999.999', '35547.260', '2004-08-02 08:49:16', '2020-11-23 04:09:00');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (16, 'autem', 16, '343949.971', '520.047', '0.000', '27470.837', '1999-02-08 21:57:53', '2020-11-26 13:15:54');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (17, 'aut', 17, '99999999.999', '4.902', '21.000', '2489.626', '2002-11-26 04:03:32', '2020-11-16 16:45:10');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (18, 'eaque', 18, '1.789', '22.036', '0.100', '53659.900', '1948-11-19 03:42:06', '2020-12-08 20:12:46');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (19, 'maxime', 19, '0.000', '453628.558', '621.484', '7331.960', '2019-12-05 19:42:32', '2020-11-30 12:06:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (20, 'cupiditate', 20, '677.887', '0.000', '12814665.591', '10353.110', '1952-01-23 21:15:54', '2020-12-01 22:11:05');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (21, 'beatae', 21, '99999999.999', '12153.027', '72583597.879', '9509184.000', '1984-02-05 16:49:56', '2020-11-18 18:07:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (22, 'delectus', 22, '439434.292', '17009.245', '99999999.999', '745361.000', '1997-08-25 22:05:13', '2020-11-19 04:31:38');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (23, 'soluta', 23, '4111.711', '0.000', '99999999.999', '26888187.682', '1925-05-26 07:25:47', '2020-12-03 15:07:57');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (24, 'harum', 24, '71348678.512', '31.000', '543759.895', '53607.186', '1988-09-08 00:08:26', '2020-12-06 05:39:01');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (25, 'cum', 25, '2460593.500', '0.000', '4624.951', '0.000', '1948-11-09 07:59:15', '2020-11-27 21:24:50');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (26, 'optio', 26, '80598903.000', '99999999.999', '7405.717', '28108.446', '2010-03-06 06:15:14', '2020-11-18 06:31:53');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (27, 'rerum', 27, '1835.300', '7.524', '5133502.650', '0.000', '1942-04-18 03:01:10', '2020-11-24 05:44:37');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (28, 'repellat', 28, '396.920', '99999999.999', '23828.082', '35449.037', '1979-03-07 14:57:29', '2020-12-08 21:44:20');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (29, 'laborum', 29, '99999999.999', '655390.763', '28304.900', '17412.682', '1980-10-24 13:10:58', '2020-12-03 12:43:34');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (30, 'numquam', 30, '38221.000', '446.334', '88932869.000', '75798.328', '1988-08-13 10:51:39', '2020-11-28 18:03:00');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (31, 'sunt', 1, '0.000', '5129.000', '32134066.989', '2.800', '2008-11-09 04:25:09', '2020-11-26 22:16:46');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (32, 'dolores', 2, '21.426', '0.000', '1.907', '1782077.000', '2014-09-03 09:32:33', '2020-11-29 02:27:19');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (33, 'quia', 3, '85.000', '1.763', '5.900', '294.816', '1944-06-05 01:20:57', '2020-11-26 10:57:18');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (34, 'cumque', 4, '51.393', '16592509.300', '6.419', '29.366', '1960-07-03 05:07:53', '2020-11-21 17:36:40');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (35, 'laboriosam', 5, '2004314.508', '0.000', '944.800', '2331903.290', '1929-06-28 16:29:01', '2020-12-10 03:19:16');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (36, 'praesentium', 6, '226253.616', '0.234', '26847.224', '2200726.636', '1938-08-06 15:48:12', '2020-11-16 19:53:45');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (37, 'natus', 7, '368.052', '210.795', '0.000', '236856.320', '1962-04-01 19:35:45', '2020-12-11 07:28:42');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (38, 'quod', 8, '4415613.239', '4822583.667', '0.000', '89.870', '1922-06-28 05:41:26', '2020-11-21 06:31:32');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (39, 'dolorum', 9, '99999999.999', '21444895.840', '29277573.500', '1.400', '1953-09-17 23:58:17', '2020-11-15 10:34:00');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (40, 'voluptatibus', 10, '7922302.702', '47.600', '1.300', '768.000', '1973-10-10 18:13:12', '2020-11-29 12:17:24');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (41, 'nam', 11, '228488.000', '372.644', '0.000', '1181.772', '2004-04-06 16:25:33', '2020-11-20 15:04:55');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (42, 'veritatis', 12, '2.392', '2363105.986', '248329.806', '0.000', '1965-12-18 01:46:42', '2020-11-26 05:17:12');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (43, 'ut', 13, '1028079.246', '785723.662', '39.800', '497503.488', '1996-01-08 18:35:48', '2020-11-21 02:14:56');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (44, 'fugit', 14, '96350904.100', '99999999.999', '17.643', '39.600', '2012-02-27 16:17:34', '2020-11-18 19:09:26');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (45, 'suscipit', 15, '11.200', '7714.308', '20.444', '45416434.402', '1931-06-26 21:16:46', '2020-12-01 05:47:48');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (46, 'officia', 16, '563860.400', '99999999.999', '282529.600', '4.210', '1953-09-20 10:58:28', '2020-12-08 08:38:06');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (47, 'sit', 17, '53841399.327', '1850839.580', '0.000', '27273.141', '1966-07-24 10:17:57', '2020-12-07 20:28:57');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (48, 'dolorem', 18, '1.600', '54.265', '2346912.601', '417242.549', '2002-06-27 11:59:21', '2020-11-16 06:08:57');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (49, 'tempora', 19, '43576.717', '99999999.999', '28962996.420', '79.600', '1933-09-11 10:47:17', '2020-12-02 02:00:45');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (50, 'minima', 20, '740739.036', '0.000', '2074.827', '203964.550', '1952-09-29 00:16:47', '2020-11-21 02:53:14');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (51, 'deleniti', 21, '310.441', '6.400', '890860.813', '2.260', '1991-05-04 19:18:31', '2020-12-09 17:36:16');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (52, 'ex', 22, '43602.160', '543.223', '45032375.282', '173040.371', '1971-01-12 22:34:39', '2020-11-26 13:20:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (53, 'consequatur', 23, '440290.051', '38119780.383', '0.972', '0.000', '1953-01-10 20:49:05', '2020-11-20 03:28:58');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (54, 'excepturi', 24, '3122372.000', '264.482', '24321.061', '1936807.351', '1961-12-30 12:32:01', '2020-11-16 22:52:09');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (55, 'voluptatem', 25, '140057.130', '3399.571', '224.927', '21.950', '1954-02-15 00:10:42', '2020-11-15 18:14:20');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (56, 'dignissimos', 26, '26077712.371', '0.242', '0.000', '99999999.999', '1998-08-05 08:17:46', '2020-11-21 02:51:27');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (57, 'omnis', 27, '0.000', '2.180', '11863.450', '8.000', '1989-06-05 14:18:04', '2020-12-07 20:22:41');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (58, 'necessitatibus', 28, '0.550', '25968864.248', '0.000', '145.335', '2005-04-23 22:50:12', '2020-11-22 22:08:05');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (59, 'doloribus', 29, '14081758.000', '368139.875', '3599.916', '2690253.252', '1929-04-09 23:34:35', '2020-11-19 14:06:36');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (60, 'fuga', 30, '11.968', '243123.567', '0.000', '411.000', '1944-10-21 10:23:42', '2020-11-29 11:17:47');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (61, 'totam', 1, '1621014.210', '97.614', '430330.789', '25.318', '1936-02-26 19:37:12', '2020-11-17 00:09:04');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (62, 'pariatur', 2, '4117.900', '10598162.000', '7185.034', '290909.000', '1993-05-31 07:16:57', '2020-12-09 15:14:32');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (63, 'tenetur', 3, '32.236', '73853.585', '55.872', '3420.480', '1943-11-21 11:15:56', '2020-12-02 05:15:01');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (64, 'ducimus', 4, '4327039.467', '8.620', '14.040', '19.740', '1960-09-02 13:33:52', '2020-11-28 17:31:14');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (65, 'consectetur', 5, '516037.026', '5732.525', '0.000', '1124635.382', '2010-01-29 19:27:59', '2020-11-16 15:32:34');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (66, 'incidunt', 6, '1873208.709', '99999999.999', '4034090.026', '99999999.999', '1981-10-11 16:58:19', '2020-11-24 03:31:11');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (67, 'rem', 7, '92712840.161', '64046.702', '0.444', '591963.294', '1970-02-05 15:05:02', '2020-11-21 23:23:20');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (68, 'maiores', 8, '0.000', '31961026.717', '141935.117', '3348.050', '1995-12-23 21:40:27', '2020-11-26 07:07:16');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (69, 'placeat', 9, '285.332', '120715.318', '4787077.664', '574016.456', '1999-06-19 09:39:29', '2020-11-27 20:36:43');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (70, 'architecto', 10, '4485034.434', '2.396', '0.000', '22463.837', '1961-02-06 04:06:32', '2020-12-05 06:46:33');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (71, 'odit', 11, '0.000', '99999999.999', '1514172.000', '30968470.100', '1983-11-23 02:31:17', '2020-11-28 07:38:51');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (72, 'quidem', 12, '0.000', '92.338', '40.043', '37268880.000', '2000-01-01 17:27:02', '2020-12-02 11:30:32');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (73, 'non', 13, '26209678.851', '61778.372', '0.061', '0.000', '1962-08-28 08:57:11', '2020-12-12 14:49:35');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (74, 'velit', 14, '32508.332', '375817.867', '5532.765', '1.742', '1964-09-27 23:37:56', '2020-11-22 12:21:03');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (75, 'est', 15, '20959870.446', '13490.987', '36.800', '0.000', '1931-10-30 02:45:54', '2020-11-30 20:12:53');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (76, 'quisquam', 16, '0.000', '5492.772', '9807.728', '4279301.000', '1968-04-26 06:43:44', '2020-12-02 03:44:17');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (77, 'aliquid', 17, '43.939', '6790628.212', '10.843', '47455.549', '2011-04-04 09:03:06', '2020-11-22 05:28:38');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (78, 'esse', 18, '934.342', '40614.604', '26446.054', '43563.540', '1982-02-06 10:46:16', '2020-12-07 07:57:46');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (79, 'nisi', 19, '99029067.000', '30845.600', '99999999.999', '179.960', '1932-01-19 19:39:57', '2020-12-12 21:08:08');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (80, 'nulla', 20, '604325.654', '1378.000', '19455295.672', '1149279.917', '1964-05-01 13:57:50', '2020-11-14 12:13:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (81, 'minus', 21, '224.526', '0.910', '72.841', '66299.400', '2005-04-02 23:47:35', '2020-12-10 09:19:36');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (82, 'officiis', 22, '495.389', '367.053', '1.000', '3.700', '2008-12-15 02:54:14', '2020-12-07 13:08:51');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (83, 'recusandae', 23, '0.110', '5662895.160', '8.100', '1736344.270', '1933-05-08 19:56:38', '2020-11-21 04:37:08');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (84, 'aperiam', 24, '518708.663', '0.674', '52047.821', '5.699', '1924-03-20 13:57:57', '2020-12-05 23:10:57');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (85, 'quo', 25, '5566100.000', '266324.972', '31633.000', '2.376', '1977-12-21 02:32:30', '2020-12-10 18:28:26');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (86, 'quis', 26, '1076559.015', '5386.900', '11183.810', '1083853.660', '1998-09-30 09:32:13', '2020-11-20 23:21:55');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (87, 'unde', 27, '72536.000', '466.126', '4.870', '21988043.102', '1975-07-24 16:15:38', '2020-11-28 01:00:00');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (88, 'ipsam', 28, '12371820.000', '0.000', '1032.644', '61.680', '1933-07-20 10:19:24', '2020-11-24 18:47:09');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (89, 'sequi', 29, '8.000', '15641.000', '67929649.282', '786276.425', '2004-09-16 12:44:42', '2020-11-24 12:52:30');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (90, 'nobis', 30, '150.565', '5799387.310', '387858.700', '45128.425', '1990-10-29 20:15:44', '2020-12-01 05:53:04');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (91, 'quos', 1, '5.346', '364.434', '1333556.495', '99999999.999', '2005-05-10 17:41:22', '2020-11-22 05:30:35');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (92, 'neque', 2, '4408.657', '72773771.639', '1354.390', '56.114', '1971-09-16 02:19:46', '2020-11-27 08:29:20');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (93, 'debitis', 3, '38249998.569', '3194.000', '182.793', '0.000', '2019-08-09 11:22:07', '2020-11-28 20:08:04');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (94, 'in', 4, '2829471.005', '38.493', '0.000', '5.575', '2006-12-23 22:21:37', '2020-12-05 02:24:41');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (95, 'voluptates', 5, '61659.243', '16801.193', '294039.066', '99999999.999', '1935-03-10 18:41:50', '2020-11-18 19:11:18');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (96, 'explicabo', 6, '696.693', '266.897', '4369675.690', '321572.696', '2016-05-17 15:19:10', '2020-12-06 18:25:55');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (97, 'atque', 7, '1544063.788', '201.551', '7569.000', '0.976', '2005-09-28 21:11:23', '2020-11-15 23:16:58');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (98, 'veniam', 8, '184401.300', '8467.397', '536.535', '0.000', '2016-01-20 23:54:27', '2020-11-25 11:46:41');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (99, 'dicta', 9, '26.000', '443098.578', '26832.810', '2.620', '1937-08-10 17:13:59', '2020-11-19 08:26:38');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (100, 'vitae', 10, '34653.254', '1579849.523', '16.807', '13474.000', '1948-08-24 16:12:24', '2020-11-29 12:57:21');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (101, 'a', 11, '23032317.731', '3533.000', '7.242', '0.000', '2017-02-11 03:52:46', '2020-12-10 10:40:15');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (102, 'illo', 12, '10.963', '27.609', '0.000', '12072.000', '1973-03-26 18:10:39', '2020-11-27 21:34:36');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (103, 'voluptatum', 13, '10746973.799', '17438.769', '0.000', '0.000', '1982-11-25 18:09:19', '2020-11-19 09:37:12');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (104, 'voluptas', 14, '0.000', '13211.040', '0.000', '2395.906', '1992-03-16 08:40:40', '2020-11-24 21:39:43');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (105, 'dolore', 15, '451210.056', '490690.330', '32554.599', '10.000', '1933-09-25 06:11:28', '2020-11-25 00:06:14');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (106, 'eos', 16, '628.460', '28.330', '0.000', '4.521', '1972-03-07 18:34:04', '2020-12-04 11:52:51');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (107, 'eius', 17, '219256.062', '63.931', '11185031.937', '5125834.556', '1980-12-27 21:54:59', '2020-11-17 02:50:03');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (108, 'quibusdam', 18, '22.265', '12.996', '37.413', '432.222', '1995-02-15 22:45:54', '2020-11-18 05:37:21');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (109, 'sed', 19, '2.614', '298.391', '9033185.766', '20312.983', '1953-02-04 22:06:30', '2020-11-20 12:10:26');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (110, 'hic', 20, '5790484.018', '6200225.994', '0.000', '531181.399', '1982-06-03 16:53:11', '2020-12-09 09:34:27');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (111, 'quasi', 21, '132.060', '1066025.877', '12064763.420', '99999999.999', '2015-04-07 09:11:25', '2020-12-05 06:23:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (112, 'exercitationem', 22, '60614.404', '359032.154', '99999999.999', '2.964', '1997-05-10 09:19:13', '2020-11-23 23:24:22');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (113, 'voluptate', 23, '14.087', '3408309.845', '585486.829', '31625.249', '1993-08-25 04:46:44', '2020-12-10 03:46:54');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (114, 'alias', 24, '1765.670', '63055.701', '99999999.999', '38696.000', '1921-06-19 19:43:44', '2020-11-27 02:58:55');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (115, 'molestiae', 25, '0.000', '0.017', '15.159', '145.705', '1967-04-07 05:58:41', '2020-11-17 23:10:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (116, 'enim', 26, '1480704.145', '8046013.000', '27604.900', '17657043.852', '1949-04-08 18:15:47', '2020-11-23 17:33:27');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (117, 'nostrum', 27, '10102199.599', '28552.000', '146351.200', '0.000', '1982-07-05 12:15:59', '2020-12-09 23:00:48');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (118, 'ad', 28, '2538.996', '4551.144', '652262.451', '45929.986', '2007-02-10 21:04:36', '2020-11-27 05:18:29');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (119, 'nihil', 29, '200.000', '4200.000', '1385125.729', '58104.210', '1925-10-22 10:09:21', '2020-12-10 13:22:06');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (120, 'at', 30, '4.207', '4824.803', '1514238.297', '129.735', '2004-08-18 14:20:09', '2020-11-15 07:48:54');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (121, 'culpa', 1, '0.000', '7.707', '2.000', '7232.000', '2010-05-06 15:45:02', '2020-11-28 04:00:11');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (122, 'deserunt', 2, '271345.209', '1.414', '232.200', '5548520.430', '1928-07-18 19:43:50', '2020-11-29 14:05:54');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (123, 'temporibus', 3, '1219.886', '24305.697', '1.189', '234.538', '2000-03-19 10:50:26', '2020-12-04 05:15:20');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (124, 'similique', 4, '77.620', '36.127', '0.000', '0.378', '2003-09-29 12:40:25', '2020-11-18 13:46:22');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (125, 'ea', 5, '8099.348', '110299.542', '0.000', '35.683', '1934-01-01 17:55:56', '2020-11-20 16:32:05');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (126, 'quas', 6, '18.839', '749348.230', '842.885', '33406158.000', '1967-08-06 21:58:21', '2020-11-24 00:32:44');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (127, 'earum', 7, '150238.341', '4.770', '3228761.797', '31342672.657', '1924-03-19 11:46:46', '2020-12-04 22:39:29');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (128, 'ab', 8, '322899.428', '2.701', '33.674', '1617031.833', '1972-08-18 11:40:20', '2020-11-15 13:53:38');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (129, 'facilis', 9, '8.273', '0.402', '0.809', '31.000', '1984-01-27 08:24:34', '2020-11-25 19:50:31');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (130, 'quam', 10, '15916.775', '41853554.251', '6076121.000', '67375704.000', '1975-07-07 19:08:33', '2020-11-23 06:41:11');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (131, 'provident', 11, '319.000', '475.581', '2520077.000', '39276.300', '1979-12-04 17:43:04', '2020-11-28 18:42:24');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (132, 'iure', 12, '0.000', '4594.300', '326265.100', '56438527.787', '1937-03-26 05:23:58', '2020-11-25 01:48:34');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (133, 'error', 13, '0.000', '288780.670', '3699313.700', '2919867.913', '1987-09-13 20:44:34', '2020-12-09 03:13:58');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (134, 'sint', 14, '52.170', '0.000', '0.000', '36484852.536', '1977-02-26 07:36:47', '2020-11-25 18:19:01');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (135, 'reiciendis', 15, '775794.477', '2810.278', '32121.000', '769.851', '1951-06-06 07:30:09', '2020-11-24 22:15:21');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (136, 'quaerat', 16, '4310993.000', '33.800', '0.510', '42.196', '1962-09-14 23:31:03', '2020-11-18 17:09:17');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (137, 'nemo', 17, '90763250.200', '25519.099', '10278146.070', '43253.819', '1931-07-30 22:20:45', '2020-11-24 02:03:46');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (138, 'ratione', 18, '0.000', '3371371.000', '1824036.730', '206.112', '1944-12-12 17:25:26', '2020-12-13 01:18:43');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (139, 'itaque', 19, '2429513.990', '16.865', '4761801.891', '426796.822', '1931-12-20 20:31:20', '2020-12-09 07:02:54');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (140, 'facere', 20, '0.000', '3.734', '13687570.696', '99999999.999', '1975-07-08 03:28:00', '2020-11-22 03:40:59');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (141, 'qui', 21, '16574626.041', '0.000', '0.000', '99999999.999', '1962-08-10 08:08:34', '2020-11-26 00:40:01');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (142, 'occaecati', 22, '136374.877', '5028814.010', '13702.647', '82047.490', '1990-07-11 15:22:36', '2020-11-19 10:02:53');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (143, 'perspiciatis', 23, '0.000', '99999999.999', '3165.020', '1997.923', '1942-02-18 05:44:36', '2020-12-09 01:40:28');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (144, 'distinctio', 24, '10.055', '22256958.406', '32523771.394', '14020361.534', '1995-01-06 16:24:48', '2020-11-27 10:46:16');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (145, 'assumenda', 25, '4.639', '5344370.800', '6.304', '380505.162', '1976-07-02 09:41:15', '2020-12-10 18:17:00');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (146, 'eum', 26, '621.790', '0.000', '4.591', '46583401.507', '1951-04-22 03:30:20', '2020-11-18 20:59:11');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (147, 'ullam', 27, '16417.094', '4.852', '2430.000', '0.000', '1968-06-10 18:59:54', '2020-11-24 15:26:39');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (148, 'nesciunt', 28, '0.000', '701081.590', '99999999.999', '0.000', '1958-11-15 15:36:02', '2020-11-16 21:20:53');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (149, 'corrupti', 29, '2045.905', '99999999.999', '5968126.000', '0.000', '1962-02-28 02:19:34', '2020-11-28 13:43:24');
INSERT INTO `referenc` (`id`, `name`, `unit_id`, `ref_from_optimal`, `ref_to_optimal`, `ref_from`, `ref_to`, `created_at`, `updated_at`) VALUES (150, 'repudiandae', 30, '0.628', '1602.977', '910.400', '372840.155', '1937-09-03 15:32:05', '2020-12-02 17:44:22');


#
# TABLE STRUCTURE FOR: research_users
#

DROP TABLE IF EXISTS `research_users`;

CREATE TABLE `research_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `clinic_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на клинику',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `service_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на услугу',
  `referenc_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на исследованный параметр',
  `unit_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на единицы измерения',
  `indicat` decimal(11,3) DEFAULT NULL COMMENT 'Показатель измерения',
  `research_at` datetime DEFAULT NULL COMMENT 'Дата забора биоматериала (проведения исследования)',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Результаты анализов';

INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (1, 1, 1, 201, 1, 1, '0.000', '1930-10-26 18:58:01', '2015-10-31 15:24:44', '2020-11-30 01:04:17');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (2, 2, 2, 202, 2, 2, '486.300', '1992-08-08 21:36:30', '1952-07-01 21:03:51', '2020-12-05 14:52:25');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (3, 3, 3, 203, 3, 3, '5.000', '2007-03-30 18:34:21', '1924-04-20 05:29:42', '2020-11-25 04:39:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (4, 4, 4, 204, 4, 4, '86.000', '1992-04-30 21:22:10', '1962-09-06 12:45:02', '2020-11-26 11:10:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (5, 5, 5, 205, 5, 5, '5177.870', '1995-07-12 22:47:05', '1983-11-25 02:04:29', '2020-11-17 04:31:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (6, 6, 6, 206, 6, 6, '33346.035', '2008-07-30 22:18:40', '2007-12-03 23:46:58', '2020-11-16 21:08:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (7, 7, 7, 207, 7, 7, '0.000', '1966-01-12 19:01:46', '1987-02-12 01:38:07', '2020-12-08 09:41:08');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (8, 8, 8, 208, 8, 8, '57855.570', '1953-05-07 12:06:41', '2007-07-15 13:21:53', '2020-12-13 07:26:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (9, 9, 9, 209, 9, 9, '1245.850', '1960-11-08 01:32:37', '1968-08-28 15:44:35', '2020-11-24 03:05:54');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (10, 10, 10, 210, 10, 10, '6294165.000', '1978-08-19 16:33:54', '1989-01-26 13:16:25', '2020-11-16 06:16:16');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (11, 11, 11, 211, 11, 11, '0.000', '1963-09-18 15:19:12', '1996-02-27 20:40:49', '2020-11-18 14:25:51');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (12, 12, 12, 212, 12, 12, '1537662.563', '1934-06-01 05:06:54', '1952-08-31 09:18:25', '2020-11-14 06:25:30');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (13, 13, 13, 213, 13, 13, '2381.014', '1968-12-25 08:38:39', '1964-07-29 02:32:35', '2020-12-08 20:59:46');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (14, 14, 14, 216, 14, 14, '62454145.207', '1949-12-18 21:39:05', '1986-06-26 20:45:41', '2020-12-06 21:05:01');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (15, 15, 15, 217, 15, 15, '2628.800', '1960-12-21 12:08:54', '1934-11-22 22:43:48', '2020-12-04 18:31:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (16, 16, 16, 218, 16, 16, '528.837', '2003-02-28 07:42:28', '1948-01-08 01:31:59', '2020-12-02 21:14:20');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (17, 17, 17, 219, 17, 17, '28256.225', '1979-10-31 03:14:20', '1927-08-24 05:40:03', '2020-11-23 04:20:09');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (18, 18, 18, 220, 18, 18, '389189.319', '1963-10-22 06:39:34', '1951-02-25 10:15:59', '2020-11-30 16:56:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (19, 19, 19, 221, 19, 19, '2561050.159', '1985-08-23 05:52:12', '1940-07-17 11:55:35', '2020-12-04 03:00:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (20, 20, 20, 222, 20, 20, '2785.623', '1949-06-24 13:24:53', '1991-06-27 17:43:12', '2020-11-15 04:31:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (21, 1, 21, 223, 21, 21, '13275.645', '1971-04-01 00:29:30', '1934-02-05 13:08:19', '2020-12-02 07:21:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (22, 2, 22, 224, 22, 22, '0.000', '1993-10-06 22:39:08', '1990-01-15 22:25:22', '2020-12-06 19:43:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (23, 3, 23, 225, 23, 23, '3584.855', '1932-10-10 09:17:40', '1997-04-30 13:13:48', '2020-12-01 14:38:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (24, 4, 24, 226, 24, 24, '23650159.163', '2011-10-18 00:06:53', '1959-01-25 11:00:31', '2020-12-02 04:39:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (25, 5, 25, 227, 25, 25, '62645996.387', '1977-07-31 04:07:40', '1969-12-08 04:37:34', '2020-11-20 13:26:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (26, 6, 26, 228, 26, 26, '0.000', '1959-08-10 07:28:25', '1947-09-29 02:44:40', '2020-12-02 09:05:04');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (27, 7, 27, 230, 27, 27, '183156.082', '1921-07-13 18:47:45', '1977-08-04 22:44:59', '2020-11-22 01:31:13');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (28, 8, 28, 231, 28, 28, '204202.977', '1963-08-02 21:36:23', '1981-08-20 16:52:17', '2020-11-26 21:24:53');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (29, 9, 29, 232, 29, 29, '378125.700', '1965-08-16 18:32:33', '1970-06-12 11:27:36', '2020-11-30 07:57:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (30, 10, 30, 233, 30, 30, '8.422', '1929-11-10 22:01:32', '1948-09-13 16:26:03', '2020-12-10 06:38:25');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (31, 11, 31, 234, 31, 1, '34253.020', '1924-06-30 05:34:40', '2008-12-26 16:47:01', '2020-11-23 08:35:53');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (32, 12, 32, 235, 32, 2, '361690.218', '1971-11-30 21:47:03', '1937-11-02 04:33:57', '2020-12-02 22:11:19');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (33, 13, 33, 237, 33, 3, '99999999.999', '1976-10-27 11:11:16', '1999-04-18 14:49:41', '2020-11-28 05:03:20');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (34, 14, 34, 238, 34, 4, '5075369.938', '1976-05-26 11:32:20', '2005-06-10 13:19:56', '2020-12-06 18:38:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (35, 15, 35, 239, 35, 5, '15486541.623', '1955-03-17 11:45:17', '1959-10-20 08:24:16', '2020-11-14 12:35:45');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (36, 16, 36, 240, 36, 6, '763287.000', '1939-06-04 10:31:03', '1979-03-13 20:54:27', '2020-11-25 21:55:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (37, 17, 37, 241, 37, 7, '4879.010', '2007-08-12 17:42:21', '1964-03-02 18:16:08', '2020-11-27 04:45:55');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (38, 18, 38, 242, 38, 8, '5.000', '1953-06-14 00:08:16', '1958-10-16 08:19:46', '2020-11-26 10:36:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (39, 19, 39, 244, 39, 9, '0.000', '1926-12-10 01:01:07', '2002-08-08 01:41:57', '2020-11-23 10:01:14');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (40, 20, 40, 245, 40, 10, '0.000', '2010-01-21 05:33:30', '1965-12-27 03:28:38', '2020-12-03 08:49:45');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (41, 1, 41, 247, 41, 11, '4.822', '1922-11-27 10:35:13', '1999-12-15 14:02:44', '2020-11-20 12:51:20');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (42, 2, 42, 249, 42, 12, '18361004.577', '1963-12-07 13:23:56', '2005-07-24 01:48:44', '2020-11-22 22:04:02');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (43, 3, 43, 250, 43, 13, '0.340', '2007-11-19 02:17:53', '2020-11-16 21:44:26', '2020-12-09 00:27:42');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (44, 4, 44, 251, 44, 14, '0.000', '1989-04-26 08:17:23', '1964-01-24 21:24:24', '2020-12-04 16:36:23');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (45, 5, 45, 252, 45, 15, '99999999.999', '1953-06-05 07:52:47', '1955-09-16 15:26:22', '2020-11-21 22:45:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (46, 6, 46, 254, 46, 16, '18538182.388', '2020-07-25 04:08:49', '1932-05-18 19:33:24', '2020-12-03 19:29:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (47, 7, 47, 255, 47, 17, '16.712', '1946-04-18 00:48:16', '1956-05-07 23:19:14', '2020-12-02 08:32:02');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (48, 8, 48, 256, 48, 18, '117.034', '1931-02-02 11:31:37', '1984-04-21 06:27:15', '2020-12-05 13:39:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (49, 9, 49, 258, 49, 19, '652.168', '1977-06-30 01:37:49', '1937-09-16 19:20:46', '2020-11-28 03:31:30');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (50, 10, 50, 259, 50, 20, '462.887', '1925-10-27 05:40:33', '1943-03-15 14:01:49', '2020-12-12 18:33:38');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (51, 11, 51, 260, 51, 21, '262.054', '1947-10-12 20:50:03', '1930-11-18 13:41:32', '2020-11-25 16:35:25');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (52, 12, 52, 261, 52, 22, '99999999.999', '1935-06-09 00:08:03', '2006-06-04 07:08:07', '2020-11-30 08:30:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (53, 13, 53, 262, 53, 23, '0.000', '1990-05-06 22:28:49', '1961-11-02 22:54:35', '2020-11-17 21:05:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (54, 14, 54, 264, 54, 24, '8186135.173', '1962-04-13 05:03:46', '1922-03-22 07:24:25', '2020-11-19 02:27:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (55, 15, 55, 265, 55, 25, '63903.474', '1959-02-01 16:51:32', '1933-04-01 23:15:25', '2020-11-24 22:09:49');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (56, 16, 56, 266, 56, 26, '13.900', '1985-09-28 23:28:01', '1969-10-26 09:33:57', '2020-12-12 05:49:00');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (57, 17, 57, 267, 57, 27, '201463.498', '1999-11-21 02:36:41', '1981-10-25 11:05:12', '2020-12-04 08:04:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (58, 18, 58, 269, 58, 28, '0.900', '1999-11-19 16:28:28', '1997-08-14 17:48:23', '2020-12-05 22:43:22');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (59, 19, 59, 270, 59, 29, '271627.050', '1929-10-27 15:29:41', '1983-05-04 11:30:57', '2020-12-13 05:53:36');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (60, 20, 60, 273, 60, 30, '0.984', '2001-11-13 14:30:58', '1951-06-14 12:54:32', '2020-11-26 06:23:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (61, 1, 61, 276, 61, 1, '23.900', '1946-11-16 05:27:29', '1967-02-10 08:40:22', '2020-12-03 00:42:38');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (62, 2, 62, 278, 62, 2, '7.889', '1960-12-08 23:36:24', '1997-12-18 16:12:49', '2020-11-20 16:31:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (63, 3, 63, 279, 63, 3, '355083.064', '1952-09-20 19:53:55', '1993-11-03 15:29:46', '2020-11-24 06:09:55');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (64, 4, 64, 280, 64, 4, '8824746.200', '1961-12-18 21:34:28', '1943-11-12 11:04:21', '2020-12-04 19:24:33');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (65, 5, 65, 282, 65, 5, '420928.000', '2007-06-23 21:29:10', '1998-03-23 16:21:15', '2020-11-23 11:47:41');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (66, 6, 66, 283, 66, 6, '56479328.552', '1922-03-03 01:29:40', '1937-09-14 14:02:32', '2020-12-03 20:34:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (67, 7, 67, 284, 67, 7, '3806.300', '1978-07-31 09:36:13', '1933-11-16 04:00:01', '2020-11-22 20:01:12');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (68, 8, 68, 285, 68, 8, '42300818.257', '1924-05-07 15:56:17', '1941-05-17 20:27:05', '2020-11-13 19:03:35');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (69, 9, 69, 286, 69, 9, '13.200', '1972-06-12 20:33:49', '1950-03-23 20:30:52', '2020-11-13 22:28:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (70, 10, 70, 287, 70, 10, '318.550', '1994-08-08 01:59:57', '1959-12-26 11:15:47', '2020-11-18 21:31:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (71, 11, 71, 289, 71, 11, '99999999.999', '1985-02-26 09:49:54', '1963-03-21 17:16:26', '2020-11-20 03:43:53');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (72, 12, 72, 292, 72, 12, '0.000', '2014-03-30 03:08:40', '1961-06-01 15:57:11', '2020-12-04 18:45:07');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (73, 13, 73, 293, 73, 13, '98.000', '1957-02-07 22:01:15', '1976-06-18 23:59:30', '2020-11-14 06:08:16');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (74, 14, 74, 294, 74, 14, '99999999.999', '1953-05-26 17:36:39', '2017-12-04 10:55:17', '2020-11-27 03:45:00');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (75, 15, 75, 298, 75, 15, '14.951', '1931-12-08 19:14:08', '1934-02-20 10:23:15', '2020-11-26 19:17:15');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (76, 16, 76, 299, 76, 16, '832.226', '1929-02-02 08:35:40', '1982-03-09 09:11:36', '2020-11-22 11:59:08');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (77, 17, 77, 300, 77, 17, '0.000', '1995-08-12 14:04:45', '2014-10-23 19:29:48', '2020-12-13 12:55:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (78, 18, 78, 303, 78, 18, '0.000', '1949-01-25 00:10:28', '1925-07-16 09:43:08', '2020-11-28 08:21:37');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (79, 19, 79, 304, 79, 19, '20560298.815', '1975-01-03 06:01:30', '1935-11-05 07:06:45', '2020-11-14 23:32:45');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (80, 20, 80, 308, 80, 20, '26353382.729', '2007-04-01 17:28:35', '1979-01-09 08:55:25', '2020-12-10 03:38:09');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (81, 1, 81, 311, 81, 21, '38.887', '1964-10-06 10:44:22', '1995-02-08 22:03:33', '2020-11-21 07:57:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (82, 2, 82, 316, 82, 22, '6190013.970', '1994-09-27 03:47:59', '1985-04-27 17:21:10', '2020-11-18 20:34:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (83, 3, 83, 321, 83, 23, '135.943', '1927-05-25 08:45:32', '1943-07-14 12:48:12', '2020-12-02 06:50:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (84, 4, 84, 324, 84, 24, '35506643.603', '1952-07-29 16:10:29', '1921-12-18 01:04:55', '2020-11-29 22:21:15');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (85, 5, 85, 325, 85, 25, '8.950', '2006-02-07 18:11:10', '1940-11-08 05:03:12', '2020-11-18 17:42:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (86, 6, 86, 327, 86, 26, '1.737', '1981-05-07 15:28:09', '1930-04-09 14:00:58', '2020-12-02 09:14:05');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (87, 7, 87, 330, 87, 27, '99999999.999', '1995-12-01 22:31:45', '1992-08-13 11:21:40', '2020-12-02 07:21:30');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (88, 8, 88, 332, 88, 28, '0.042', '1999-09-20 06:45:53', '2019-07-03 17:16:40', '2020-12-04 00:39:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (89, 9, 89, 337, 89, 29, '0.000', '1984-06-01 04:55:56', '1940-03-07 16:09:57', '2020-11-26 17:34:13');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (90, 10, 90, 341, 90, 30, '4794.636', '1945-08-19 08:53:44', '2004-12-04 22:39:02', '2020-12-07 19:34:16');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (91, 11, 91, 342, 91, 1, '48228502.777', '1952-06-04 04:29:20', '1971-12-26 09:03:35', '2020-11-16 06:49:59');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (92, 12, 92, 346, 92, 2, '0.000', '1925-04-06 08:40:34', '1970-10-25 03:17:27', '2020-11-28 18:55:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (93, 13, 93, 351, 93, 3, '1107.350', '1980-11-28 22:38:28', '2004-09-05 10:46:48', '2020-12-05 12:16:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (94, 14, 94, 352, 94, 4, '59648.000', '1994-01-04 14:22:51', '1957-12-31 08:41:39', '2020-11-20 06:00:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (95, 15, 95, 353, 95, 5, '4.333', '2011-01-24 00:18:18', '1945-11-10 14:56:07', '2020-12-11 02:44:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (96, 16, 96, 360, 96, 6, '9740289.310', '2007-03-03 08:27:13', '1988-04-14 01:15:13', '2020-11-15 23:19:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (97, 17, 97, 363, 97, 7, '39.109', '2013-07-17 00:49:03', '2018-02-26 15:04:55', '2020-11-18 11:46:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (98, 18, 98, 364, 98, 8, '0.375', '2018-11-08 12:37:46', '2011-07-13 00:36:40', '2020-12-01 06:44:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (99, 19, 99, 366, 99, 9, '221884.160', '2010-03-29 21:42:32', '1980-06-18 03:29:04', '2020-12-10 22:17:07');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (100, 20, 100, 368, 100, 10, '12.000', '1924-02-18 23:13:07', '1938-04-30 23:11:46', '2020-12-12 09:32:05');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (101, 1, 101, 369, 101, 11, '3752202.878', '1953-04-27 10:08:09', '2011-10-14 06:43:20', '2020-12-07 12:47:11');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (102, 2, 102, 370, 102, 12, '0.000', '2009-12-20 12:57:43', '2004-03-03 07:29:04', '2020-12-07 10:57:45');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (103, 3, 103, 373, 103, 13, '2885332.764', '1971-08-06 07:38:55', '1977-04-21 10:09:03', '2020-11-14 07:07:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (104, 4, 104, 375, 104, 14, '231.560', '1969-12-26 09:31:12', '1963-08-22 06:31:50', '2020-12-12 09:42:28');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (105, 5, 105, 377, 105, 15, '3753.000', '1971-12-27 10:45:22', '1937-12-22 03:08:15', '2020-12-09 02:40:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (106, 6, 106, 378, 106, 16, '2577.000', '2000-11-28 13:32:58', '1948-09-08 19:44:37', '2020-12-04 03:36:48');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (107, 7, 107, 382, 107, 17, '99999999.999', '2002-11-23 22:29:18', '1935-06-08 11:59:15', '2020-11-18 05:52:07');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (108, 8, 108, 384, 108, 18, '33011.380', '2017-01-12 13:35:31', '1960-10-02 02:38:07', '2020-12-05 04:48:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (109, 9, 109, 390, 109, 19, '163.096', '2013-12-01 19:52:12', '1981-12-21 20:11:14', '2020-12-08 06:30:23');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (110, 10, 110, 391, 110, 20, '24.700', '1995-09-05 09:19:07', '1922-09-06 08:48:08', '2020-12-07 18:18:04');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (111, 11, 111, 393, 111, 21, '6186.576', '1964-02-12 07:18:58', '1934-03-02 02:12:10', '2020-11-14 22:16:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (112, 12, 112, 394, 112, 22, '19.065', '2011-06-01 21:21:13', '1929-10-20 15:27:02', '2020-11-25 05:07:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (113, 13, 113, 398, 113, 23, '3.161', '1931-04-02 10:17:45', '1939-12-16 18:28:25', '2020-11-28 00:39:05');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (114, 14, 114, 201, 114, 24, '99999999.999', '2000-05-01 13:18:14', '2011-04-12 08:16:27', '2020-11-24 23:38:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (115, 15, 115, 202, 115, 25, '9574896.156', '1967-03-02 08:07:20', '1985-09-18 01:17:03', '2020-12-03 11:07:42');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (116, 16, 116, 203, 116, 26, '161.880', '1973-05-28 01:19:51', '1962-09-28 00:33:15', '2020-11-23 18:21:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (117, 17, 117, 204, 117, 27, '99999999.999', '2020-07-01 04:20:13', '1932-05-02 02:53:10', '2020-11-19 13:37:14');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (118, 18, 118, 205, 118, 28, '5783.274', '1949-08-25 19:04:18', '1979-01-30 18:58:55', '2020-12-09 10:05:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (119, 19, 119, 206, 119, 29, '4.077', '1984-04-13 07:21:38', '2017-12-12 05:28:52', '2020-11-25 19:30:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (120, 20, 120, 207, 120, 30, '399530.670', '1947-10-26 12:54:43', '1998-01-22 15:27:49', '2020-11-23 19:17:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (121, 1, 121, 208, 121, 1, '3.824', '1968-07-12 23:12:24', '1926-09-30 10:16:10', '2020-11-13 19:10:30');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (122, 2, 122, 209, 122, 2, '1958948.502', '2003-10-05 19:41:29', '1989-04-26 03:56:36', '2020-11-29 22:31:59');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (123, 3, 123, 210, 123, 3, '14303.340', '1938-02-22 18:27:18', '2020-05-01 08:38:05', '2020-11-23 23:12:45');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (124, 4, 124, 211, 124, 4, '2327632.321', '1997-04-09 16:57:09', '1978-04-02 02:26:58', '2020-11-27 16:55:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (125, 5, 125, 212, 125, 5, '869619.712', '1991-06-15 04:19:49', '1987-12-20 23:21:35', '2020-11-27 07:31:35');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (126, 6, 126, 213, 126, 6, '171.000', '1932-08-15 22:57:12', '1998-10-22 11:57:12', '2020-11-15 08:36:39');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (127, 7, 127, 216, 127, 7, '0.000', '1961-04-06 01:39:01', '1959-06-16 02:28:09', '2020-11-23 23:01:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (128, 8, 128, 217, 128, 8, '0.000', '1922-09-11 00:10:51', '1967-08-15 03:23:28', '2020-11-19 01:33:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (129, 9, 129, 218, 129, 9, '43192.700', '2004-10-23 10:29:34', '2019-03-24 18:12:08', '2020-12-12 06:08:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (130, 10, 130, 219, 130, 10, '14.403', '1957-04-02 18:45:43', '1987-11-16 18:02:16', '2020-12-07 04:48:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (131, 11, 131, 220, 131, 11, '149.818', '1933-07-03 06:06:43', '1949-12-20 02:07:25', '2020-12-05 10:46:36');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (132, 12, 132, 221, 132, 12, '70.000', '1940-11-06 08:55:00', '2001-10-06 08:03:38', '2020-12-11 13:39:38');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (133, 13, 133, 222, 133, 13, '30914991.000', '2013-12-27 17:24:53', '1951-04-05 15:35:34', '2020-11-27 07:54:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (134, 14, 134, 223, 134, 14, '750501.440', '1941-09-14 10:58:15', '1994-12-29 15:55:49', '2020-11-16 03:36:48');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (135, 15, 135, 224, 135, 15, '230.763', '1948-02-18 10:48:05', '1996-10-20 15:16:36', '2020-11-24 02:10:45');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (136, 16, 136, 225, 136, 16, '294.330', '1951-11-25 07:35:47', '1964-08-02 21:24:03', '2020-12-01 18:41:22');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (137, 17, 137, 226, 137, 17, '0.000', '1967-07-29 09:41:14', '2020-06-05 17:28:11', '2020-11-21 05:22:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (138, 18, 138, 227, 138, 18, '60221.982', '2020-07-27 09:25:42', '1951-10-22 07:50:57', '2020-11-30 14:56:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (139, 19, 139, 228, 139, 19, '62.002', '1962-05-07 05:20:42', '1922-09-29 08:05:52', '2020-11-21 19:22:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (140, 20, 140, 230, 140, 20, '737.911', '1941-12-18 00:24:28', '1930-09-18 23:06:33', '2020-11-18 16:46:20');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (141, 1, 141, 231, 141, 21, '10.347', '1975-09-19 00:03:06', '1993-01-26 02:05:42', '2020-12-11 03:00:15');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (142, 2, 142, 232, 142, 22, '0.000', '1963-10-22 01:16:49', '1937-11-19 02:23:33', '2020-12-03 07:39:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (143, 3, 143, 233, 143, 23, '2.350', '1960-06-01 18:34:07', '1971-08-05 18:06:58', '2020-11-14 05:45:09');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (144, 4, 144, 234, 144, 24, '99999999.999', '1988-09-11 02:43:15', '1956-11-16 14:40:20', '2020-11-26 17:48:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (145, 5, 145, 235, 145, 25, '0.000', '1926-12-20 04:47:24', '1959-07-28 10:44:19', '2020-12-12 16:24:34');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (146, 6, 146, 237, 146, 26, '1289.646', '1968-02-02 17:29:24', '1971-09-25 13:36:30', '2020-11-23 14:53:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (147, 7, 147, 238, 147, 27, '8706363.263', '1954-06-09 18:58:50', '1965-04-24 18:08:00', '2020-11-29 07:11:52');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (148, 8, 148, 239, 148, 28, '1798696.090', '1953-06-30 02:05:30', '2014-01-22 07:52:49', '2020-11-16 06:15:23');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (149, 9, 149, 240, 149, 29, '99999999.999', '1966-04-10 14:57:59', '2017-05-15 04:59:06', '2020-11-20 09:56:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (150, 10, 150, 241, 150, 30, '0.000', '1954-03-23 13:46:42', '1954-08-07 01:41:42', '2020-12-05 15:42:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (151, 11, 151, 242, 1, 1, '29134.008', '2002-01-27 10:34:29', '1971-09-24 14:46:05', '2020-11-18 00:18:19');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (152, 12, 152, 244, 2, 2, '0.000', '1976-09-11 09:24:35', '1957-05-11 00:55:45', '2020-12-09 15:05:11');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (153, 13, 153, 245, 3, 3, '48.196', '2019-09-17 15:04:09', '1926-10-22 03:20:33', '2020-11-13 18:40:48');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (154, 14, 154, 247, 4, 4, '2967.100', '1995-01-08 11:17:52', '2014-12-28 07:23:28', '2020-11-19 00:11:11');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (155, 15, 155, 249, 5, 5, '0.000', '1945-09-11 09:16:29', '1974-05-01 05:27:56', '2020-12-04 23:39:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (156, 16, 156, 250, 6, 6, '1174.180', '1981-06-01 09:09:36', '1922-01-10 07:08:51', '2020-12-03 21:43:42');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (157, 17, 157, 251, 7, 7, '420.416', '1926-08-04 15:20:36', '1921-02-18 11:21:16', '2020-11-29 21:31:34');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (158, 18, 158, 252, 8, 8, '39.252', '1942-08-30 01:52:49', '1994-07-10 19:05:40', '2020-12-08 23:59:35');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (159, 19, 159, 254, 9, 9, '99999999.999', '1939-08-08 08:44:18', '1998-09-26 12:37:21', '2020-12-01 13:05:13');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (160, 20, 160, 255, 10, 10, '0.000', '1929-01-29 23:20:08', '1963-11-21 07:00:40', '2020-12-12 02:56:13');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (161, 1, 161, 256, 11, 11, '10.359', '2007-07-20 17:44:52', '1955-01-22 14:35:00', '2020-12-05 13:57:00');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (162, 2, 162, 258, 12, 12, '22.000', '2016-05-20 07:23:35', '1928-01-21 18:39:47', '2020-11-14 09:04:34');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (163, 3, 163, 259, 13, 13, '76900.618', '1994-05-04 04:34:19', '2008-06-05 03:12:39', '2020-12-02 18:57:11');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (164, 4, 164, 260, 14, 14, '349601.000', '1934-12-22 23:31:41', '2005-01-13 00:03:09', '2020-11-15 18:41:08');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (165, 5, 165, 261, 15, 15, '90491.960', '2016-06-04 02:44:33', '1940-12-26 01:11:06', '2020-12-12 16:57:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (166, 6, 166, 262, 16, 16, '1062.545', '2007-01-20 07:20:01', '2015-11-01 09:00:17', '2020-12-02 14:15:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (167, 7, 167, 264, 17, 17, '23.713', '2011-12-15 06:04:58', '1923-06-22 09:20:52', '2020-12-13 13:55:09');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (168, 8, 168, 265, 18, 18, '4.300', '1992-11-22 03:28:28', '1991-10-16 22:25:07', '2020-12-09 16:04:59');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (169, 9, 169, 266, 19, 19, '544260.808', '1972-05-26 08:00:14', '1986-06-23 19:49:57', '2020-11-25 22:52:12');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (170, 10, 170, 267, 20, 20, '4303.380', '1997-07-11 23:05:44', '1931-01-16 01:40:18', '2020-12-06 19:48:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (171, 11, 171, 269, 21, 21, '99999999.999', '1990-07-15 17:12:05', '1943-02-06 06:13:15', '2020-11-20 07:55:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (172, 12, 172, 270, 22, 22, '99999999.999', '2011-09-02 14:10:52', '1962-02-24 01:40:42', '2020-12-06 19:35:09');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (173, 13, 173, 273, 23, 23, '325.664', '1955-02-11 23:43:27', '1987-01-30 13:16:23', '2020-11-23 01:43:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (174, 14, 174, 276, 24, 24, '678259.570', '2000-03-25 21:19:17', '1978-11-08 09:43:54', '2020-11-19 05:05:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (175, 15, 175, 278, 25, 25, '17961301.080', '1958-08-19 22:36:20', '1948-12-28 03:59:01', '2020-11-14 09:24:14');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (176, 16, 176, 279, 26, 26, '15914484.650', '2016-12-15 00:57:52', '2012-04-28 18:56:00', '2020-11-19 11:00:35');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (177, 17, 177, 280, 27, 27, '43.250', '2008-10-14 15:13:27', '2016-03-14 19:58:58', '2020-11-27 02:13:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (178, 18, 178, 282, 28, 28, '26908711.880', '1928-05-27 03:42:15', '1921-04-13 16:20:27', '2020-12-07 00:53:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (179, 19, 179, 283, 29, 29, '0.777', '1957-01-02 09:11:11', '1985-07-02 15:16:49', '2020-11-25 12:05:01');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (180, 20, 180, 284, 30, 30, '99999999.999', '2002-12-18 22:17:23', '1944-04-17 21:19:57', '2020-12-06 07:16:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (181, 1, 181, 285, 31, 1, '88703.777', '1955-02-05 02:03:29', '1967-07-22 01:21:13', '2020-11-26 12:57:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (182, 2, 182, 286, 32, 2, '19599022.273', '1930-12-11 18:33:16', '1938-02-21 22:29:39', '2020-11-22 01:02:16');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (183, 3, 183, 287, 33, 3, '74.820', '1981-02-20 20:00:09', '2005-10-14 15:06:46', '2020-11-14 00:06:07');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (184, 4, 184, 289, 34, 4, '1096182.000', '1961-02-24 11:59:36', '1924-02-22 17:20:41', '2020-11-26 13:32:12');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (185, 5, 185, 292, 35, 5, '10658380.766', '2012-11-10 13:16:51', '1984-10-16 06:11:14', '2020-11-15 10:53:54');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (186, 6, 186, 293, 36, 6, '15.540', '1962-01-17 10:43:41', '1950-07-04 02:38:49', '2020-12-01 03:44:22');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (187, 7, 187, 294, 37, 7, '2.900', '2004-05-31 12:40:36', '1954-11-18 23:35:10', '2020-12-02 09:34:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (188, 8, 188, 298, 38, 8, '642.700', '1957-05-07 15:47:17', '1983-02-25 21:18:22', '2020-11-23 04:58:20');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (189, 9, 189, 299, 39, 9, '44100.000', '1980-07-09 20:41:45', '1951-04-23 23:41:09', '2020-11-16 21:19:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (190, 10, 190, 300, 40, 10, '3.602', '1950-07-20 00:34:03', '1931-05-20 07:15:58', '2020-12-05 19:44:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (191, 11, 191, 303, 41, 11, '18692.234', '1925-01-08 06:00:54', '1979-10-21 19:59:14', '2020-12-12 19:28:19');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (192, 12, 192, 304, 42, 12, '93614.554', '1962-05-18 19:10:13', '1963-06-15 18:13:18', '2020-11-30 07:14:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (193, 13, 193, 308, 43, 13, '0.000', '2016-11-29 06:15:54', '2005-05-27 19:39:36', '2020-12-03 11:06:54');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (194, 14, 194, 311, 44, 14, '746.193', '1972-06-05 13:05:14', '2020-11-01 01:45:21', '2020-11-22 10:19:06');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (195, 15, 195, 316, 45, 15, '4.000', '1967-12-13 15:35:16', '1961-12-25 07:04:27', '2020-12-11 05:21:25');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (196, 16, 196, 321, 46, 16, '0.000', '1987-07-16 02:35:59', '1987-05-11 08:54:52', '2020-11-20 21:11:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (197, 17, 197, 324, 47, 17, '921.132', '2011-01-05 04:57:30', '1991-05-16 13:40:14', '2020-12-12 21:12:01');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (198, 18, 198, 325, 48, 18, '67989.804', '1972-12-03 19:07:51', '2006-01-28 16:23:06', '2020-12-09 19:41:51');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (199, 19, 199, 327, 49, 19, '0.000', '1942-09-18 06:18:55', '1999-01-21 14:39:40', '2020-11-23 09:25:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (200, 20, 200, 330, 50, 20, '0.000', '1973-04-13 17:38:16', '1938-04-07 14:50:19', '2020-11-23 15:29:04');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (201, 1, 1, 332, 51, 21, '4566806.132', '2000-07-28 22:45:28', '2001-12-02 21:22:33', '2020-12-03 01:52:49');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (202, 2, 2, 337, 52, 22, '23.000', '1924-05-08 11:26:01', '1976-01-27 19:20:44', '2020-11-24 08:33:36');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (203, 3, 3, 341, 53, 23, '89.818', '1970-10-02 11:03:28', '1924-03-12 04:08:06', '2020-12-12 02:23:51');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (204, 4, 4, 342, 54, 24, '1600271.561', '2004-01-12 02:42:20', '2017-05-22 06:53:00', '2020-11-15 13:26:49');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (205, 5, 5, 346, 55, 25, '10.855', '1998-10-04 02:50:15', '1939-01-11 07:08:02', '2020-12-12 05:56:02');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (206, 6, 6, 351, 56, 26, '20776.000', '2006-10-02 19:36:37', '1964-11-03 19:24:09', '2020-11-18 22:07:02');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (207, 7, 7, 352, 57, 27, '73.000', '2004-08-16 02:41:33', '1987-02-19 19:44:05', '2020-11-17 13:48:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (208, 8, 8, 353, 58, 28, '99999999.999', '2020-05-25 01:34:09', '1951-09-09 01:17:10', '2020-11-17 06:44:15');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (209, 9, 9, 360, 59, 29, '1422.300', '2020-10-20 20:07:05', '1991-04-15 10:58:52', '2020-11-21 07:14:55');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (210, 10, 10, 363, 60, 30, '659.166', '1945-07-30 20:34:35', '1926-10-18 05:19:07', '2020-11-16 21:53:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (211, 11, 11, 364, 61, 1, '2829690.624', '1992-11-18 05:17:35', '2005-04-02 01:27:14', '2020-12-01 01:46:35');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (212, 12, 12, 366, 62, 2, '486017.859', '1925-03-01 03:31:54', '1924-03-09 00:30:20', '2020-11-23 07:42:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (213, 13, 13, 368, 63, 3, '1.884', '1990-03-31 01:02:49', '2011-08-28 10:46:00', '2020-11-28 20:50:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (214, 14, 14, 369, 64, 4, '8501103.777', '2006-07-17 16:42:27', '1990-05-20 18:36:35', '2020-11-22 09:16:29');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (215, 15, 15, 370, 65, 5, '3537.000', '2008-03-27 10:51:35', '2009-05-14 08:35:35', '2020-12-10 09:01:12');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (216, 16, 16, 373, 66, 6, '2.180', '1995-08-15 19:17:15', '1931-03-20 10:07:37', '2020-11-21 19:04:15');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (217, 17, 17, 375, 67, 7, '22183.456', '1921-12-30 13:37:52', '1933-04-17 02:53:47', '2020-12-04 13:16:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (218, 18, 18, 377, 68, 8, '13688.691', '1960-09-11 10:43:14', '2009-01-07 21:14:59', '2020-11-23 14:10:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (219, 19, 19, 378, 69, 9, '149909.784', '1993-08-13 06:10:53', '1936-06-22 12:45:40', '2020-12-07 17:11:38');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (220, 20, 20, 382, 70, 10, '338.458', '1939-08-23 06:48:28', '1971-07-16 12:13:41', '2020-11-20 05:45:59');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (221, 1, 21, 384, 71, 11, '5296.116', '1972-09-21 02:55:09', '2013-08-13 16:03:36', '2020-12-11 21:26:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (222, 2, 22, 390, 72, 12, '2706.164', '1951-09-14 10:55:15', '1972-03-14 08:53:20', '2020-11-17 09:50:37');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (223, 3, 23, 391, 73, 13, '2768659.000', '1928-12-02 02:33:10', '1981-11-12 17:30:48', '2020-11-28 05:50:05');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (224, 4, 24, 393, 74, 14, '8168.900', '1958-11-20 10:30:35', '1982-06-24 23:58:50', '2020-12-10 16:50:14');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (225, 5, 25, 394, 75, 15, '2077392.590', '2006-03-24 12:19:34', '1976-05-25 19:02:53', '2020-11-24 19:22:28');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (226, 6, 26, 398, 76, 16, '11.800', '1961-04-23 11:51:38', '2003-08-07 16:22:52', '2020-12-07 23:19:56');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (227, 7, 27, 201, 77, 17, '5.140', '1935-09-22 22:06:22', '1967-04-26 06:11:52', '2020-11-20 15:16:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (228, 8, 28, 202, 78, 18, '99999999.999', '1974-04-15 08:08:32', '1943-04-15 15:43:48', '2020-11-17 01:55:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (229, 9, 29, 203, 79, 19, '639.470', '1979-11-24 14:28:48', '1974-06-20 20:32:25', '2020-12-12 20:58:11');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (230, 10, 30, 204, 80, 20, '5157.180', '1953-03-01 14:42:40', '1957-01-26 11:50:29', '2020-11-21 05:51:33');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (231, 11, 31, 205, 81, 21, '3617.385', '1988-03-29 19:57:38', '2020-02-13 19:49:20', '2020-11-16 00:27:21');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (232, 12, 32, 206, 82, 22, '60678198.302', '2019-01-11 04:50:34', '2003-09-09 17:22:09', '2020-11-22 03:43:36');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (233, 13, 33, 207, 83, 23, '6.717', '1938-09-22 00:09:36', '1962-11-05 10:54:04', '2020-12-03 06:06:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (234, 14, 34, 208, 84, 24, '17541.000', '2019-01-09 19:00:11', '2016-10-22 05:57:24', '2020-11-16 02:53:10');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (235, 15, 35, 209, 85, 25, '45948023.204', '1940-06-28 03:31:01', '1973-08-16 06:43:39', '2020-11-26 23:09:16');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (236, 16, 36, 210, 86, 26, '24440.054', '1992-11-28 02:58:44', '1929-10-20 04:09:45', '2020-12-05 09:15:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (237, 17, 37, 211, 87, 27, '0.000', '2010-05-12 00:45:44', '2003-04-05 12:24:27', '2020-11-23 06:58:13');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (238, 18, 38, 212, 88, 28, '3459.591', '1997-06-10 14:24:20', '1977-02-22 03:30:54', '2020-12-01 02:50:48');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (239, 19, 39, 213, 89, 29, '99207.836', '1998-12-01 21:36:42', '2011-01-21 22:36:55', '2020-11-22 02:57:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (240, 20, 40, 216, 90, 30, '0.000', '2000-07-17 04:56:44', '1982-05-18 06:15:09', '2020-12-10 08:02:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (241, 1, 41, 217, 91, 1, '4855242.896', '1997-06-13 12:08:09', '1945-06-08 06:45:21', '2020-12-12 14:19:20');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (242, 2, 42, 218, 92, 2, '1127275.990', '2000-05-24 00:41:46', '1936-07-20 21:31:29', '2020-11-17 21:30:04');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (243, 3, 43, 219, 93, 3, '66.634', '2004-04-11 07:26:48', '1994-11-08 21:35:57', '2020-11-15 12:42:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (244, 4, 44, 220, 94, 4, '184304.803', '1974-06-28 00:25:26', '1930-03-08 20:03:36', '2020-12-13 09:41:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (245, 5, 45, 221, 95, 5, '99999999.999', '1923-05-17 04:49:57', '1976-12-09 17:05:10', '2020-11-21 01:35:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (246, 6, 46, 222, 96, 6, '1054560.801', '1997-03-10 08:33:25', '1922-08-12 15:04:49', '2020-11-25 02:43:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (247, 7, 47, 223, 97, 7, '55.438', '2006-07-23 03:16:07', '1967-11-30 14:55:39', '2020-12-05 12:57:07');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (248, 8, 48, 224, 98, 8, '501.194', '1948-12-10 12:25:11', '2019-06-09 15:04:57', '2020-11-20 10:20:55');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (249, 9, 49, 225, 99, 9, '1.965', '1992-12-21 00:58:30', '1934-09-07 16:40:36', '2020-11-25 05:13:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (250, 10, 50, 226, 100, 10, '48062242.712', '1928-11-08 05:08:30', '1931-08-26 14:52:43', '2020-12-03 08:30:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (251, 11, 51, 227, 101, 11, '39193.636', '1968-02-16 08:09:24', '1999-12-03 20:43:40', '2020-12-05 15:34:27');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (252, 12, 52, 228, 102, 12, '417660.023', '2007-01-15 05:23:23', '2013-02-02 06:03:32', '2020-11-23 17:48:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (253, 13, 53, 230, 103, 13, '56182.226', '1932-03-23 00:50:09', '1947-10-27 01:31:47', '2020-11-21 03:38:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (254, 14, 54, 231, 104, 14, '24343.400', '1961-05-22 11:29:58', '1936-04-02 18:42:35', '2020-11-16 21:17:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (255, 15, 55, 232, 105, 15, '3.974', '1932-12-21 15:12:07', '1956-02-19 10:06:27', '2020-12-11 09:14:04');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (256, 16, 56, 233, 106, 16, '936.332', '1939-07-15 09:52:12', '1984-11-24 02:55:43', '2020-11-30 04:22:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (257, 17, 57, 234, 107, 17, '57.000', '1936-09-03 22:05:02', '1975-05-17 21:30:07', '2020-12-05 04:14:12');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (258, 18, 58, 235, 108, 18, '99999999.999', '1992-11-12 07:06:45', '1981-04-24 00:43:43', '2020-12-03 17:15:48');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (259, 19, 59, 237, 109, 19, '99999999.999', '1990-08-15 12:31:23', '1963-02-21 05:18:27', '2020-12-11 04:07:19');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (260, 20, 60, 238, 110, 20, '45186844.062', '1987-09-26 13:22:02', '1924-04-15 09:48:32', '2020-12-12 07:25:15');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (261, 1, 61, 239, 111, 21, '395.459', '1935-09-20 02:35:09', '1941-02-13 01:21:09', '2020-12-09 10:16:46');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (262, 2, 62, 240, 112, 22, '2356.202', '1943-08-21 19:16:26', '1991-12-09 00:45:27', '2020-11-20 21:02:26');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (263, 3, 63, 241, 113, 23, '221250.459', '1961-11-20 19:25:50', '1970-05-07 09:22:43', '2020-12-02 20:41:01');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (264, 4, 64, 242, 114, 24, '2764941.490', '1934-09-13 20:44:00', '1963-12-07 03:28:49', '2020-11-25 08:03:13');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (265, 5, 65, 244, 115, 25, '2532.820', '1987-06-19 16:16:13', '1964-11-23 18:46:55', '2020-11-27 06:29:50');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (266, 6, 66, 245, 116, 26, '2286469.596', '2002-02-11 18:06:12', '2004-07-04 02:31:10', '2020-11-20 07:42:02');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (267, 7, 67, 247, 117, 27, '0.000', '1996-03-24 02:57:50', '1961-10-21 04:47:17', '2020-11-24 11:47:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (268, 8, 68, 249, 118, 28, '10.271', '2005-03-28 18:15:22', '1927-01-08 04:43:18', '2020-11-17 20:37:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (269, 9, 69, 250, 119, 29, '52.000', '1963-03-24 17:33:08', '1921-06-28 23:46:42', '2020-11-27 20:21:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (270, 10, 70, 251, 120, 30, '1262.000', '1935-06-10 10:35:50', '1941-12-01 15:06:14', '2020-12-05 15:19:02');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (271, 11, 71, 252, 121, 1, '0.600', '1961-05-14 07:04:36', '2007-03-31 05:30:08', '2020-11-29 11:53:53');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (272, 12, 72, 254, 122, 2, '2412494.813', '1948-07-18 02:01:17', '1938-04-11 05:16:18', '2020-12-07 18:12:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (273, 13, 73, 255, 123, 3, '866135.492', '1941-03-23 06:57:25', '1937-09-12 08:03:41', '2020-11-26 20:45:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (274, 14, 74, 256, 124, 4, '43.657', '1950-12-05 06:45:37', '1965-10-17 17:27:04', '2020-11-25 15:48:36');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (275, 15, 75, 258, 125, 5, '0.681', '1944-05-22 16:00:02', '1961-03-12 15:06:03', '2020-12-01 17:31:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (276, 16, 76, 259, 126, 6, '1.000', '1976-12-16 05:59:27', '2002-11-27 02:18:19', '2020-12-10 21:52:04');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (277, 17, 77, 260, 127, 7, '2774.000', '1940-02-06 08:19:39', '1956-02-27 13:43:13', '2020-11-14 17:48:40');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (278, 18, 78, 261, 128, 8, '99999999.999', '1933-11-11 20:51:34', '1964-07-27 00:34:06', '2020-12-08 20:45:11');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (279, 19, 79, 262, 129, 9, '2927.459', '1997-10-03 20:49:30', '2001-06-03 23:24:56', '2020-12-07 08:23:16');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (280, 20, 80, 264, 130, 10, '103.172', '1922-11-13 01:31:07', '1924-09-03 16:22:54', '2020-11-25 22:11:25');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (281, 1, 81, 265, 131, 11, '176182.779', '1987-07-06 06:46:19', '1956-09-29 09:30:35', '2020-12-07 01:58:14');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (282, 2, 82, 266, 132, 12, '60632514.000', '1949-03-29 22:12:06', '1960-04-07 01:53:58', '2020-12-08 02:13:44');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (283, 3, 83, 267, 133, 13, '4819932.580', '1972-02-25 15:05:28', '2008-02-14 19:47:19', '2020-11-17 16:30:59');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (284, 4, 84, 269, 134, 14, '0.000', '1990-12-15 07:58:43', '1937-10-07 23:17:41', '2020-11-25 09:47:32');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (285, 5, 85, 270, 135, 15, '0.000', '1963-08-10 11:11:01', '1989-05-31 16:28:01', '2020-11-28 03:02:31');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (286, 6, 86, 273, 136, 16, '127.200', '1924-03-07 00:04:00', '2007-01-22 20:18:39', '2020-11-16 15:57:23');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (287, 7, 87, 276, 137, 17, '72.669', '1923-02-14 20:51:14', '2008-03-21 14:54:28', '2020-11-30 02:50:22');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (288, 8, 88, 278, 138, 18, '645.197', '1986-09-27 00:04:24', '1933-01-15 21:36:48', '2020-12-09 18:34:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (289, 9, 89, 279, 139, 19, '0.000', '1941-09-04 12:17:38', '1945-05-02 08:19:18', '2020-11-18 07:24:43');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (290, 10, 90, 280, 140, 20, '163012.000', '1924-04-17 07:22:42', '1978-04-27 00:45:17', '2020-12-04 17:22:56');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (291, 11, 91, 282, 141, 21, '8286140.500', '1936-10-26 23:33:36', '1950-12-31 06:47:26', '2020-11-29 15:50:03');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (292, 12, 92, 283, 142, 22, '503827.246', '1960-01-03 16:37:47', '1975-01-19 09:46:34', '2020-12-05 13:05:41');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (293, 13, 93, 284, 143, 23, '0.000', '1942-12-04 01:32:45', '1975-04-22 16:26:51', '2020-11-30 21:52:53');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (294, 14, 94, 285, 144, 24, '0.000', '1927-06-25 01:33:06', '1954-03-09 11:34:49', '2020-12-07 00:09:18');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (295, 15, 95, 286, 145, 25, '36.090', '1992-07-25 19:39:44', '1957-10-09 18:57:25', '2020-12-09 20:03:14');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (296, 16, 96, 287, 146, 26, '16.100', '1970-10-20 07:27:31', '1970-02-06 09:35:58', '2020-12-02 03:02:58');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (297, 17, 97, 289, 147, 27, '37215779.000', '2002-03-27 15:11:38', '2006-05-21 17:00:42', '2020-12-03 03:37:33');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (298, 18, 98, 292, 148, 28, '36.572', '1980-12-16 05:41:48', '1985-02-24 14:25:35', '2020-11-26 06:20:57');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (299, 19, 99, 293, 149, 29, '0.000', '1956-12-14 04:44:28', '1960-06-04 01:28:15', '2020-11-25 13:05:24');
INSERT INTO `research_users` (`id`, `clinic_id`, `user_id`, `service_id`, `referenc_id`, `unit_id`, `indicat`, `research_at`, `created_at`, `updated_at`) VALUES (300, 20, 100, 294, 150, 30, '112.000', '1982-01-16 23:25:54', '1920-12-25 17:26:04', '2020-12-13 04:47:03');


#
# TABLE STRUCTURE FOR: services
#

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `program_id` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на программу',
  `serv_category` enum('Allergology-immunology vaccination','Assisted reproductive technologies issuing certificates','Calling a doctor at home','Gastroenterology','Hematology','Genetics','Hepatology','Gynecology','Hospitalization','Dermatovenerology','Dermatology','Diagnostics','Dietology medical','Examination','Cardiology','Cosmetology physical','Therapy speech','Therapy','Mammology','Urology','Manual therapy','Massage','Medical rehabilitation','Neurology','Neurophysiology','Neurosurgery','Nephrology','Oncology','Osteopathy','Otoneurology','Phoniatry','Otorhinolaryngology (throat)','Ophthalmology','Pediatrics','Thoracic surgery','Plastic surgery proctology psychotherapy','Pulmonology work in the Chi system','Dentistry','Rheumatology x-ray','Surgery','Spa treatment','Somnology','Traumatology and orthopedics','Physiotherapy','Phlebology','Functional diagnostics','Extracorporeal methods of treatment','Endoscopic research') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Категория услуги',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название услуги',
  `preparation` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Описание услуги',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `preparation` (`preparation`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Услуги';

INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (201, 1, 'Phlebology', 'earum', 'Placeat rerum culpa perspiciatis dolore. Consequuntur et repudiandae dolore est. Et fugiat aspernatur debitis earum ut. Est ullam sunt quis est.', '375.52', '1980-06-02 17:03:55', '2020-02-04 22:19:50');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (202, 2, 'Manual therapy', 'molestiae', 'Magni reiciendis minus quia illo voluptatem cumque. Omnis quasi autem harum voluptates vel aut facilis. Aut qui amet accusantium.', '639454.46', '1981-05-17 03:25:49', '2020-09-01 10:10:56');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (203, 3, 'Mammology', 'nobis', 'Beatae voluptatem et facere omnis ipsum. Minima doloribus non accusantium odio et dolores exercitationem. Aut quia possimus sapiente reprehenderit qui', '52.90', '1972-01-29 13:14:42', '2020-02-10 21:26:40');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (204, 4, 'Genetics', 'iure', 'Minus sit aut harum nemo numquam eveniet repudiandae. Perspiciatis dignissimos quia nisi eum.', '30326.28', '1938-11-26 09:53:06', '2020-09-07 08:32:06');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (205, 5, 'Calling a doctor at home', 'possimus', 'Mollitia nulla qui aut voluptas doloribus molestiae quasi. Ea enim nulla laudantium vero voluptas. Sit mollitia ad et porro ut mollitia ipsam. Similiq', '525.36', '1990-03-23 10:46:19', '2020-03-13 22:57:00');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (206, 1, 'Osteopathy', 'non', 'Rerum minus dignissimos fugiat iste. Tenetur est quia omnis sapiente non.\nSimilique sit et vero optio repudiandae. Tenetur laborum sapiente in saepe q', '29.24', '2000-01-17 00:33:19', '2020-06-07 10:04:53');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (207, 2, 'Spa treatment', 'quia', 'Eos qui ut saepe omnis odio non. Et ut vero cupiditate error facilis aut. Autem officia omnis ea esse iure excepturi. Quas numquam voluptas alias porr', '0.00', '2001-06-18 19:54:31', '2020-12-11 05:30:17');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (208, 3, 'Surgery', 'eos', 'Sequi vel iure ducimus. Non est odio modi quia eum consequatur illum ut. Veritatis nihil quis voluptatum voluptate nihil sed.', '1002.88', '1993-12-22 21:50:53', '2020-06-09 16:48:57');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (209, 4, 'Neurology', 'quibusdam', 'Perspiciatis maiores nostrum quia et dolor. Labore maxime at delectus at. Aut ex velit amet unde dolorem id.', '3109.30', '1924-12-23 09:55:44', '2020-03-17 06:18:16');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (210, 5, 'Nephrology', 'beatae', 'Nesciunt quia veniam sunt. Nulla ipsam similique sequi accusamus rem. In dolores omnis architecto voluptatem aut. Quod ut repellat et rem libero ducim', '95830.25', '1962-10-21 11:41:59', '2020-06-11 00:58:38');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (211, 1, 'Ophthalmology', 'officia', 'Accusantium nesciunt porro similique laboriosam quibusdam. Et labore ut quia aliquam. Dolor molestias omnis cumque qui ut.', '372.70', '1932-05-09 19:42:43', '2019-12-23 18:34:33');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (212, 2, 'Dietology medical', 'nisi', 'Labore inventore velit earum consequatur maxime magni ex. Ut praesentium expedita maxime magni consectetur inventore sint.', '6.04', '1939-01-25 01:32:39', '2020-10-06 12:37:59');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (213, 3, 'Hospitalization', 'omnis', 'Repellat vel impedit maxime eum. Quam officia illo ipsum porro consequatur. Voluptate ut in et animi. Quia soluta iste cupiditate aliquid voluptas exp', '408325.50', '1949-04-18 00:39:13', '2020-09-29 21:10:49');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (216, 1, 'Otorhinolaryngology (throat)', 'dignissimos', 'Nemo ipsa suscipit sunt ut minus minus. Libero quibusdam possimus alias aliquid unde laborum et. Autem officiis cumque vel perferendis similique velit', '0.00', '1924-07-07 23:01:55', '2020-09-03 05:32:13');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (217, 2, 'Cosmetology physical', 'atque', 'Rerum aut quasi quae sed atque ipsa numquam. Tempora cupiditate molestiae dolores necessitatibus repellat cumque adipisci. Accusantium optio enim cons', '4920.44', '1946-03-12 18:28:55', '2020-09-10 18:08:27');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (218, 3, 'Surgery', 'blanditiis', 'Vitae quis aut dicta impedit. Dolor aut perferendis modi provident commodi. Et non in adipisci quo. Qui inventore qui velit incidunt dolorem ut harum ', '0.21', '1927-06-17 04:08:13', '2020-03-28 11:33:09');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (219, 4, 'Pulmonology work in the Chi system', 'iusto', 'Et rem assumenda voluptatem est. Porro enim unde veniam repudiandae atque explicabo corrupti rem. Sint distinctio asperiores nam aspernatur.', '7486900.27', '2020-05-20 08:17:31', '2020-01-17 19:15:56');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (220, 5, 'Extracorporeal methods of treatment', 'qui', 'Voluptas pariatur velit architecto. Quas in sed similique voluptas quis omnis pariatur eius. Ducimus sed quia temporibus nemo unde doloremque. Quia do', '27202491.71', '1926-05-14 18:35:20', '2020-07-23 21:39:33');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (221, 1, 'Phoniatry', 'et', 'Nemo sequi qui et ut autem. Tenetur sint amet vitae consequuntur ex quo. Nesciunt sit commodi non possimus repellat maxime.', '6449.20', '1960-04-14 12:22:20', '2020-04-12 19:24:20');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (222, 2, 'Calling a doctor at home', 'libero', 'Velit veniam dolor dolor quasi voluptatem vel. Nemo dolor velit molestiae qui voluptatibus. Perspiciatis aliquam voluptate rerum amet.', '0.00', '1933-10-12 04:31:50', '2020-01-15 11:50:50');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (223, 3, 'Functional diagnostics', 'soluta', 'Harum ut eos incidunt in quae. Perferendis possimus dolores omnis vero. Est qui nulla omnis odio.', '26.87', '1943-03-15 19:55:16', '2020-06-03 19:51:33');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (224, 4, 'Assisted reproductive technologies issuing certificates', 'id', 'Consequatur omnis officia consequatur sit. Ut id ut consectetur esse. Provident temporibus dolor aut itaque natus.', '0.41', '1980-11-30 21:35:05', '2020-05-11 19:17:37');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (225, 5, 'Osteopathy', 'laborum', 'Minima odio consequatur et harum nihil aspernatur excepturi facere. Vel officiis ea ipsam rerum harum. Fugit dicta odit dignissimos voluptate aut repe', '0.00', '1935-11-10 02:27:18', '2020-05-21 14:19:30');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (226, 1, 'Neurosurgery', 'tempore', 'Aliquid consequatur et aut saepe sapiente dolor dolores. Voluptas fuga sed maiores sapiente dolorum. Odio alias ipsam soluta.', '49834.22', '2019-06-20 14:07:34', '2019-12-21 01:09:49');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (227, 2, 'Urology', 'voluptas', 'Quis ratione molestiae in. Et est nihil provident voluptatem explicabo adipisci. Aperiam placeat non aut nemo eos qui.', '44275.39', '1937-01-20 13:39:46', '2020-03-07 17:32:57');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (228, 3, 'Hepatology', 'dolorum', 'Quis eum ut quidem rerum ut neque. Ut velit rem qui exercitationem esse minus officia inventore. Nobis laborum at minima ab tenetur enim natus.', '14495.15', '1942-03-25 06:28:56', '2020-09-30 17:23:09');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (230, 5, 'Surgery', 'necessitatibus', 'In praesentium mollitia dolores et aspernatur ipsam qui rerum. Vel magnam qui amet ea veniam. Voluptatem ex voluptatem laboriosam voluptatem.', '0.12', '1978-09-17 22:11:55', '2020-04-10 13:38:30');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (231, 1, 'Dentistry', 'eius', 'Velit consequuntur natus labore sed. Laborum culpa est laboriosam ab qui aut qui.', '75.64', '1990-01-16 21:33:49', '2020-08-10 14:25:19');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (232, 2, 'Ophthalmology', 'eveniet', 'Blanditiis velit qui magnam aut explicabo. Laboriosam et et molestias.\nLaboriosam id sed ea quis autem quia. Accusantium ea at fugit blanditiis enim e', '1541339.74', '1931-07-31 03:36:32', '2020-09-11 04:15:54');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (233, 3, 'Hematology', 'perferendis', 'Voluptate culpa non iure ut. Placeat voluptatum quidem autem sunt minima. Qui non voluptatem hic non et sit. Quibusdam dignissimos iusto odit voluptas', '0.00', '1930-03-15 13:42:48', '2020-05-27 00:56:28');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (234, 4, 'Assisted reproductive technologies issuing certificates', 'eligendi', 'Labore pariatur accusantium inventore. Nulla atque amet itaque nostrum at in natus. Ut impedit facilis natus eos in voluptas nihil. Laborum et nesciun', '0.55', '1926-06-10 05:17:30', '2020-10-10 08:01:52');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (235, 5, 'Manual therapy', 'aperiam', 'Maxime beatae facilis dolor nemo. Eaque asperiores culpa quia minima sunt ut sunt. Praesentium vel corporis iste dolor fuga nihil voluptatibus.', '0.22', '1953-04-23 14:41:53', '2020-06-19 02:29:16');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (237, 2, 'Calling a doctor at home', 'nulla', 'Qui ratione explicabo tenetur quas debitis. Ad impedit mollitia qui consequatur quasi. Et assumenda accusantium provident voluptas dolores velit labor', '124329153.00', '1995-06-27 20:37:44', '2020-03-06 09:36:34');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (238, 3, 'Somnology', 'voluptatem', 'Ea itaque ipsa qui architecto cupiditate saepe dolorem. Est rerum et molestiae qui sunt possimus. Pariatur enim reprehenderit ut blanditiis.', '7348497.39', '1956-12-21 03:38:29', '2020-07-09 00:56:38');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (239, 4, 'Neurosurgery', 'dolorem', 'Alias quo vitae consequatur vero. Corrupti tempore non autem molestias. Ea quia quas et optio dicta reiciendis provident.', '199951891.00', '2004-01-01 04:20:31', '2020-11-21 05:06:13');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (240, 5, 'Hospitalization', 'ut', 'Facilis laborum non omnis atque qui repudiandae recusandae. Aspernatur ipsa veritatis in a enim qui. Adipisci possimus vero sint accusamus et.', '287613.97', '1961-06-11 08:50:18', '2020-01-12 15:19:00');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (241, 1, 'Dermatology', 'inventore', 'Voluptatem sed omnis eligendi sit veritatis et. Eum minima neque veniam sed. Laudantium et aut porro eaque aut ab. Error voluptatem quia modi.', '280.00', '1930-05-17 09:38:30', '2020-12-10 12:06:41');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (242, 2, 'Spa treatment', 'voluptate', 'Ab praesentium vitae molestiae. Provident et odio aliquam. Aut et voluptate tenetur doloremque commodi non et. Id explicabo vel nostrum voluptatem eve', '0.00', '1922-02-15 17:29:12', '2020-08-10 03:16:10');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (244, 4, 'Assisted reproductive technologies issuing certificates', 'reprehenderit', 'Et voluptas sit est quidem non. Dolor voluptatem itaque debitis quo velit neque repellat iure. Totam et labore natus tempora ea nostrum qui. Fugit inv', '3375.80', '1939-05-01 05:07:33', '2020-11-21 15:57:12');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (245, 5, 'Oncology', 'cumque', 'Quo necessitatibus fugiat et ipsum quibusdam magni occaecati. Quia beatae aut sint iure beatae animi excepturi. Odio omnis tenetur numquam velit dolor', '268.76', '2013-06-28 07:02:40', '2020-10-23 12:37:15');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (247, 2, 'Nephrology', 'sit', 'Quaerat officia sit facilis harum cupiditate ratione. Sint eius voluptates praesentium rerum assumenda adipisci iure odio. Voluptas iste minus aliquid', '16608062.89', '1993-02-04 19:55:57', '2020-06-09 11:30:24');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (249, 4, 'Endoscopic research', 'autem', 'Corporis eum laboriosam eligendi dolores quasi. Omnis est similique odio laborum quis commodi quae. Excepturi alias qui ut sit.', '0.00', '2002-11-30 09:12:05', '2020-08-23 05:58:34');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (250, 5, 'Traumatology and orthopedics', 'nihil', 'Aliquid totam ut eaque aspernatur voluptas. Deserunt aut illo veritatis at nulla aut. Nisi quae occaecati molestias officia ea aliquid. Voluptatem mod', '5.00', '1927-06-24 22:10:12', '2020-04-30 05:09:15');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (251, 1, 'Pediatrics', 'veniam', 'Ipsa rem dolore ad qui laborum id eos. Ullam magni soluta dolore quia et quibusdam quisquam. Dolorem placeat inventore et ratione et quia dolor.', '3356646.69', '2014-12-21 04:24:54', '2020-07-22 06:52:42');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (252, 2, 'Functional diagnostics', 'repudiandae', 'Vitae assumenda voluptatum error officiis quo veritatis. Molestias quos quidem aut facere aperiam. Esse pariatur ut quidem magnam aut amet ipsa.', '24.72', '1950-05-07 14:58:05', '2020-06-05 20:19:06');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (254, 4, 'Traumatology and orthopedics', 'quo', 'Voluptatem nobis et consequuntur tempore aut quia. Voluptatibus hic ipsum totam. Voluptas id quam debitis quo laboriosam. Nisi et voluptatem dolor bea', '204974488.97', '1989-12-08 00:43:05', '2020-05-04 20:11:00');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (255, 5, 'Hospitalization', 'adipisci', 'Et totam deleniti cumque fugiat voluptas. Rerum consequatur quo vero impedit omnis assumenda consequuntur. Facere deleniti rerum beatae cumque delectu', '1.91', '1957-11-19 07:42:55', '2019-12-21 02:40:39');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (256, 1, 'Nephrology', 'deserunt', 'Commodi voluptatem aspernatur quaerat occaecati voluptatem. Sapiente ea reprehenderit est soluta. Ut eligendi consequuntur nulla quo.', '10655150.00', '1950-12-07 18:20:17', '2020-06-22 09:38:12');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (258, 3, 'Extracorporeal methods of treatment', 'deleniti', 'Magni commodi debitis amet omnis. Cupiditate a provident quia et aliquam sed consequatur. Cum ducimus cumque ullam temporibus consectetur voluptas eli', '1.00', '2000-02-02 08:47:24', '2020-04-07 16:37:37');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (259, 4, 'Functional diagnostics', 'voluptatum', 'Ut dolores cumque accusantium saepe ipsa alias. Eos veniam dicta debitis modi aperiam quia quo. Quia veniam nisi praesentium esse dolores iste qui ad.', '6.18', '2001-04-16 19:18:33', '2020-06-23 21:27:30');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (260, 5, 'Mammology', 'officiis', 'Et ut praesentium aspernatur quos iusto labore. Qui in nisi cumque tempora nihil repellat. Tempore consequuntur adipisci voluptatibus ad ut. Fuga dolo', '13820.66', '1964-12-08 06:14:00', '2020-07-06 13:28:24');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (261, 1, 'Otorhinolaryngology (throat)', 'ipsum', 'Earum tenetur labore qui ab accusantium. Laudantium veritatis maiores et non eos qui. Sed nostrum veritatis officia sint omnis odit. Recusandae occaec', '1444008.26', '1976-04-18 23:37:15', '2020-07-24 15:43:43');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (262, 2, 'Otoneurology', 'consectetur', 'Aspernatur esse sed quos atque saepe maxime. Ut qui consectetur porro in.', '25689.49', '1962-10-05 00:37:26', '2020-10-11 11:56:00');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (264, 4, 'Genetics', 'itaque', 'Itaque voluptas in tenetur occaecati. Laboriosam doloremque nisi dolorem non consequatur autem occaecati. Maiores accusamus deserunt dolor incidunt.', '199470520.10', '2000-12-11 21:33:51', '2020-08-17 13:30:23');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (265, 5, 'Somnology', 'corporis', 'Cupiditate corrupti aut quo accusamus totam rerum assumenda. Neque voluptatum ut nemo et quidem. Id et aliquam eligendi unde.', '0.39', '1925-05-04 11:09:45', '2020-01-13 04:01:38');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (266, 1, 'Massage', 'magnam', 'Optio reprehenderit sapiente reiciendis ut esse corrupti. Ut modi voluptas nobis. Dolore nostrum minima cumque laborum amet omnis consectetur. Dolore ', '0.00', '1945-09-18 11:48:58', '2020-10-07 21:47:06');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (267, 2, 'Cardiology', 'accusamus', 'Ut cumque fugiat et alias sit beatae. Corrupti vitae nesciunt et. Culpa exercitationem quia quia sint quia. Totam quibusdam accusantium enim.', '34317409.45', '1999-05-06 22:00:01', '2020-03-27 15:56:46');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (269, 4, 'Extracorporeal methods of treatment', 'est', 'Modi quisquam vitae vitae quae saepe ipsa occaecati. Non voluptatem non repellat qui et culpa voluptatem sint. Quidem quo asperiores adipisci in dolor', '14467.03', '2019-11-03 07:05:02', '2020-10-08 04:03:12');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (270, 5, 'Phoniatry', 'exercitationem', 'Omnis fuga ipsum fugit facere repudiandae quos maxime error. Et quia iure animi et. Ipsa maxime eos voluptatem dolore ut quidem.', '0.19', '2009-05-04 21:35:27', '2019-12-30 17:46:53');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (273, 3, 'Oncology', 'voluptatibus', 'Possimus similique quia rerum et amet totam et. Molestiae consequatur sed magni temporibus quae assumenda dignissimos. Quisquam nisi laboriosam ea sit', '28513833.97', '1992-01-24 06:44:04', '2020-02-27 19:32:43');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (276, 1, 'Diagnostics', 'saepe', 'Ut dolorum laborum est excepturi nostrum. Sunt voluptas dicta sunt deserunt quasi impedit.', '676660.00', '1921-07-21 03:38:51', '2020-03-05 03:45:07');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (278, 3, 'Dermatovenerology', 'unde', 'Ullam exercitationem non recusandae aut neque. Maiores et debitis asperiores nihil. Mollitia cumque rem ad est perspiciatis iure.', '0.00', '1958-09-26 22:31:46', '2020-10-20 16:18:42');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (279, 4, 'Examination', 'laudantium', 'Ex provident non numquam et saepe ea ea. Est quia ea velit molestiae. Assumenda libero voluptatum occaecati aut.', '12977.48', '1958-11-10 19:31:21', '2020-11-14 00:51:42');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (280, 5, 'Manual therapy', 'maiores', 'Qui id sit voluptatem sunt consequatur voluptate. Et voluptas iure aut repellat. Eum laboriosam quas tenetur dolor sapiente perspiciatis. Et occaecati', '4.01', '1980-07-12 16:34:56', '2020-08-29 10:42:49');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (282, 2, 'Osteopathy', 'delectus', 'Et numquam accusamus sit quisquam. Hic quis id veniam totam. Deleniti tempore quia eum quisquam quasi exercitationem sed. Non aut sit sequi sed.', '2591.33', '1940-10-08 01:40:22', '2020-09-16 15:50:04');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (283, 3, 'Examination', 'doloremque', 'Occaecati quibusdam et dolorum voluptas consequatur dolorem. Harum ea eveniet minus et saepe. Et ad quia et animi voluptates voluptatum.', '586.72', '1941-07-28 08:58:31', '2020-10-27 12:57:29');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (284, 4, 'Diagnostics', 'minima', 'Earum ipsam tenetur ut autem iusto dolorem. Voluptas incidunt deleniti ratione nesciunt. Et fugiat doloribus consequuntur vitae id assumenda ut. Non e', '6681.34', '1943-08-09 17:18:53', '2020-10-23 07:04:51');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (285, 5, 'Oncology', 'repellat', 'Dolor reprehenderit molestiae asperiores dolorem optio. Iure ut perspiciatis eveniet. Aliquam dolor odit maiores modi soluta. Repellendus unde volupta', '4233921.69', '1924-08-09 02:29:11', '2020-08-04 00:06:35');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (286, 1, 'Spa treatment', 'odit', 'Nostrum occaecati ipsa illo ipsum enim recusandae. Voluptatibus atque rerum veniam id rerum autem voluptate.', '21810.99', '1941-12-27 09:28:35', '2020-02-05 01:33:27');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (287, 2, 'Oncology', 'sed', 'Perferendis doloribus dolore autem eos delectus impedit. Enim incidunt ut aut hic. Molestiae rerum minus sint quia magni consequatur nesciunt magnam.', '27227594.73', '1937-03-30 19:30:14', '2020-06-23 18:20:20');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (289, 4, 'Oncology', 'ex', 'Totam accusamus harum consequatur dolor eveniet id quia. Sit quas itaque labore consequuntur. Eaque sit rem at libero quos. Quia velit id laborum ipsa', '4526424.28', '1961-10-19 03:53:50', '2020-09-25 08:31:17');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (292, 2, 'Traumatology and orthopedics', 'eum', 'Amet non necessitatibus voluptatem enim voluptas voluptas. Aliquid alias architecto itaque.', '13377.45', '2015-09-13 16:08:10', '2019-12-31 05:38:42');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (293, 3, 'Phoniatry', 'similique', 'Voluptatem omnis sit doloremque sit aut id dolorem quia. Ut maxime et omnis soluta dicta tempore earum labore. Occaecati ipsa rerum qui omnis iure.', '5116.00', '1991-07-15 21:24:40', '2020-03-06 04:58:19');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (294, 4, 'Phlebology', 'ad', 'Velit odit molestias dicta beatae neque. Neque voluptatem sint debitis praesentium nesciunt exercitationem.', '51.84', '1947-05-25 12:03:42', '2020-04-04 17:22:30');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (298, 3, 'Physiotherapy', 'praesentium', 'Neque exercitationem alias adipisci perspiciatis expedita odit. Similique et ut cumque quia recusandae animi commodi. Ut modi corporis omnis architect', '43.33', '2015-11-23 03:25:15', '2019-12-18 10:06:05');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (299, 4, 'Assisted reproductive technologies issuing certificates', 'vitae', 'Consequatur rem quibusdam rerum est adipisci et. Eaque et eligendi adipisci occaecati excepturi. Blanditiis harum maxime aperiam nemo atque eius. Est ', '1430946.20', '1935-02-13 12:05:51', '2020-10-26 11:43:47');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (300, 5, 'Diagnostics', 'ea', 'Placeat totam ratione odit minima. Voluptatum id ex dolorum totam dolore laudantium. Veritatis aut dolores aliquid sit omnis. Omnis ipsa necessitatibu', '0.00', '1946-06-18 18:27:52', '2020-08-02 07:35:41');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (303, 3, 'Neurosurgery', 'numquam', 'Nam quisquam reprehenderit unde et. Itaque vitae rerum voluptatem ratione adipisci cum. Corrupti ut omnis modi temporibus. Nisi dolore molestiae dolor', '71355.69', '1923-04-14 00:24:12', '2020-09-22 00:38:39');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (304, 4, 'Oncology', 'rerum', 'Aperiam ratione ut aut corporis. Voluptatem deleniti voluptate inventore expedita. Ullam sit magni voluptas. Officiis sit cumque vitae excepturi conse', '489.71', '1922-07-31 03:00:13', '2020-05-20 09:38:51');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (308, 3, 'Surgery', 'illum', 'Dolorem vero consectetur velit consequatur omnis. Qui saepe eveniet iusto magnam iure repellendus illo. Commodi non soluta sunt sed velit unde quas.', '6.80', '1946-09-06 04:24:04', '2020-05-10 15:05:36');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (311, 1, 'Hematology', 'quae', 'Quaerat dolor vero ducimus neque vitae maiores. Est ut provident provident tempora. Quo et minus excepturi nostrum quibusdam quia quo.', '3261.88', '1971-07-28 09:09:44', '2020-01-16 00:31:18');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (316, 1, 'Therapy speech', 'vero', 'Ut dolor ut voluptas consequatur sed mollitia incidunt. Eligendi aut necessitatibus placeat. Unde et debitis sed quo vitae.', '0.00', '1993-03-27 12:24:24', '2020-01-24 18:33:55');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (321, 1, 'Assisted reproductive technologies issuing certificates', 'nemo', 'Tempore distinctio dolorum voluptatem quasi est. Atque est quisquam accusamus et. Et mollitia optio suscipit ad.', '60238.00', '2020-05-17 10:11:12', '2020-06-23 09:18:19');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (324, 4, 'Oncology', 'iste', 'At veniam earum dicta consectetur corporis qui. Dolores perspiciatis repudiandae aut veritatis dolor nam. Ut praesentium est cumque et dolorem dolor c', '10.40', '1998-07-12 02:27:48', '2019-12-26 14:24:12');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (325, 5, 'Neurology', 'ipsa', 'Aut minus et iusto dolor nostrum iste quaerat nostrum. Nisi cupiditate autem et expedita eum tempore magnam excepturi. Corporis sit quas natus cum.', '1765883.28', '2015-07-13 07:45:11', '2020-10-24 20:53:00');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (327, 2, 'Otorhinolaryngology (throat)', 'architecto', 'Minima impedit corporis ut placeat. Voluptatem odio illum sit ut. Eum provident culpa et natus qui voluptatem et.', '5.00', '1934-09-04 08:47:03', '2020-09-11 21:48:36');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (330, 5, 'Thoracic surgery', 'dolore', 'Molestias consequatur accusamus earum sapiente autem veritatis. Inventore sit deserunt assumenda. Sint quas dolor et voluptates quae porro voluptatibu', '2145.74', '1985-04-24 11:59:11', '2020-02-12 21:41:40');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (332, 2, 'Endoscopic research', 'dolor', 'Praesentium inventore eum unde et magni soluta qui. Qui voluptas sunt aut expedita dolorem. Ab ut ex dolores et. Deserunt sint suscipit assumenda porr', '415591.21', '2008-03-05 16:48:03', '2019-12-26 20:40:54');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (337, 2, 'Genetics', 'quod', 'Facere voluptas molestias laboriosam blanditiis provident excepturi. Rerum illum sint facere soluta dolorum aut voluptatem. Architecto eos debitis ad ', '823007.33', '2019-08-29 01:50:49', '2020-05-20 23:26:16');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (341, 1, 'Thoracic surgery', 'fugiat', 'Quia culpa cumque est quo magnam amet doloribus. Perspiciatis facere molestias iure eligendi. Eaque iusto temporibus sed a pariatur. Odio ea voluptate', '40673.00', '2008-08-18 16:24:48', '2020-05-04 03:21:51');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (342, 2, 'Pulmonology work in the Chi system', 'porro', 'Dicta totam ut libero velit recusandae quia. Est illum enim voluptas vel nulla fugiat illo. Voluptatem ut enim magnam eum fuga rem. Excepturi eos est ', '66560483.40', '1963-11-14 01:58:19', '2020-10-17 21:24:11');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (346, 1, 'Endoscopic research', 'consequatur', 'Molestiae delectus eligendi sint. Totam in iure recusandae non. Sit recusandae nostrum qui repellendus culpa occaecati.', '0.00', '1976-10-16 10:18:41', '2020-02-01 07:28:48');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (351, 1, 'Medical rehabilitation', 'quidem', 'Ipsum temporibus dolore aut eligendi a. Laborum ab est perferendis omnis voluptatibus.', '13.16', '2010-03-04 08:47:56', '2020-04-06 15:16:10');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (352, 2, 'Osteopathy', 'labore', 'Iusto consequuntur qui repellat dolor. Sequi magni et iste iste nobis beatae in. Repellat nostrum quasi molestiae nam soluta quis est.', '120.58', '1946-08-10 00:11:52', '2020-04-18 18:20:04');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (353, 3, 'Physiotherapy', 'aliquid', 'Dicta veniam corporis autem reiciendis. Corporis possimus reiciendis nesciunt harum dolorem sint et occaecati. Nihil vitae officia sunt.', '37631.86', '1925-08-01 21:38:34', '2020-12-07 04:11:01');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (360, 5, 'Gynecology', 'recusandae', 'Ratione accusamus qui nihil nisi et pariatur. Nulla exercitationem ullam et quo soluta. Eius quo doloremque assumenda aliquid.', '238076.04', '1949-08-04 09:14:48', '2020-09-25 10:43:52');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (363, 3, 'Therapy speech', 'molestias', 'Consequatur autem dolores quia minima illo. Consequatur velit nemo possimus. Odit dicta ea aspernatur laboriosam.', '26151806.70', '1941-02-18 08:56:15', '2019-12-19 14:00:40');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (364, 4, 'Dermatology', 'sapiente', 'Ut ipsa officiis vel est unde. Voluptate est neque et harum aut id deleniti. Eveniet aliquid veniam sit ratione inventore quas incidunt. Consequatur c', '957.79', '2003-08-23 18:18:49', '2020-02-11 12:37:14');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (366, 1, 'Phoniatry', 'neque', 'Velit voluptas quis exercitationem repudiandae. Similique sed ab et ratione delectus exercitationem. Doloribus laborum ex rem voluptates mollitia illu', '1362.00', '1964-04-02 02:20:42', '2020-02-29 19:52:46');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (368, 3, 'Extracorporeal methods of treatment', 'rem', 'In magnam a consequatur aliquam id ut. Qui sed voluptatum rerum id quos. Possimus dolorem sed culpa et ut beatae omnis.', '5366528.25', '1953-01-06 15:00:57', '2020-06-09 12:04:50');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (369, 4, 'Neurosurgery', 'velit', 'Et doloremque et fugiat minus tenetur rerum eum enim. Et dolores cumque error exercitationem possimus illum. Eligendi magnam voluptatem minima esse la', '8639372.18', '1997-11-05 20:47:43', '2020-08-26 03:20:18');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (370, 5, 'Cardiology', 'provident', 'Et debitis beatae qui facilis aut. Aut repellat hic impedit consequatur modi. Illo est atque cumque enim adipisci omnis et. Ipsa nihil nobis quia et i', '358447.10', '1932-10-05 08:46:15', '2020-09-29 04:54:48');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (373, 3, 'Therapy', 'alias', 'Ut impedit occaecati itaque ut quam unde et et. Rem reprehenderit sit consectetur. Aut deleniti nam possimus reiciendis.', '9997.29', '1945-07-12 01:23:20', '2020-08-29 00:17:33');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (375, 5, 'Neurosurgery', 'tempora', 'Commodi a dolorum enim voluptatem sunt dolores. Sed et est eligendi voluptas qui. Iusto quia et animi magni similique odit. Eius corporis vitae quia f', '647746142.20', '1985-06-18 10:34:22', '2020-12-01 20:14:19');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (377, 2, 'Calling a doctor at home', 'totam', 'Perspiciatis et quo aut. Autem ratione non magnam reprehenderit dolores quo. Non sapiente tempora officiis quidem deleniti alias reprehenderit.', '11.68', '1956-01-21 23:24:53', '2020-03-15 05:14:10');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (378, 3, 'Neurology', 'impedit', 'Itaque id porro nemo qui repellendus ratione. Delectus a quaerat aliquam error voluptates alias. Ut illum repellat non eaque.', '3101.23', '2013-01-18 06:19:28', '2020-02-27 11:37:20');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (382, 2, 'Nephrology', 'fugit', 'Voluptas tempore exercitationem illum omnis eos ab. Deserunt quibusdam odit ratione beatae adipisci. Optio eligendi enim cumque quae.', '0.00', '2008-09-09 06:25:51', '2020-12-11 03:37:34');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (384, 4, 'Plastic surgery proctology psychotherapy', 'occaecati', 'Incidunt ratione sed at. Architecto architecto officia porro quia.', '20477122.00', '2020-06-01 10:49:51', '2020-02-25 20:20:57');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (390, 5, 'Dermatology', 'reiciendis', 'Perferendis molestiae excepturi nemo odit quam qui dolor. Consequuntur voluptas mollitia nobis impedit tempore ea. Omnis nulla ex consectetur inventor', '1049760.77', '1928-01-29 11:12:18', '2020-03-16 03:05:33');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (391, 1, 'Diagnostics', 'nam', 'Laudantium non sint officia provident velit. Dolorum quo vel ex in.', '1860.45', '2000-05-07 00:25:49', '2020-11-18 03:07:38');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (393, 3, 'Gastroenterology', 'magni', 'Est aspernatur tempora recusandae. Nihil velit id autem consequatur corporis iure fugit et. Ad earum illum qui ad est.', '473067.00', '2010-04-20 09:01:47', '2020-03-20 16:56:22');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (394, 4, 'Massage', 'pariatur', 'Fugit consequatur mollitia esse et omnis. Ut necessitatibus voluptatibus earum quidem iste. Expedita quasi et et quaerat eum sit rem quia. Nulla et ve', '287178.33', '1983-07-17 13:29:37', '2019-12-14 06:27:54');
INSERT INTO `services` (`id`, `program_id`, `serv_category`, `name`, `preparation`, `price`, `created_at`, `updated_at`) VALUES (398, 3, 'Ophthalmology', 'nostrum', 'Sed quo assumenda et esse. Perspiciatis dolorum voluptatum quaerat deserunt expedita aperiam. Nisi non a nostrum at.', '0.49', '1936-03-26 23:41:00', '2020-07-06 17:41:37');


#
# TABLE STRUCTURE FOR: services_users
#

DROP TABLE IF EXISTS `services_users`;

CREATE TABLE `services_users` (
  `clinic_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на клинику',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `service_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на услугу',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`clinic_id`,`user_id`,`service_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Связь между пользователями и клиниками';

INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 1, 201, '1962-03-13 22:18:01', '2020-04-29 07:24:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 1, 332, '1955-03-25 11:28:00', '2020-10-07 22:44:07');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 21, 223, '1995-12-30 00:53:04', '2016-03-08 18:54:42');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 21, 384, '1985-07-17 21:15:13', '2012-05-05 13:43:51');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 41, 217, '1982-02-15 07:25:46', '2015-07-11 13:42:36');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 41, 247, '1986-02-10 00:22:11', '2020-02-13 22:25:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 61, 239, '1996-12-09 19:30:47', '2011-03-18 11:47:45');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 61, 276, '1952-08-30 21:39:23', '2016-10-18 13:28:26');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 81, 265, '1982-09-15 18:58:37', '2020-01-15 19:15:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 81, 311, '1937-06-16 05:11:19', '2015-03-16 01:16:42');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 101, 369, '1945-12-13 17:47:35', '2014-10-08 19:59:30');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 121, 208, '1974-11-15 15:22:58', '2014-03-15 16:32:02');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 141, 231, '1941-10-04 10:49:57', '2017-08-08 13:31:07');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 161, 256, '1933-05-08 22:25:26', '2018-01-18 03:00:36');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (1, 181, 285, '1945-06-10 07:08:51', '2014-02-25 22:55:38');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 2, 202, '1978-08-23 11:13:35', '2015-02-22 13:14:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 2, 337, '2002-10-15 10:22:45', '2016-08-13 01:14:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 22, 224, '1952-08-26 16:21:03', '2013-04-05 12:30:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 22, 390, '1970-06-22 16:55:12', '2017-01-25 21:12:48');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 42, 218, '1935-12-01 23:54:08', '2014-04-02 04:53:37');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 42, 249, '1975-03-18 05:51:26', '2020-03-15 00:15:32');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 62, 240, '1941-07-26 07:51:03', '2018-01-27 04:56:57');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 62, 278, '1945-03-20 01:19:02', '2015-04-17 07:11:45');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 82, 266, '1992-08-14 15:04:29', '2014-09-17 08:16:36');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 82, 316, '1990-06-05 22:59:18', '2017-04-18 20:11:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 102, 370, '1922-09-02 04:34:30', '2016-05-27 12:14:23');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 122, 209, '2000-05-01 10:09:36', '2012-09-04 21:31:51');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 142, 232, '1933-05-23 22:12:28', '2014-06-05 01:49:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 162, 258, '2011-02-26 17:21:06', '2017-10-07 04:29:56');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (2, 182, 286, '1983-10-18 03:14:43', '2014-11-19 15:52:30');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 3, 203, '1951-05-18 02:41:41', '2016-03-20 17:08:29');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 3, 341, '1928-05-02 21:06:40', '2019-11-28 19:12:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 23, 225, '1922-04-20 03:25:47', '2018-12-12 17:13:46');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 23, 391, '1975-01-25 02:41:38', '2011-07-14 20:53:19');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 43, 219, '2015-06-26 07:31:40', '2020-03-15 16:54:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 43, 250, '1928-09-30 14:26:33', '2018-01-03 18:10:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 63, 241, '1924-02-07 21:07:29', '2020-10-31 19:46:57');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 63, 279, '2020-04-23 09:12:49', '2015-05-17 01:12:27');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 83, 267, '1964-07-24 16:57:34', '2018-08-08 04:32:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 83, 321, '1928-08-23 23:13:27', '2020-05-18 08:55:21');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 103, 373, '1954-05-29 21:30:53', '2014-08-20 03:57:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 123, 210, '1992-06-12 22:17:23', '2013-06-13 16:19:27');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 143, 233, '1992-05-09 07:10:02', '2017-02-01 09:13:27');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 163, 259, '1980-10-28 10:28:36', '2017-09-11 10:35:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (3, 183, 287, '1983-09-05 21:58:18', '2018-10-30 05:14:16');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 4, 204, '1996-12-09 05:16:29', '2018-07-17 12:39:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 4, 342, '2005-01-24 15:09:13', '2019-12-27 04:07:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 24, 226, '1946-07-29 19:07:19', '2017-01-02 08:26:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 24, 393, '1966-05-28 06:54:08', '2012-01-01 11:54:31');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 44, 220, '2017-05-14 09:59:43', '2016-04-18 13:33:42');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 44, 251, '1966-06-01 22:51:51', '2019-06-20 01:25:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 64, 242, '1992-08-31 15:41:10', '2012-11-17 20:02:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 64, 280, '2017-03-13 23:14:07', '2011-07-09 07:04:23');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 84, 269, '1951-04-20 19:03:37', '2015-10-21 02:43:32');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 84, 324, '1969-12-04 10:02:51', '2020-05-19 07:23:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 104, 375, '1925-04-12 08:07:17', '2017-02-08 02:57:24');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 124, 211, '1979-04-17 07:33:04', '2018-04-11 15:43:14');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 144, 234, '1929-07-22 04:22:34', '2016-08-17 13:35:31');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 164, 260, '2014-07-01 07:11:10', '2019-04-14 13:39:08');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (4, 184, 289, '1995-11-18 16:37:15', '2011-06-12 22:32:31');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 5, 205, '2002-12-29 05:32:23', '2012-11-06 07:19:41');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 5, 346, '1964-07-13 17:51:12', '2020-05-23 14:16:42');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 25, 227, '1990-11-19 04:46:53', '2015-09-15 01:36:11');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 25, 394, '1999-09-28 16:29:29', '2011-10-07 19:59:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 45, 221, '1987-07-04 12:48:07', '2016-11-14 17:02:52');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 45, 252, '1997-04-27 01:40:04', '2015-06-21 22:47:09');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 65, 244, '1957-04-27 07:27:57', '2016-05-17 19:11:11');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 65, 282, '1958-03-26 18:39:16', '2020-01-02 16:34:25');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 85, 270, '2009-01-02 13:30:24', '2013-01-13 23:11:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 85, 325, '1955-02-03 11:43:56', '2015-11-11 14:33:52');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 105, 377, '1931-04-29 08:30:59', '2020-02-24 11:14:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 125, 212, '1969-07-14 02:55:31', '2020-06-10 10:43:54');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 145, 235, '1993-10-07 14:53:59', '2012-09-30 23:01:21');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 165, 261, '1934-01-07 16:00:21', '2012-02-21 18:17:46');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (5, 185, 292, '1966-01-07 10:13:15', '2020-06-26 10:15:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 6, 206, '1998-09-23 17:52:17', '2020-11-29 23:24:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 6, 351, '2005-11-08 17:33:02', '2013-08-29 13:59:08');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 26, 228, '1920-12-16 10:49:37', '2019-12-28 18:14:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 26, 398, '1981-09-10 20:54:25', '2011-06-14 12:12:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 46, 222, '1960-04-20 20:22:30', '2019-01-22 04:00:09');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 46, 254, '1965-12-07 09:36:40', '2013-10-06 09:31:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 66, 245, '1971-03-14 15:10:43', '2017-01-14 16:44:58');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 66, 283, '1997-06-20 23:58:38', '2014-11-21 16:25:48');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 86, 273, '1963-10-23 09:27:21', '2020-02-24 08:50:00');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 86, 327, '1932-02-17 18:38:19', '2013-07-21 10:18:42');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 106, 378, '1969-11-24 13:50:04', '2020-06-27 06:15:01');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 126, 213, '1963-03-28 21:55:48', '2012-10-08 22:13:31');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 146, 237, '1957-01-10 12:24:25', '2016-07-28 19:55:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 166, 262, '1953-05-05 21:22:58', '2017-12-15 23:33:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (6, 186, 293, '2009-12-02 15:09:41', '2014-04-14 04:05:12');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 7, 207, '1965-05-31 02:39:08', '2017-05-26 07:43:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 7, 352, '2005-11-29 15:42:44', '2011-04-03 18:08:32');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 27, 201, '1981-11-24 22:35:35', '2018-04-27 22:30:31');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 27, 230, '1942-05-09 17:43:02', '2014-05-07 03:45:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 47, 223, '2018-01-03 11:31:28', '2017-07-27 19:03:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 47, 255, '1940-01-03 10:35:03', '2017-03-28 06:22:15');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 67, 247, '1957-07-11 23:25:35', '2012-02-18 13:29:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 67, 284, '1999-08-31 10:37:09', '2014-11-17 08:19:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 87, 276, '1948-01-12 07:16:41', '2017-11-22 12:21:11');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 87, 330, '1998-01-31 18:39:56', '2012-06-06 18:45:46');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 107, 382, '1993-11-30 13:37:52', '2020-01-23 10:25:38');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 127, 216, '2014-10-18 21:43:57', '2013-08-06 06:16:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 147, 238, '1982-04-18 21:41:38', '2012-03-20 08:14:37');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 167, 264, '1999-06-05 16:27:42', '2013-04-14 13:01:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (7, 187, 294, '1973-04-20 19:15:05', '2017-11-29 00:28:24');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 8, 208, '1951-05-14 01:10:05', '2014-07-19 17:14:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 8, 353, '2001-08-01 00:41:29', '2018-05-19 21:52:58');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 28, 202, '1990-07-13 04:34:35', '2011-06-11 21:34:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 28, 231, '2018-10-13 06:00:14', '2017-09-16 08:56:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 48, 224, '1982-06-10 02:53:28', '2012-07-12 21:05:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 48, 256, '1989-02-10 06:48:29', '2012-09-19 14:46:42');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 68, 249, '1963-08-13 23:14:10', '2018-01-26 14:11:34');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 68, 285, '1935-12-12 13:19:36', '2020-01-03 02:03:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 88, 278, '1986-11-02 18:52:21', '2012-05-28 19:40:33');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 88, 332, '1990-12-29 11:15:01', '2012-11-15 15:06:16');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 108, 384, '1974-10-06 21:27:54', '2018-02-09 05:21:59');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 128, 217, '1930-01-03 13:13:22', '2014-10-23 20:05:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 148, 239, '1943-09-14 14:31:06', '2012-06-21 12:13:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 168, 265, '2020-07-05 17:46:58', '2014-09-15 10:38:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (8, 188, 298, '1967-12-18 19:27:38', '2018-09-27 15:07:35');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 9, 209, '1947-08-02 16:41:29', '2019-07-16 13:49:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 9, 360, '2017-07-19 10:13:34', '2019-07-27 16:39:27');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 29, 203, '1969-07-07 06:04:29', '2011-11-10 01:40:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 29, 232, '1955-03-09 09:29:14', '2015-02-02 18:03:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 49, 225, '1949-05-16 03:58:56', '2017-10-28 02:56:57');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 49, 258, '2008-10-24 12:16:40', '2011-03-03 04:05:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 69, 250, '1999-05-23 19:52:27', '2012-08-22 03:47:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 69, 286, '2015-10-07 04:19:43', '2019-06-19 17:35:25');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 89, 279, '1981-03-15 09:54:20', '2018-08-18 07:10:56');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 89, 337, '1923-02-27 03:37:28', '2013-10-25 17:03:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 109, 390, '1948-09-07 14:08:54', '2019-05-14 10:16:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 129, 218, '1991-10-28 05:01:11', '2017-10-16 17:32:04');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 149, 240, '2004-12-31 11:58:48', '2012-02-06 14:48:09');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 169, 266, '1954-09-19 12:15:09', '2013-12-03 02:07:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (9, 189, 299, '2019-06-10 05:07:24', '2020-10-01 22:22:04');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 10, 210, '2015-04-14 17:57:24', '2017-01-03 00:29:29');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 10, 363, '1993-01-02 05:28:24', '2016-01-13 20:56:19');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 30, 204, '1937-10-12 13:51:49', '2020-12-12 00:03:14');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 30, 233, '1975-10-05 20:22:32', '2014-03-19 12:04:46');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 50, 226, '1998-05-22 14:09:52', '2015-02-11 04:40:52');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 50, 259, '1929-11-18 23:22:56', '2011-04-28 05:02:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 70, 251, '1986-07-13 15:10:28', '2012-04-24 21:30:00');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 70, 287, '1961-11-27 21:33:33', '2020-01-06 18:21:54');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 90, 280, '1992-01-29 04:34:36', '2017-05-30 15:36:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 90, 341, '1943-06-19 09:43:09', '2012-06-16 10:10:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 110, 391, '1922-11-28 06:27:18', '2012-08-08 02:22:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 130, 219, '1972-09-08 15:15:10', '2015-02-27 20:02:24');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 150, 241, '1960-06-21 07:51:44', '2018-09-15 22:32:21');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 170, 267, '1952-04-15 22:54:35', '2016-05-20 18:47:33');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (10, 190, 300, '1949-07-25 14:10:09', '2020-03-27 11:27:40');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 11, 211, '1939-08-01 14:53:34', '2017-05-02 00:26:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 11, 364, '1996-12-07 20:11:44', '2011-09-23 07:59:29');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 31, 205, '1935-03-26 10:59:16', '2020-08-23 12:43:55');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 31, 234, '1935-07-01 20:21:45', '2018-04-23 07:21:10');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 51, 227, '2009-07-30 00:19:11', '2016-09-26 20:44:31');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 51, 260, '1971-05-23 09:41:39', '2014-02-04 02:34:56');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 71, 252, '2002-01-27 23:02:35', '2013-10-06 19:48:10');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 71, 289, '1963-11-26 10:55:41', '2013-12-26 16:05:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 91, 282, '1961-05-17 22:26:02', '2014-04-05 20:46:24');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 91, 342, '2016-03-25 16:37:32', '2019-06-30 01:01:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 111, 393, '1996-09-11 12:17:05', '2018-08-07 09:36:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 131, 220, '1964-02-16 15:23:47', '2020-10-01 14:14:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 151, 242, '1938-06-09 20:18:11', '2018-10-05 21:05:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 171, 269, '1931-07-05 19:53:16', '2014-11-16 04:10:03');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (11, 191, 303, '1935-05-28 04:21:06', '2014-02-27 21:34:34');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 12, 212, '1998-07-11 15:10:06', '2013-06-07 15:21:52');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 12, 366, '1990-03-31 04:06:03', '2019-12-05 20:55:07');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 32, 206, '1946-02-08 22:34:33', '2013-04-21 04:00:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 32, 235, '1992-06-07 17:27:33', '2015-01-13 13:49:09');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 52, 228, '2006-11-04 05:31:51', '2014-02-13 08:20:45');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 52, 261, '1934-10-08 05:05:46', '2020-03-05 12:23:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 72, 254, '1970-05-08 01:31:58', '2020-04-05 07:50:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 72, 292, '2018-06-24 04:25:06', '2017-05-18 06:34:48');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 92, 283, '1932-09-16 21:53:15', '2014-05-21 05:25:40');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 92, 346, '2019-10-23 19:54:25', '2017-06-29 07:12:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 112, 394, '1958-02-22 10:15:53', '2017-02-18 12:35:25');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 132, 221, '1994-02-06 07:10:29', '2015-08-08 01:48:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 152, 244, '1947-04-11 09:52:05', '2019-04-06 16:40:30');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 172, 270, '1985-10-04 11:28:04', '2019-07-23 08:45:27');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (12, 192, 304, '1941-09-10 08:45:12', '2013-08-07 00:42:30');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 13, 213, '1933-01-31 18:51:29', '2016-09-27 05:34:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 13, 368, '2019-10-03 19:48:51', '2019-09-05 04:15:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 33, 207, '1950-02-07 05:25:15', '2020-10-21 05:00:24');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 33, 237, '1982-11-30 08:16:23', '2014-03-04 08:15:48');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 53, 230, '2010-06-04 00:47:46', '2019-10-14 06:07:08');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 53, 262, '2003-05-12 17:07:56', '2016-08-17 22:04:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 73, 255, '1944-09-16 06:45:54', '2017-06-23 09:17:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 73, 293, '2002-11-18 19:53:11', '2014-01-18 14:16:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 93, 284, '1937-09-28 17:46:55', '2020-01-20 02:40:51');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 93, 351, '1993-09-20 21:13:17', '2012-06-08 10:04:15');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 113, 398, '1934-11-08 15:57:25', '2015-01-15 02:29:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 133, 222, '2000-09-25 02:22:06', '2013-09-15 21:47:51');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 153, 245, '1976-04-17 18:42:54', '2017-07-20 08:46:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 173, 273, '2018-10-04 15:57:49', '2020-04-22 12:20:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (13, 193, 308, '1973-03-31 12:49:38', '2018-05-01 07:34:59');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 14, 216, '1924-02-25 16:54:05', '2015-06-29 05:31:56');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 14, 369, '1932-04-01 22:36:58', '2015-08-10 05:21:26');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 34, 208, '1982-08-16 13:16:41', '2012-09-25 08:16:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 34, 238, '1929-04-30 15:45:31', '2015-01-24 13:52:07');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 54, 231, '2013-02-24 03:59:53', '2016-05-28 11:51:33');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 54, 264, '1959-10-27 17:45:35', '2017-07-05 12:53:40');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 74, 256, '1995-07-16 01:57:08', '2013-08-12 23:32:23');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 74, 294, '1932-04-14 03:22:43', '2014-08-23 02:38:14');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 94, 285, '2012-10-26 10:37:45', '2015-06-05 04:09:04');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 94, 352, '1988-05-09 13:27:13', '2013-08-13 08:23:16');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 114, 201, '2004-05-18 15:37:13', '2020-03-23 17:06:11');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 134, 223, '1976-09-17 10:08:26', '2011-08-13 21:53:07');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 154, 247, '1981-12-30 19:28:59', '2015-01-24 02:43:09');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 174, 276, '2020-12-13 01:57:15', '2016-08-04 14:18:58');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (14, 194, 311, '2018-02-16 00:12:52', '2014-11-03 22:30:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 15, 217, '1945-08-10 05:36:04', '2012-03-20 07:43:19');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 15, 370, '2003-08-28 11:51:59', '2020-11-02 03:32:08');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 35, 209, '1993-03-03 16:51:42', '2019-02-11 08:41:41');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 35, 239, '1960-06-06 02:49:29', '2019-10-12 10:06:11');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 55, 232, '1964-06-24 11:07:30', '2015-11-21 17:31:40');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 55, 265, '1984-06-06 09:42:50', '2016-09-06 21:23:35');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 75, 258, '1930-04-12 08:57:17', '2017-06-13 23:08:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 75, 298, '1992-01-09 07:01:45', '2011-12-10 13:06:41');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 95, 286, '1970-12-17 23:27:37', '2015-01-20 15:54:52');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 95, 353, '1983-03-11 00:30:03', '2012-11-27 06:57:36');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 115, 202, '1948-08-07 11:02:28', '2018-05-25 01:34:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 135, 224, '1946-12-06 22:00:35', '2013-12-19 16:45:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 155, 249, '2012-06-12 15:31:19', '2013-11-24 03:38:27');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 175, 278, '1953-03-06 03:58:20', '2017-05-13 12:35:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (15, 195, 316, '1957-05-04 00:07:34', '2013-07-04 02:59:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 16, 218, '1987-05-21 17:56:27', '2015-09-01 02:31:16');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 16, 373, '1922-06-02 23:21:39', '2015-04-09 01:51:21');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 36, 210, '1937-10-04 19:17:29', '2020-03-14 01:37:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 36, 240, '1940-02-29 21:52:41', '2018-01-01 01:55:00');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 56, 233, '1933-11-24 15:43:08', '2013-07-21 01:15:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 56, 266, '1932-05-15 15:26:51', '2010-12-28 02:21:40');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 76, 259, '2005-02-12 02:11:25', '2017-06-30 16:24:15');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 76, 299, '1944-04-08 12:31:49', '2015-06-12 11:04:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 96, 287, '1939-10-23 23:21:53', '2019-01-01 14:48:07');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 96, 360, '1985-10-25 21:53:09', '2014-08-04 01:58:00');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 116, 203, '1966-04-24 01:34:29', '2019-09-12 19:47:02');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 136, 225, '1952-01-28 22:21:25', '2017-04-16 07:12:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 156, 250, '2016-09-17 11:57:33', '2013-08-24 05:30:20');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 176, 279, '1973-09-04 01:12:46', '2011-05-25 05:39:39');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (16, 196, 321, '1947-12-18 11:42:12', '2015-01-04 03:24:37');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 17, 219, '1936-08-01 21:44:25', '2019-10-20 11:03:15');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 17, 375, '2002-02-17 22:27:33', '2014-08-23 20:16:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 37, 211, '1937-12-16 06:04:37', '2015-06-14 16:41:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 37, 241, '2011-03-29 16:13:56', '2011-02-11 08:33:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 57, 234, '1990-12-04 10:56:52', '2016-09-05 03:46:16');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 57, 267, '1991-10-15 00:00:43', '2012-09-21 20:54:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 77, 260, '1967-12-11 22:49:38', '2017-04-21 14:46:43');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 77, 300, '1990-12-30 03:40:08', '2017-02-16 03:43:18');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 97, 289, '1921-07-29 23:40:12', '2016-12-16 15:49:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 97, 363, '1974-04-03 20:29:16', '2014-07-04 00:29:45');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 117, 204, '1978-01-07 13:12:29', '2015-07-31 04:54:34');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 137, 226, '2004-11-13 11:15:22', '2016-07-14 18:29:21');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 157, 251, '1963-10-29 22:44:50', '2017-09-01 18:49:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 177, 280, '2002-05-27 18:18:14', '2013-03-24 14:30:08');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (17, 197, 324, '1951-11-29 04:48:28', '2013-10-31 03:35:30');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 18, 220, '1992-07-31 00:31:46', '2014-07-13 19:06:30');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 18, 377, '2020-06-09 02:44:13', '2016-07-02 08:32:57');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 38, 212, '1935-05-25 13:50:13', '2018-04-14 22:37:33');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 38, 242, '2010-04-27 07:48:16', '2020-10-01 02:20:00');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 58, 235, '1924-09-08 18:14:23', '2014-09-12 19:25:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 58, 269, '1988-05-04 03:24:18', '2020-11-22 01:29:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 78, 261, '2001-02-22 21:48:14', '2019-05-02 22:58:54');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 78, 303, '1921-07-20 05:36:19', '2017-07-18 17:01:58');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 98, 292, '1993-09-03 06:09:16', '2015-10-10 23:12:25');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 98, 364, '2002-08-28 23:41:24', '2012-04-24 21:51:59');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 118, 205, '1980-12-13 02:36:36', '2019-08-29 02:43:49');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 138, 227, '1987-07-26 05:43:38', '2020-10-15 20:35:59');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 158, 252, '1980-11-23 14:33:00', '2017-08-10 14:20:22');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 178, 282, '1984-02-13 00:37:46', '2019-07-07 17:51:47');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (18, 198, 325, '1989-05-23 15:54:50', '2017-10-26 14:42:51');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 19, 221, '1972-12-24 08:25:37', '2019-06-26 08:10:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 19, 378, '1975-08-16 04:18:27', '2017-05-03 10:33:51');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 39, 213, '1944-04-04 00:41:16', '2013-01-24 04:29:14');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 39, 244, '1953-10-11 01:16:39', '2013-06-19 21:42:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 59, 237, '1969-02-23 14:51:27', '2020-05-22 21:29:15');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 59, 270, '2020-03-11 12:26:34', '2017-05-15 00:38:28');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 79, 262, '1945-08-23 22:20:38', '2017-09-05 00:07:36');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 79, 304, '2001-09-07 14:23:43', '2013-09-05 18:34:38');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 99, 293, '1958-10-23 03:38:33', '2014-07-02 18:19:48');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 99, 366, '1989-09-05 15:37:13', '2020-01-16 00:38:06');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 119, 206, '2011-11-05 17:49:22', '2020-05-11 08:55:04');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 139, 228, '1989-08-30 22:59:16', '2013-01-13 03:47:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 159, 254, '1976-04-08 07:03:32', '2017-08-20 02:35:33');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 179, 283, '1945-08-02 06:44:26', '2016-12-03 04:33:23');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (19, 199, 327, '1922-12-16 14:00:05', '2018-08-02 05:34:50');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 20, 222, '1930-10-02 23:36:50', '2020-09-14 11:47:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 20, 382, '1938-03-08 13:50:01', '2018-01-18 14:50:05');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 40, 216, '1970-09-30 19:05:46', '2011-07-18 21:10:17');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 40, 245, '1994-11-12 14:33:32', '2012-01-13 23:50:25');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 60, 238, '1988-10-22 12:13:24', '2019-04-30 01:59:44');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 60, 273, '1958-09-11 17:31:33', '2017-10-26 05:08:55');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 80, 264, '1935-10-11 23:30:15', '2019-02-24 21:59:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 80, 308, '1991-02-27 15:45:58', '2018-02-10 12:15:45');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 100, 294, '1945-07-23 16:00:31', '2017-10-22 07:13:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 100, 368, '1994-09-27 13:13:44', '2015-10-22 14:38:19');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 120, 207, '1995-02-22 00:14:47', '2011-04-25 07:50:37');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 140, 230, '1954-04-19 18:46:18', '2010-12-14 01:08:15');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 160, 255, '1972-09-23 09:19:19', '2020-07-29 07:30:13');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 180, 284, '1921-01-06 19:22:19', '2015-04-17 15:40:53');
INSERT INTO `services_users` (`clinic_id`, `user_id`, `service_id`, `created_at`, `updated_at`) VALUES (20, 200, 330, '1951-06-07 17:56:17', '2013-10-29 02:24:50');


#
# TABLE STRUCTURE FOR: specializations
#

DROP TABLE IF EXISTS `specializations`;

CREATE TABLE `specializations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `job` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Должность',
  `age_category` enum('Adult','Children') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Категория возраста пациента',
  `doc_category` enum('Professor','Doctor medical sciences','Associate professor','Candidate of medical sciences','Honored doctor jf the RF','Doctor of the highest qualification category') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Категория врача',
  `specialization` enum('Accident and emergency medicine','Allergology','Anesthetics','Cardiology','Child psychiatry','Clinical biology','Clinical chemistry','Clinical','Microbiology','Clinical neurophysiology','Craniofacial surgery','Dermatology','Endocrinology','Family and General medicine','Gastroenterological surgery','Gastroenterology','General practice','General surgery','Geriatrics','Hematology','Immunology','Infectious diseases internal medicine','Laboratory medicine','Nephrology','Neuropsychiatry','Neurology','Neurosurgery','Nuclear medicine','Obstetrics and Gynecology occupational','Medicine','Oncology ophthalmology','Maxillofacial surgery','Orthopedics','Otorhinolaryngology','Pediatric surgery','Pediatrics','Pathology','Pharmacology','Physical medicine and rehabilitation','Plastic surgery','Orthopedic surgery','Preventive medicine','Psychiatry','Health care','Radiation','Oncology','Radiology','Respiratory medicine','Rheumatology','Dentistry','Thoracic surgery','Tropical medicine','Urology','Vascular surgery','Venereology','Medical specialty') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Специализация врача',
  `education` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Наименование учебного заведения',
  `еxperience` datetime DEFAULT current_timestamp() COMMENT 'Начало стажа',
  `resume` text COLLATE utf8_unicode_ci COMMENT 'Резюме врача',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Специализация врачей';


SELECT * FROM specializations;
INSERT INTO specializations (user_id, age_category, doc_category, specialization, еxperience, created_at, updated_at)
VALUES 
  (50, 'Adult', 'Honored doctor jf the RF', 'Child psychiatry', '2018-08-02 12:10:00', '2020-12-01 12:49:22', '2019-04-06 08:17:06'),
  (100, 'Adult', 'Doctor of the highest qualification category', 'Neurosurgery', '2009-03-28 23:37:01', '2020-11-21 23:20:00', '2017-01-06 15:27:02'),
  (7, 'Adult', 'Doctor of the highest qualification category', 'Preventive medicine', '1950-05-21 12:49:13', '2020-11-16 13:30:14', '2017-02-16 23:22:26'),
  (32, 'Adult', 'Doctor of the highest qualification category', 'Radiology', '2014-03-09 05:46:07', '2020-12-10 20:08:11', '2016-02-23 16:24:19'),
  (92, 'Adult', 'Doctor medical sciences', 'Oncology', '1967-09-16 09:33:10', '2020-11-18 16:31:23', '2014-03-27 18:25:58'),
  (12, 'Adult', 'Doctor of the highest qualification category', 'Neuropsychiatry', '1986-07-03 04:16:55', '2020-12-09 00:47:37', '2011-02-24 16:37:25'),
  (64, 'Adult', 'Doctor of the highest qualification category', 'Maxillofacial surgery', '1995-09-20 14:08:51', '2020-11-17 06:10:22', '2019-11-27 15:59:24'),
  (44, 'Children','Doctor of the highest qualification category', 'Immunology', '1950-08-30 18:21:48', '2020-11-15 16:30:51', '2018-06-06 04:45:45'),
  (8, 'Children', 'Doctor of the highest qualification category', 'Dermatology', '1953-10-24 07:09:50', '2020-11-24 07:50:16', '2012-12-29 14:39:39'),
  (5, 'Adult', 'Doctor of the highest qualification category', 'Clinical', '1996-10-10 18:19:48', '2020-12-06 17:58:06', '2016-09-15 21:23:27'),
  (87, 'Adult', 'Honored doctor jf the RF', 'Dentistry', '1999-05-25 07:37:05', '2020-12-02 15:13:35', '2014-05-30 06:27:09'),
  (81, 'Adult', 'Doctor of the highest qualification category', 'Microbiology', '1994-07-13 02:52:44', '2020-11-26 10:07:19', '2012-07-10 18:54:35'),
  (40, 'Adult', 'Doctor of the highest qualification category', 'Accident and emergency medicine', '1986-07-03 04:16:55', '2020-11-28 15:11:53', '2013-11-20 14:38:25'),
  (23, 'Adult', 'Doctor of the highest qualification category', 'Anesthetics', '1964-05-10 19:00:32', '2020-11-23 12:43:03', '2014-11-01 06:37:25'),
  (30, 'Adult', 'Doctor of the highest qualification category', 'Endocrinology', '1955-12-26 19:04:27', '2020-11-18 00:23:23', '2012-04-17 01:32:15'),
  (74, 'Adult', 'Doctor of the highest qualification category', 'Cardiology', '2013-06-20 21:09:15', '2020-12-03 13:43:21', '2015-04-13 08:38:56'),
  (27, 'Adult', 'Doctor of the highest qualification category', 'Neuropsychiatry', '1993-08-09 02:34:32', '2020-11-15 14:01:11', '2019-01-14 07:36:40'),
  (72, 'Adult', 'Doctor medical sciences', 'Hematology', '2009-03-28 23:37:01', '2020-11-27 07:43:16', '2018-09-07 13:16:06'),
  (35, 'Adult', 'Associate professor', 'Clinical chemistry', '1968-11-22 22:54:17', '2020-11-16 07:31:10', '2011-05-10 03:48:40'),
  (9, 'Children','Doctor of the highest qualification category', 'Family and General medicine', '1985-01-17 09:35:04', '2020-12-07 20:34:14', '2016-11-30 12:44:40'),
  (1, 'Adult', 'Doctor of the highest qualification category', 'Pathology', '2018-08-02 12:10:00', '2020-11-28 05:07:05', '2013-08-18 09:31:37'),
  (2, 'Adult', 'Doctor of the highest qualification category', 'Dentistry', '2013-08-18 09:31:37', '2020-11-25 14:37:54', '2014-04-23 20:00:52'),
  (8, 'Adult', 'Associate professor', 'Laboratory medicine', '2017-07-17 20:58:22', '2020-11-22 06:21:45', '2015-05-02 04:25:18'); -- наполнение таблицы specializations


UPDATE specializations SET updated_at = NOW() WHERE updated_at < created_at; -- Доработка БД поскольку для ее наполнения использовался ресурс http://filldb.info

#
# TABLE STRUCTURE FOR: unit
#

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Название единицы измерения',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Единицы измерения';

INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'illum', '1953-09-30 12:24:14', '2020-11-16 17:58:45');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'provident', '1996-06-06 10:09:03', '2020-12-09 18:54:24');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'praesentium', '1925-01-05 09:08:37', '2020-11-23 00:56:38');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'consequatur', '1926-01-20 05:50:59', '2020-11-20 02:00:27');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'illo', '1961-07-06 07:49:05', '2020-12-01 10:33:24');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'et', '1941-01-22 17:14:05', '2020-11-14 12:07:40');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'sed', '1923-04-02 07:11:20', '2020-11-17 23:56:18');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'ut', '1931-09-29 19:00:06', '2020-12-05 03:06:11');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'odio', '2006-08-31 05:40:20', '2020-12-04 00:33:22');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'quae', '1989-04-28 02:25:07', '2020-11-24 04:23:06');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'nam', '1923-11-27 04:16:24', '2020-12-06 04:27:35');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'eum', '1997-03-03 15:16:57', '2020-11-30 14:43:01');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'dolores', '1995-12-07 18:09:37', '2020-11-14 16:29:48');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'laudantium', '1942-08-24 03:29:20', '2020-12-12 09:23:44');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'aperiam', '2010-06-28 14:05:10', '2020-11-29 11:12:55');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'repellendus', '1922-02-14 22:52:38', '2020-11-20 03:28:42');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'voluptatem', '1994-06-17 01:17:11', '2020-12-02 09:39:34');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'autem', '1936-04-09 17:25:24', '2020-11-23 10:19:24');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'qui', '1966-08-03 04:30:14', '2020-12-03 13:12:10');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'maiores', '1962-02-12 04:11:48', '2020-12-10 03:46:10');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'ipsum', '1982-10-05 18:22:37', '2020-12-12 06:09:22');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'numquam', '1927-07-22 01:21:17', '2020-12-10 09:34:00');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'consequuntur', '2000-03-19 11:34:58', '2020-11-22 20:40:42');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'quaerat', '1977-09-29 00:09:22', '2020-12-13 02:41:11');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'delectus', '2008-06-28 03:09:34', '2020-11-27 04:25:50');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'veniam', '2018-05-18 22:48:37', '2020-11-19 01:35:50');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'laboriosam', '2015-05-24 08:32:52', '2020-11-20 08:01:15');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'aut', '2013-11-18 03:29:05', '2020-12-13 02:19:27');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'sint', '1988-04-25 01:58:30', '2020-11-27 07:08:12');
INSERT INTO `unit` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'sequi', '2007-11-05 10:47:44', '2020-11-20 13:00:05');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Телефон',
  `status` enum('Doctor','Patient','Doctor-Patient') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Статус',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Пользователи';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (1, 'Hugh', 'Fay', 'lbernhard@example.org', '(079)605-8384x78873', 'Patient', '1967-06-09 23:23:55', '2020-11-24 06:46:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (2, 'Eliseo', 'Lueilwitz', 'fritsch.krystina@example.org', '(850)770-5321', 'Doctor', '1979-10-23 19:29:18', '2020-12-01 04:19:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (3, 'Orlo', 'Roberts', 'mparisian@example.org', '(404)812-4145', 'Doctor-Patient', '1940-08-24 09:12:13', '2020-12-10 16:25:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (4, 'Destini', 'Batz', 'jhickle@example.org', '703.510.9934x73660', 'Doctor-Patient', '2014-10-23 12:44:43', '2020-11-24 20:56:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (5, 'Lucy', 'O\'Keefe', 'turner.jacinthe@example.org', '380-131-5768', 'Patient', '1998-10-03 17:56:29', '2020-11-26 22:24:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (6, 'Jacynthe', 'Borer', 'ondricka.jerome@example.com', '1-289-078-9701', 'Patient', '2009-06-28 07:51:13', '2020-12-01 12:51:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (7, 'Mollie', 'Botsford', 'barbara26@example.net', '1-677-080-9923x516', 'Doctor-Patient', '1946-06-29 06:17:06', '2020-11-23 21:44:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (8, 'Furman', 'Jacobs', 'cvon@example.net', '(729)484-9429x94633', 'Doctor', '1977-08-03 22:19:41', '2020-12-05 12:28:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (9, 'Ivy', 'Murray', 'hvolkman@example.net', '(875)871-2239', 'Doctor', '2018-06-24 22:14:21', '2020-12-06 04:04:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (10, 'Missouri', 'Howe', 'drussel@example.org', '635.990.7499', 'Doctor-Patient', '1986-08-06 05:49:50', '2020-12-04 12:06:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (11, 'Marjorie', 'Monahan', 'jwiegand@example.com', '1-274-826-6022', 'Patient', '2011-02-10 22:00:03', '2020-12-07 07:00:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (12, 'Skylar', 'Lesch', 'lynch.terrell@example.net', '06121694782', 'Patient', '2016-04-20 01:06:52', '2020-12-01 01:29:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (13, 'Kathlyn', 'Ankunding', 'orval39@example.com', '031-789-6511x1559', 'Doctor', '1968-07-14 17:49:46', '2020-12-06 09:00:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (14, 'Felipa', 'O\'Connell', 'szemlak@example.com', '338.351.6674', 'Doctor-Patient', '1966-06-04 07:09:54', '2020-11-15 13:08:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (15, 'Easter', 'Lindgren', 'carter.wilhelmine@example.org', '1-092-057-8734x943', 'Doctor', '2006-07-25 05:35:41', '2020-11-22 16:17:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (16, 'Jerrod', 'Runolfsdottir', 'mckenna.kris@example.com', '1-937-419-0772', 'Doctor', '1930-03-31 12:25:38', '2020-12-08 02:14:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (17, 'Fay', 'Dooley', 'frank55@example.org', '759.782.7161x463', 'Doctor-Patient', '2012-11-13 18:32:24', '2020-11-29 01:26:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (18, 'Milton', 'Bernier', 'winnifred.walter@example.net', '(483)795-3942x6995', 'Doctor', '1963-08-06 03:09:14', '2020-12-02 11:42:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (19, 'Alberto', 'King', 'hettinger.brandon@example.com', '(077)996-2546x078', 'Doctor-Patient', '1985-09-09 20:39:58', '2020-11-18 12:52:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (20, 'Sim', 'Bergnaum', 'brenda.haley@example.com', '243.118.2172x68393', 'Doctor', '2017-11-19 01:30:44', '2020-12-08 02:11:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (21, 'Felipe', 'Tillman', 'jerde.lonie@example.org', '08392233447', 'Doctor-Patient', '1958-08-19 21:07:36', '2020-11-14 14:08:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (22, 'Savanna', 'O\'Keefe', 'jdenesik@example.org', '859.774.7971x1017', 'Patient', '1960-11-01 04:57:20', '2020-12-04 03:43:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (23, 'Jaquan', 'Deckow', 'domingo.walker@example.net', '(536)009-6926x920', 'Doctor-Patient', '1947-09-17 23:42:49', '2020-12-07 01:35:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (24, 'Velva', 'Predovic', 'jbosco@example.net', '+04(7)6791183479', 'Doctor', '1999-11-10 23:30:53', '2020-12-13 13:01:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (25, 'Tyreek', 'Nitzsche', 'sfriesen@example.org', '(556)457-2071', 'Patient', '1953-06-29 03:10:16', '2020-11-30 06:44:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (26, 'Jasen', 'Conn', 'cindy88@example.com', '07396397095', 'Doctor-Patient', '1947-06-07 13:14:26', '2020-12-05 12:44:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (27, 'Emmanuel', 'Schmitt', 'herzog.june@example.org', '230.944.7247', 'Doctor', '1953-05-13 09:52:49', '2020-12-02 13:30:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (28, 'Ahmad', 'Kohler', 'skreiger@example.net', '(578)429-9028x84354', 'Patient', '1986-07-06 15:15:50', '2020-11-14 23:00:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (29, 'Lou', 'Schamberger', 'burdette.leffler@example.org', '(557)185-1901', 'Doctor-Patient', '1936-10-03 00:14:35', '2020-11-28 15:50:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (30, 'Jordan', 'Carter', 'casper.kailyn@example.org', '113.644.3207', 'Patient', '1928-09-16 23:54:23', '2020-12-13 09:21:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (31, 'Kimberly', 'Veum', 'hoeger.lucas@example.org', '756.896.5368', 'Doctor', '1939-11-16 02:21:20', '2020-11-15 14:13:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (32, 'Chanel', 'Waelchi', 'kaylah.huels@example.com', '+43(4)5980718907', 'Doctor-Patient', '1921-03-07 00:57:48', '2020-11-16 10:41:20');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (33, 'Vidal', 'Langosh', 'steuber.kyler@example.net', '121-547-5481x273', 'Doctor', '1948-08-15 22:10:55', '2020-12-08 16:14:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (34, 'Laurianne', 'Corkery', 'ondricka.sandrine@example.net', '591.695.6696x38864', 'Doctor', '1934-08-31 22:30:15', '2020-11-13 19:13:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (35, 'Harmony', 'Spinka', 'trantow.russ@example.com', '(123)582-8865', 'Doctor', '2020-08-01 14:44:35', '2020-11-23 07:10:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (36, 'Selmer', 'Sanford', 'tyler77@example.net', '1-533-980-7154', 'Doctor', '1982-09-25 04:27:26', '2020-11-17 07:06:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (37, 'Kathleen', 'Rosenbaum', 'harvey.mozell@example.com', '497.270.4023', 'Patient', '2008-12-21 23:49:57', '2020-12-11 08:08:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (38, 'Sibyl', 'Dach', 'jake.howe@example.org', '1-619-923-7297x45756', 'Patient', '1939-05-13 13:28:52', '2020-11-15 07:00:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (39, 'Annie', 'Ernser', 'albin68@example.net', '1-167-971-8934x0497', 'Patient', '1967-07-31 08:00:13', '2020-11-24 03:52:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (40, 'Madeline', 'Beahan', 'omer61@example.com', '802.798.7751', 'Patient', '1938-08-17 05:51:36', '2020-11-25 06:15:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (41, 'Samir', 'Homenick', 'deanna27@example.com', '(358)074-8700x834', 'Doctor', '1979-01-07 09:41:29', '2020-11-21 07:42:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (42, 'Lenna', 'Corwin', 'stephen29@example.org', '099.176.9216', 'Patient', '1938-05-11 13:53:25', '2020-12-03 07:13:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (43, 'Ella', 'Cremin', 'ervin60@example.net', '(848)012-8981', 'Doctor-Patient', '1961-01-30 18:47:19', '2020-11-15 11:54:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (44, 'Tommie', 'Rutherford', 'bettie31@example.com', '(020)062-1661', 'Patient', '1929-06-13 07:21:18', '2020-11-30 21:12:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (45, 'Nathaniel', 'Kreiger', 'kathryn.ferry@example.net', '125.414.4084', 'Patient', '1935-12-16 18:38:16', '2020-11-30 06:27:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (46, 'Waldo', 'Hammes', 'mking@example.org', '375.028.0859', 'Doctor-Patient', '2011-11-30 00:22:51', '2020-11-18 05:11:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (47, 'Golden', 'Howe', 'bprice@example.net', '(253)964-0427', 'Doctor-Patient', '1925-03-18 08:13:41', '2020-12-05 10:44:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (48, 'Tanya', 'Crona', 'carolanne.dietrich@example.org', '1-313-960-5055', 'Doctor-Patient', '1963-01-07 21:36:32', '2020-11-24 02:29:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (49, 'Demetris', 'Schultz', 'stanton.winifred@example.org', '+20(5)4239590821', 'Doctor-Patient', '1982-03-19 20:26:40', '2020-11-23 08:04:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (50, 'Amiya', 'Greenfelder', 'marcos94@example.org', '809.171.0549x463', 'Doctor', '1925-07-18 12:14:56', '2020-11-18 14:41:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (51, 'Gwendolyn', 'Will', 'judah22@example.org', '543-190-3152', 'Patient', '1933-03-26 03:01:06', '2020-12-01 12:51:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (52, 'Marley', 'Hirthe', 'joanny69@example.com', '(679)853-7077', 'Patient', '1971-03-23 12:29:24', '2020-11-30 05:46:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (53, 'Caesar', 'Kilback', 'herzog.kody@example.org', '027-008-8268x54922', 'Patient', '1972-01-22 12:59:13', '2020-11-24 16:06:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (54, 'Pauline', 'Wehner', 'maryam.sawayn@example.com', '372.324.5703x81237', 'Doctor-Patient', '1945-12-10 19:41:14', '2020-12-01 00:14:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (55, 'Joelle', 'Kessler', 'shaniya94@example.org', '478-738-1383x23508', 'Doctor-Patient', '2018-12-18 03:34:05', '2020-11-27 16:20:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (56, 'Estrella', 'Kuhic', 'hackett.vivienne@example.org', '(761)510-2585', 'Patient', '1922-02-08 04:49:39', '2020-12-10 11:32:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (57, 'Shanelle', 'Abernathy', 'jade77@example.net', '468-416-0280', 'Patient', '1957-01-04 16:43:05', '2020-11-17 20:24:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (58, 'Adrain', 'Mitchell', 'amina.tromp@example.org', '+40(8)3491569391', 'Doctor', '1941-12-26 07:26:36', '2020-12-01 15:49:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (59, 'Danyka', 'Bashirian', 'rmuller@example.org', '1-923-349-0757x3605', 'Doctor-Patient', '1934-09-03 22:16:02', '2020-11-17 18:07:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (60, 'Jordy', 'Labadie', 'keebler.mercedes@example.com', '+30(3)5944255190', 'Patient', '1968-11-09 12:17:37', '2020-12-04 02:42:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (61, 'Nicholas', 'Klocko', 'bartholome05@example.org', '06659213471', 'Doctor-Patient', '1981-09-20 03:45:39', '2020-11-19 11:57:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (62, 'Albertha', 'Cormier', 'shanon30@example.com', '089-225-2654', 'Doctor-Patient', '1954-11-04 21:27:02', '2020-11-18 09:01:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (63, 'Gregg', 'McLaughlin', 'palma51@example.net', '933-121-2150', 'Doctor-Patient', '1945-02-21 17:28:31', '2020-12-02 16:57:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (64, 'Retta', 'Bauch', 'daisy.wilderman@example.com', '1-437-876-5644', 'Patient', '1977-11-28 07:55:55', '2020-12-01 08:22:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (65, 'Raphael', 'Hammes', 'daugherty.augustine@example.net', '840-185-7894x762', 'Doctor-Patient', '1976-08-05 18:33:23', '2020-11-28 16:41:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (66, 'Hazle', 'Swift', 'cecilia75@example.org', '537.660.7959x7898', 'Doctor-Patient', '1923-12-17 09:38:11', '2020-11-20 00:46:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (67, 'Enola', 'Walter', 'marquise44@example.com', '1-482-506-5683x2887', 'Doctor-Patient', '1984-03-30 09:01:52', '2020-11-28 21:07:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (68, 'Jacinthe', 'Marquardt', 'wendy58@example.net', '09069076598', 'Doctor-Patient', '1976-03-05 08:45:18', '2020-11-19 05:58:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (69, 'Randy', 'Hermiston', 'gzboncak@example.net', '1-886-255-8961x282', 'Patient', '2014-04-24 20:43:26', '2020-12-07 17:19:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (70, 'Ari', 'Franecki', 'gerhard.greenholt@example.com', '(132)455-9274', 'Doctor', '1967-09-03 05:13:28', '2020-11-19 00:58:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (71, 'Brycen', 'Beatty', 'dach.theron@example.org', '06986996878', 'Patient', '1965-04-08 08:14:34', '2020-12-09 08:46:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (72, 'Agustin', 'Moen', 'eryn16@example.org', '09514674045', 'Doctor', '1995-01-27 15:25:51', '2020-11-19 14:21:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (73, 'Alivia', 'Sauer', 'qbartoletti@example.com', '112-444-2517x01338', 'Doctor', '1970-04-05 08:56:10', '2020-11-20 15:41:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (74, 'Ramon', 'Shanahan', 'dickens.belle@example.org', '(163)498-1339', 'Doctor-Patient', '1964-12-03 09:59:06', '2020-11-16 01:32:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (75, 'Jovan', 'Harber', 'dswift@example.net', '094.299.7740x616', 'Doctor', '1945-07-01 19:18:17', '2020-11-26 23:37:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (76, 'Adelia', 'Fisher', 'mschinner@example.com', '550-453-2656x9649', 'Doctor', '1954-08-11 21:43:32', '2020-12-02 06:09:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (77, 'Zula', 'Koelpin', 'avis.strosin@example.org', '291-226-3500', 'Doctor-Patient', '2005-08-16 08:30:03', '2020-11-15 15:30:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (78, 'Kelsie', 'Wiegand', 'jgottlieb@example.com', '071-265-9792x671', 'Patient', '1994-10-22 09:39:13', '2020-12-02 00:39:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (79, 'Rashawn', 'Kozey', 'kathryn.leannon@example.org', '(546)442-4816x77053', 'Doctor-Patient', '1949-04-06 06:55:58', '2020-11-23 19:49:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (80, 'Ima', 'Weimann', 'wschaefer@example.net', '178-723-9006x2599', 'Doctor', '1983-01-12 10:53:37', '2020-12-06 10:50:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (81, 'Bonita', 'McDermott', 'kaley.wiegand@example.net', '947.407.3352x822', 'Doctor', '1947-07-13 06:38:33', '2020-11-26 06:02:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (82, 'Jeanie', 'Sauer', 'koch.barbara@example.net', '(157)439-6264x40965', 'Doctor-Patient', '2020-05-08 12:12:35', '2020-12-13 04:13:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (83, 'Jabari', 'Smitham', 'nbaumbach@example.org', '1-173-455-4437', 'Doctor', '1944-07-16 00:02:23', '2020-11-14 17:17:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (84, 'Brenda', 'Mueller', 'lnitzsche@example.com', '1-166-764-8613', 'Doctor', '1966-11-15 03:08:06', '2020-12-08 04:08:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (85, 'Tyrel', 'Goyette', 'ebode@example.net', '1-319-097-9088', 'Doctor-Patient', '1940-02-28 20:24:30', '2020-12-06 10:27:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (86, 'Fermin', 'Hodkiewicz', 'uromaguera@example.net', '1-303-752-2524', 'Patient', '2000-07-18 05:17:25', '2020-12-08 21:14:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (87, 'Amir', 'Klocko', 'candelario.harber@example.org', '959-926-5326x374', 'Doctor', '1921-10-22 23:17:28', '2020-11-28 10:04:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (88, 'Hal', 'Quigley', 'henry14@example.net', '05149648022', 'Doctor', '1981-05-09 23:28:45', '2020-11-23 20:35:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (89, 'Mozell', 'Rutherford', 'vstehr@example.com', '840.446.9053', 'Doctor-Patient', '2002-12-15 04:24:35', '2020-12-09 06:09:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (90, 'Talon', 'Mills', 'odessa41@example.net', '(708)657-5820', 'Doctor', '1960-09-02 19:59:51', '2020-11-14 16:31:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (91, 'Grant', 'Turcotte', 'kamron.cremin@example.net', '105-036-2745x4528', 'Doctor', '2005-10-15 18:53:08', '2020-12-12 13:23:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (92, 'Antoinette', 'Huels', 'pfahey@example.com', '1-091-584-9876', 'Doctor', '2017-12-09 17:16:09', '2020-11-29 08:13:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (93, 'Mose', 'Howe', 'rosemary18@example.net', '+45(4)1506640850', 'Patient', '1997-11-11 02:43:47', '2020-12-07 01:42:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (94, 'Mya', 'Hagenes', 'shyanne12@example.org', '554.273.6796', 'Doctor-Patient', '1926-03-30 07:31:22', '2020-11-15 13:29:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (95, 'Jerald', 'Homenick', 'jessica44@example.org', '188.237.6716x1549', 'Doctor', '1995-05-04 08:31:06', '2020-12-08 06:39:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (96, 'Vince', 'Robel', 'pkuhic@example.net', '(678)213-8533x013', 'Doctor', '1926-04-08 14:10:34', '2020-11-28 03:07:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (97, 'Devyn', 'Schamberger', 'arvel.weber@example.com', '(496)346-4230', 'Patient', '1927-02-20 16:16:38', '2020-11-24 14:30:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (98, 'Keanu', 'Steuber', 'cherzog@example.com', '1-421-516-9373x7628', 'Patient', '2013-06-02 05:55:11', '2020-12-07 10:04:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (99, 'Stone', 'Wisozk', 'swisoky@example.com', '697-661-8518', 'Patient', '2009-12-11 07:03:48', '2020-11-24 12:11:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (100, 'Zane', 'Maggio', 'pgaylord@example.org', '892-944-0672x1336', 'Doctor-Patient', '1966-01-31 11:01:31', '2020-11-27 14:57:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (101, 'Marina', 'Smith', 'baylee47@example.net', '774.606.8848x0748', 'Doctor', '1981-08-26 17:57:49', '2020-11-19 23:29:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (102, 'Garland', 'Borer', 'pcole@example.org', '989.515.1704', 'Doctor-Patient', '1962-04-29 16:12:22', '2020-11-21 18:59:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (103, 'Breana', 'Aufderhar', 'anna.wiza@example.net', '+53(8)7572549385', 'Doctor', '1950-12-03 17:59:35', '2020-11-28 03:39:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (104, 'Martina', 'Lakin', 'ygoodwin@example.org', '(257)571-6045x399', 'Doctor', '1994-10-17 14:33:40', '2020-11-16 00:34:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (105, 'Lambert', 'Ruecker', 'weber.presley@example.com', '647.939.5115', 'Patient', '1982-06-15 15:58:10', '2020-11-26 11:05:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (106, 'Kiel', 'Barton', 'jtremblay@example.org', '844.904.0717x264', 'Doctor', '1954-02-13 14:58:59', '2020-12-07 10:36:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (107, 'Landen', 'Howell', 'howell.raymond@example.net', '962.198.1247x93448', 'Doctor', '1996-04-11 21:55:57', '2020-11-14 11:45:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (108, 'Brooke', 'Dach', 'dora.mclaughlin@example.net', '(057)070-3511x5109', 'Doctor', '1978-10-15 08:11:04', '2020-12-02 16:39:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (109, 'Luisa', 'Carroll', 'cletus43@example.net', '(691)534-7111', 'Doctor-Patient', '2003-09-06 11:12:30', '2020-11-28 17:04:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (110, 'Hassan', 'O\'Keefe', 'mauricio22@example.com', '04905812937', 'Doctor-Patient', '1996-12-02 18:07:52', '2020-12-09 20:43:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (111, 'Nick', 'Schmeler', 'reece.yost@example.org', '542.297.3326', 'Doctor', '1946-04-05 19:06:57', '2020-11-15 13:19:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (112, 'Fletcher', 'Bode', 'bruce19@example.net', '+05(3)0328241361', 'Doctor', '1937-07-17 05:45:20', '2020-12-03 16:35:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (113, 'Helena', 'Pfannerstill', 'yhermiston@example.net', '1-505-488-9865x05438', 'Doctor', '1953-01-18 19:03:56', '2020-12-11 04:41:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (114, 'Haskell', 'Bradtke', 'egaylord@example.com', '787-501-7277x34035', 'Doctor', '1922-10-31 21:35:00', '2020-11-23 10:03:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (115, 'Javier', 'Ebert', 'roscoe.predovic@example.org', '05049025933', 'Doctor-Patient', '1997-10-23 04:54:55', '2020-11-16 22:45:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (116, 'Alessandro', 'Wuckert', 'sbuckridge@example.org', '1-752-172-8486x38421', 'Doctor-Patient', '1984-09-15 01:50:21', '2020-11-18 11:04:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (117, 'Owen', 'Jast', 'gibson.kristian@example.net', '127.885.2624x905', 'Doctor', '1960-06-14 04:18:32', '2020-12-09 10:59:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (118, 'Keith', 'Rogahn', 'kylie43@example.org', '275.720.8530x882', 'Doctor', '1996-09-07 22:46:04', '2020-11-23 16:17:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (119, 'Roscoe', 'Prosacco', 'bosco.renee@example.org', '(758)754-6557', 'Doctor', '1985-07-17 17:08:09', '2020-11-19 05:45:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (120, 'Nicolette', 'Heidenreich', 'hbarrows@example.org', '(146)547-0127x9147', 'Doctor', '2015-02-08 08:41:19', '2020-11-23 04:37:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (121, 'Ora', 'Huel', 'dwhite@example.org', '(833)486-2228x86169', 'Doctor-Patient', '1987-03-13 00:08:57', '2020-12-06 11:16:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (122, 'Belle', 'Paucek', 'hrunolfsdottir@example.org', '+66(9)9685057670', 'Doctor-Patient', '1926-11-16 13:26:05', '2020-11-25 20:18:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (123, 'Leopold', 'Gaylord', 'amir.mraz@example.com', '+51(8)7655900284', 'Doctor-Patient', '2013-09-12 14:13:50', '2020-11-24 18:34:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (124, 'Caroline', 'Barton', 'elvera19@example.com', '679-314-1231', 'Patient', '1949-04-30 13:47:38', '2020-11-19 04:12:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (125, 'Gilbert', 'Heathcote', 'earnestine.dibbert@example.org', '340-712-8330', 'Doctor-Patient', '1944-01-09 16:58:54', '2020-12-08 01:30:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (126, 'Anabelle', 'Haag', 'abdullah.bauch@example.org', '1-810-810-8565', 'Doctor', '1988-02-09 02:10:55', '2020-11-30 10:20:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (127, 'Lura', 'DuBuque', 'williamson.eldon@example.com', '1-399-642-9692x067', 'Doctor-Patient', '1973-10-29 19:58:22', '2020-12-10 13:46:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (128, 'Danika', 'Littel', 'hilpert.noemi@example.org', '1-161-928-4075x19166', 'Patient', '2013-01-26 09:35:09', '2020-12-10 02:50:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (129, 'Emelia', 'Adams', 'stroman.rodger@example.com', '(787)320-2871x68055', 'Patient', '1939-12-21 14:34:34', '2020-12-04 08:19:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (130, 'Ahmed', 'Feil', 'harber.pasquale@example.com', '(157)632-6522', 'Doctor-Patient', '1961-08-07 16:22:19', '2020-11-17 19:00:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (131, 'Alycia', 'Kuhn', 'wiley04@example.com', '438.176.5841x2423', 'Doctor', '1987-12-07 14:36:52', '2020-11-14 07:11:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (132, 'Sven', 'Mante', 'edgar.cremin@example.com', '849-087-0213x559', 'Doctor', '1940-10-05 17:16:12', '2020-12-01 22:46:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (133, 'Rex', 'Kuvalis', 'xwill@example.net', '958.442.4087', 'Patient', '1939-04-30 04:06:02', '2020-11-16 14:01:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (134, 'Christy', 'Lakin', 'nitzsche.kayden@example.net', '(205)796-5830x251', 'Doctor', '2002-06-25 19:14:19', '2020-11-24 10:04:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (135, 'Telly', 'Torphy', 'larry48@example.com', '1-218-052-4970', 'Doctor-Patient', '2003-09-27 15:19:29', '2020-11-26 13:24:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (136, 'Burdette', 'Nikolaus', 'vicky.bartell@example.com', '883-576-1029x83275', 'Doctor-Patient', '1984-06-04 09:59:25', '2020-12-10 18:38:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (137, 'Anabelle', 'Nolan', 'wwiegand@example.org', '836-851-2690', 'Doctor-Patient', '1948-01-14 20:08:39', '2020-12-03 04:36:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (138, 'Marielle', 'Lebsack', 'murphy.jedidiah@example.net', '+06(4)3462306540', 'Doctor', '1958-10-10 00:41:06', '2020-12-07 17:19:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (139, 'Gregorio', 'Dach', 'buckridge.scotty@example.com', '883.583.7455', 'Doctor-Patient', '1974-02-06 16:48:40', '2020-12-07 21:04:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (140, 'Consuelo', 'Prohaska', 'wwuckert@example.com', '1-770-330-5731', 'Patient', '1985-11-29 14:11:49', '2020-12-10 21:38:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (141, 'Johnson', 'Altenwerth', 'ghammes@example.org', '(436)433-1275x32787', 'Doctor', '2007-06-19 13:15:14', '2020-11-14 04:09:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (142, 'Beth', 'Jast', 'vinnie44@example.net', '1-627-147-3115x14266', 'Doctor', '1967-07-06 00:06:35', '2020-11-16 05:03:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (143, 'Dandre', 'Koch', 'hilll.alexane@example.com', '433-884-9831x2002', 'Doctor-Patient', '1953-10-21 09:53:42', '2020-11-14 15:12:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (144, 'Elvis', 'Vandervort', 'nicola.nader@example.com', '359.742.6139x775', 'Doctor-Patient', '1950-09-05 16:45:04', '2020-12-05 14:18:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (145, 'Ford', 'Streich', 'oliver.collins@example.com', '683.044.5163x377', 'Patient', '1965-10-11 10:09:41', '2020-11-28 23:01:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (146, 'Damien', 'Stroman', 'pansy.satterfield@example.net', '937-075-4125x5154', 'Patient', '1978-01-09 22:49:51', '2020-11-22 18:26:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (147, 'Jacques', 'Kuhn', 'clinton37@example.org', '(338)967-6533', 'Doctor', '2011-04-19 18:28:54', '2020-12-12 07:27:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (148, 'Foster', 'Becker', 'zoie98@example.com', '(605)630-7765x33602', 'Doctor-Patient', '1928-07-02 01:55:12', '2020-11-16 14:55:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (149, 'Fredy', 'Swaniawski', 'lkub@example.net', '927-020-2834x096', 'Doctor-Patient', '1923-12-12 15:33:01', '2020-11-14 18:57:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (150, 'Golden', 'Crist', 'atoy@example.com', '400-677-4131x3569', 'Patient', '2006-11-27 08:11:22', '2020-12-02 17:36:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (151, 'Antwon', 'Schultz', 'jrenner@example.com', '603.123.9905x886', 'Doctor', '1946-06-16 12:53:10', '2020-11-28 03:15:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (152, 'Deja', 'Hauck', 'sdubuque@example.net', '455.131.7500', 'Patient', '1922-06-21 19:44:37', '2020-12-04 01:56:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (153, 'Griffin', 'Shanahan', 'clementina.littel@example.net', '523-384-6280', 'Patient', '1923-09-12 10:50:58', '2020-12-01 14:50:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (154, 'Adrian', 'Davis', 'myrna67@example.com', '331.956.8470', 'Doctor-Patient', '1960-02-27 12:31:49', '2020-11-25 09:39:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (155, 'Kaela', 'Fahey', 'david87@example.com', '1-019-074-0634x60049', 'Patient', '1975-04-12 09:22:19', '2020-11-14 12:54:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (156, 'Alejandrin', 'Abshire', 'jonathon.hudson@example.org', '(665)526-2794x769', 'Doctor-Patient', '1980-02-27 08:45:30', '2020-12-07 19:45:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (157, 'Judd', 'Bradtke', 'mosciski.florida@example.net', '311-952-7613', 'Patient', '1950-05-12 00:49:38', '2020-12-11 22:36:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (158, 'Viviane', 'Reichert', 'geraldine10@example.com', '(852)723-8378x148', 'Doctor-Patient', '1940-07-28 20:51:48', '2020-11-13 19:15:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (159, 'Edison', 'Renner', 'jordi00@example.org', '+19(2)0157512332', 'Patient', '1950-09-18 01:17:50', '2020-12-02 15:58:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (160, 'Tyler', 'Beier', 'reilly.bridgette@example.net', '1-478-569-3429', 'Doctor', '1933-02-11 06:21:04', '2020-12-02 07:26:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (161, 'Garrick', 'Reichel', 'alysson86@example.org', '979.790.6340', 'Doctor', '1969-03-08 12:26:37', '2020-12-09 12:12:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (162, 'Melba', 'Labadie', 'queen.wilkinson@example.org', '955.363.6007', 'Doctor', '1926-07-17 19:28:33', '2020-12-07 07:18:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (163, 'Beulah', 'Pollich', 'rebekah48@example.net', '(906)147-0763x013', 'Patient', '1993-06-19 07:28:35', '2020-12-05 11:17:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (164, 'Albertha', 'Walter', 'ratke.peter@example.net', '06947532929', 'Patient', '2020-04-29 11:35:22', '2020-11-25 07:31:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (165, 'Patrick', 'Stroman', 'hermiston.ernestina@example.com', '1-371-628-2957x54584', 'Doctor', '1982-12-13 00:19:07', '2020-11-15 14:26:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (166, 'Vallie', 'Kiehn', 'little.elnora@example.net', '(169)229-7308x82176', 'Patient', '1971-03-05 05:20:20', '2020-11-13 22:14:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (167, 'Mya', 'Miller', 'rrempel@example.net', '382.437.8364', 'Doctor-Patient', '1993-12-27 20:16:11', '2020-11-18 15:54:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (168, 'Cecile', 'Gerlach', 'antonetta.abernathy@example.net', '906-149-5685x96014', 'Doctor', '1974-05-29 18:56:02', '2020-12-08 15:28:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (169, 'Jermey', 'Rohan', 'carmine22@example.net', '096-653-6970', 'Doctor-Patient', '1993-10-18 06:54:31', '2020-12-02 23:28:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (170, 'Mittie', 'Leffler', 'judd.kris@example.com', '976-471-2833', 'Doctor-Patient', '1940-06-14 04:58:37', '2020-12-09 21:28:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (171, 'Creola', 'Schowalter', 'alaina.jerde@example.com', '012-024-0426x9087', 'Patient', '1948-01-20 07:09:27', '2020-11-23 03:59:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (172, 'Dominique', 'Klein', 'beier.rubye@example.org', '1-220-034-4889', 'Doctor-Patient', '1997-06-27 20:01:17', '2020-12-02 23:00:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (173, 'Darrick', 'Bahringer', 'lucienne98@example.org', '1-221-803-3010x201', 'Doctor-Patient', '2000-03-25 16:16:10', '2020-11-21 19:45:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (174, 'Bobby', 'Dietrich', 'hosea.jast@example.org', '968-122-6106x4960', 'Doctor-Patient', '1952-12-22 14:20:05', '2020-11-30 14:09:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (175, 'Willis', 'Beier', 'darron28@example.com', '+11(1)5912190110', 'Patient', '1955-12-01 03:01:53', '2020-11-19 06:45:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (176, 'Dedrick', 'Cartwright', 'gislason.rocky@example.net', '332-668-8323x081', 'Doctor-Patient', '1974-01-20 19:43:06', '2020-11-15 23:13:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (177, 'Bertrand', 'Harris', 'yroob@example.net', '(005)444-7877x75091', 'Doctor', '1923-03-29 13:37:23', '2020-11-13 23:54:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (178, 'Rylee', 'Armstrong', 'hassie52@example.com', '380-889-4887x66435', 'Doctor-Patient', '1966-11-27 01:05:22', '2020-12-02 18:56:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (179, 'Aryanna', 'Greenfelder', 'estella.wilkinson@example.net', '208.140.5581', 'Patient', '1989-01-28 22:11:00', '2020-12-07 09:25:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (180, 'Mervin', 'Bayer', 'ciara.abbott@example.org', '(005)874-9427x15319', 'Doctor-Patient', '1959-04-19 07:13:00', '2020-11-18 23:04:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (181, 'Emily', 'Homenick', 'swift.calista@example.com', '(687)413-1784', 'Doctor', '1924-11-16 21:43:59', '2020-12-12 00:37:17');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (182, 'Katrine', 'Stark', 'macey.nolan@example.org', '06348473517', 'Doctor', '2003-01-27 16:48:00', '2020-11-30 22:24:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (183, 'Gaylord', 'Mosciski', 'cfranecki@example.net', '247.382.9597', 'Patient', '1923-08-20 22:00:39', '2020-11-24 03:11:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (184, 'Carole', 'Barton', 'hhowell@example.com', '1-498-275-7393', 'Doctor-Patient', '1938-12-07 19:03:56', '2020-12-04 06:04:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (185, 'Braeden', 'Gerhold', 'rpurdy@example.org', '444-678-6450x5780', 'Patient', '1936-02-04 03:04:21', '2020-12-04 13:47:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (186, 'Kennedy', 'Roob', 'franecki.graham@example.org', '571-545-6230x2741', 'Doctor', '1947-02-17 17:48:51', '2020-11-16 01:55:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (187, 'Ryley', 'Kozey', 'samara30@example.com', '(725)955-3765x85265', 'Doctor', '1938-12-10 07:35:59', '2020-11-15 15:05:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (188, 'Dee', 'Daniel', 'eriberto08@example.org', '+41(8)6751450528', 'Patient', '1936-09-14 06:23:24', '2020-11-18 15:03:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (189, 'Taryn', 'Fisher', 'katrine.klocko@example.org', '890-186-0639', 'Doctor-Patient', '1966-02-18 22:44:44', '2020-12-01 17:21:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (190, 'Etha', 'Olson', 'clarabelle.schulist@example.net', '158-973-7955x25179', 'Doctor-Patient', '1989-02-16 18:19:50', '2020-11-15 04:17:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (191, 'Xzavier', 'Cummings', 'ryann.dare@example.org', '532-417-4983x26175', 'Doctor-Patient', '1963-04-28 21:25:49', '2020-12-10 15:17:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (192, 'Isadore', 'Franecki', 'mac83@example.net', '(657)168-7740x711', 'Doctor', '2002-09-21 16:57:39', '2020-12-07 14:36:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (193, 'Gennaro', 'Heathcote', 'vcarter@example.com', '09773419073', 'Doctor-Patient', '1929-05-07 11:01:25', '2020-12-08 21:04:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (194, 'Abby', 'Grady', 'bfeeney@example.net', '(861)289-8312x68198', 'Doctor-Patient', '2006-08-29 21:34:03', '2020-11-15 07:41:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (195, 'Theo', 'Johns', 'retta56@example.com', '1-981-278-2804', 'Doctor-Patient', '1938-02-06 03:50:29', '2020-12-09 04:53:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (196, 'Robin', 'Weber', 'ccorwin@example.net', '438.514.7384x70746', 'Doctor-Patient', '1961-04-25 08:41:13', '2020-11-15 16:12:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (197, 'Kira', 'Brown', 'carroll.greyson@example.net', '1-456-200-8113x4686', 'Patient', '2016-03-01 21:09:20', '2020-12-01 18:41:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (198, 'Orlo', 'Kuhic', 'mschultz@example.net', '064.437.0183x3090', 'Doctor-Patient', '2015-11-20 14:05:19', '2020-12-08 02:49:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (199, 'Sabina', 'Heller', 'grant.dolores@example.com', '(198)201-8938x0967', 'Patient', '1931-12-14 09:23:10', '2020-12-08 07:26:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `status`, `created_at`, `updated_at`) VALUES (200, 'Shanon', 'Murphy', 'marielle69@example.net', '+16(4)2914859676', 'Patient', '2013-05-24 03:13:25', '2020-11-17 01:16:50');


-- 6 требование: Скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);

SELECT SUM(sy) AS services_young -- Подсчет общего количества полученных услуг 15 самыми молодыми пациентами
FROM 
	(SELECT COUNT(*) AS sy
		FROM services AS s
			JOIN services_users AS su
				ON s.id = su.service_id
			RIGHT JOIN profiles AS p
				ON su.user_id = p.user_id  
			RIGHT JOIN users AS u
				ON u.id = su.user_id
					AND u.status IN('Patient', 'Doctor-Patient')
	GROUP BY u.id 
	ORDER BY p.birthday DESC LIMIT 15) AS ps;
	

SELECT DISTINCT -- Вывод списка 10 врачей с наибольшим опытом работы, оказавшим медицинские услуги 
	CONCAT_WS(' ', u.id, u.first_name, u.last_name) AS Doctor,
	sp.еxperience,
	s.name,
	COUNT(*) OVER w1 AS services
FROM users AS u
	JOIN specializations AS sp
		ON u.id = sp.user_id 
			AND u.status IN('Doctor', 'Doctor-Patient')
	JOIN services_users AS su
		ON sp.user_id = su.user_id
	JOIN services AS s
		ON su.service_id = s.id 
		WINDOW w1 AS (PARTITION BY su.service_id ORDER BY sp.еxperience)
LIMIT 10;

DELETE -- удаление устаревших записей из таблицы research_users, оставляя 10 самых свежих
  research_users
FROM
  research_users
JOIN
 (SELECT
    created_at
  FROM
    research_users
  ORDER BY
    created_at DESC
  LIMIT 10, 1) AS del_research_users
ON
  research_users.created_at <= del_research_users.created_at;

SELECT * FROM research_users;


-- 7 требование: Представления (минимум 2);

DROP VIEW services_youngs;
SHOW TABLES;
SELECT * FROM services_youngs;

CREATE VIEW services_youngs AS  -- Вывод количества полученных услуг по каждому из 15 самых молодых пациентов
	SELECT 
		CONCAT_WS(' ', u.first_name, u.last_name) AS Patient,
		p.birthday,
		COUNT(*) AS services_young
	FROM services AS s
		JOIN services_users AS su
			ON s.id = su.service_id
		RIGHT JOIN profiles AS p
			ON su.user_id = p.user_id  
		RIGHT JOIN users AS u
			ON u.id = su.user_id
				AND u.status IN('Patient', 'Doctor-Patient')
	GROUP BY u.id 
	ORDER BY p.birthday DESC LIMIT 15;



DROP VIEW Patient_Doctor;
SHOW TABLES;
SELECT * FROM Patient_Doctor;

CREATE VIEW Patient_Doctor AS  -- Вывод количества полученных услуг по каждому из 15 самых молодых пациентов и врачей с самым большим стажем работы
	SELECT DISTINCT 
		Patient,
		services_young,
		Doctor
	FROM 
		(SELECT 
				CONCAT_WS(' ', users.id ,users.first_name, users.last_name) AS Patient,
				profiles.birthday,
				COUNT(*) AS services_young
			FROM services
				JOIN services_users
					ON services.id = services_users.service_id
				RIGHT JOIN profiles
					ON services_users.user_id = profiles.user_id  
				RIGHT JOIN users
					ON users.id = services_users.user_id
						AND users.status IN('Patient', 'Doctor-Patient')
			GROUP BY users.id 
			ORDER BY profiles.birthday DESC LIMIT 15) AS P
		CROSS JOIN (SELECT
				CONCAT_WS(' ', users.id, users.first_name, users.last_name) AS Doctor,
				specializations.еxperience
			FROM users
				JOIN specializations
					ON users.id = specializations.user_id 
						AND users.status IN('Doctor', 'Doctor-Patient')
				JOIN services_users
					ON specializations.user_id = services_users.user_id
			ORDER BY specializations.еxperience LIMIT 15) AS D
	LIMIT 15;