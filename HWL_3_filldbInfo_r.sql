-- Обращаемся к базе данных
USE vk;

-- Загружаем данные фейкера
#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????? ?????',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '???????? ??????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='??????';

INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'aliquid', '2020-11-05 06:18:26', '2020-04-22 09:06:06');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'at', '2020-11-10 12:26:49', '2020-08-27 09:08:11');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'consequatur', '2020-10-17 14:39:06', '2020-05-21 05:05:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'similique', '2020-10-26 19:34:13', '2020-02-16 03:20:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'ut', '2020-10-31 08:30:44', '2020-03-16 10:18:39');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'error', '2020-10-26 17:26:59', '2020-07-12 23:57:51');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'enim', '2020-10-16 03:33:09', '2020-01-30 08:26:17');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (8, 'et', '2020-10-21 19:32:19', '2020-06-19 16:26:26');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (9, 'vel', '2020-11-09 06:53:50', '2020-09-21 02:55:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (10, 'dolor', '2020-11-08 18:21:38', '2020-02-13 15:51:02');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (11, 'maxime', '2020-11-09 22:48:18', '2020-09-16 12:07:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (12, 'non', '2020-10-17 05:05:40', '2020-07-01 18:07:38');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (13, 'aut', '2020-10-20 03:41:24', '2020-10-10 14:39:37');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (14, 'incidunt', '2020-11-03 22:21:49', '2020-08-13 22:30:56');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (15, 'sequi', '2020-10-16 07:57:56', '2019-12-30 09:08:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (16, 'esse', '2020-11-09 10:03:52', '2020-05-16 04:43:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (17, 'sint', '2020-11-08 17:31:31', '2020-04-19 21:21:56');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (18, 'modi', '2020-10-21 16:16:44', '2020-05-26 22:23:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (19, 'cum', '2020-11-07 23:48:09', '2020-04-02 19:13:50');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (20, 'dicta', '2020-10-28 02:45:05', '2020-10-15 12:18:57');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (21, 'perspiciatis', '2020-10-22 06:06:49', '2020-06-08 17:46:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (22, 'eum', '2020-10-13 04:48:29', '2020-09-12 07:50:30');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (23, 'nesciunt', '2020-11-11 06:37:15', '2020-02-08 16:08:28');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (24, 'qui', '2020-10-21 00:38:07', '2020-04-08 07:24:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (25, 'est', '2020-10-26 11:49:57', '2020-03-02 11:26:16');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (26, 'corporis', '2020-10-14 01:44:13', '2020-06-13 16:23:54');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (27, 'voluptate', '2020-10-20 10:40:04', '2019-12-11 06:30:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (28, 'quo', '2020-11-03 20:42:37', '2020-08-05 07:41:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (29, 'doloribus', '2020-10-30 01:43:46', '2020-10-23 12:09:47');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (30, 'voluptatem', '2020-11-01 22:41:25', '2019-12-24 03:51:22');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (31, 'velit', '2020-11-02 03:28:47', '2019-11-21 19:24:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (32, 'eos', '2020-10-22 12:27:37', '2020-11-10 14:24:07');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (33, 'numquam', '2020-10-13 02:41:39', '2020-10-15 20:18:00');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (34, 'praesentium', '2020-11-07 02:28:16', '2020-02-04 06:22:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (35, 'dolores', '2020-10-17 03:02:23', '2020-09-08 01:41:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (36, 'facere', '2020-10-23 19:37:15', '2020-10-01 02:58:13');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (37, 'corrupti', '2020-10-18 09:11:30', '2019-12-10 20:43:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (38, 'hic', '2020-11-04 21:21:03', '2020-09-11 20:48:06');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (39, 'consequuntur', '2020-11-06 01:04:51', '2020-07-31 05:23:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (40, 'molestias', '2020-11-07 06:40:48', '2020-11-09 01:19:03');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (41, 'molestiae', '2020-10-29 10:15:42', '2020-07-02 01:35:30');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (42, 'quia', '2020-11-08 05:33:02', '2020-07-24 22:39:28');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (43, 'sed', '2020-11-01 15:32:25', '2020-04-25 11:10:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (44, 'aliquam', '2020-10-20 07:59:50', '2020-03-27 15:28:22');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (45, 'odio', '2020-10-23 23:37:31', '2020-08-20 03:43:45');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (46, 'omnis', '2020-10-25 15:38:23', '2020-10-12 14:59:10');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (47, 'perferendis', '2020-10-29 11:13:58', '2020-09-11 00:40:18');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (48, 'reprehenderit', '2020-10-15 02:11:12', '2020-05-20 03:55:25');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (49, 'repellendus', '2020-10-19 21:05:47', '2020-02-29 00:29:05');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (50, 'nihil', '2020-11-01 19:38:23', '2020-03-08 23:56:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (51, 'commodi', '2020-10-12 17:32:37', '2019-12-16 07:17:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (52, 'architecto', '2020-11-07 23:56:35', '2020-08-07 12:34:40');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (53, 'dolorum', '2020-11-08 00:15:00', '2019-11-23 10:13:43');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (54, 'sapiente', '2020-10-25 09:52:53', '2020-09-30 20:13:02');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (55, 'possimus', '2020-10-21 16:07:52', '2020-02-12 04:53:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (56, 'explicabo', '2020-10-24 08:29:47', '2020-05-23 12:45:11');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (57, 'culpa', '2020-10-29 17:41:30', '2019-11-16 15:39:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (58, 'autem', '2020-10-13 16:06:42', '2020-10-27 08:11:35');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (59, 'accusamus', '2020-11-06 05:41:24', '2019-12-08 15:12:44');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (60, 'alias', '2020-11-09 04:26:24', '2020-02-05 14:14:26');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (61, 'fugit', '2020-10-24 04:02:06', '2020-03-20 16:01:23');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (62, 'labore', '2020-11-05 02:16:50', '2020-03-22 08:16:01');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (63, 'id', '2020-10-29 23:23:37', '2020-05-09 23:41:18');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (64, 'tenetur', '2020-11-01 04:48:40', '2020-11-06 07:13:31');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (65, 'nam', '2020-11-03 23:05:49', '2019-11-12 17:14:52');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (66, 'laudantium', '2020-10-23 10:36:40', '2020-08-07 23:24:27');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (67, 'dolorem', '2020-11-05 10:54:44', '2020-03-08 22:06:28');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (68, 'sit', '2020-11-10 15:50:06', '2020-07-03 14:29:21');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (69, 'aperiam', '2020-10-27 23:58:39', '2020-10-29 15:39:40');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (70, 'odit', '2020-10-24 05:41:25', '2020-10-28 14:28:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (71, 'temporibus', '2020-11-09 07:42:17', '2020-05-05 13:52:34');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (72, 'consectetur', '2020-11-07 10:47:11', '2020-05-20 02:16:16');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (73, 'nobis', '2020-10-23 12:53:12', '2020-05-12 15:06:47');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (74, 'a', '2020-10-16 04:29:34', '2020-10-22 04:37:29');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (75, 'blanditiis', '2020-11-09 08:09:29', '2020-11-01 20:45:26');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (76, 'vitae', '2020-10-28 18:08:45', '2020-06-03 18:20:14');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (77, 'minus', '2020-10-16 22:50:32', '2019-11-19 12:40:58');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (78, 'atque', '2020-10-22 18:40:47', '2020-09-07 13:40:27');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (79, 'ad', '2020-10-14 05:25:21', '2020-02-03 00:28:07');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (80, 'iste', '2020-10-31 10:28:43', '2019-11-21 17:22:13');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (81, 'exercitationem', '2020-11-02 05:45:10', '2020-02-27 01:30:23');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (82, 'ipsam', '2020-10-29 02:40:31', '2020-06-20 05:34:33');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (83, 'in', '2020-10-15 23:26:58', '2020-08-31 07:39:06');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (84, 'rerum', '2020-10-15 05:01:49', '2020-05-07 01:55:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (85, 'minima', '2020-10-29 23:51:51', '2019-12-11 16:52:36');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (86, 'asperiores', '2020-11-07 20:03:13', '2020-01-20 23:07:09');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (87, 'natus', '2020-10-26 02:41:10', '2020-07-12 16:50:21');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (88, 'adipisci', '2020-10-20 13:04:13', '2020-09-12 20:13:28');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (89, 'harum', '2020-10-17 18:02:58', '2020-02-08 23:07:53');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (90, 'quis', '2020-11-10 20:48:09', '2019-12-27 01:28:24');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (91, 'recusandae', '2020-10-13 22:13:39', '2020-09-04 06:42:15');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (92, 'laborum', '2020-10-14 15:24:29', '2019-11-20 23:10:33');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (93, 'iure', '2020-10-13 03:53:48', '2020-08-29 08:27:18');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (94, 'soluta', '2020-10-17 01:22:59', '2019-12-15 19:35:19');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (95, 'quibusdam', '2020-11-10 22:36:28', '2020-04-19 04:11:20');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (96, 'itaque', '2020-10-20 07:56:32', '2020-10-29 04:34:43');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (97, 'repellat', '2020-10-13 13:48:01', '2020-10-28 23:39:04');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (98, 'tempore', '2020-11-11 13:13:58', '2020-08-03 21:19:55');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (99, 'magnam', '2020-11-09 13:05:09', '2020-11-11 19:00:34');
INSERT INTO `communities` (`id`, `name`, `created_at`, `updated_at`) VALUES (100, 'facilis', '2020-10-28 03:19:39', '2020-02-22 13:34:17');


#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ??????',
  `user_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ????????????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT '????????? ????????? ????'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='????????? ?????, ????? ????? ?????????????? ? ????????';

INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (1, 1, '1985-03-19 20:16:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (2, 2, '1978-04-27 12:01:26');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (3, 3, '2007-06-02 02:21:24');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (4, 4, '1989-02-17 15:48:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (5, 5, '1971-06-22 17:56:03');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (6, 6, '2019-03-08 07:29:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (7, 7, '1982-03-16 12:10:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (8, 8, '2006-06-19 05:52:41');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (9, 9, '1983-07-08 14:25:51');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (10, 10, '1977-03-01 07:30:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (11, 11, '2007-06-25 09:25:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (12, 12, '1982-09-25 11:41:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (13, 13, '2020-01-21 11:46:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (14, 14, '2004-08-19 17:19:37');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (15, 15, '2018-12-16 13:46:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (16, 16, '2006-12-20 18:19:57');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (17, 17, '2017-10-17 00:22:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (18, 18, '2011-12-27 07:09:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (19, 19, '2004-06-02 11:03:18');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (20, 20, '1992-08-21 07:52:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (21, 21, '2005-09-13 08:03:39');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (22, 22, '2003-06-22 02:15:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (23, 23, '2019-05-19 05:32:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (24, 24, '2010-10-02 05:08:41');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (25, 25, '2017-01-24 04:15:37');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (26, 26, '1977-12-16 20:04:53');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (27, 27, '2002-12-15 09:20:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (28, 28, '1982-12-18 00:25:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (29, 29, '1971-02-02 01:15:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (30, 30, '1986-04-04 05:59:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (31, 31, '1970-03-27 00:26:18');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (32, 32, '1972-12-07 08:17:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (33, 33, '1986-02-04 13:30:41');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (34, 34, '1997-08-29 09:54:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (35, 35, '2005-02-18 11:38:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (36, 36, '1988-09-27 10:38:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (37, 37, '2012-08-15 19:26:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (38, 38, '1971-04-28 23:59:47');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (39, 39, '2011-03-24 03:29:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (40, 40, '1994-09-10 07:58:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (41, 41, '1988-11-11 08:03:17');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (42, 42, '2004-01-30 22:51:54');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (43, 43, '1974-02-10 22:21:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (44, 44, '1994-07-21 14:52:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (45, 45, '2005-01-13 12:44:16');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (46, 46, '2005-10-27 05:36:34');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (47, 47, '2002-04-10 13:30:40');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (48, 48, '2006-06-10 20:02:54');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (49, 49, '2007-07-18 21:31:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (50, 50, '1989-02-22 01:22:30');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (51, 51, '2001-06-27 10:44:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (52, 52, '1982-01-02 02:57:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (53, 53, '1997-03-06 02:03:52');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (54, 54, '2013-06-23 08:59:02');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (55, 55, '1976-09-28 21:36:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (56, 56, '1985-11-12 18:20:31');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (57, 57, '1984-04-01 18:51:43');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (58, 58, '2019-09-28 11:24:26');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (59, 59, '2013-12-20 14:40:25');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (60, 60, '2018-07-24 01:24:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (61, 61, '2013-06-18 12:54:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (62, 62, '2020-11-07 08:02:03');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (63, 63, '2002-08-03 00:47:46');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (64, 64, '2004-12-04 14:02:11');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (65, 65, '2020-04-17 15:56:12');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (66, 66, '1993-04-25 05:00:58');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (67, 67, '1976-12-05 15:30:35');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (68, 68, '2004-09-10 23:56:28');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (69, 69, '2018-09-24 18:44:02');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (70, 70, '1985-02-22 13:44:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (71, 71, '1987-02-28 18:20:21');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (72, 72, '2015-07-06 12:56:19');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (73, 73, '2002-07-04 14:43:56');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (74, 74, '1978-07-28 08:19:22');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (75, 75, '2000-04-13 16:19:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (76, 76, '1998-04-03 15:06:38');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (77, 77, '1981-02-18 08:01:59');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (78, 78, '1982-12-29 11:07:57');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (79, 79, '2011-03-10 20:14:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (80, 80, '2016-08-28 06:26:13');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (81, 81, '1973-03-15 00:25:04');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (82, 82, '1984-12-05 17:35:01');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (83, 83, '2010-09-21 14:26:07');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (84, 84, '2004-11-03 14:54:02');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (85, 85, '1991-01-21 16:00:28');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (86, 86, '2008-10-15 22:05:41');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (87, 87, '1995-05-01 10:48:50');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (88, 88, '2016-05-05 15:02:18');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (89, 89, '1970-05-14 21:44:33');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (90, 90, '1991-07-23 09:30:00');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (91, 91, '2006-11-29 12:58:41');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (92, 92, '2000-12-07 00:36:13');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (93, 93, '1992-03-03 03:44:08');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (94, 94, '1983-10-11 10:05:33');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (95, 95, '2014-03-22 10:14:27');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (96, 96, '1991-11-12 18:24:32');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (97, 97, '1977-08-20 20:54:36');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (98, 98, '1987-08-08 11:41:15');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (99, 99, '1989-10-07 03:38:29');
INSERT INTO `communities_users` (`community_id`, `user_id`, `created_at`) VALUES (100, 100, '2000-11-06 14:27:50');


#
# TABLE STRUCTURE FOR: friendship
#

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ?????????? ????????? ?????????',
  `friend_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ?????????? ??????????? ???????',
  `status_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ?????? (??????? ?????????) ?????????',
  `requested_at` datetime DEFAULT current_timestamp() COMMENT '????? ??????????? ??????????? ???????',
  `confirmed_at` datetime DEFAULT NULL COMMENT '????? ????????????? ???????????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT '????????? ????????? ????'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='??????? ??????';

INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (1, 1, 1, '1974-09-16 16:35:13', '1996-12-02 01:11:08', '2020-10-28 16:31:53', '2020-01-08 10:04:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (2, 2, 2, '2013-04-09 14:14:06', '1975-01-29 22:13:02', '2020-11-01 22:38:22', '2020-07-06 15:28:01');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (3, 3, 3, '1993-10-21 23:33:32', '1994-04-05 03:47:16', '2020-11-10 00:28:21', '2020-11-11 23:43:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (4, 4, 1, '1981-11-19 15:03:41', '1981-11-24 06:58:35', '2020-10-15 00:28:59', '2019-11-25 03:23:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (5, 5, 2, '2002-12-10 12:32:11', '1985-02-13 00:28:40', '2020-11-01 22:34:50', '2020-10-03 20:32:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (6, 6, 3, '1975-09-03 15:54:52', '2002-07-18 22:07:37', '2020-11-11 02:25:01', '2020-06-18 03:06:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (7, 7, 1, '2015-10-11 09:35:01', '2015-10-23 18:08:43', '2020-10-20 19:39:23', '2020-08-22 10:04:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (8, 8, 2, '2015-05-19 10:59:44', '1984-10-09 15:49:53', '2020-11-04 09:20:44', '2020-01-29 20:13:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (9, 9, 3, '1984-05-14 13:33:06', '1979-06-13 06:06:17', '2020-11-03 08:35:52', '2019-11-12 17:15:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (10, 10, 1, '1993-08-13 18:25:45', '2000-08-20 14:28:52', '2020-11-12 00:19:37', '2020-01-06 13:02:41');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (11, 11, 2, '1976-07-19 05:07:59', '1973-04-11 20:36:44', '2020-10-26 00:06:35', '2020-02-03 15:28:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (12, 12, 3, '2008-06-02 17:29:29', '2003-05-06 14:24:58', '2020-10-14 20:59:10', '2020-01-31 22:02:06');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (13, 13, 1, '1990-06-08 22:46:40', '1978-08-07 00:23:24', '2020-10-25 18:28:07', '2020-03-17 02:23:51');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (14, 14, 2, '1972-08-26 19:55:25', '2014-03-03 13:36:25', '2020-11-06 03:09:45', '2020-09-11 04:39:50');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (15, 15, 3, '1970-08-16 21:33:31', '1999-07-31 10:16:15', '2020-11-07 21:07:10', '2020-07-14 05:15:40');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (16, 16, 1, '1996-02-17 20:08:28', '1997-01-01 08:14:52', '2020-10-22 18:53:47', '2019-12-13 22:02:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (17, 17, 2, '1970-10-25 03:59:39', '2011-07-15 05:54:17', '2020-11-04 14:14:16', '2020-05-13 11:23:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (18, 18, 3, '1995-05-12 15:06:14', '1999-10-14 17:34:04', '2020-11-04 15:01:23', '2020-03-22 21:58:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (19, 19, 1, '1982-05-22 05:02:51', '1974-04-16 17:54:14', '2020-10-30 20:31:02', '2020-06-15 11:45:08');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (20, 20, 2, '1994-06-03 19:25:41', '1996-06-18 00:38:55', '2020-11-07 14:08:19', '2020-02-28 17:01:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (21, 21, 3, '1972-08-31 21:44:27', '1985-06-09 16:50:16', '2020-11-01 20:05:05', '2020-10-16 05:51:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (22, 22, 1, '2017-02-09 10:25:14', '2003-04-18 18:57:01', '2020-10-15 19:58:55', '2020-02-19 10:54:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (23, 23, 2, '2016-03-03 11:02:41', '2015-12-02 09:14:03', '2020-11-12 05:36:58', '2020-10-10 09:14:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (24, 24, 3, '2017-12-24 08:32:19', '1976-05-15 15:01:53', '2020-10-30 00:17:07', '2020-05-05 19:15:27');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (25, 25, 1, '1971-11-27 08:59:48', '2015-11-08 23:34:08', '2020-11-08 08:33:58', '2020-11-02 08:00:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (26, 26, 2, '1981-09-10 12:29:20', '1975-05-13 19:47:19', '2020-11-05 04:52:14', '2020-04-28 10:27:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (27, 27, 3, '1985-08-23 20:16:44', '2014-05-23 11:25:52', '2020-11-10 19:44:12', '2020-01-06 00:57:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (28, 28, 1, '1999-08-22 15:37:43', '1984-08-03 19:16:00', '2020-10-24 03:46:08', '2019-12-13 02:18:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (29, 29, 2, '1997-01-05 11:20:22', '1983-06-12 09:18:34', '2020-11-05 08:53:57', '2020-01-22 09:03:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (30, 30, 3, '1998-04-24 01:16:53', '1997-09-21 00:53:39', '2020-10-13 13:13:48', '2020-07-12 01:45:17');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (31, 31, 1, '1986-01-13 10:35:54', '2008-05-26 07:58:38', '2020-10-30 04:16:37', '2020-10-20 04:11:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (32, 32, 2, '2010-06-06 22:03:10', '2001-01-03 14:35:41', '2020-11-08 18:06:01', '2020-05-01 11:20:52');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (33, 33, 3, '2006-03-03 23:55:16', '2020-08-06 12:18:36', '2020-10-14 19:45:49', '2020-08-06 00:00:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (34, 34, 1, '2001-07-10 07:03:44', '2005-03-24 22:22:36', '2020-11-09 09:05:02', '2020-01-27 06:55:58');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (35, 35, 2, '1997-12-02 08:22:18', '1972-01-06 12:59:16', '2020-10-27 11:37:42', '2020-06-16 05:26:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (36, 36, 3, '1996-04-05 21:30:01', '1975-07-01 11:20:24', '2020-11-03 11:29:31', '2020-04-22 22:50:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (37, 37, 1, '2020-07-07 02:14:02', '2014-11-20 15:55:25', '2020-10-17 06:45:20', '2020-05-22 23:52:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (38, 38, 2, '1981-03-29 22:25:30', '1987-03-15 20:34:26', '2020-10-14 09:45:06', '2020-07-07 01:51:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (39, 39, 3, '2001-04-23 21:35:25', '2012-12-19 13:26:21', '2020-10-22 15:48:03', '2020-09-07 02:45:26');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (40, 40, 1, '1996-07-30 05:11:56', '1981-03-11 23:39:17', '2020-10-27 12:33:37', '2020-06-29 12:07:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (41, 41, 2, '1988-04-03 20:22:52', '1973-07-29 00:52:49', '2020-11-02 08:07:52', '2020-05-01 02:19:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (42, 42, 3, '2016-12-30 22:18:50', '2020-08-05 14:25:16', '2020-10-29 14:28:38', '2020-03-23 23:30:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (43, 43, 1, '2015-08-01 20:33:02', '1980-10-19 20:07:33', '2020-11-11 03:12:35', '2020-02-19 03:58:05');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (44, 44, 2, '2015-02-06 06:47:05', '1988-11-25 13:08:48', '2020-10-29 00:33:00', '2020-04-25 20:08:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (45, 45, 3, '2002-11-16 09:30:29', '1992-06-17 18:51:17', '2020-11-02 23:10:21', '2020-05-07 04:53:09');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (46, 46, 1, '1979-07-25 05:00:53', '1995-05-10 03:48:05', '2020-10-20 08:41:58', '2020-03-21 13:30:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (47, 47, 2, '1985-09-26 07:25:41', '2017-03-29 01:45:28', '2020-11-07 11:29:32', '2020-08-10 19:10:59');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (48, 48, 3, '2004-08-24 07:19:32', '1986-12-10 09:20:29', '2020-10-23 02:29:58', '2020-05-09 07:35:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (49, 49, 1, '1983-09-09 00:39:31', '1974-02-02 21:40:02', '2020-11-09 10:47:36', '2020-03-08 17:56:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (50, 50, 2, '1978-01-26 02:45:58', '1991-03-01 20:51:16', '2020-10-22 00:07:45', '2020-02-01 07:53:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (51, 51, 3, '1980-06-09 00:43:36', '1971-07-11 15:08:31', '2020-11-10 00:58:50', '2020-07-29 09:34:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (52, 52, 1, '1975-10-19 23:48:40', '1977-06-29 14:39:15', '2020-10-23 23:01:55', '2020-01-12 01:52:04');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (53, 53, 2, '2015-07-26 17:54:29', '1992-08-31 19:03:58', '2020-10-13 14:15:56', '2020-01-29 23:21:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (54, 54, 3, '1985-05-20 10:50:17', '2008-12-07 13:53:59', '2020-10-21 08:11:06', '2020-05-15 18:25:37');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (55, 55, 1, '1977-03-29 20:16:42', '1998-10-18 04:08:19', '2020-11-03 14:56:39', '2020-03-08 13:16:30');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (56, 56, 2, '2001-11-06 02:47:37', '1970-06-30 06:30:56', '2020-11-03 12:33:33', '2020-09-09 02:31:54');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (57, 57, 3, '1990-02-01 18:13:43', '1993-03-31 23:16:27', '2020-10-17 23:32:18', '2020-03-21 04:00:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (58, 58, 1, '1985-09-27 04:27:15', '1980-11-03 14:42:19', '2020-10-29 11:33:17', '2019-12-08 15:10:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (59, 59, 2, '1999-05-11 17:44:11', '1979-04-21 20:34:09', '2020-10-26 10:43:33', '2020-02-08 08:20:52');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (60, 60, 3, '1998-06-24 03:36:04', '1986-10-06 23:26:21', '2020-10-13 19:36:14', '2019-12-10 19:43:33');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (61, 61, 1, '2014-07-02 05:29:34', '2008-02-01 11:17:24', '2020-10-31 23:59:29', '2020-03-05 17:59:11');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (62, 62, 2, '2004-06-27 10:26:58', '1977-12-17 10:26:56', '2020-11-11 07:16:56', '2020-03-26 12:01:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (63, 63, 3, '1988-01-18 15:24:28', '1998-02-06 20:53:29', '2020-10-23 16:45:08', '2020-10-10 14:03:00');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (64, 64, 1, '1979-05-12 00:04:51', '2000-09-22 01:26:30', '2020-10-31 21:45:32', '2020-04-26 06:33:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (65, 65, 2, '2009-01-02 09:55:40', '1970-05-25 07:49:03', '2020-10-28 06:25:23', '2020-04-24 05:15:16');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (66, 66, 3, '2016-08-27 15:13:08', '1979-01-23 09:51:14', '2020-10-17 08:49:16', '2020-01-09 13:53:43');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (67, 67, 1, '1977-02-03 03:08:44', '1976-08-01 01:49:20', '2020-10-23 22:08:09', '2020-08-08 16:42:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (68, 68, 2, '2010-03-18 14:28:12', '1999-12-20 18:51:09', '2020-10-25 04:08:15', '2020-10-27 20:43:09');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (69, 69, 3, '1996-06-22 03:02:45', '1987-01-07 03:09:13', '2020-10-31 13:59:49', '2020-03-13 13:43:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (70, 70, 1, '1978-06-17 09:40:39', '1970-01-12 04:50:47', '2020-10-19 21:32:40', '2020-04-05 07:17:02');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (71, 71, 2, '1988-10-10 05:37:56', '1991-08-07 16:55:03', '2020-11-02 06:33:37', '2020-07-09 14:40:38');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (72, 72, 3, '1989-06-03 23:30:17', '2003-01-01 18:45:48', '2020-10-20 13:29:59', '2019-12-01 11:26:34');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (73, 73, 1, '1973-09-20 17:11:33', '1996-02-10 19:14:52', '2020-11-07 16:40:30', '2020-01-23 23:32:49');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (74, 74, 2, '2004-07-21 16:13:38', '2002-07-16 19:58:54', '2020-11-01 18:53:55', '2020-02-01 05:37:48');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (75, 75, 3, '1993-10-18 16:21:26', '1996-04-18 04:16:03', '2020-10-26 05:50:05', '2019-12-29 15:45:47');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (76, 76, 1, '1978-03-10 09:26:43', '1986-03-14 09:15:09', '2020-10-21 20:43:53', '2019-12-31 13:14:20');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (77, 77, 2, '1992-05-21 16:31:16', '1987-09-02 15:58:34', '2020-10-28 11:34:49', '2020-10-25 21:59:28');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (78, 78, 3, '2015-03-12 17:03:04', '1986-07-29 08:43:20', '2020-11-08 17:31:27', '2019-11-14 17:53:24');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (79, 79, 1, '2005-06-11 07:25:26', '1977-11-30 19:01:57', '2020-10-13 18:37:02', '2020-06-26 02:12:45');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (80, 80, 2, '2008-08-26 00:47:24', '1974-07-02 01:16:22', '2020-11-02 11:10:03', '2020-04-04 08:35:23');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (81, 81, 3, '2011-04-25 22:26:54', '1977-06-18 05:40:25', '2020-10-23 15:53:08', '2020-09-26 08:47:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (82, 82, 1, '1999-12-14 13:39:33', '1985-02-20 07:57:07', '2020-10-24 07:59:10', '2019-11-19 06:27:32');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (83, 83, 2, '1972-04-20 11:02:24', '1990-07-12 09:21:37', '2020-11-09 18:39:08', '2020-04-29 23:48:53');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (84, 84, 3, '1991-03-03 05:18:10', '2010-08-21 12:25:46', '2020-11-07 20:46:24', '2020-01-24 22:27:46');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (85, 85, 1, '2010-01-13 17:11:08', '2014-07-12 02:37:57', '2020-11-10 21:42:35', '2020-06-14 00:37:22');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (86, 86, 2, '1979-07-07 17:02:54', '1976-08-20 02:09:52', '2020-10-30 10:13:19', '2020-05-29 12:57:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (87, 87, 3, '1999-02-21 15:04:08', '2009-10-01 11:32:59', '2020-11-07 10:32:11', '2020-11-09 08:46:44');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (88, 88, 1, '2008-10-09 13:56:26', '1988-02-11 20:32:09', '2020-10-24 10:01:08', '2020-03-15 20:11:18');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (89, 89, 2, '1997-09-20 04:32:32', '1987-07-20 16:23:58', '2020-10-27 17:59:38', '2020-06-28 10:37:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (90, 90, 3, '2018-09-23 01:28:22', '1981-07-03 18:31:03', '2020-10-30 03:46:36', '2020-02-16 03:58:03');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (91, 91, 1, '1997-06-10 04:39:40', '2017-04-26 07:03:33', '2020-10-27 11:51:16', '2020-03-24 19:51:55');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (92, 92, 2, '1984-12-11 20:11:28', '1995-08-26 20:59:47', '2020-10-17 00:38:44', '2019-11-16 05:41:12');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (93, 93, 3, '2012-10-16 15:49:05', '2002-03-28 08:19:22', '2020-11-09 17:36:18', '2020-03-03 07:02:31');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (94, 94, 1, '1987-05-20 02:32:24', '1995-03-31 16:13:59', '2020-11-07 06:56:31', '2020-01-02 21:48:07');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (95, 95, 2, '2002-05-29 22:17:21', '1998-07-08 20:04:19', '2020-10-29 00:50:48', '2020-05-18 00:45:10');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (96, 96, 3, '1988-05-14 22:32:31', '1998-02-04 11:12:56', '2020-10-27 17:44:02', '2020-04-26 18:35:15');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (97, 97, 1, '2014-08-16 16:53:08', '1984-05-29 06:52:31', '2020-10-20 10:03:52', '2020-09-24 15:07:19');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (98, 98, 2, '2001-04-10 08:37:41', '1988-08-15 07:22:12', '2020-11-04 15:59:33', '2020-01-24 05:08:14');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (99, 99, 3, '1972-12-24 23:03:50', '1972-12-24 08:32:51', '2020-11-01 06:50:54', '2019-11-30 19:01:56');
INSERT INTO `friendship` (`user_id`, `friend_id`, `status_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`) VALUES (100, 100, 1, '1992-10-07 02:20:32', '2015-08-31 10:34:14', '2020-11-04 14:49:24', '2020-02-11 05:47:16');


#
# TABLE STRUCTURE FOR: friendship_statuses
#

DROP TABLE IF EXISTS `friendship_statuses`;

CREATE TABLE `friendship_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????? ??????',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '???????? ???????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='??????? ??????';

INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'magni', '2017-06-29 02:43:54', '2020-07-25 13:40:19');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'cum', '2019-07-23 06:31:58', '2020-04-27 08:56:02');
INSERT INTO `friendship_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'deleniti', '2017-02-02 21:31:21', '2020-03-11 16:06:53');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????? ??????',
  `user_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ????????????, ??????? ???????? ????',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '???? ? ?????',
  `size` int(11) NOT NULL COMMENT '?????? ?????',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '?????????? ?????' CHECK (json_valid(`metadata`)),
  `media_type_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ??? ????????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='??????????';

INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (1, 1, 'nihil', 26360, NULL, 1, '2020-02-29 03:40:26', '2017-01-20 07:11:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (2, 2, 'impedit', 0, NULL, 2, '2020-10-31 04:01:29', '2014-09-16 06:58:00');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (3, 3, 'et', 600559598, NULL, 3, '2019-11-15 17:22:28', '2010-12-25 02:55:33');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (4, 4, 'quam', 137625, NULL, 4, '2020-07-08 04:09:46', '2012-04-13 22:29:16');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (5, 5, 'asperiores', 3, NULL, 1, '2020-01-02 08:10:43', '2015-07-12 08:51:50');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (6, 6, 'corrupti', 13816575, NULL, 2, '2020-04-06 21:43:54', '2012-05-30 06:58:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (7, 7, 'natus', 9896702, NULL, 3, '2020-10-22 18:58:28', '2016-05-04 00:52:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (8, 8, 'dicta', 0, NULL, 4, '2020-05-26 00:15:43', '2014-11-19 04:39:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (9, 9, 'at', 40, NULL, 1, '2020-10-13 16:38:39', '2011-02-06 01:42:16');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (10, 10, 'enim', 36615, NULL, 1, '2020-06-10 03:59:16', '2012-08-05 00:19:27');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (11, 11, 'dolorum', 6473973, NULL, 3, '2020-01-17 04:40:13', '2012-10-01 04:40:33');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (12, 12, 'ut', 4, NULL, 4, '2019-11-17 15:46:01', '2019-01-25 11:21:20');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (13, 13, 'ipsam', 7053, NULL, 4, '2020-02-19 20:33:57', '2017-06-12 16:12:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (14, 14, 'aut', 93208, NULL, 2, '2020-03-11 06:51:17', '2014-10-31 23:59:58');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (15, 15, 'exercitationem', 4, NULL, 1, '2019-12-13 22:19:32', '2011-10-27 11:31:38');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (16, 16, 'impedit', 6103983, NULL, 2, '2019-11-24 18:05:54', '2016-03-29 17:18:03');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (17, 17, 'in', 2, NULL, 3, '2020-05-09 05:41:31', '2013-01-02 02:43:51');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (18, 18, 'sit', 0, NULL, 1, '2020-07-18 07:25:00', '2020-10-25 02:55:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (19, 19, 'nobis', 4585, NULL, 4, '2020-07-29 16:29:58', '2019-09-28 00:45:08');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (20, 20, 'porro', 52674790, NULL, 3, '2020-11-07 05:12:21', '2018-11-28 19:43:50');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (21, 21, 'consequatur', 99530476, NULL, 2, '2020-06-10 10:35:23', '2013-06-07 10:24:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (22, 22, 'qui', 753, NULL, 2, '2020-11-01 23:54:20', '2012-12-17 23:34:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (23, 23, 'ipsa', 0, NULL, 1, '2020-07-05 08:32:14', '2011-08-06 14:32:17');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (24, 24, 'hic', 75, NULL, 1, '2020-09-05 11:56:19', '2015-02-04 18:32:17');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (25, 25, 'similique', 77773756, NULL, 4, '2019-12-20 06:08:23', '2018-06-07 00:14:16');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (26, 26, 'esse', 685, NULL, 4, '2020-08-27 17:39:27', '2013-06-19 07:16:27');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (27, 27, 'dolores', 0, NULL, 2, '2020-05-10 07:12:42', '2020-07-22 05:48:46');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (28, 28, 'qui', 4, NULL, 2, '2020-08-29 13:57:19', '2020-10-30 00:27:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (29, 29, 'vitae', 5936757, NULL, 3, '2020-06-20 02:34:08', '2015-05-21 11:33:35');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (30, 30, 'ipsum', 3, NULL, 4, '2020-06-11 02:18:43', '2018-03-22 13:36:43');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (31, 31, 'distinctio', 65, NULL, 4, '2020-07-09 09:57:27', '2019-04-03 14:05:16');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (32, 32, 'cum', 460, NULL, 1, '2020-02-14 01:33:24', '2011-07-30 10:13:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (33, 33, 'sed', 92277, NULL, 1, '2019-11-26 12:00:53', '2014-07-19 21:31:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (34, 34, 'quo', 6073808, NULL, 4, '2019-12-31 21:00:36', '2020-09-29 23:50:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (35, 35, 'sequi', 49586595, NULL, 4, '2020-11-03 23:20:53', '2012-03-26 12:17:05');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (36, 36, 'facere', 1, NULL, 2, '2019-11-17 16:06:07', '2012-02-29 03:28:36');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (37, 37, 'maxime', 286, NULL, 3, '2020-01-25 17:50:59', '2013-01-02 23:32:36');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (38, 38, 'voluptatem', 5311, NULL, 3, '2020-04-20 19:12:02', '2015-07-07 12:07:10');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (39, 39, 'consequatur', 9548176, NULL, 3, '2020-06-15 04:38:36', '2013-03-24 19:15:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (40, 40, 'cum', 944, NULL, 4, '2019-12-28 15:35:41', '2018-03-03 19:33:25');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (41, 41, 'ea', 569898602, NULL, 4, '2019-12-21 00:44:33', '2017-11-05 04:05:08');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (42, 42, 'velit', 9660, NULL, 4, '2020-05-09 16:52:34', '2020-10-30 11:58:21');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (43, 43, 'esse', 5, NULL, 4, '2019-12-29 14:28:58', '2011-01-14 21:55:29');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (44, 44, 'placeat', 0, NULL, 4, '2020-03-06 05:36:59', '2015-04-22 23:12:24');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (45, 45, 'aut', 79775014, NULL, 4, '2020-11-12 03:22:11', '2013-11-21 21:54:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (46, 46, 'nemo', 0, NULL, 4, '2019-11-16 02:34:42', '2020-05-04 02:15:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (47, 47, 'officia', 27198, NULL, 4, '2020-02-08 23:02:04', '2016-04-24 13:33:32');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (48, 48, 'quaerat', 734, NULL, 4, '2020-08-10 15:04:48', '2013-04-10 18:59:20');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (49, 49, 'sed', 9639, NULL, 4, '2020-11-01 01:13:47', '2015-07-07 16:31:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (50, 50, 'rerum', 13, NULL, 1, '2020-04-25 09:02:05', '2013-07-10 07:06:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (51, 51, 'sapiente', 867359039, NULL, 1, '2020-01-16 05:11:39', '2012-04-08 20:43:51');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (52, 52, 'inventore', 11833555, NULL, 2, '2020-08-11 05:55:13', '2011-12-30 03:07:36');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (53, 53, 'omnis', 227054, NULL, 3, '2020-03-23 04:39:02', '2012-05-06 09:10:04');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (54, 54, 'nisi', 393146, NULL, 4, '2020-09-10 19:13:39', '2011-10-26 18:58:06');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (55, 55, 'qui', 96, NULL, 1, '2020-05-04 05:51:11', '2018-12-20 01:29:51');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (56, 56, 'sint', 105025, NULL, 2, '2020-03-12 10:33:49', '2016-05-10 14:56:22');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (57, 57, 'molestiae', 47612, NULL, 3, '2020-08-08 18:17:16', '2017-05-25 19:35:48');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (58, 58, 'et', 3603, NULL, 4, '2020-09-24 23:12:50', '2018-12-01 22:37:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (59, 59, 'est', 47, NULL, 1, '2019-11-19 05:48:29', '2019-07-10 06:03:15');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (60, 60, 'voluptatibus', 86750607, NULL, 2, '2020-05-28 19:44:40', '2012-01-28 09:23:05');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (61, 61, 'culpa', 2701094, NULL, 3, '2020-02-03 13:20:18', '2020-04-16 03:58:20');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (62, 62, 'placeat', 426383684, NULL, 4, '2020-07-22 19:08:42', '2011-07-13 07:21:27');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (63, 63, 'in', 97110472, NULL, 3, '2020-04-21 18:52:17', '2018-07-17 08:25:40');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (64, 64, 'rerum', 39702960, NULL, 4, '2020-06-22 05:07:09', '2020-08-02 22:51:34');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (65, 65, 'fuga', 33, NULL, 2, '2020-01-15 15:39:35', '2015-01-17 23:54:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (66, 66, 'ratione', 0, NULL, 1, '2020-10-05 02:30:43', '2011-08-05 13:04:39');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (67, 67, 'consequatur', 7461450, NULL, 4, '2020-04-25 11:54:33', '2012-12-05 11:26:29');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (68, 68, 'aut', 171247198, NULL, 3, '2020-05-23 14:38:16', '2011-08-02 15:14:27');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (69, 69, 'culpa', 913, NULL, 3, '2020-08-14 18:18:33', '2018-02-24 19:10:31');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (70, 70, 'itaque', 9986281, NULL, 1, '2020-04-09 23:56:17', '2017-01-02 06:16:29');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (71, 71, 'velit', 438, NULL, 1, '2020-10-03 16:06:48', '2013-05-19 22:23:54');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (72, 72, 'delectus', 5594, NULL, 2, '2020-07-02 14:48:06', '2013-09-04 04:04:59');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (73, 73, 'laboriosam', 5689, NULL, 3, '2019-11-13 03:49:21', '2015-05-09 00:59:10');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (74, 74, 'fugit', 2104987, NULL, 4, '2020-05-10 11:18:46', '2014-11-24 23:35:43');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (75, 75, 'et', 4, NULL, 1, '2020-04-13 04:51:11', '2017-08-23 09:22:07');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (76, 76, 'deserunt', 19, NULL, 1, '2020-06-16 01:08:01', '2013-03-20 15:50:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (77, 77, 'quia', 32872992, NULL, 2, '2020-04-20 10:04:14', '2020-01-26 17:57:28');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (78, 78, 'ex', 352985, NULL, 2, '2019-12-25 04:47:00', '2013-03-10 09:42:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (79, 79, 'velit', 0, NULL, 2, '2019-12-27 04:56:35', '2016-11-28 07:09:19');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (80, 80, 'nostrum', 62691, NULL, 4, '2020-08-28 07:09:47', '2018-08-12 01:51:32');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (81, 81, 'quam', 264000, NULL, 1, '2020-06-25 09:05:16', '2017-06-04 19:17:55');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (82, 82, 'voluptatem', 0, NULL, 2, '2020-08-03 14:50:57', '2014-08-27 14:44:16');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (83, 83, 'sed', 338542, NULL, 3, '2020-08-31 18:01:06', '2014-03-17 13:15:12');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (84, 84, 'neque', 80, NULL, 4, '2020-01-06 04:03:41', '2015-09-26 20:23:30');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (85, 85, 'velit', 840057, NULL, 2, '2020-07-06 12:51:57', '2016-09-29 05:21:18');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (86, 86, 'maxime', 57127539, NULL, 2, '2020-09-22 19:58:53', '2014-09-13 15:47:57');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (87, 87, 'ut', 0, NULL, 1, '2020-09-23 04:18:51', '2011-03-08 09:28:47');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (88, 88, 'vitae', 0, NULL, 4, '2020-01-04 14:06:57', '2019-03-20 04:46:15');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (89, 89, 'et', 794337419, NULL, 1, '2020-10-19 02:15:19', '2013-06-18 12:31:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (90, 90, 'in', 0, NULL, 4, '2019-11-25 08:35:31', '2019-12-13 10:04:44');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (91, 91, 'nostrum', 217835, NULL, 1, '2020-11-01 21:15:21', '2013-04-01 08:10:37');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (92, 92, 'similique', 53, NULL, 2, '2019-11-16 16:09:55', '2019-01-18 15:54:20');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (93, 93, 'deleniti', 57966, NULL, 3, '2019-12-08 11:16:10', '2016-03-31 06:57:26');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (94, 94, 'ex', 9612420, NULL, 4, '2020-10-20 19:12:14', '2012-11-22 08:09:08');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (95, 95, 'sed', 53, NULL, 1, '2019-12-01 02:54:29', '2016-06-23 02:42:11');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (96, 96, 'incidunt', 801, NULL, 2, '2020-04-29 13:29:46', '2014-01-08 10:11:19');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (97, 97, 'autem', 196483446, NULL, 3, '2020-01-22 10:45:48', '2017-05-07 07:47:42');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (98, 98, 'laudantium', 9, NULL, 4, '2020-05-08 20:38:23', '2016-08-19 04:48:13');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (99, 99, 'inventore', 258771238, NULL, 1, '2020-02-22 20:18:41', '2014-04-06 14:09:15');
INSERT INTO `media` (`id`, `user_id`, `filename`, `size`, `metadata`, `media_type_id`, `created_at`, `updated_at`) VALUES (100, 100, 'adipisci', 70490, NULL, 1, '2020-08-01 13:05:42', '2011-07-21 00:02:35');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????? ??????',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '???????? ????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='???? ???????????';

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'video', '2020-11-03 06:48:06', '2019-11-13 00:24:22');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'music', '2020-11-06 02:15:18', '2019-12-30 21:04:17');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'photo', '2020-11-03 04:27:11', '2020-05-02 20:56:52');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'clips', '2020-11-10 01:50:19', '2020-10-01 02:36:42');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????? ??????',
  `from_user_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ??????????? ?????????',
  `to_user_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ?????????? ?????????',
  `body` text COLLATE utf8_unicode_ci NOT NULL COMMENT '????? ?????????',
  `is_important` tinyint(1) DEFAULT NULL COMMENT '??????? ????????',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT '??????? ????????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='?????????';

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (1, 1, 1, 'sint', 0, 1, '1988-03-14 01:02:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (2, 2, 2, 'vero', 0, 1, '2019-06-26 14:35:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (3, 3, 3, 'amet', 0, 1, '2000-08-03 14:41:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (4, 4, 4, 'nobis', 1, 1, '1993-02-07 14:39:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (5, 5, 5, 'sint', 0, 0, '2018-03-29 06:39:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (6, 6, 6, 'quis', 1, 1, '1990-03-25 12:08:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (7, 7, 7, 'atque', 1, 1, '2002-01-29 04:16:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (8, 8, 8, 'et', 0, 1, '2000-03-15 14:37:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (9, 9, 9, 'velit', 1, 0, '1984-10-31 22:57:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (10, 10, 10, 'dignissimos', 1, 1, '2014-04-20 18:06:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (11, 11, 11, 'et', 1, 1, '2005-10-25 23:47:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (12, 12, 12, 'ut', 0, 1, '2003-03-21 09:18:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (13, 13, 13, 'commodi', 0, 0, '1985-02-05 16:35:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (14, 14, 14, 'delectus', 1, 1, '1970-03-17 15:39:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (15, 15, 15, 'nisi', 0, 1, '2015-04-24 16:48:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (16, 16, 16, 'dolorum', 1, 1, '2019-06-28 20:31:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (17, 17, 17, 'consectetur', 1, 1, '1993-05-02 04:24:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (18, 18, 18, 'accusantium', 1, 0, '1986-05-09 10:29:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (19, 19, 19, 'enim', 1, 1, '1981-06-15 01:26:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (20, 20, 20, 'doloribus', 1, 0, '1999-02-08 01:43:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (21, 21, 21, 'sint', 1, 0, '2014-04-14 04:43:42');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (22, 22, 22, 'pariatur', 1, 0, '1993-11-26 03:25:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (23, 23, 23, 'dolore', 1, 0, '2007-05-15 06:04:42');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (24, 24, 24, 'quia', 1, 1, '1977-04-04 13:41:37');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (25, 25, 25, 'fuga', 0, 0, '2009-03-24 06:13:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (26, 26, 26, 'molestiae', 0, 1, '1973-07-18 16:55:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (27, 27, 27, 'sit', 1, 0, '2008-07-13 19:15:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (28, 28, 28, 'perferendis', 1, 0, '2011-01-13 11:16:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (29, 29, 29, 'et', 0, 0, '1971-07-15 10:50:56');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (30, 30, 30, 'quae', 0, 0, '1999-07-27 08:02:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (31, 31, 31, 'ut', 0, 0, '2009-05-07 11:24:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (32, 32, 32, 'sunt', 1, 0, '1979-10-01 08:55:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (33, 33, 33, 'expedita', 1, 1, '2011-09-11 12:17:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (34, 34, 34, 'qui', 0, 0, '2012-01-06 13:28:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (35, 35, 35, 'ut', 0, 0, '1978-11-28 07:34:30');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (36, 36, 36, 'ab', 0, 0, '1978-10-07 06:34:41');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (37, 37, 37, 'officiis', 1, 0, '1983-11-24 05:17:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (38, 38, 38, 'nihil', 0, 0, '1993-01-07 19:28:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (39, 39, 39, 'ut', 1, 0, '1981-12-31 23:19:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (40, 40, 40, 'tempore', 1, 1, '1990-07-10 11:37:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (41, 41, 41, 'iusto', 0, 1, '1976-11-22 11:54:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (42, 42, 42, 'veritatis', 1, 0, '1998-12-29 16:04:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (43, 43, 43, 'sint', 0, 0, '1977-06-14 08:16:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (44, 44, 44, 'ea', 0, 0, '1992-12-13 07:54:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (45, 45, 45, 'veniam', 1, 0, '1975-11-07 02:48:51');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (46, 46, 46, 'enim', 0, 1, '2016-10-18 01:20:34');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (47, 47, 47, 'temporibus', 0, 0, '1972-05-30 20:41:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (48, 48, 48, 'qui', 1, 1, '2015-07-28 04:08:19');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (49, 49, 49, 'quae', 1, 0, '1999-03-01 14:08:11');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (50, 50, 50, 'nobis', 0, 0, '2004-08-25 23:54:49');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (51, 51, 51, 'ea', 1, 0, '2001-07-19 10:46:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (52, 52, 52, 'suscipit', 1, 0, '1984-03-19 07:31:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (53, 53, 53, 'sed', 1, 1, '2011-10-02 10:45:22');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (54, 54, 54, 'sit', 1, 1, '1995-04-18 04:04:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (55, 55, 55, 'provident', 0, 0, '2003-01-21 05:44:22');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (56, 56, 56, 'cupiditate', 0, 1, '2001-05-22 13:19:41');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (57, 57, 57, 'tenetur', 0, 1, '1999-04-13 20:36:24');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (58, 58, 58, 'aut', 1, 0, '2010-08-16 20:41:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (59, 59, 59, 'dolore', 1, 0, '2000-01-27 13:04:04');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (60, 60, 60, 'voluptatum', 1, 1, '1979-02-15 16:49:23');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (61, 61, 61, 'consequuntur', 1, 1, '1982-10-19 10:15:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (62, 62, 62, 'omnis', 0, 1, '1991-08-21 14:16:49');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (63, 63, 63, 'sit', 1, 1, '1974-12-20 14:22:47');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (64, 64, 64, 'alias', 1, 0, '2012-03-25 23:00:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (65, 65, 65, 'asperiores', 0, 0, '1979-08-26 07:16:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (66, 66, 66, 'officiis', 0, 0, '2019-08-14 23:56:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (67, 67, 67, 'qui', 0, 0, '1987-01-18 03:12:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (68, 68, 68, 'pariatur', 0, 0, '1974-01-08 11:09:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (69, 69, 69, 'et', 1, 1, '2017-07-18 13:27:57');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (70, 70, 70, 'autem', 0, 1, '1978-06-03 16:05:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (71, 71, 71, 'eum', 0, 1, '2015-09-01 15:05:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (72, 72, 72, 'blanditiis', 0, 1, '2013-01-01 02:02:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (73, 73, 73, 'velit', 1, 1, '1978-08-24 22:24:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (74, 74, 74, 'unde', 0, 1, '2010-12-10 14:48:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (75, 75, 75, 'et', 0, 1, '2016-04-04 22:54:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (76, 76, 76, 'sit', 0, 0, '2011-01-07 17:52:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (77, 77, 77, 'sed', 0, 0, '1975-07-12 21:07:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (78, 78, 78, 'quos', 1, 0, '1980-01-30 23:38:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (79, 79, 79, 'voluptas', 0, 0, '2018-01-03 20:35:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (80, 80, 80, 'quidem', 0, 0, '1986-09-21 15:43:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (81, 81, 81, 'ut', 0, 0, '2013-01-05 10:19:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (82, 82, 82, 'eum', 0, 1, '1990-01-05 15:28:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (83, 83, 83, 'rerum', 1, 1, '1972-01-09 01:26:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (84, 84, 84, 'id', 1, 0, '1985-11-02 18:28:39');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (85, 85, 85, 'sit', 0, 1, '1987-06-21 05:38:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (86, 86, 86, 'et', 1, 0, '2016-11-19 20:32:51');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (87, 87, 87, 'excepturi', 0, 0, '1971-03-16 05:51:22');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (88, 88, 88, 'id', 1, 0, '2000-10-11 04:45:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (89, 89, 89, 'error', 1, 0, '1999-03-29 05:26:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (90, 90, 90, 'est', 1, 0, '2017-03-16 16:00:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (91, 91, 91, 'fugiat', 0, 1, '2011-01-05 23:50:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (92, 92, 92, 'amet', 1, 0, '2004-08-24 17:17:54');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (93, 93, 93, 'fugit', 0, 0, '1985-11-11 06:50:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (94, 94, 94, 'et', 0, 1, '1988-03-30 06:12:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (95, 95, 95, 'soluta', 1, 1, '2009-04-14 05:15:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (96, 96, 96, 'excepturi', 1, 1, '1982-11-18 01:18:33');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (97, 97, 97, 'libero', 0, 1, '2011-11-10 20:37:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (98, 98, 98, 'illum', 0, 1, '2011-02-12 06:14:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (99, 99, 99, 'ut', 0, 0, '2016-01-23 07:44:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`) VALUES (100, 100, 100, 'dolorem', 1, 1, '2010-11-26 16:40:01');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT '?????? ?? ????????????',
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '???',
  `birthday` date DEFAULT NULL COMMENT '???? ????????',
  `city` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '????? ??????????',
  `country` varchar(130) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '?????? ??????????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='???????';

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (1, 'P', '1975-06-13', 'Collierhaven', '599', '2020-11-11 12:21:35', '2013-07-12 19:41:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (2, 'M', '2012-01-26', 'Yoshikoview', '453624831', '2020-10-21 02:17:30', '2014-12-28 22:49:10');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (3, 'M', '1986-08-21', 'Port Armandotown', '348990425', '2020-10-14 16:34:49', '2010-11-16 18:06:33');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (4, 'P', '2012-07-09', 'New Millerfurt', '759708520', '2020-10-15 20:02:28', '2014-09-11 17:00:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (5, 'M', '2005-03-01', 'Port Nataliechester', '428590189', '2020-10-18 18:12:04', '2012-12-13 04:16:02');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (6, 'P', '1990-02-10', 'Terenceport', '19811215', '2020-10-14 14:21:57', '2013-12-13 22:21:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (7, 'P', '2010-12-19', 'Kochside', '3144', '2020-11-07 16:05:29', '2012-06-07 04:24:02');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (8, 'D', '1993-06-03', 'Joannyport', '96429730', '2020-10-27 08:35:30', '2014-04-25 20:56:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (9, 'M', '1988-01-27', 'Botsfordhaven', '', '2020-11-07 22:19:25', '2011-10-24 03:39:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (10, 'D', '1981-01-31', 'Millsmouth', '22869913', '2020-10-20 22:09:02', '2012-03-11 03:00:40');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (11, 'P', '1974-03-28', 'Port Harry', '79587', '2020-10-31 09:28:02', '2017-12-31 10:55:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (12, 'M', '1989-04-23', 'Huelstad', '92779709', '2020-10-25 06:10:34', '2013-04-22 09:13:17');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (13, 'M', '2008-06-18', 'Genevievebury', '98031', '2020-11-10 07:09:29', '2019-01-10 23:31:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (14, 'M', '2016-08-08', 'Funkbury', '900769', '2020-11-07 10:36:30', '2018-07-21 07:21:31');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (15, 'M', '1983-08-01', 'Lindsayshire', '527624176', '2020-11-06 12:15:03', '2019-05-25 16:54:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (16, 'P', '2011-05-13', 'Mossiefort', '34229087', '2020-11-12 01:17:39', '2014-06-02 12:39:26');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (17, 'D', '1993-11-30', 'New Gregoria', '452003637', '2020-10-26 22:57:01', '2014-01-09 04:11:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (18, 'M', '1970-09-10', 'Schroederburgh', '90839796', '2020-10-29 11:13:33', '2018-04-11 10:12:23');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (19, 'M', '2001-07-03', 'Port Keltonton', '850280464', '2020-10-16 08:03:12', '2018-08-27 09:55:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (20, 'M', '2011-10-10', 'Walkerland', '2739', '2020-10-31 20:31:34', '2017-05-11 10:35:13');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (21, 'P', '1988-09-16', 'Klockoton', '36312', '2020-11-07 09:24:29', '2014-10-02 15:03:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (22, 'D', '2016-03-23', 'North Ofeliaport', '3351', '2020-10-16 11:11:01', '2012-10-16 16:55:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (23, 'M', '1999-05-09', 'Clotildehaven', '3029975', '2020-10-13 05:03:12', '2012-09-30 04:31:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (24, 'D', '1997-10-27', 'Novellaport', '631271692', '2020-10-12 18:46:11', '2016-01-15 10:29:12');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (25, 'D', '1982-12-11', 'Auermouth', '69615558', '2020-10-24 11:15:24', '2014-11-14 20:23:20');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (26, 'M', '1992-04-05', 'North Anissastad', '89', '2020-10-13 05:23:05', '2017-05-30 18:49:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (27, 'D', '1986-09-28', 'Russelburgh', '7502843', '2020-10-31 07:15:48', '2012-12-01 06:49:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (28, 'M', '2012-05-31', 'Lake Cotyton', '2477936', '2020-10-25 05:04:22', '2012-05-05 19:02:52');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (29, 'D', '2002-06-08', 'North Zane', '82725', '2020-11-12 14:39:08', '2013-10-10 00:52:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (30, 'M', '2001-08-09', 'Batztown', '306032398', '2020-10-30 09:08:29', '2019-01-02 09:45:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (31, 'D', '1999-07-28', 'Alysonborough', '8', '2020-10-21 08:55:23', '2011-10-22 16:35:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (32, 'P', '1975-12-18', 'New Verdie', '1939603', '2020-10-30 11:31:37', '2011-05-16 19:01:30');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (33, 'M', '1992-07-28', 'Albinfurt', '14410', '2020-10-24 06:30:57', '2020-09-02 00:12:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (34, 'M', '1997-12-03', 'North Jasmintown', '45', '2020-10-21 02:30:58', '2019-12-26 12:20:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (35, 'M', '1983-01-04', 'West Zackeryberg', '65594147', '2020-10-12 17:34:25', '2015-08-08 18:18:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (36, 'M', '2006-07-23', 'Luettgenstad', '605604448', '2020-10-29 06:44:25', '2018-12-30 09:09:58');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (37, 'P', '2014-12-07', 'Lake Lera', '', '2020-11-02 15:59:36', '2020-10-17 00:22:11');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (38, 'D', '2016-03-05', 'East Wilfredoland', '968164', '2020-10-13 04:32:16', '2012-10-26 22:26:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (39, 'P', '1991-08-28', 'Hildegardshire', '37238242', '2020-11-11 14:05:45', '2014-09-13 06:50:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (40, 'D', '2008-11-13', 'South Dallasberg', '986448436', '2020-10-18 15:31:49', '2019-06-03 01:09:48');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (41, 'M', '1989-12-10', 'Lake Mckaylatown', '8944985', '2020-10-23 19:09:10', '2011-10-02 13:00:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (42, 'P', '1972-12-02', 'Rhiannahaven', '664607', '2020-10-21 04:38:42', '2012-01-30 08:21:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (43, 'M', '2015-01-17', 'South Anthony', '9149', '2020-11-08 20:32:37', '2015-04-03 01:54:51');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (44, 'P', '1989-09-29', 'Ofeliahaven', '9128', '2020-10-27 00:35:47', '2015-08-06 10:29:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (45, 'D', '2012-01-14', 'Shanahanchester', '728414', '2020-10-13 06:46:56', '2019-10-20 20:30:53');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (46, 'P', '1997-08-30', 'Elmoreside', '95033165', '2020-11-10 23:31:25', '2017-06-29 09:40:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (47, 'M', '1987-07-18', 'East Celialand', '74129377', '2020-10-18 22:27:18', '2012-09-02 07:14:38');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (48, 'P', '1975-04-11', 'Ulisesville', '680', '2020-10-28 13:41:39', '2014-08-26 00:37:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (49, 'D', '1984-09-20', 'Larsonview', '', '2020-11-12 11:41:13', '2018-06-04 23:32:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (50, 'M', '2010-01-05', 'South Ianborough', '', '2020-10-23 12:38:27', '2013-06-12 05:37:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (51, 'D', '1991-01-29', 'Buckridgeville', '60', '2020-11-05 17:03:51', '2011-03-23 08:20:45');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (52, 'D', '1971-01-16', 'North Bernie', '34906818', '2020-10-18 07:47:47', '2019-11-22 17:40:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (53, 'D', '1989-08-19', 'North Lambert', '9831', '2020-10-14 10:39:08', '2012-11-12 21:51:43');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (54, 'P', '1986-05-18', 'Autumnside', '66475', '2020-10-22 00:52:52', '2011-02-04 19:47:59');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (55, 'M', '2011-05-02', 'Carrieport', '7682827', '2020-11-12 05:39:32', '2011-08-14 03:02:46');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (56, 'M', '2016-11-26', 'North Devan', '64404104', '2020-11-08 21:48:24', '2012-10-12 08:31:16');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (57, 'M', '1999-05-27', 'Ethaton', '167772524', '2020-10-29 09:54:11', '2012-03-29 21:24:15');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (58, 'D', '2014-07-26', 'Amelymouth', '329', '2020-10-23 10:41:45', '2015-05-15 01:33:31');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (59, 'D', '2000-04-20', 'North Jacky', '69', '2020-11-03 19:18:27', '2014-08-10 19:59:29');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (60, 'M', '1977-04-08', 'Maudeville', '5', '2020-11-03 20:54:27', '2017-05-23 00:42:39');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (61, 'M', '2012-06-13', 'Sengerport', '45575', '2020-10-29 15:34:36', '2017-07-01 15:17:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (62, 'M', '1982-02-13', 'North Neoma', '', '2020-10-21 02:22:41', '2020-08-30 19:33:12');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (63, 'D', '1990-05-15', 'North Alvertaside', '5223', '2020-11-12 05:02:12', '2020-04-19 11:08:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (64, 'D', '1991-05-03', 'East Hiramstad', '8008789', '2020-11-07 09:00:25', '2014-09-21 20:03:21');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (65, 'P', '2007-07-11', 'Koeppshire', '56433795', '2020-10-30 15:25:35', '2020-03-05 16:36:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (66, 'M', '1975-01-07', 'South Arlietown', '272850667', '2020-10-24 18:07:02', '2012-01-06 15:33:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (67, 'M', '2017-04-18', 'Waldohaven', '32', '2020-10-29 11:34:06', '2018-10-18 14:55:43');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (68, 'M', '2008-09-05', 'Hirthechester', '7448', '2020-10-12 21:58:00', '2020-05-18 18:22:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (69, 'M', '1998-09-04', 'East Sammyberg', '4', '2020-11-04 07:38:05', '2014-12-22 23:09:22');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (70, 'M', '1996-01-16', 'Lake Declan', '981387', '2020-11-11 05:10:41', '2015-11-14 08:35:18');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (71, 'M', '2001-09-13', 'Marvinmouth', '126186235', '2020-11-12 06:55:29', '2014-03-02 02:49:47');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (72, 'P', '1984-07-25', 'East Janeborough', '8000', '2020-10-21 06:15:53', '2014-06-17 21:05:44');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (73, 'M', '2003-03-17', 'North Nayelibury', '70', '2020-11-11 04:41:18', '2012-01-02 21:49:24');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (74, 'D', '2017-05-08', 'South Addisonburgh', '22360740', '2020-11-10 17:58:02', '2013-07-28 14:18:54');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (75, 'M', '1980-02-12', 'Metzbury', '8327270', '2020-10-27 08:22:34', '2020-07-31 14:02:36');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (76, 'D', '1994-07-28', 'Billberg', '388021', '2020-11-11 11:31:48', '2014-07-29 05:40:39');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (77, 'M', '2007-01-17', 'Sanfordfort', '2023098', '2020-10-22 04:28:59', '2016-11-03 06:47:26');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (78, 'D', '2010-10-29', 'Mekhiport', '6392', '2020-10-28 04:43:21', '2015-08-18 21:52:25');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (79, 'P', '2014-12-21', 'Tessieberg', '', '2020-10-29 05:30:39', '2018-11-28 21:25:05');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (80, 'D', '2013-10-24', 'Jayceton', '711', '2020-10-19 07:19:55', '2020-03-19 07:29:32');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (81, 'D', '1970-05-07', 'South Wilfredbury', '6600563', '2020-11-12 01:11:30', '2018-04-03 19:00:01');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (82, 'D', '1999-06-04', 'South Marge', '144', '2020-11-10 11:51:35', '2014-09-04 12:18:41');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (83, 'D', '2013-11-10', 'Treutelhaven', '101', '2020-10-15 04:14:26', '2012-08-24 22:50:08');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (84, 'P', '2002-11-04', 'Lakinland', '1', '2020-10-28 00:44:07', '2017-06-01 23:24:42');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (85, 'M', '1981-09-01', 'North Zoe', '931866567', '2020-11-05 17:29:05', '2013-05-05 17:50:58');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (86, 'M', '2000-07-06', 'New Holly', '517652', '2020-10-27 21:11:00', '2011-01-08 04:04:47');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (87, 'P', '2008-10-02', 'Starkhaven', '497484', '2020-10-19 04:46:52', '2016-08-09 17:30:04');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (88, 'D', '1973-06-30', 'Lake Camryn', '306882163', '2020-11-01 14:57:05', '2016-06-24 17:36:34');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (89, 'M', '1982-11-15', 'Deckowview', '841030077', '2020-10-17 15:40:46', '2013-09-12 06:41:55');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (90, 'M', '2000-06-05', 'Millermouth', '863', '2020-11-01 06:31:50', '2018-10-23 21:24:15');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (91, 'D', '2007-08-18', 'Feeneyport', '6022161', '2020-10-28 15:38:48', '2016-07-11 12:04:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (92, 'M', '1998-12-27', 'Roderickville', '97257', '2020-10-19 01:45:58', '2014-10-15 02:59:05');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (93, 'P', '1999-08-16', 'Port Glen', '', '2020-10-12 19:34:25', '2018-03-17 12:50:58');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (94, 'M', '2007-12-23', 'Lake Jazmyn', '12618', '2020-11-08 14:42:13', '2013-06-20 12:13:14');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (95, 'P', '2011-09-24', 'Nilsbury', '40222', '2020-10-20 15:10:43', '2014-04-21 21:55:47');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (96, 'M', '1973-12-26', 'West Marlon', '99', '2020-10-23 09:02:24', '2017-07-01 02:04:28');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (97, 'M', '2004-10-09', 'New Cali', '587126', '2020-10-13 06:56:13', '2012-08-23 15:10:09');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (98, 'M', '1972-02-24', 'West Enrico', '62', '2020-11-04 17:38:45', '2018-03-10 13:05:03');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (99, 'P', '2020-09-11', 'Lake Veronaside', '60', '2020-10-20 04:46:34', '2013-08-28 03:20:39');
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `city`, `country`, `created_at`, `updated_at`) VALUES (100, 'M', '1996-11-12', 'Christiansenberg', '385214064', '2020-11-12 10:15:23', '2019-09-07 06:12:34');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????? ??????',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '??? ????????????',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '??????? ????????????',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '?????',
  `phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '???????',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '????? ???????? ??????',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '????? ?????????? ??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='????????????';

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (1, 'Vella', 'Bogan', 'flo29@example.net', '192.948.3516x87081', '2020-10-19 07:44:07', '2011-10-23 07:38:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (2, 'Francisco', 'Dickens', 'jack.collier@example.net', '+64(0)0779142822', '2020-11-09 16:14:19', '2013-05-08 18:16:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (3, 'Gideon', 'DuBuque', 'damien.becker@example.com', '840-178-5506x86700', '2020-11-03 05:56:23', '2016-03-23 16:03:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (4, 'Nicholaus', 'Renner', 'fritz04@example.net', '+34(1)7979542762', '2020-11-08 12:49:05', '2018-05-11 13:08:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (5, 'Brayan', 'Raynor', 'cleve.wunsch@example.com', '(431)461-0774', '2020-10-30 12:37:23', '2012-03-02 09:42:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (6, 'Bill', 'Schaden', 'jokuneva@example.com', '06013701151', '2020-11-05 06:40:15', '2015-09-09 08:07:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (7, 'Emma', 'Flatley', 'serenity95@example.net', '1-476-297-2509', '2020-11-03 02:09:58', '2019-07-17 00:02:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (8, 'Vance', 'Schmeler', 'pagac.doyle@example.net', '1-061-415-8814x664', '2020-11-09 07:27:59', '2019-03-15 07:24:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (9, 'Alexzander', 'Nikolaus', 'rfahey@example.net', '961.458.8942x3456', '2020-11-04 06:17:50', '2020-11-03 15:43:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (10, 'Maegan', 'Fisher', 'juana97@example.org', '(364)858-1453x761', '2020-11-02 10:19:34', '2020-10-31 03:36:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (11, 'Hilbert', 'Donnelly', 'ned.kuhic@example.com', '365.235.5800', '2020-10-27 04:00:50', '2015-06-19 11:20:58');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (12, 'Jazmyne', 'Bechtelar', 'balistreri.erin@example.net', '151-977-2868x19872', '2020-11-02 18:19:23', '2014-07-09 03:13:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (13, 'Gregoria', 'Robel', 'ndouglas@example.com', '827-750-3657', '2020-10-16 07:20:16', '2013-07-15 11:14:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (14, 'Maverick', 'Trantow', 'loma.wilderman@example.net', '05717320015', '2020-10-17 11:46:08', '2018-07-31 11:04:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (15, 'Juana', 'O\'Conner', 'pwitting@example.net', '773-163-4797x989', '2020-10-21 05:36:36', '2012-01-03 02:19:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (16, 'Brooks', 'Boyle', 'marquardt.tia@example.com', '(668)082-7115x0086', '2020-10-26 13:59:52', '2019-09-18 04:51:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (17, 'Sydni', 'Kerluke', 'dakota44@example.com', '(262)646-2668x79029', '2020-10-16 15:17:08', '2012-09-23 22:59:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (18, 'Lula', 'Walter', 'sporer.ansley@example.net', '(477)449-6097x78323', '2020-10-29 05:31:08', '2017-10-11 22:13:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (19, 'Maurice', 'Kessler', 'gglover@example.org', '578.130.7469', '2020-10-28 16:54:48', '2017-01-21 22:49:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (20, 'Eleonore', 'Bosco', 'jena.bruen@example.net', '525-303-5971', '2020-10-15 08:05:44', '2019-12-24 08:38:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (21, 'Gordon', 'Halvorson', 'mcdermott.tyshawn@example.net', '+30(2)7336063436', '2020-10-21 15:48:28', '2012-07-03 17:18:51');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (22, 'Roberto', 'Botsford', 'reilly.scottie@example.com', '883.428.0256x62886', '2020-10-30 07:26:18', '2018-08-11 18:42:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (23, 'Phoebe', 'Koss', 'bdietrich@example.net', '989-632-6329x727', '2020-10-19 20:19:15', '2019-02-27 12:36:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (24, 'Earnest', 'Brown', 'hudson40@example.com', '(844)030-9101', '2020-10-30 21:15:30', '2019-02-16 13:55:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (25, 'Noemie', 'Monahan', 'qjenkins@example.com', '1-165-677-3784', '2020-10-27 08:23:07', '2016-03-14 00:21:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (26, 'Hannah', 'Parisian', 'terry.pink@example.org', '1-292-451-4523x9589', '2020-10-29 09:48:05', '2016-10-07 13:26:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (27, 'Ruthie', 'Gutmann', 'ahane@example.com', '1-856-965-9230x5083', '2020-11-02 02:39:16', '2015-12-07 23:01:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (28, 'Otho', 'Harris', 'bobby88@example.org', '825-795-1205', '2020-10-30 13:24:49', '2015-12-19 13:05:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (29, 'Kristy', 'Armstrong', 'juana83@example.org', '1-557-705-5205', '2020-11-05 18:02:27', '2019-08-19 19:07:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (30, 'Chloe', 'Moore', 'kertzmann.sigrid@example.org', '02412533386', '2020-10-14 14:16:57', '2013-05-22 09:06:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (31, 'Janice', 'Hartmann', 'greenfelder.franz@example.net', '346-948-9419x3571', '2020-10-22 14:42:02', '2011-12-08 10:18:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (32, 'Orland', 'Marquardt', 'rebekah.o\'connell@example.com', '037.332.1179x1038', '2020-10-19 21:41:33', '2013-12-02 06:25:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (33, 'Zachary', 'Sawayn', 'lazaro.sanford@example.net', '599.734.6786', '2020-10-18 10:08:46', '2012-03-27 21:37:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (34, 'Denis', 'Dach', 'nola.bins@example.net', '(896)091-7598', '2020-11-02 16:25:43', '2017-08-16 02:30:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (35, 'Everett', 'Herman', 'ima17@example.net', '+98(5)1701928377', '2020-11-05 17:47:49', '2012-09-09 12:27:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (36, 'Sofia', 'Kuvalis', 'delphia85@example.net', '(219)048-6247', '2020-11-05 22:02:58', '2014-12-03 07:02:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (37, 'Roberto', 'O\'Keefe', 'lebsack.loraine@example.net', '(269)224-6797', '2020-11-02 21:04:28', '2020-09-28 17:54:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (38, 'Conner', 'Heaney', 'jordon.schneider@example.com', '(806)166-7823x97702', '2020-11-10 12:25:28', '2018-11-15 15:52:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (39, 'Riley', 'Altenwerth', 'river.connelly@example.org', '1-402-272-4981x0396', '2020-11-06 16:37:22', '2018-04-03 13:19:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (40, 'Alvis', 'Kiehn', 'arvid98@example.com', '558.931.0789', '2020-11-10 06:09:10', '2012-07-02 00:00:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (41, 'Jalen', 'O\'Conner', 'waters.roosevelt@example.com', '(952)305-2097x68824', '2020-11-09 02:06:03', '2015-11-03 08:50:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (42, 'Lempi', 'Bergnaum', 'harold94@example.com', '(130)529-5444x741', '2020-10-19 01:16:14', '2017-06-17 23:03:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (43, 'Queenie', 'Littel', 'kole45@example.net', '03040222699', '2020-10-15 10:45:24', '2015-08-27 21:36:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (44, 'Adrianna', 'Cummings', 'white.destiney@example.org', '(255)104-0810', '2020-10-30 01:44:44', '2019-02-01 20:21:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (45, 'Timothy', 'Runte', 'mason98@example.org', '(827)082-2112x4172', '2020-10-21 08:35:27', '2019-04-26 14:07:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (46, 'Alicia', 'Senger', 'lesch.emerald@example.org', '+49(2)2970591534', '2020-10-27 04:15:16', '2014-06-01 03:15:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (47, 'Alivia', 'Orn', 'gerhold.brett@example.net', '348-148-3770', '2020-10-25 14:06:46', '2014-03-14 22:22:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (48, 'Elsa', 'Ledner', 'gleason.hester@example.org', '1-331-990-8396', '2020-11-06 09:02:24', '2013-03-28 16:29:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (49, 'Loma', 'Mante', 'bkuhic@example.net', '+63(6)6541832471', '2020-11-01 20:01:02', '2019-01-07 03:00:49');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (50, 'Viviane', 'Gleason', 'yesenia.bins@example.net', '551.364.9332x9809', '2020-10-25 03:15:12', '2020-09-11 08:31:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (51, 'Elian', 'Boehm', 'carolyn.o\'conner@example.net', '06850367072', '2020-11-08 14:56:56', '2015-07-20 16:36:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (52, 'Kylee', 'Bayer', 'karina.bradtke@example.org', '902.617.5917x46669', '2020-10-23 21:01:55', '2013-08-13 07:35:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (53, 'Paul', 'Bradtke', 'raymond.steuber@example.org', '591-537-0144x3525', '2020-10-24 15:19:31', '2020-01-31 23:26:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (54, 'Megane', 'Conn', 'kortiz@example.net', '(172)866-9041', '2020-10-28 22:07:45', '2013-12-06 17:17:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (55, 'Nayeli', 'Abbott', 'fabiola.pouros@example.com', '270.812.4748x923', '2020-11-05 15:11:11', '2017-12-24 14:22:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (56, 'Werner', 'Bins', 'drew.pacocha@example.org', '1-486-774-9937x725', '2020-11-02 00:09:43', '2017-11-14 08:56:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (57, 'Rico', 'Bergstrom', 'jones.rowena@example.org', '036-614-2703x3629', '2020-11-07 22:31:29', '2018-06-19 22:18:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (58, 'Alexa', 'Larkin', 'pouros.kaitlyn@example.net', '(752)653-0139x628', '2020-11-12 05:54:25', '2018-07-30 08:44:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (59, 'Deontae', 'King', 'federico66@example.com', '00440557907', '2020-10-22 23:07:23', '2018-04-17 03:36:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (60, 'Kailee', 'Kshlerin', 'brittany.brakus@example.net', '1-621-233-9588', '2020-11-10 22:41:23', '2017-12-20 23:04:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (61, 'Selena', 'Cormier', 'fay.abagail@example.net', '849-499-4536x65407', '2020-10-13 06:00:47', '2014-11-30 15:33:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (62, 'Jeffery', 'Boyle', 'ezequiel29@example.org', '1-864-334-5886x1805', '2020-10-28 13:24:34', '2015-12-21 20:43:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (63, 'Maida', 'Gaylord', 'ubernier@example.org', '812.689.5025', '2020-10-17 11:54:21', '2016-04-15 09:30:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (64, 'Adella', 'Dibbert', 'danyka.hoeger@example.org', '+54(8)5236864204', '2020-11-08 02:00:18', '2020-04-16 22:33:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (65, 'Richmond', 'Halvorson', 'fhansen@example.org', '(600)258-8121x1737', '2020-11-10 15:12:45', '2011-11-05 14:53:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (66, 'Marjorie', 'Bogan', 'abeahan@example.net', '08672108009', '2020-11-12 00:59:44', '2015-09-23 00:42:54');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (67, 'Karelle', 'Dooley', 'lakin.polly@example.org', '594.308.5983x1607', '2020-10-14 19:50:09', '2013-03-03 08:13:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (68, 'Karl', 'Luettgen', 'rosie75@example.org', '598-004-6893', '2020-10-30 13:55:35', '2018-04-26 14:13:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (69, 'Nayeli', 'O\'Keefe', 'dovie.bode@example.com', '+80(0)1117061314', '2020-11-02 12:53:29', '2015-02-23 12:21:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (70, 'Corbin', 'Turcotte', 'mallie.crona@example.net', '582.515.6720x81123', '2020-10-24 20:31:56', '2012-07-23 19:13:05');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (71, 'Lila', 'Marvin', 'louisa67@example.com', '(226)634-6779x2577', '2020-10-23 23:02:39', '2018-11-05 15:44:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (72, 'Dimitri', 'Gerlach', 'ehintz@example.org', '1-885-575-3085x361', '2020-10-30 03:52:59', '2016-12-16 17:32:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (73, 'Evangeline', 'Funk', 'nboyer@example.org', '(855)441-1054x61406', '2020-10-26 06:47:32', '2019-03-18 08:24:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (74, 'Stacy', 'Schaefer', 'keeley20@example.org', '303.560.4274x12274', '2020-10-31 07:37:13', '2013-10-27 01:43:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (75, 'Leanna', 'Quigley', 'xfeil@example.net', '03278682043', '2020-11-09 02:01:28', '2015-08-13 15:09:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (76, 'Alex', 'Hackett', 'phayes@example.org', '1-266-478-8894x232', '2020-10-24 07:57:07', '2019-08-22 05:14:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (77, 'Ernest', 'Heller', 'prohaska.jimmie@example.com', '453-954-1343', '2020-10-17 21:49:49', '2012-02-17 12:25:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (78, 'Ava', 'West', 'xzavier.kohler@example.org', '077-460-1091x87219', '2020-10-27 11:57:34', '2016-02-20 17:20:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (79, 'Sven', 'Predovic', 'cormier.reid@example.org', '+87(5)4158976971', '2020-10-18 09:07:17', '2014-04-29 05:05:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (80, 'Maybell', 'Gulgowski', 'nader.phoebe@example.net', '08821991528', '2020-10-28 04:32:11', '2019-07-27 23:17:21');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (81, 'Karson', 'Keebler', 'haven46@example.net', '268-615-7635x9071', '2020-10-27 08:09:06', '2017-06-15 04:09:14');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (82, 'Meaghan', 'Doyle', 'georgette.collier@example.org', '290-311-7507x557', '2020-10-28 18:05:18', '2020-11-06 09:24:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (83, 'Claudie', 'Champlin', 'obarton@example.net', '848.286.0616', '2020-10-15 17:58:09', '2012-11-26 06:03:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (84, 'Sadye', 'Breitenberg', 'alarson@example.net', '(123)424-1844x685', '2020-10-23 10:47:34', '2019-10-10 03:28:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (85, 'Garett', 'Waelchi', 'malachi.cremin@example.org', '1-029-338-5896', '2020-11-04 00:26:00', '2015-09-28 00:15:11');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (86, 'Solon', 'Hickle', 'zulauf.bernhard@example.net', '09763374298', '2020-10-25 16:47:49', '2016-11-03 14:34:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (87, 'Eduardo', 'Zulauf', 'destiny.sipes@example.org', '(137)971-1437x530', '2020-10-14 21:05:47', '2018-01-25 05:05:48');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (88, 'Amari', 'Rohan', 'jay.pacocha@example.com', '1-195-848-1211x42383', '2020-10-28 16:44:03', '2013-06-28 07:38:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (89, 'Juston', 'Eichmann', 'marc18@example.org', '+10(9)7268770343', '2020-10-17 16:34:20', '2016-07-17 12:15:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (90, 'Meagan', 'Stark', 'pmacejkovic@example.net', '(907)747-6022x7307', '2020-10-19 06:42:32', '2015-06-15 01:24:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (91, 'Alaina', 'Klein', 'daija.bailey@example.com', '174.803.3349', '2020-11-06 06:15:54', '2020-04-26 10:59:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (92, 'Lew', 'Ruecker', 'bergstrom.alanis@example.org', '395.988.8169', '2020-10-31 16:17:04', '2018-06-04 02:05:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (93, 'Oleta', 'Shields', 'monroe.vandervort@example.net', '07649155600', '2020-11-07 00:46:58', '2020-08-28 02:45:53');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (94, 'Winfield', 'Ledner', 'vconnelly@example.org', '535-727-6064x04597', '2020-10-27 17:47:39', '2014-07-30 00:50:34');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (95, 'Carter', 'Sauer', 'crooks.evangeline@example.com', '1-526-224-0881x275', '2020-10-15 00:00:42', '2015-01-01 14:44:52');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (96, 'Asa', 'Mills', 'christ.doyle@example.net', '113.422.9009x9166', '2020-11-07 07:02:55', '2017-07-23 21:16:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (97, 'Dejuan', 'Greenfelder', 'srodriguez@example.com', '143-845-3257x454', '2020-10-23 04:20:04', '2019-05-18 05:36:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (98, 'Beaulah', 'Ziemann', 'tpagac@example.org', '569-842-3281x2016', '2020-11-07 04:41:06', '2014-10-17 10:23:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (99, 'Kristy', 'Romaguera', 'gussie.davis@example.net', '562-193-5685x53629', '2020-11-08 07:32:51', '2016-09-28 13:21:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (100, 'Devonte', 'Schulist', 'americo29@example.org', '(204)535-6196x2316', '2020-11-12 06:02:28', '2017-12-18 22:33:32');
