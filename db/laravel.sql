/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : laravel

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-02-23 15:07:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
INSERT INTO `activity_log` VALUES ('1', 'default', 'updated', 'App\\Models\\Perusahaan', 'updated', '25', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-16 09:48:25', '2024-02-16 09:48:25');
INSERT INTO `activity_log` VALUES ('2', 'default', 'created', 'App\\Models\\Client', 'created', '10', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 18:32:34', '2024-02-20 18:32:34');
INSERT INTO `activity_log` VALUES ('3', 'default', 'created', 'App\\Models\\Client', 'created', '11', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 18:33:14', '2024-02-20 18:33:14');
INSERT INTO `activity_log` VALUES ('4', 'default', 'updated', 'App\\Models\\Client', 'updated', '10', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 18:34:53', '2024-02-20 18:34:53');
INSERT INTO `activity_log` VALUES ('5', 'default', 'deleted', 'App\\Models\\Client', 'deleted', '2', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 18:36:13', '2024-02-20 18:36:13');
INSERT INTO `activity_log` VALUES ('6', 'default', 'deleted', 'App\\Models\\Client', 'deleted', '9', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 18:40:33', '2024-02-20 18:40:33');
INSERT INTO `activity_log` VALUES ('7', 'default', 'updated', 'App\\Models\\Perusahaan', 'updated', '25', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 18:41:02', '2024-02-20 18:41:02');
INSERT INTO `activity_log` VALUES ('8', 'default', 'created', 'App\\Models\\Employee', 'created', '13', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 20:05:06', '2024-02-20 20:05:06');
INSERT INTO `activity_log` VALUES ('9', 'default', 'deleted', 'App\\Models\\Employee', 'deleted', '13', 'App\\Models\\Admin', '1', 0x5B5D, null, '2024-02-20 20:05:14', '2024-02-20 20:05:14');

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'superadmin', 'superadmin@admin.com', null, '$2y$10$PqSKV7Ye2PVTzNor1tEhguuPxzY3lGTN9H4JWZqlNwK2GvjYB7OXG', '1', null, '2020-07-08 00:00:00', '2020-10-14 14:45:34');

-- ----------------------------
-- Table structure for `blogs`
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `category` varchar(200) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT 1,
  `file_path` varchar(255) DEFAULT 'assets/images/blog/default.png',
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES ('1', 'Velit consectetur saepe adipisci pariatur laboriosam sit. Dolores qui et expedita rerum earum quia. Optio cumque quia dolor et. Doloremque provident vero suscipit.', 'Doloremque et reprehenderit tempore natus a animi. Corrupti porro ea voluptatem id. Excepturi atque aut perferendis. Consequatur sapiente qui distinctio totam eligendi.', '1', '1', 'assets/images/blog/default_news_a.jpg', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('2', 'Iste qui est ea facere quisquam rem. Magnam saepe qui consequatur qui iste delectus alias. Aliquam iusto quas voluptas commodi molestiae.', 'Et ipsum beatae consequatur. Ut provident id aliquam debitis enim. Cupiditate aliquam qui repellendus ad saepe. Voluptate alias qui fugiat nihil aut aspernatur. Laboriosam modi et quia nihil voluptate molestias porro.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('3', 'Eos voluptatem dolorem laudantium facere ipsa aut. Qui illo quaerat eos recusandae culpa. Molestias et voluptates fugit ab totam laboriosam. Rem libero maxime perferendis facilis hic architecto.', 'Accusamus minima in nulla aut eos consequuntur vitae est. Ad quod ab at quo dolores porro. Voluptatem molestiae dolorem a unde nobis laudantium totam.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('4', 'Reiciendis dolores in sunt illo. Repudiandae deleniti soluta tempore voluptatum consectetur voluptatem perspiciatis. Rerum qui eius aut adipisci.', 'Quam aut eos ullam. Dolor et vitae aut maxime. Ducimus qui harum voluptatum deserunt dolorum corporis tempore.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('5', 'Vel numquam non ipsam amet dicta doloremque eligendi. Nulla rerum aut reiciendis voluptas mollitia et. Atque iste dolor animi neque consequuntur labore doloribus.', 'Dolorem unde tempora eum. Velit eum velit quia in repudiandae natus et incidunt. Corrupti eum dolor nobis est quibusdam. Velit iusto consectetur reiciendis ex aut consequuntur odit. Excepturi laborum est occaecati fugiat voluptas.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('6', 'Sed qui inventore voluptas iste pariatur nihil fugiat. Laboriosam nam fugiat odit temporibus et. Porro omnis quaerat nobis voluptas et cupiditate nam. Ut id eum eos. Quas voluptatem nobis rem non.', 'Assumenda vel tenetur saepe repellendus amet. Quo qui placeat aut et laborum magnam. Corporis et velit quibusdam ipsa. Alias excepturi labore et hic necessitatibus dicta.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('7', 'Velit at magnam libero quibusdam cum. Accusantium modi porro excepturi sit sequi. Facilis nihil inventore a qui aut.', 'Quia est numquam dolor enim eum est. Amet voluptatem est architecto voluptatem vero vitae ut.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('8', 'Accusamus et sit saepe ut eum. Qui error ipsum dolor optio provident error aut. Et facilis corrupti saepe. Aliquam et omnis quibusdam hic dicta.', 'Ut dolorum aut labore corrupti occaecati ipsa dolores est. Officiis ipsam dolores tenetur sequi velit rerum dolor. Magni debitis pariatur asperiores nesciunt perferendis. Molestiae autem non est veritatis.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('9', 'Repudiandae id aperiam est et. Delectus possimus ipsam est accusamus.', 'Ad maxime et quam sed minima sint quia. Facilis odio et voluptas earum hic quas magnam numquam. Ut debitis cupiditate eos enim.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('10', 'Quis pariatur porro sint vel excepturi. Delectus facilis rerum sed molestiae.', 'Quos harum officia esse sunt in qui natus nihil. Est eligendi sint possimus aut. Quis et qui repellat inventore et. Ut ut ratione id accusamus vel.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:08:13', '2020-07-13 15:08:13');
INSERT INTO `blogs` VALUES ('14', 'Quam accusamus molestias qui optio fugiat omnis autem. Reprehenderit adipisci accusantium qui iusto sapiente sed voluptatem quasi. Laboriosam voluptas blanditiis earum amet voluptas sit.', 'Quas laboriosam corporis dolorem id itaque et. Est aut illo alias aut sint. Eaque sunt impedit mollitia nihil impedit repellat architecto.', '1', '1', 'assets/images/blog/default_news_a.jpg', '1', '2020-07-13 15:11:03', '2020-09-28 12:18:49');
INSERT INTO `blogs` VALUES ('15', 'Et deleniti maiores eum consectetur facere inventore. Enim praesentium quo quia praesentium. Est voluptatem qui molestiae voluptas harum. Ut inventore impedit sequi vitae fugit aut est repellat.', 'Adipisci expedita fuga consequatur nobis aut suscipit iusto blanditiis. Magnam accusamus necessitatibus numquam et repellendus aut culpa consectetur. Et quod accusamus ut harum adipisci ab. Vero debitis nobis veniam quia cupiditate voluptates. Pariatur est doloremque eum voluptas incidunt vero quas et.', '1', '1', 'assets/images/blog/default_news_a.jpg', '1', '2020-07-13 15:11:03', '2020-09-28 12:19:00');
INSERT INTO `blogs` VALUES ('16', 'Animi dignissimos natus optio voluptatum officiis. Culpa aspernatur fugit nemo non officia.', 'Mollitia voluptatem est aut similique qui commodi vitae. Est in perspiciatis eligendi eveniet sunt. Quisquam error exercitationem odit aut.', '1', '1', 'assets/images/blog/default_news_a.jpg', '1', '2020-07-13 15:11:03', '2020-09-28 13:09:46');
INSERT INTO `blogs` VALUES ('17', 'Et sit quia veniam qui optio. Ut dolorum illum nemo error neque repellendus. Expedita atque consectetur consequatur.', 'Quas est architecto natus. Non libero repellat tempore ut excepturi recusandae a. Officiis repellendus aut neque aliquam. Tenetur aut placeat iure.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:11:03', '2020-07-13 15:11:03');
INSERT INTO `blogs` VALUES ('18', 'Dolor consequatur repudiandae molestias dolorum hic autem corrupti. Et dolores porro totam quidem sequi et. Ab voluptas soluta qui eum assumenda.', 'Dolor provident consequatur autem dicta qui aut. Est non assumenda provident ut. Eos maiores quos molestias alias maxime omnis nisi voluptatibus. Nisi vero quam incidunt ut nobis.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:11:03', '2020-07-13 15:11:03');
INSERT INTO `blogs` VALUES ('19', 'Perspiciatis officia qui rerum enim sit non debitis. Omnis nesciunt voluptas saepe optio labore. Dolore voluptatum qui exercitationem optio eum exercitationem.', 'Et assumenda non rerum et. Quibusdam et nam eos qui quia minima sit rerum. Perspiciatis velit impedit fuga magni voluptas voluptas blanditiis eius.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:11:03', '2020-07-13 15:11:03');
INSERT INTO `blogs` VALUES ('20', 'Sed eaque enim rerum sapiente dolorem porro aut. Rerum quae debitis deleniti quibusdam veniam. Delectus unde nulla rerum vel sed. Accusantium quae optio animi minus est sed.', 'Corporis est optio exercitationem nesciunt velit quos iste. Consectetur praesentium aliquid ipsa ducimus reiciendis.', '1', '1', 'assets/images/blog/default.png', '1', '2020-07-13 15:11:03', '2020-07-13 15:11:03');

-- ----------------------------
-- Table structure for `clients`
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `pic_name` varchar(255) DEFAULT NULL,
  `pic_phone` varchar(255) DEFAULT NULL,
  `pic_email` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `id_user_modified` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_id_user_foreign` (`id_user`),
  KEY `clients_id_user_modified_foreign` (`id_user_modified`),
  CONSTRAINT `clients_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clients_id_user_modified_foreign` FOREIGN KEY (`id_user_modified`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES ('1', '003', 'fadly', 'cigombong', '01.001.613.7-093.000', 'Dicky', '0', '-', '-', '1', null, null, null, null, null);
INSERT INTO `clients` VALUES ('3', null, 'b', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `clients` VALUES ('4', null, 'halo', null, null, null, null, null, null, null, null, '2024-02-20 17:59:23', '2024-02-20 17:59:23', null, null);
INSERT INTO `clients` VALUES ('5', '1000', 'ga', null, null, null, null, null, null, null, null, '2024-02-20 18:00:02', '2024-02-20 18:00:02', null, null);
INSERT INTO `clients` VALUES ('6', '324324', 'sad', 'sada', '2131', 'asd', '132', 'm@gmail.com', 'sad', null, null, '2024-02-20 18:00:48', '2024-02-20 18:00:48', null, null);
INSERT INTO `clients` VALUES ('7', '132', 'sad', 'dsa', 'sda', 'das', 'sad', 'm@gmail.com', 'sad', null, null, '2024-02-20 18:11:38', '2024-02-20 18:11:38', null, null);
INSERT INTO `clients` VALUES ('8', '1000', 'fadly', 'ads', '12', 'dsa', 'sda', 'm@gmail.com', 'dsa', '1', null, '2024-02-20 18:15:56', '2024-02-20 18:15:56', null, null);
INSERT INTO `clients` VALUES ('9', '1000', 'fadly1', 'ads', '12', 'dsa', 'sda', 'm@gmail.com', 'dsa', '1', null, '2024-02-20 18:21:15', '2024-02-20 18:40:33', null, '2024-02-20 18:40:33');
INSERT INTO `clients` VALUES ('10', '1000', 'fadly', 'ads', '12', 'dsa', 'sda', 'm@gmail.com', 'dsa', '1', null, '2024-02-20 18:32:34', '2024-02-20 18:34:53', null, null);
INSERT INTO `clients` VALUES ('11', '10001', 'fadly1', 'ads', '12', 'dsa', 'sda', 'm@gmail.com', 'dsa', '1', null, '2024-02-20 18:33:14', '2024-02-20 18:33:14', null, null);

-- ----------------------------
-- Table structure for `employees`
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `tempat` varchar(30) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(100) DEFAULT '',
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `uploaded_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', 'Lutfi Muladi', 'Bogor', '1998-07-21', 'Laki - Laki', 'Kp. Jogjogan Kec.Cisarua', '081316992135', 'muladilutfi21@gmail.com', 'Pujaan Ariel', 'assets/images/employee/default_news_a.jpg', '2020-07-24 10:11:36', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('2', 'Muhammad Iqbal Fikri', 'Jakarta', '1985-04-09', 'Laki - Laki', 'Jl. Cempaka III BS - 17/17 KR. Permai Rt : 019 / Rw : 012 Jatisampurna, Bekasi - Jawa Barat', '08118884296', '2@batcrew.net', '-', 'assets/images/employee/default.png', '2020-11-14 15:23:14', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('4', 'Iskandar', 'Jakarta', '1959-10-22', 'Laki - Laki', 'Jl. Nakula I Blok U No. 7 Rt : 003 / Rw: 006 Duren Sawit - Jakarta Timur', '087783220631', 'batcrewnday@gmail.com', '-', 'assets/images/employee/default.png', '2020-03-10 10:50:13', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('5', 'Muhamad Maulana Abidin', 'Bogor', '1993-08-30', 'Laki - Laki', 'KP. Pangarakan Rt : 016 / Rw : 006 Srogol, Cigombong, Bogor - Jawa Barat ', '085819994989', '7@batcrew.net', '-', 'assets/images/employee/default.png', '2020-03-11 09:56:50', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('6', 'Eka Astuti', 'Wonogiri', '1990-11-22', 'Perempuan', 'Jl. Batu Bulat Rt : 003 / Rw : 005 Batu Ampar, Kramat Jati - Jakarta Timur', '087889510052', 'mickyastyeka@gmail.com', '-', 'assets/images/employee/default_news_a.jpg', '2020-03-11 09:58:27', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('7', 'Herlansyah', 'Jakarta', '1989-04-16', 'Laki - Laki', 'Jl. H. Murtadho VIII/B 45 Rt : 015 / Rw: 005 Paseban Senen - Jakarta Pusat', '085283398737', 'erlansyah160488@gmail.com', '-', 'assets/images/employee/default_news_a.jpg', '2020-03-11 10:00:17', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('8', 'Nanang Santoso', 'Bogor', '1997-09-01', 'Laki - Laki', 'Griya Katulampa B.2 No. 16 Rt : 003 / Rw : 010 Katulampa, Kota Bogor Timur,  Bogor - Jawa Barat', '081283120180', 'nanangsantoso1997@gmail.com', '-', 'assets/images/employee/default_news_a.jpg', '2020-03-11 10:03:13', null, null, '1', null, null);
INSERT INTO `employees` VALUES ('9', 'Fandi Ahmed', 'cibedug', '2024-02-19', 'Laki - Laki', 'testing aplikas', '0812343122', 'fandi@gmail.com', 'Programmer', 'assets/images/employee/1708389897.jpg', '2024-02-20 06:44:57', null, '2024-02-20 06:44:57', '1', '1', null);
INSERT INTO `employees` VALUES ('10', 'alwi romadhon', 'cikunir', '2024-02-20', 'Laki - Laki', 'testing aplikasi', '08564123617', 'alwi@gmail.com', 'programmer', 'assets/images/employee/1708390039.jpg', '2024-02-20 06:47:19', null, '2024-02-20 06:47:19', '1', '1', null);

-- ----------------------------
-- Table structure for `expense_details`
-- ----------------------------
DROP TABLE IF EXISTS `expense_details`;
CREATE TABLE `expense_details` (
  `id_expense_detail` int(2) NOT NULL AUTO_INCREMENT,
  `id_expense` varchar(8) DEFAULT NULL,
  `nama_detail` varchar(150) DEFAULT NULL,
  `qty` varchar(2) DEFAULT NULL,
  `harga_satuan` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_expense_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of expense_details
-- ----------------------------
INSERT INTO `expense_details` VALUES ('2', '27', 'Kabel ', '3', '5000', '15000');
INSERT INTO `expense_details` VALUES ('3', '27', 'Bohlam Eurotion', '2', '50000', '100000');
INSERT INTO `expense_details` VALUES ('4', '25', 'Bolpoint Joyko Hitam', '1', '21000', '21000');
INSERT INTO `expense_details` VALUES ('5', '25', 'Plastic Laminating Folio Joyko', '1', '74000', '74000');
INSERT INTO `expense_details` VALUES ('6', '24', 'Logo Nigmarid Indonesia Stainless (30 x 30)', '1', '750000', '750000');
INSERT INTO `expense_details` VALUES ('7', '23', 'Bayar Parkir Motor Bulan Maret 2020 - Venti Aniver Sari', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('8', '22', 'Bayar Parkir Motor Bulan Maret 2020   - Andri Royantara', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('9', '21', 'Bayar Parkir Motor Bulan Maret 2020 - Yuli Wulandari', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('10', '20', 'Bayar Parkir Motor Bulan Maret 2020 - Herlansyah', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('11', '19', 'Bayar Parkir Mobil Bulan Maret 2020  - Billy Citra Saputra', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('12', '18', 'Kain kanopi Merah (3m x 1,5 m)', '1', '790000', '790000');
INSERT INTO `expense_details` VALUES ('13', '17', 'Biaya Keamanan RK H09 08 DRA I  Blok H9 - 8', '1', '900000', '900000');
INSERT INTO `expense_details` VALUES ('14', '15', 'Hardisk SEAGATE 320GB R_', '3', '235000', '705000');
INSERT INTO `expense_details` VALUES ('15', '15', 'Cashing Alcatroz Futura Black Pro N5000', '2', '340000', '680000');
INSERT INTO `expense_details` VALUES ('16', '14', 'MEMORY DDR2 2GB PC6400 V-GEN', '12', '350000', '4200000');
INSERT INTO `expense_details` VALUES ('17', '14', 'Hardisk SEAGATE 320GB R_', '2', '235000', '470000');
INSERT INTO `expense_details` VALUES ('18', '14', 'CASHING ALCATROZ FUTURA BLACK PRO N5000', '10', '340000', '3400000');
INSERT INTO `expense_details` VALUES ('19', '14', 'MOUSE LOGITECH USB B100', '5', '70000', '350000');
INSERT INTO `expense_details` VALUES ('20', '14', 'DEEP COOL THERMAL GREASE Z3', '1', '65000', '65000');
INSERT INTO `expense_details` VALUES ('21', '13', 'SAMSUNG SSD V-NAND 860 EVO 250GB', '1', '900000', '900000');
INSERT INTO `expense_details` VALUES ('22', '9', 'Bayar Parkir Mobil Bulan Februari 2020 - Billy Citra Saputra', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('23', '9', 'Biaya Kartu Parkir Mobil', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('24', '12', 'Bayar Parkir Motor Bulan Februari 2020 - Andri Royantara', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('25', '12', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('26', '11', 'Bayar Parkir Motor Bulan Februari 2020 - Yuli Wulandari', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('27', '11', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('28', '10', 'Bayar Parkir Motor Bulan Februari 2020 - Venti Aniver Sari', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('29', '10', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('30', '8', 'Bayar Parkir Motor Bulan Februari 2020 - Herlansyah', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('31', '8', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('32', '26', 'Dina Bor 8 x 40', '10', '1000', '10000');
INSERT INTO `expense_details` VALUES ('33', '26', 'Mata Bor Irwin 8', '1', '35000', '35000');
INSERT INTO `expense_details` VALUES ('34', '26', 'Double Tape 3m', '1', '25000', '25000');
INSERT INTO `expense_details` VALUES ('35', '26', 'Aibon', '1', '15000', '15000');
INSERT INTO `expense_details` VALUES ('36', '26', 'Paku Beton 4', '2', '3000', '6000');
INSERT INTO `expense_details` VALUES ('37', '7', 'Service Cuci AC', '1', '70000', '70000');
INSERT INTO `expense_details` VALUES ('38', '7', 'Jasa Kerja Bongkar Pasang AC + Vacum', '1', '450000', '450000');
INSERT INTO `expense_details` VALUES ('39', '7', 'Isi Ulang Freon R410 A', '1', '450000', '450000');
INSERT INTO `expense_details` VALUES ('40', '6', 'Kabel  Eter 3 x 2,5', '1', '600000', '600000');
INSERT INTO `expense_details` VALUES ('41', '5', 'Huruf Timbul Stainless \\\"Nigmarid Indonesia\\\" 21 x 213 cm', '1', '3000000', '3000000');
INSERT INTO `expense_details` VALUES ('42', '4', 'Double Tape 3 m', '2', '25000', '50000');
INSERT INTO `expense_details` VALUES ('43', '3', 'Box Kartu Nama Kecil (30 pcs)', '1', '4500', '4500');
INSERT INTO `expense_details` VALUES ('44', '3', 'Ongkos Potongan', '1', '2000', '2000');
INSERT INTO `expense_details` VALUES ('45', '3', 'Smooth Canova White A3 (47x32)', '1', '6000', '6000');
INSERT INTO `expense_details` VALUES ('46', '3', 'Print Color Kn A3 Minipack (1 Klik) BB', '1', '35000', '35000');
INSERT INTO `expense_details` VALUES ('47', '28', 'Tinta 85 N Epson 1390', '1', '390000', '390000');
INSERT INTO `expense_details` VALUES ('48', '28', 'JNE YES', '1', '43000', '43000');
INSERT INTO `expense_details` VALUES ('49', '29', 'Latar Acrylik Logo Logo PT Bramanty (30 x 30)', '1', '350000', '350000');
INSERT INTO `expense_details` VALUES ('50', '29', 'Laser Acrylik PT Bramanty Adhikari Tibra Syandana', '1', '1550000', '1550000');
INSERT INTO `expense_details` VALUES ('51', '30', 'Air Minum', '2', '6000', '12000');
INSERT INTO `expense_details` VALUES ('52', '30', 'Ongkir', '1', '2000', '2000');
INSERT INTO `expense_details` VALUES ('53', '39', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('54', '39', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('55', '39', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('56', '39', 'B 3171 PXA', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('57', '39', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('58', '40', 'B 3171 PXA', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('59', '40', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('60', '40', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('61', '40', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('62', '40', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('63', '41', 'B 6396 PPQ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('64', '41', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('65', '41', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('66', '42', 'Top Up E tol ', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('67', '43', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `expense_details` VALUES ('68', '43', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `expense_details` VALUES ('69', '43', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `expense_details` VALUES ('70', '44', 'Tokopedia (Iqbal Fikri)', '1', '202750', '202750');
INSERT INTO `expense_details` VALUES ('71', '45', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('72', '46', 'Dana (Listrik) Abi Maulana', '1', '21500', '21500');
INSERT INTO `expense_details` VALUES ('73', '47', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `expense_details` VALUES ('74', '48', 'Bensin Motor', '1', '15000', '15000');
INSERT INTO `expense_details` VALUES ('75', '48', 'Parkir', '1', '10000', '10000');
INSERT INTO `expense_details` VALUES ('77', '49', 'Ongkir', '1', '2000', '2000');
INSERT INTO `expense_details` VALUES ('78', '49', 'Air Minum', '3', '7000', '21000');
INSERT INTO `expense_details` VALUES ('79', '50', 'Dana (Listrik) Lutfi ', '1', '201500', '201500');
INSERT INTO `expense_details` VALUES ('80', '51', 'Tunjangan Hari Raya ( Security )', '1', '200000', '200000');
INSERT INTO `expense_details` VALUES ('81', '52', 'Tunjangan Hari Raya ( Rukun Tetangga )', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('82', '53', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('83', '53', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('84', '53', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('85', '53', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('86', '53', 'B 6396 PPQ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('87', '54', 'M Banking BCA Lutfi ', '1', '201500', '201500');
INSERT INTO `expense_details` VALUES ('88', '55', 'Isi Ulang Aqua', '2', '6000', '12000');
INSERT INTO `expense_details` VALUES ('89', '56', 'Dana (Listrik) Lutfi ', '1', '201500', '201500');
INSERT INTO `expense_details` VALUES ('90', '57', 'Tokopedia (Listrik) Iqbal Fikri', '1', '202750', '202750');
INSERT INTO `expense_details` VALUES ('92', '59', 'Drain gun blaster (Tembakan Pipa Saluran Air)', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('93', '58', 'Makan', '1', '25000', '25000');
INSERT INTO `expense_details` VALUES ('94', '58', 'Bensin', '1', '25000', '25000');
INSERT INTO `expense_details` VALUES ('95', '60', 'Bohlam LED In Lite 7watt', '2', '25000', '50000');
INSERT INTO `expense_details` VALUES ('96', '61', 'M Banking BCA Herlansyah', '1', '102500', '102500');
INSERT INTO `expense_details` VALUES ('97', '62', 'Pemasangan Server Dell  (sn:D6JDT92)', '1', '250000', '250000');
INSERT INTO `expense_details` VALUES ('98', '63', 'Bensin Motor + Parkir', '1', '50000', '50000');
INSERT INTO `expense_details` VALUES ('99', '64', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('100', '64', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('101', '64', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('102', '64', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('103', '65', 'Restart Server', '1', '30000', '30000');
INSERT INTO `expense_details` VALUES ('104', '64', 'B 6598 SMY', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('105', '73', 'B 6598 SMY', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('106', '73', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('107', '73', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `expense_details` VALUES ('108', '73', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `expense_details` VALUES ('109', '73', 'B 3011 SWZ', '1', '100000', '100000');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2020_07_08_141130_create_admins_table', '2');
INSERT INTO `migrations` VALUES ('6', '2020_07_08_145603_create_permission_tables', '3');
INSERT INTO `migrations` VALUES ('7', '2014_10_12_100000_create_password_resets_table', '4');
INSERT INTO `migrations` VALUES ('8', '2019_02_02_112609_create_settings_table', '4');
INSERT INTO `migrations` VALUES ('9', '2014_10_12_000000_create_users_table', '5');
INSERT INTO `migrations` VALUES ('10', '2016_06_01_000001_create_oauth_auth_codes_table', '6');
INSERT INTO `migrations` VALUES ('11', '2016_06_01_000002_create_oauth_access_tokens_table', '6');
INSERT INTO `migrations` VALUES ('12', '2016_06_01_000003_create_oauth_refresh_tokens_table', '6');
INSERT INTO `migrations` VALUES ('13', '2016_06_01_000004_create_oauth_clients_table', '6');
INSERT INTO `migrations` VALUES ('14', '2016_06_01_000005_create_oauth_personal_access_clients_table', '6');
INSERT INTO `migrations` VALUES ('16', '2020_07_12_220312_create_blogs_table', '7');

-- ----------------------------
-- Table structure for `model_has_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `model_has_roles`
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES ('1', 'App\\Models\\Admin', '1');

-- ----------------------------
-- Table structure for `m_barang`
-- ----------------------------
DROP TABLE IF EXISTS `m_barang`;
CREATE TABLE `m_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(20) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of m_barang
-- ----------------------------
INSERT INTO `m_barang` VALUES ('1', 'PC', 'PC Dektop', 'DN-KS-1');
INSERT INTO `m_barang` VALUES ('2', 'PC', 'PC Dektop', 'DN-KS-2');
INSERT INTO `m_barang` VALUES ('3', 'PC', 'PC Dektop', 'DN-KS-3');
INSERT INTO `m_barang` VALUES ('4', 'PC', 'PC Dektop', 'DN-KS-4');
INSERT INTO `m_barang` VALUES ('5', 'PC', 'PC Dektop', 'DN-KS-5');
INSERT INTO `m_barang` VALUES ('6', 'PC', 'PC Dektop', 'DN-KS-6');
INSERT INTO `m_barang` VALUES ('7', 'PC', 'PC Dektop', 'DN-KS-7');
INSERT INTO `m_barang` VALUES ('8', 'PC', 'PC Dektop', 'DN-KS-8');
INSERT INTO `m_barang` VALUES ('9', 'PC', 'PC Dektop', 'DN-KS-9');
INSERT INTO `m_barang` VALUES ('10', 'PC', 'PC Dektop', 'DN-KS-10');
INSERT INTO `m_barang` VALUES ('11', 'PC', 'PC Dektop', 'DN-KS-11');
INSERT INTO `m_barang` VALUES ('12', 'PC', 'PC Dektop', 'DN-KS-12');
INSERT INTO `m_barang` VALUES ('13', 'PC', 'PC Dektop', 'DN-KS-13');
INSERT INTO `m_barang` VALUES ('14', 'PC', 'PC Dektop', 'DN-KS-14');
INSERT INTO `m_barang` VALUES ('15', 'PC', 'PC Dektop', 'DN-KS-15');
INSERT INTO `m_barang` VALUES ('16', 'PC', 'PC Dektop', 'DN-KS-16');
INSERT INTO `m_barang` VALUES ('17', 'PC', 'PC Dektop', 'DN-KS-17');
INSERT INTO `m_barang` VALUES ('18', 'PC', 'PC Dektop', 'DN-KS-18');
INSERT INTO `m_barang` VALUES ('19', 'PC', 'PC Dektop', 'DN-KS-19');
INSERT INTO `m_barang` VALUES ('20', 'PC', 'PC Dektop', 'DN-KS-20');
INSERT INTO `m_barang` VALUES ('21', 'PC', 'PC Dektop', 'DN-KS-21');
INSERT INTO `m_barang` VALUES ('22', 'PC', 'PC Dektop', 'DN-KS-22');
INSERT INTO `m_barang` VALUES ('23', 'PC', 'PC Dektop', 'DN-KS-23');
INSERT INTO `m_barang` VALUES ('24', 'PC', 'PC Dektop', 'DN-KS-24');
INSERT INTO `m_barang` VALUES ('25', 'PC', 'PC Dektop', 'DN-KS-25');
INSERT INTO `m_barang` VALUES ('26', 'PC', 'PC Dektop', 'DN-KS-26');
INSERT INTO `m_barang` VALUES ('27', 'PC', 'PC Dektop', 'DN-KS-27');
INSERT INTO `m_barang` VALUES ('28', 'PC', 'PC Dektop', 'DN-KS-28');
INSERT INTO `m_barang` VALUES ('29', 'PC', 'PC Dektop', 'DN-KS-29');
INSERT INTO `m_barang` VALUES ('30', 'PC', 'PC Dektop', 'DN-KS-30');
INSERT INTO `m_barang` VALUES ('31', 'PC', 'PC Dektop', 'DN-KS-31');
INSERT INTO `m_barang` VALUES ('32', 'PC', 'PC Dektop', 'DN-KS-32');
INSERT INTO `m_barang` VALUES ('33', 'PC', 'PC Dektop', 'DN-KS-33');
INSERT INTO `m_barang` VALUES ('34', 'PC', 'PC Dektop', 'DN-KS-34');
INSERT INTO `m_barang` VALUES ('35', 'PC', 'PC Dektop', 'DN-KS-35');
INSERT INTO `m_barang` VALUES ('36', 'PC', 'PC Dektop', 'DN-KS-36');
INSERT INTO `m_barang` VALUES ('37', 'PC', 'PC Dektop', 'DN-KS-37');
INSERT INTO `m_barang` VALUES ('38', 'PC', 'PC Dektop', 'DN-KS-38');
INSERT INTO `m_barang` VALUES ('39', 'PC', 'PC Dektop', 'DN-KS-39');
INSERT INTO `m_barang` VALUES ('40', 'PC', 'PC Dektop', 'DN-KS-40');
INSERT INTO `m_barang` VALUES ('41', 'PC', 'PC Dektop', 'DN-KS-41');
INSERT INTO `m_barang` VALUES ('42', 'PC', 'PC Dektop', 'DN-KS-42');
INSERT INTO `m_barang` VALUES ('43', 'PC', 'PC Dektop', 'DN-KS-43');
INSERT INTO `m_barang` VALUES ('44', 'PC', 'PC Dektop', 'DN-KS-44');
INSERT INTO `m_barang` VALUES ('45', 'PC', 'PC Dektop', 'DN-KS-45');
INSERT INTO `m_barang` VALUES ('46', 'PC', 'PC Dektop', 'DN-KS-46');
INSERT INTO `m_barang` VALUES ('47', 'PC', 'PC Dektop', 'DN-KS-47');
INSERT INTO `m_barang` VALUES ('48', 'PC', 'PC Dektop', 'DN-KS-48');
INSERT INTO `m_barang` VALUES ('49', 'PC', 'PC Dektop', 'DN-KS-49');
INSERT INTO `m_barang` VALUES ('50', 'PC', 'PC Dektop', 'DN-KS-50');
INSERT INTO `m_barang` VALUES ('51', 'PC', 'PC Dektop', 'DN-KS-51');
INSERT INTO `m_barang` VALUES ('52', 'PC', 'PC Dektop', 'DN-KS-52');
INSERT INTO `m_barang` VALUES ('53', 'PC', 'PC Dektop', 'DN-KS-53');
INSERT INTO `m_barang` VALUES ('54', 'PC', 'PC Dektop', 'DN-KS-54');
INSERT INTO `m_barang` VALUES ('55', 'PC', 'PC Dektop', 'DN-KS-55');
INSERT INTO `m_barang` VALUES ('56', 'PC', 'PC Dektop', 'DN-KS-56');
INSERT INTO `m_barang` VALUES ('57', 'PC', 'PC Dektop', 'DN-KS-57');
INSERT INTO `m_barang` VALUES ('58', 'PC', 'PC Dektop', 'DN-KS-58');
INSERT INTO `m_barang` VALUES ('59', 'PC', 'PC Dektop', 'DN-KS-59');
INSERT INTO `m_barang` VALUES ('60', 'PC', 'PC Dektop', 'DN-KS-60');
INSERT INTO `m_barang` VALUES ('61', 'PC', 'PC Dektop', 'DN-KS-61');
INSERT INTO `m_barang` VALUES ('62', 'PC', 'PC Dektop', 'DN-KS-62');
INSERT INTO `m_barang` VALUES ('63', 'PC', 'PC Dektop', 'DN-KS-63');
INSERT INTO `m_barang` VALUES ('64', 'PC', 'PC Dektop', 'DN-KS-64');
INSERT INTO `m_barang` VALUES ('65', 'PC', 'Monitor', 'MN-KS-1');
INSERT INTO `m_barang` VALUES ('66', 'PC', 'Monitor', 'MN-KS-2');
INSERT INTO `m_barang` VALUES ('67', 'PC', 'Monitor', 'MN-KS-3');
INSERT INTO `m_barang` VALUES ('68', 'PC', 'Monitor', 'MN-KS-4');
INSERT INTO `m_barang` VALUES ('69', 'PC', 'Monitor', 'MN-KS-5');
INSERT INTO `m_barang` VALUES ('70', 'PC', 'Monitor', 'MN-KS-6');
INSERT INTO `m_barang` VALUES ('71', 'PC', 'Monitor', 'MN-KS-7');
INSERT INTO `m_barang` VALUES ('72', 'PC', 'Monitor', 'MN-KS-8');
INSERT INTO `m_barang` VALUES ('73', 'PC', 'Monitor', 'MN-KS-9');
INSERT INTO `m_barang` VALUES ('74', 'PC', 'Monitor', 'MN-KS-10');
INSERT INTO `m_barang` VALUES ('75', 'PC', 'Monitor', 'MN-KS-11');
INSERT INTO `m_barang` VALUES ('76', 'PC', 'Monitor', 'MN-KS-12');
INSERT INTO `m_barang` VALUES ('77', 'PC', 'Monitor', 'MN-KS-13');
INSERT INTO `m_barang` VALUES ('78', 'PC', 'Monitor', 'MN-KS-14');
INSERT INTO `m_barang` VALUES ('79', 'PC', 'Monitor', 'MN-KS-15');
INSERT INTO `m_barang` VALUES ('80', 'PC', 'Monitor', 'MN-KS-16');
INSERT INTO `m_barang` VALUES ('81', 'PC', 'Monitor', 'MN-KS-17');
INSERT INTO `m_barang` VALUES ('82', 'PC', 'Monitor', 'MN-KS-18');
INSERT INTO `m_barang` VALUES ('83', 'PC', 'Monitor', 'MN-KS-19');
INSERT INTO `m_barang` VALUES ('84', 'PC', 'Monitor', 'MN-KS-20');
INSERT INTO `m_barang` VALUES ('85', 'PC', 'Monitor', 'MN-KS-21');
INSERT INTO `m_barang` VALUES ('86', 'PC', 'Monitor', 'MN-KS-22');
INSERT INTO `m_barang` VALUES ('87', 'PC', 'Monitor', 'MN-KS-23');
INSERT INTO `m_barang` VALUES ('88', 'PC', 'Monitor', 'MN-KS-24');
INSERT INTO `m_barang` VALUES ('89', 'PC', 'Monitor', 'MN-KS-25');
INSERT INTO `m_barang` VALUES ('90', 'PC', 'Monitor', 'MN-KS-26');
INSERT INTO `m_barang` VALUES ('91', 'PC', 'Monitor', 'MN-KS-27');
INSERT INTO `m_barang` VALUES ('92', 'PC', 'Monitor', 'MN-KS-28');
INSERT INTO `m_barang` VALUES ('93', 'PC', 'Monitor', 'MN-KS-29');
INSERT INTO `m_barang` VALUES ('94', 'PC', 'Monitor', 'MN-KS-30');
INSERT INTO `m_barang` VALUES ('95', 'PC', 'Monitor', 'MN-KS-31');
INSERT INTO `m_barang` VALUES ('96', 'PC', 'Monitor', 'MN-KS-32');
INSERT INTO `m_barang` VALUES ('97', 'PC', 'Monitor', 'MN-KS-33');
INSERT INTO `m_barang` VALUES ('98', 'PC', 'Monitor', 'MN-KS-34');
INSERT INTO `m_barang` VALUES ('99', 'PC', 'Monitor', 'MN-KS-35');
INSERT INTO `m_barang` VALUES ('100', 'PC', 'Monitor', 'MN-KS-36');
INSERT INTO `m_barang` VALUES ('101', 'PC', 'Monitor', 'MN-KS-37');
INSERT INTO `m_barang` VALUES ('102', 'PC', 'Monitor', 'MN-KS-38');
INSERT INTO `m_barang` VALUES ('103', 'PC', 'Monitor', 'MN-KS-39');
INSERT INTO `m_barang` VALUES ('104', 'PC', 'Monitor', 'MN-KS-40');
INSERT INTO `m_barang` VALUES ('105', 'PC', 'Monitor', 'MN-KS-41');
INSERT INTO `m_barang` VALUES ('106', 'PC', 'Monitor', 'MN-KS-42');
INSERT INTO `m_barang` VALUES ('107', 'PC', 'Monitor', 'MN-KS-43');
INSERT INTO `m_barang` VALUES ('108', 'PC', 'Monitor', 'MN-KS-44');
INSERT INTO `m_barang` VALUES ('109', 'PC', 'Monitor', 'MN-KS-45');
INSERT INTO `m_barang` VALUES ('110', 'PC', 'Monitor', 'MN-KS-46');
INSERT INTO `m_barang` VALUES ('111', 'PC', 'Monitor', 'MN-KS-47');
INSERT INTO `m_barang` VALUES ('112', 'PC', 'Monitor', 'MN-KS-48');
INSERT INTO `m_barang` VALUES ('113', 'PC', 'Monitor', 'MN-KS-49');
INSERT INTO `m_barang` VALUES ('114', 'PC', 'Monitor', 'MN-KS-50');
INSERT INTO `m_barang` VALUES ('115', 'PC', 'Monitor', 'MN-KS-51');
INSERT INTO `m_barang` VALUES ('116', 'PC', 'Monitor', 'MN-KS-52');
INSERT INTO `m_barang` VALUES ('117', 'PC', 'Monitor', 'MN-KS-53');
INSERT INTO `m_barang` VALUES ('118', 'PC', 'Monitor', 'MN-KS-54');
INSERT INTO `m_barang` VALUES ('119', 'PC', 'Monitor', 'MN-KS-55');
INSERT INTO `m_barang` VALUES ('120', 'PC', 'Monitor', 'MN-KS-56');
INSERT INTO `m_barang` VALUES ('121', 'PC', 'Monitor', 'MN-KS-57');
INSERT INTO `m_barang` VALUES ('122', 'PC', 'Monitor', 'MN-KS-58');
INSERT INTO `m_barang` VALUES ('123', 'PC', 'Monitor', 'MN-KS-59');
INSERT INTO `m_barang` VALUES ('124', 'PC', 'Monitor', 'MN-KS-60');
INSERT INTO `m_barang` VALUES ('125', 'PC', 'Monitor', 'MN-KS-61');
INSERT INTO `m_barang` VALUES ('126', 'PC', 'Monitor', 'MN-KS-62');
INSERT INTO `m_barang` VALUES ('127', 'PC', 'Monitor', 'MN-KS-63');
INSERT INTO `m_barang` VALUES ('128', 'PC', 'Monitor', 'MN-KS-64');
INSERT INTO `m_barang` VALUES ('129', 'PC', 'Mouse', 'MSN-KS-1');
INSERT INTO `m_barang` VALUES ('130', 'PC', 'Mouse', 'MSN-KS-2');
INSERT INTO `m_barang` VALUES ('131', 'PC', 'Mouse', 'MSN-KS-3');
INSERT INTO `m_barang` VALUES ('132', 'PC', 'Mouse', 'MSN-KS-4');
INSERT INTO `m_barang` VALUES ('133', 'PC', 'Mouse', 'MSN-KS-5');
INSERT INTO `m_barang` VALUES ('134', 'PC', 'Mouse', 'MSN-KS-6');
INSERT INTO `m_barang` VALUES ('135', 'PC', 'Mouse', 'MSN-KS-7');
INSERT INTO `m_barang` VALUES ('136', 'PC', 'Mouse', 'MSN-KS-8');
INSERT INTO `m_barang` VALUES ('137', 'PC', 'Mouse', 'MSN-KS-9');
INSERT INTO `m_barang` VALUES ('138', 'PC', 'Mouse', 'MSN-KS-10');
INSERT INTO `m_barang` VALUES ('139', 'PC', 'Mouse', 'MSN-KS-11');
INSERT INTO `m_barang` VALUES ('140', 'PC', 'Mouse', 'MSN-KS-12');
INSERT INTO `m_barang` VALUES ('141', 'PC', 'Mouse', 'MSN-KS-13');
INSERT INTO `m_barang` VALUES ('142', 'PC', 'Mouse', 'MSN-KS-14');
INSERT INTO `m_barang` VALUES ('143', 'PC', 'Mouse', 'MSN-KS-15');
INSERT INTO `m_barang` VALUES ('144', 'PC', 'Mouse', 'MSN-KS-16');
INSERT INTO `m_barang` VALUES ('145', 'PC', 'Mouse', 'MSN-KS-17');
INSERT INTO `m_barang` VALUES ('146', 'PC', 'Mouse', 'MSN-KS-18');
INSERT INTO `m_barang` VALUES ('147', 'PC', 'Mouse', 'MSN-KS-19');
INSERT INTO `m_barang` VALUES ('148', 'PC', 'Mouse', 'MSN-KS-20');
INSERT INTO `m_barang` VALUES ('149', 'PC', 'Mouse', 'MSN-KS-21');
INSERT INTO `m_barang` VALUES ('150', 'PC', 'Mouse', 'MSN-KS-22');
INSERT INTO `m_barang` VALUES ('151', 'PC', 'Mouse', 'MSN-KS-23');
INSERT INTO `m_barang` VALUES ('152', 'PC', 'Mouse', 'MSN-KS-24');
INSERT INTO `m_barang` VALUES ('153', 'PC', 'Mouse', 'MSN-KS-25');
INSERT INTO `m_barang` VALUES ('154', 'PC', 'Mouse', 'MSN-KS-26');
INSERT INTO `m_barang` VALUES ('155', 'PC', 'Mouse', 'MSN-KS-27');
INSERT INTO `m_barang` VALUES ('156', 'PC', 'Mouse', 'MSN-KS-28');
INSERT INTO `m_barang` VALUES ('157', 'PC', 'Mouse', 'MSN-KS-29');
INSERT INTO `m_barang` VALUES ('158', 'PC', 'Mouse', 'MSN-KS-30');
INSERT INTO `m_barang` VALUES ('159', 'PC', 'Mouse', 'MSN-KS-31');
INSERT INTO `m_barang` VALUES ('160', 'PC', 'Mouse', 'MSN-KS-32');
INSERT INTO `m_barang` VALUES ('161', 'PC', 'Mouse', 'MSN-KS-33');
INSERT INTO `m_barang` VALUES ('162', 'PC', 'Mouse', 'MSN-KS-34');
INSERT INTO `m_barang` VALUES ('163', 'PC', 'Mouse', 'MSN-KS-35');
INSERT INTO `m_barang` VALUES ('164', 'PC', 'Mouse', 'MSN-KS-36');
INSERT INTO `m_barang` VALUES ('165', 'PC', 'Mouse', 'MSN-KS-37');
INSERT INTO `m_barang` VALUES ('166', 'PC', 'Mouse', 'MSN-KS-38');
INSERT INTO `m_barang` VALUES ('167', 'PC', 'Mouse', 'MSN-KS-39');
INSERT INTO `m_barang` VALUES ('168', 'PC', 'Mouse', 'MSN-KS-40');
INSERT INTO `m_barang` VALUES ('169', 'PC', 'Mouse', 'MSN-KS-41');
INSERT INTO `m_barang` VALUES ('170', 'PC', 'Mouse', 'MSN-KS-42');
INSERT INTO `m_barang` VALUES ('171', 'PC', 'Mouse', 'MSN-KS-43');
INSERT INTO `m_barang` VALUES ('172', 'PC', 'Mouse', 'MSN-KS-44');
INSERT INTO `m_barang` VALUES ('173', 'PC', 'Mouse', 'MSN-KS-45');
INSERT INTO `m_barang` VALUES ('174', 'PC', 'Mouse', 'MSN-KS-46');
INSERT INTO `m_barang` VALUES ('175', 'PC', 'Mouse', 'MSN-KS-47');
INSERT INTO `m_barang` VALUES ('176', 'PC', 'Mouse', 'MSN-KS-48');
INSERT INTO `m_barang` VALUES ('177', 'PC', 'Mouse', 'MSN-KS-49');
INSERT INTO `m_barang` VALUES ('178', 'PC', 'Mouse', 'MSN-KS-50');
INSERT INTO `m_barang` VALUES ('179', 'PC', 'Mouse', 'MSN-KS-51');
INSERT INTO `m_barang` VALUES ('180', 'PC', 'Mouse', 'MSN-KS-52');
INSERT INTO `m_barang` VALUES ('181', 'PC', 'Mouse', 'MSN-KS-53');
INSERT INTO `m_barang` VALUES ('182', 'PC', 'Mouse', 'MSN-KS-54');
INSERT INTO `m_barang` VALUES ('183', 'PC', 'Mouse', 'MSN-KS-55');
INSERT INTO `m_barang` VALUES ('184', 'PC', 'Mouse', 'MSN-KS-56');
INSERT INTO `m_barang` VALUES ('185', 'PC', 'Mouse', 'MSN-KS-57');
INSERT INTO `m_barang` VALUES ('186', 'PC', 'Mouse', 'MSN-KS-58');
INSERT INTO `m_barang` VALUES ('187', 'PC', 'Mouse', 'MSN-KS-59');
INSERT INTO `m_barang` VALUES ('188', 'PC', 'Mouse', 'MSN-KS-60');
INSERT INTO `m_barang` VALUES ('189', 'PC', 'Mouse', 'MSN-KS-61');
INSERT INTO `m_barang` VALUES ('190', 'PC', 'Mouse', 'MSN-KS-62');
INSERT INTO `m_barang` VALUES ('191', 'PC', 'Mouse', 'MSN-KS-63');
INSERT INTO `m_barang` VALUES ('192', 'PC', 'Mouse', 'MSN-KS-64');
INSERT INTO `m_barang` VALUES ('193', 'PC', 'Keyboard', 'KYN-KS-1');
INSERT INTO `m_barang` VALUES ('194', 'PC', 'Keyboard', 'KYN-KS-2');
INSERT INTO `m_barang` VALUES ('195', 'PC', 'Keyboard', 'KYN-KS-3');
INSERT INTO `m_barang` VALUES ('196', 'PC', 'Keyboard', 'KYN-KS-4');
INSERT INTO `m_barang` VALUES ('197', 'PC', 'Keyboard', 'KYN-KS-5');
INSERT INTO `m_barang` VALUES ('198', 'PC', 'Keyboard', 'KYN-KS-6');
INSERT INTO `m_barang` VALUES ('199', 'PC', 'Keyboard', 'KYN-KS-7');
INSERT INTO `m_barang` VALUES ('200', 'PC', 'Keyboard', 'KYN-KS-8');
INSERT INTO `m_barang` VALUES ('201', 'PC', 'Keyboard', 'KYN-KS-9');
INSERT INTO `m_barang` VALUES ('202', 'PC', 'Keyboard', 'KYN-KS-10');
INSERT INTO `m_barang` VALUES ('203', 'PC', 'Keyboard', 'KYN-KS-11');
INSERT INTO `m_barang` VALUES ('204', 'PC', 'Keyboard', 'KYN-KS-12');
INSERT INTO `m_barang` VALUES ('205', 'PC', 'Keyboard', 'KYN-KS-13');
INSERT INTO `m_barang` VALUES ('206', 'PC', 'Keyboard', 'KYN-KS-14');
INSERT INTO `m_barang` VALUES ('207', 'PC', 'Keyboard', 'KYN-KS-15');
INSERT INTO `m_barang` VALUES ('208', 'PC', 'Keyboard', 'KYN-KS-16');
INSERT INTO `m_barang` VALUES ('209', 'PC', 'Keyboard', 'KYN-KS-17');
INSERT INTO `m_barang` VALUES ('210', 'PC', 'Keyboard', 'KYN-KS-18');
INSERT INTO `m_barang` VALUES ('211', 'PC', 'Keyboard', 'KYN-KS-19');
INSERT INTO `m_barang` VALUES ('212', 'PC', 'Keyboard', 'KYN-KS-20');
INSERT INTO `m_barang` VALUES ('213', 'PC', 'Keyboard', 'KYN-KS-21');
INSERT INTO `m_barang` VALUES ('214', 'PC', 'Keyboard', 'KYN-KS-22');
INSERT INTO `m_barang` VALUES ('215', 'PC', 'Keyboard', 'KYN-KS-23');
INSERT INTO `m_barang` VALUES ('216', 'PC', 'Keyboard', 'KYN-KS-24');
INSERT INTO `m_barang` VALUES ('217', 'PC', 'Keyboard', 'KYN-KS-25');
INSERT INTO `m_barang` VALUES ('218', 'PC', 'Keyboard', 'KYN-KS-26');
INSERT INTO `m_barang` VALUES ('219', 'PC', 'Keyboard', 'KYN-KS-27');
INSERT INTO `m_barang` VALUES ('220', 'PC', 'Keyboard', 'KYN-KS-28');
INSERT INTO `m_barang` VALUES ('221', 'PC', 'Keyboard', 'KYN-KS-29');
INSERT INTO `m_barang` VALUES ('222', 'PC', 'Keyboard', 'KYN-KS-30');
INSERT INTO `m_barang` VALUES ('223', 'PC', 'Keyboard', 'KYN-KS-31');
INSERT INTO `m_barang` VALUES ('224', 'PC', 'Keyboard', 'KYN-KS-32');
INSERT INTO `m_barang` VALUES ('225', 'PC', 'Keyboard', 'KYN-KS-33');
INSERT INTO `m_barang` VALUES ('226', 'PC', 'Keyboard', 'KYN-KS-34');
INSERT INTO `m_barang` VALUES ('227', 'PC', 'Keyboard', 'KYN-KS-35');
INSERT INTO `m_barang` VALUES ('228', 'PC', 'Keyboard', 'KYN-KS-36');
INSERT INTO `m_barang` VALUES ('229', 'PC', 'Keyboard', 'KYN-KS-37');
INSERT INTO `m_barang` VALUES ('230', 'PC', 'Keyboard', 'KYN-KS-38');
INSERT INTO `m_barang` VALUES ('231', 'PC', 'Keyboard', 'KYN-KS-39');
INSERT INTO `m_barang` VALUES ('232', 'PC', 'Keyboard', 'KYN-KS-40');
INSERT INTO `m_barang` VALUES ('233', 'PC', 'Keyboard', 'KYN-KS-41');
INSERT INTO `m_barang` VALUES ('234', 'PC', 'Keyboard', 'KYN-KS-42');
INSERT INTO `m_barang` VALUES ('235', 'PC', 'Keyboard', 'KYN-KS-43');
INSERT INTO `m_barang` VALUES ('236', 'PC', 'Keyboard', 'KYN-KS-44');
INSERT INTO `m_barang` VALUES ('237', 'PC', 'Keyboard', 'KYN-KS-45');
INSERT INTO `m_barang` VALUES ('238', 'PC', 'Keyboard', 'KYN-KS-46');
INSERT INTO `m_barang` VALUES ('239', 'PC', 'Keyboard', 'KYN-KS-47');
INSERT INTO `m_barang` VALUES ('240', 'PC', 'Keyboard', 'KYN-KS-48');
INSERT INTO `m_barang` VALUES ('241', 'PC', 'Keyboard', 'KYN-KS-49');
INSERT INTO `m_barang` VALUES ('242', 'PC', 'Keyboard', 'KYN-KS-50');
INSERT INTO `m_barang` VALUES ('243', 'PC', 'Keyboard', 'KYN-KS-51');
INSERT INTO `m_barang` VALUES ('244', 'PC', 'Keyboard', 'KYN-KS-52');
INSERT INTO `m_barang` VALUES ('245', 'PC', 'Keyboard', 'KYN-KS-53');
INSERT INTO `m_barang` VALUES ('246', 'PC', 'Keyboard', 'KYN-KS-54');
INSERT INTO `m_barang` VALUES ('247', 'PC', 'Keyboard', 'KYN-KS-55');
INSERT INTO `m_barang` VALUES ('248', 'PC', 'Keyboard', 'KYN-KS-56');
INSERT INTO `m_barang` VALUES ('249', 'PC', 'Keyboard', 'KYN-KS-57');
INSERT INTO `m_barang` VALUES ('250', 'PC', 'Keyboard', 'KYN-KS-58');
INSERT INTO `m_barang` VALUES ('251', 'PC', 'Keyboard', 'KYN-KS-59');
INSERT INTO `m_barang` VALUES ('252', 'PC', 'Keyboard', 'KYN-KS-60');
INSERT INTO `m_barang` VALUES ('253', 'PC', 'Keyboard', 'KYN-KS-61');
INSERT INTO `m_barang` VALUES ('254', 'PC', 'Keyboard', 'KYN-KS-62');
INSERT INTO `m_barang` VALUES ('255', 'PC', 'Keyboard', 'KYN-KS-63');
INSERT INTO `m_barang` VALUES ('256', 'PC', 'Keyboard', 'KYN-KS-64');
INSERT INTO `m_barang` VALUES ('257', 'Laptop', 'Lenovo', 'LN-KS-1');
INSERT INTO `m_barang` VALUES ('258', 'Laptop', 'Lenovo', 'LN-KS-2');
INSERT INTO `m_barang` VALUES ('259', 'Laptop', 'Lenovo', 'LN-KS-3');
INSERT INTO `m_barang` VALUES ('260', 'Laptop', 'Lenovo', 'LN-KS-4');
INSERT INTO `m_barang` VALUES ('261', 'Laptop', 'Lenovo', 'LN-KS-5');
INSERT INTO `m_barang` VALUES ('262', 'Laptop', 'Lenovo', 'LN-KS-6');
INSERT INTO `m_barang` VALUES ('263', 'Laptop', 'Lenovo', 'LN-KS-7');
INSERT INTO `m_barang` VALUES ('264', 'Laptop', 'Lenovo', 'LN-KS-8');
INSERT INTO `m_barang` VALUES ('265', 'Laptop', 'Lenovo', 'LN-KS-9');
INSERT INTO `m_barang` VALUES ('266', 'Laptop', 'Lenovo', 'LN-KS-10');
INSERT INTO `m_barang` VALUES ('267', 'Laptop', 'Lenovo', 'LN-KS-11');
INSERT INTO `m_barang` VALUES ('268', 'Laptop', 'Lenovo', 'LN-KS-12');
INSERT INTO `m_barang` VALUES ('269', 'Laptop', 'Lenovo', 'LN-KS-13');
INSERT INTO `m_barang` VALUES ('270', 'Laptop', 'Lenovo', 'LN-KS-14');
INSERT INTO `m_barang` VALUES ('271', 'Laptop', 'Lenovo', 'LN-KS-15');
INSERT INTO `m_barang` VALUES ('272', 'Laptop', 'Lenovo', 'LN-KS-16');
INSERT INTO `m_barang` VALUES ('273', 'Laptop', 'Lenovo', 'LN-KS-17');
INSERT INTO `m_barang` VALUES ('274', 'Laptop', 'Lenovo', 'LN-KS-18');
INSERT INTO `m_barang` VALUES ('275', 'Laptop', 'Lenovo', 'LN-KS-19');
INSERT INTO `m_barang` VALUES ('276', 'Laptop', 'Lenovo', 'LN-KS-20');
INSERT INTO `m_barang` VALUES ('277', 'Laptop', 'Lenovo', 'LN-KS-21');
INSERT INTO `m_barang` VALUES ('278', 'Laptop', 'Lenovo', 'LN-KS-22');
INSERT INTO `m_barang` VALUES ('279', 'Laptop', 'Lenovo', 'LN-KS-23');
INSERT INTO `m_barang` VALUES ('280', 'Laptop', 'Lenovo', 'LN-KS-24');
INSERT INTO `m_barang` VALUES ('281', 'Laptop', 'Lenovo', 'LN-KS-25');
INSERT INTO `m_barang` VALUES ('282', 'Laptop', 'Lenovo', 'LN-KS-26');
INSERT INTO `m_barang` VALUES ('283', 'Laptop', 'Acer Aspire', 'LN-KS-27');
INSERT INTO `m_barang` VALUES ('284', 'Laptop', 'Acer Aspire', 'LN-KS-28');
INSERT INTO `m_barang` VALUES ('285', 'Laptop', 'Acer Aspire', 'LN-KS-29');
INSERT INTO `m_barang` VALUES ('286', 'Laptop', 'Acer Aspire', 'LN-KS-30');
INSERT INTO `m_barang` VALUES ('287', 'Laptop', 'Acer Aspire', 'LN-KS-31');
INSERT INTO `m_barang` VALUES ('288', 'Laptop', 'Acer Aspire', 'LN-KS-32');
INSERT INTO `m_barang` VALUES ('289', 'Laptop', 'Acer Aspire', 'LN-KS-33');
INSERT INTO `m_barang` VALUES ('290', 'Laptop', 'Acer Aspire', 'LN-KS-34');
INSERT INTO `m_barang` VALUES ('291', 'Laptop', 'Acer Aspire', 'LN-KS-35');
INSERT INTO `m_barang` VALUES ('292', 'Laptop', 'Acer Aspire', 'LN-KS-36');
INSERT INTO `m_barang` VALUES ('293', 'Laptop', 'Acer Aspire', 'LN-KS-37');
INSERT INTO `m_barang` VALUES ('294', 'Laptop', 'Acer Aspire', 'LN-KS-38');
INSERT INTO `m_barang` VALUES ('295', 'Laptop', 'Acer Aspire', 'LN-KS-39');
INSERT INTO `m_barang` VALUES ('296', 'Laptop', 'Acer Aspire', 'LN-KS-40');
INSERT INTO `m_barang` VALUES ('297', 'Laptop', 'Acer Aspire', 'LN-KS-41');
INSERT INTO `m_barang` VALUES ('298', 'Laptop', 'Acer Aspire', 'LN-KS-42');
INSERT INTO `m_barang` VALUES ('299', 'Laptop', 'Acer Aspire', 'LN-KS-43');
INSERT INTO `m_barang` VALUES ('300', 'Laptop', 'Acer Aspire', 'LN-KS-44');
INSERT INTO `m_barang` VALUES ('301', 'Laptop', 'Acer Aspire', 'LN-KS-45');
INSERT INTO `m_barang` VALUES ('302', 'Laptop', 'Acer Aspire', 'LN-KS-46');
INSERT INTO `m_barang` VALUES ('303', 'Laptop', 'Acer Aspire', 'LN-KS-47');
INSERT INTO `m_barang` VALUES ('304', 'Laptop', 'Acer Aspire', 'LN-KS-48');
INSERT INTO `m_barang` VALUES ('305', 'Laptop', 'Acer Aspire', 'LN-KS-49');
INSERT INTO `m_barang` VALUES ('306', 'Laptop', 'Acer Aspire', 'LN-KS-50');
INSERT INTO `m_barang` VALUES ('307', 'Laptop', 'Acer Aspire', 'LN-KS-51');
INSERT INTO `m_barang` VALUES ('308', 'Laptop', 'Acer Aspire', 'LN-KS-52');
INSERT INTO `m_barang` VALUES ('309', 'Laptop', 'Acer Aspire', 'LN-KS-53');
INSERT INTO `m_barang` VALUES ('310', 'Laptop', 'Acer Aspire', 'LN-KS-54');
INSERT INTO `m_barang` VALUES ('311', 'Laptop', 'Acer Aspire', 'LN-KS-55');
INSERT INTO `m_barang` VALUES ('312', 'Laptop', 'Acer Aspire', 'LN-KS-56');
INSERT INTO `m_barang` VALUES ('313', 'Laptop', 'Acer Aspire', 'LN-KS-57');
INSERT INTO `m_barang` VALUES ('314', 'Laptop', 'Acer Aspire', 'LN-KS-58');
INSERT INTO `m_barang` VALUES ('315', 'Laptop', 'Acer Aspire', 'LN-KS-59');
INSERT INTO `m_barang` VALUES ('316', 'Laptop', 'Acer Aspire', 'LN-KS-60');
INSERT INTO `m_barang` VALUES ('317', 'Laptop', 'Acer Aspire', 'LN-KS-61');
INSERT INTO `m_barang` VALUES ('318', 'Laptop', 'Acer Aspire', 'LN-KS-62');
INSERT INTO `m_barang` VALUES ('319', 'Laptop', 'Acer Aspire', 'LN-KS-63');
INSERT INTO `m_barang` VALUES ('320', 'Laptop', 'Acer Aspire', 'LN-KS-64');
INSERT INTO `m_barang` VALUES ('321', 'Laptop', 'Acer Aspire', 'LN-KS-65');
INSERT INTO `m_barang` VALUES ('322', 'Laptop', 'Acer Aspire', 'LN-KS-66');
INSERT INTO `m_barang` VALUES ('323', 'Laptop', 'Acer Aspire', 'LN-KS-67');
INSERT INTO `m_barang` VALUES ('324', 'Laptop', 'Acer Aspire', 'LN-KS-68');
INSERT INTO `m_barang` VALUES ('325', 'Laptop', 'Acer Aspire', 'LN-KS-69');
INSERT INTO `m_barang` VALUES ('326', 'Laptop', 'Acer Aspire', 'LN-KS-70');
INSERT INTO `m_barang` VALUES ('327', 'Laptop', 'Acer Aspire', 'LN-KS-71');
INSERT INTO `m_barang` VALUES ('328', 'Laptop', 'Acer Aspire', 'LN-KS-72');
INSERT INTO `m_barang` VALUES ('329', 'Laptop', 'Acer Aspire', 'LN-KS-73');
INSERT INTO `m_barang` VALUES ('330', 'Laptop', 'Acer Aspire', 'LN-KS-74');
INSERT INTO `m_barang` VALUES ('331', 'Laptop', 'Acer Aspire', 'LN-KS-75');
INSERT INTO `m_barang` VALUES ('332', 'Laptop', 'Acer Aspire', 'LN-KS-76');
INSERT INTO `m_barang` VALUES ('333', 'Laptop', 'Acer Aspire', 'LN-KS-77');
INSERT INTO `m_barang` VALUES ('334', 'Laptop', 'Acer Aspire', 'LN-KS-78');
INSERT INTO `m_barang` VALUES ('335', 'Laptop', 'Acer Aspire', 'LN-KS-79');
INSERT INTO `m_barang` VALUES ('336', 'Laptop', 'Acer Aspire', 'LN-KS-80');
INSERT INTO `m_barang` VALUES ('337', 'Laptop', 'Acer Aspire', 'LN-KS-81');
INSERT INTO `m_barang` VALUES ('338', 'Laptop', 'Acer Aspire', 'LN-KS-82');
INSERT INTO `m_barang` VALUES ('339', 'Laptop', 'Acer Aspire', 'LN-KS-83');
INSERT INTO `m_barang` VALUES ('340', 'Laptop', 'Acer Aspire', 'LN-KS-84');
INSERT INTO `m_barang` VALUES ('341', 'Laptop', 'Acer Aspire', 'LN-KS-85');
INSERT INTO `m_barang` VALUES ('342', 'Laptop', 'Acer Aspire', 'LN-KS-86');
INSERT INTO `m_barang` VALUES ('343', 'Laptop', 'Acer Aspire', 'LN-KS-87');
INSERT INTO `m_barang` VALUES ('344', 'Laptop', 'Acer Aspire', 'LN-KS-88');
INSERT INTO `m_barang` VALUES ('345', 'Laptop', 'Acer Aspire', 'LN-KS-89');
INSERT INTO `m_barang` VALUES ('346', 'Laptop', 'Acer Aspire', 'LN-KS-90');
INSERT INTO `m_barang` VALUES ('347', 'Laptop', 'Acer Aspire', 'LN-KS-91');
INSERT INTO `m_barang` VALUES ('348', 'Laptop', 'Acer Aspire', 'LN-KS-92');
INSERT INTO `m_barang` VALUES ('349', 'Laptop', 'Acer Aspire', 'LN-KS-93');
INSERT INTO `m_barang` VALUES ('350', 'Laptop', 'Acer Aspire', 'LN-KS-94');
INSERT INTO `m_barang` VALUES ('351', 'Laptop', 'Acer Aspire', 'LN-KS-95');
INSERT INTO `m_barang` VALUES ('352', 'Laptop', 'Acer Aspire', 'LN-KS-96');
INSERT INTO `m_barang` VALUES ('353', 'Laptop', 'Acer Aspire', 'LN-KS-97');
INSERT INTO `m_barang` VALUES ('354', 'Laptop', 'Acer Aspire', 'LN-KS-98');
INSERT INTO `m_barang` VALUES ('355', 'Laptop', 'Acer Aspire', 'LN-KS-99');
INSERT INTO `m_barang` VALUES ('356', 'Laptop', 'Acer Aspire', 'LN-KS-100');
INSERT INTO `m_barang` VALUES ('357', 'Laptop', 'Acer Aspire', 'LN-KS-101');
INSERT INTO `m_barang` VALUES ('358', 'Laptop', 'Acer Aspire', 'LN-KS-102');
INSERT INTO `m_barang` VALUES ('359', 'Laptop', 'Acer Aspire', 'LN-KS-103');

-- ----------------------------
-- Table structure for `oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('027ae400a8e608d36a65b1fcc48c85aec9f532a63339286a94fc5e06b1bc8b42e531232518a8118e', '1', '4', 'adminApiToken', '[]', '0', '2020-10-14 14:34:15', '2020-10-14 14:34:15', '2021-10-14 14:34:15');
INSERT INTO `oauth_access_tokens` VALUES ('0306edc7ce02806e6d9e2422bf49fd98e0b93d5fb7ad2998fbbb252e2205eb102315433151bbdace', '1', '6', 'adminApiToken', '[]', '0', '2024-02-19 17:48:31', '2024-02-19 17:48:31', '2025-02-19 17:48:31');
INSERT INTO `oauth_access_tokens` VALUES ('06f85f6f5cf4e1f80aa1a6e3d91613d276153ac8da05483eca73a43aec8593c41eb120d2c3386ca7', '1', '6', 'adminApiToken', '[]', '0', '2024-02-19 19:07:08', '2024-02-19 19:07:08', '2025-02-19 19:07:08');
INSERT INTO `oauth_access_tokens` VALUES ('16886740db939adcc5f6db3529641bb495892b27a450ba37eaf3b9b7b2aef645a6d0ca85a7a1c5bc', '1', '6', 'adminApiToken', '[]', '0', '2024-02-06 19:12:31', '2024-02-06 19:12:31', '2025-02-06 19:12:31');
INSERT INTO `oauth_access_tokens` VALUES ('16bdd5d9db9177217df5cf5075e7a67278ed43aa88e04435b2ac917c2042c1a29e29218a15f5a225', '1', '6', 'adminApiToken', '[]', '0', '2024-02-15 16:07:12', '2024-02-15 16:07:12', '2025-02-15 16:07:12');
INSERT INTO `oauth_access_tokens` VALUES ('198e1346516b0562574aec35cef3b68f61ba4491bfbb44ff3c3098c5722331e8c8fe40cb58045317', '1', '6', 'adminApiToken', '[]', '0', '2024-02-13 08:28:22', '2024-02-13 08:28:22', '2025-02-13 08:28:22');
INSERT INTO `oauth_access_tokens` VALUES ('24fab8def49bf9d67b82d6a653fb8bd84c54e7e388723c9edb8735cee0ef0f6404145ccbac78bac1', '1', '6', 'adminApiToken', '[]', '0', '2024-02-06 10:00:25', '2024-02-06 10:00:25', '2025-02-06 10:00:25');
INSERT INTO `oauth_access_tokens` VALUES ('2aebad3fba12c7739291dc83dc242acc78ce423f3ebc3c639a5f72d24c83c4662faca52d897acadc', '1', '6', 'adminApiToken', '[]', '0', '2024-02-05 10:10:50', '2024-02-05 10:10:50', '2025-02-05 10:10:50');
INSERT INTO `oauth_access_tokens` VALUES ('34cfca8b577333694edb5d4a43e45503ca2478f916462fe0c4d3c64a66dfb59f222dc11b06849cf7', '2', '1', 'userApiToken', '[]', '0', '2020-07-18 17:17:50', '2020-07-18 17:17:50', '2021-07-18 17:17:50');
INSERT INTO `oauth_access_tokens` VALUES ('426a51ada7bb0fd9074702dbb02a3760975885cf746983307381612052f83d75578d34ee86c7e9d3', '1', '6', 'adminApiToken', '[]', '0', '2024-02-20 12:27:24', '2024-02-20 12:27:24', '2025-02-20 12:27:24');
INSERT INTO `oauth_access_tokens` VALUES ('4720f6ba3e60e329f9c21bade704d3c5f2d4538efa5a2b3c4d4f7bfbe5d8020d7107bc4eea140024', '1', '6', 'adminApiToken', '[]', '0', '2024-02-16 06:23:12', '2024-02-16 06:23:12', '2025-02-16 06:23:12');
INSERT INTO `oauth_access_tokens` VALUES ('4b69481a1b0ce0482da4de7088bf31de79400e9f8c4a349be79822253aa423f25d7248fa887b4137', '1', '6', 'adminApiToken', '[]', '0', '2024-02-23 08:30:19', '2024-02-23 08:30:19', '2025-02-23 08:30:19');
INSERT INTO `oauth_access_tokens` VALUES ('53afccbe6cfc0a533d966a61881cf2b55fbafabd0bbb9c388b4605034d3ea22968091cf760b585c7', '1', '6', 'adminApiToken', '[]', '0', '2024-02-12 14:08:46', '2024-02-12 14:08:46', '2025-02-12 14:08:46');
INSERT INTO `oauth_access_tokens` VALUES ('5b8f639c4d1dc40eaccf18574030b75091007358a9e87cd42b26e20d48220c353779c305f20a6c3b', '1', '6', 'adminApiToken', '[]', '0', '2024-02-05 16:19:26', '2024-02-05 16:19:26', '2025-02-05 16:19:26');
INSERT INTO `oauth_access_tokens` VALUES ('609686a7f841a6e2c34119c3ec4edc68b3a9f00ed2456040248e26b58d06845ec1c20b99edb67f01', '1', '6', 'adminApiToken', '[]', '0', '2024-02-07 11:51:06', '2024-02-07 11:51:06', '2025-02-07 11:51:06');
INSERT INTO `oauth_access_tokens` VALUES ('6258d526cafa3b79e0f89fc36abc210a56538d973725dc707e6e60b28d722231d92674ada56f6e12', '1', '6', 'adminApiToken', '[]', '0', '2024-02-21 13:14:13', '2024-02-21 13:14:13', '2025-02-21 13:14:13');
INSERT INTO `oauth_access_tokens` VALUES ('67cba7b98c79510c5fac62493938fa857b1cf00da731c40c852ec4949f04be06e0dd476a84d94f8f', '1', '4', 'adminApiToken', '[]', '0', '2020-09-27 16:20:50', '2020-09-27 16:20:50', '2021-09-27 16:20:50');
INSERT INTO `oauth_access_tokens` VALUES ('67de938acb2cb370e18a0c97691d8316a3ec47086ab447fcc19eed4368d713a5c2f58ed2bde2022d', '1', '6', 'adminApiToken', '[]', '0', '2024-02-15 20:24:45', '2024-02-15 20:24:45', '2025-02-15 20:24:45');
INSERT INTO `oauth_access_tokens` VALUES ('72e78ccd24b8f2fbfa536a69c12cd40768929ae0071a627cf85dfba443f61d56b5eefeafa75de292', '1', '6', 'adminApiToken', '[]', '0', '2024-02-13 10:37:36', '2024-02-13 10:37:36', '2025-02-13 10:37:36');
INSERT INTO `oauth_access_tokens` VALUES ('74c321166c0bf95c3400a9c0a5f1daadf8b618bf57b01e8143142d2d4e7a8a7f1dcc9d38ffc7911f', '1', '6', 'adminApiToken', '[]', '0', '2024-02-02 20:50:04', '2024-02-02 20:50:04', '2025-02-02 20:50:04');
INSERT INTO `oauth_access_tokens` VALUES ('761975726cfeca2daee013b08720ebb4fb2d5d2c23d271bc0492503dfff21e6096404b2810f9fccd', '1', '6', 'adminApiToken', '[]', '0', '2024-02-13 13:49:53', '2024-02-13 13:49:53', '2025-02-13 13:49:53');
INSERT INTO `oauth_access_tokens` VALUES ('7e40475322cd8eb25fb18ed91f5daee1ca09c3026cf8edddd1152136d3ec758e197f6e47e7fa8152', '1', '6', 'adminApiToken', '[]', '0', '2024-02-02 17:13:27', '2024-02-02 17:13:27', '2025-02-02 17:13:27');
INSERT INTO `oauth_access_tokens` VALUES ('97036f5980b816680bd7015f9938e72593d5023d7ab2a10c53dc1512232c458425486ca7d1a8f91b', '1', '6', 'adminApiToken', '[]', '0', '2024-02-12 13:13:50', '2024-02-12 13:13:50', '2025-02-12 13:13:50');
INSERT INTO `oauth_access_tokens` VALUES ('a376e2a42b7d755e267aec99e0123f60b760462625de8a7f18d909ede5072cfe207e3f4758c89aed', '1', '6', 'adminApiToken', '[]', '0', '2024-02-12 17:05:29', '2024-02-12 17:05:29', '2025-02-12 17:05:29');
INSERT INTO `oauth_access_tokens` VALUES ('a419addf4ae7bea31145205699c7e95182f9c9957068f6e32554187ab3f7980bc5374635df10a69f', '1', '4', 'adminApiToken', '[]', '0', '2020-09-28 12:16:49', '2020-09-28 12:16:49', '2021-09-28 12:16:49');
INSERT INTO `oauth_access_tokens` VALUES ('a63a5ed742a080a9d8cf1379aa60e1ba0b0fbc087ffea1e858144bf92f87931119eedd334ace7ffb', '1', '4', 'adminApiToken', '[]', '0', '2020-10-15 11:20:50', '2020-10-15 11:20:50', '2021-10-15 11:20:50');
INSERT INTO `oauth_access_tokens` VALUES ('ab09563fd805d57dc698103035caa419b87a8872d5058901a99919a6770865ef4d1eb0030b7a0f7c', '1', '1', 'userApiToken', '[]', '0', '2020-07-18 17:13:13', '2020-07-18 17:13:13', '2021-07-18 17:13:13');
INSERT INTO `oauth_access_tokens` VALUES ('abdba656a23aed8c94dd36b775fabef09d251f31c54ec1c35ac84cc8eba82999b5898d17688f65b2', '1', '6', 'adminApiToken', '[]', '0', '2024-02-02 14:18:45', '2024-02-02 14:18:45', '2025-02-02 14:18:45');
INSERT INTO `oauth_access_tokens` VALUES ('b293cda6ab1802f4790eb1572dabbdc4f805d37d78eb743b48a8a0a9ccd39ed4e0881e72c40a7df9', '1', '6', 'adminApiToken', '[]', '0', '2024-02-22 18:00:19', '2024-02-22 18:00:19', '2025-02-22 18:00:19');
INSERT INTO `oauth_access_tokens` VALUES ('b3beead380d4047b7751df6099a38b448a2eb8ea76350dde5cc1791127994a2e14bbaf73a6c4344d', '1', '6', 'adminApiToken', '[]', '0', '2024-02-21 12:40:52', '2024-02-21 12:40:52', '2025-02-21 12:40:52');
INSERT INTO `oauth_access_tokens` VALUES ('bb42f06a00a887377a917efd4b8cc381c39b9a18d9d55ea457976b6deaab1b50a18f8545d407ddab', '1', '4', 'adminApiToken', '[]', '0', '2020-09-27 17:21:14', '2020-09-27 17:21:14', '2021-09-27 17:21:14');
INSERT INTO `oauth_access_tokens` VALUES ('c32bad5f108403c67c5598a659609598524c8d88fc3b1fca37a7b440e1cd0c200429bdaef3a1c51e', '1', '6', 'adminApiToken', '[]', '0', '2024-02-16 06:37:42', '2024-02-16 06:37:42', '2025-02-16 06:37:42');
INSERT INTO `oauth_access_tokens` VALUES ('c38c400bb08dee5fef293484a84cb9c4fbaf2114fbfd5e2abdd447d84abd6d23df53874ced11f910', '1', '6', 'adminApiToken', '[]', '0', '2024-02-07 11:27:58', '2024-02-07 11:27:58', '2025-02-07 11:27:58');
INSERT INTO `oauth_access_tokens` VALUES ('cfcd3c7c13ca1b13a76380de504c04b64acce9c3cc00b2fb6e3c6a132ad57a44cfc1950b61643344', '1', '6', 'adminApiToken', '[]', '0', '2024-02-15 15:01:57', '2024-02-15 15:01:57', '2025-02-15 15:01:57');
INSERT INTO `oauth_access_tokens` VALUES ('d464299a4c45d0a751f28e2b5b582895333c609f9baccd068428d389569cf3aa41ca19765007ab3e', '1', '6', 'adminApiToken', '[]', '0', '2024-02-07 12:00:18', '2024-02-07 12:00:18', '2025-02-07 12:00:18');
INSERT INTO `oauth_access_tokens` VALUES ('d9f29ed0d6be329356ca4be84dcae7fa56eeb89df4efbf9fcbe1dfdc882d9befe5abdc2dd9373383', '1', '4', 'Admin', '[]', '0', '2020-09-27 17:12:30', '2020-09-27 17:12:30', '2021-09-27 17:12:30');
INSERT INTO `oauth_access_tokens` VALUES ('dbd46365a5c1bc7058d285a3daf2b57c5a5674ad77937198a566be90f386d9b1a501a38a68fcc10f', '1', '6', 'adminApiToken', '[]', '0', '2024-02-13 16:18:26', '2024-02-13 16:18:26', '2025-02-13 16:18:26');
INSERT INTO `oauth_access_tokens` VALUES ('dcf24d9385de348f6322373538b210a7596b880aa7def6aeec7a63e917cd6b8a003a035c9e9e4947', '1', '4', 'adminApiToken', '[]', '0', '2020-09-27 17:20:34', '2020-09-27 17:20:34', '2021-09-27 17:20:34');
INSERT INTO `oauth_access_tokens` VALUES ('e24259ba391204a5617f346b7c918bb7554dbe711720b6c030ab0307ce18eddff0372a6e9723d509', '1', '6', 'adminApiToken', '[]', '0', '2024-02-22 12:24:29', '2024-02-22 12:24:29', '2025-02-22 12:24:29');
INSERT INTO `oauth_access_tokens` VALUES ('e53a815ed6cd3012e74d2a9d14e2234747cf0d55c681264513d1fa88e910803ea79cf606a26f406b', '1', '6', 'adminApiToken', '[]', '0', '2024-02-02 12:49:21', '2024-02-02 12:49:21', '2025-02-02 12:49:21');
INSERT INTO `oauth_access_tokens` VALUES ('e5d46d434f9879bdb183f643182b55836a12bc83c7b27663029edf9d9315eac88deaddb3b534872c', '1', '6', 'adminApiToken', '[]', '0', '2024-02-22 18:02:05', '2024-02-22 18:02:05', '2025-02-22 18:02:05');
INSERT INTO `oauth_access_tokens` VALUES ('e84f59893b6c34649af00f7c5310f96fc1665e85de5f120ff6f027b23250cf432e595043a4bbc929', '1', '6', 'adminApiToken', '[]', '0', '2024-02-20 20:34:40', '2024-02-20 20:34:40', '2025-02-20 20:34:40');
INSERT INTO `oauth_access_tokens` VALUES ('e85aef8b68057e3b3c32b5548092eca5a8dd31d082bb68b172d409ac1033109a07a7be9e27382d19', '1', '6', 'adminApiToken', '[]', '0', '2024-02-20 18:22:51', '2024-02-20 18:22:51', '2025-02-20 18:22:51');
INSERT INTO `oauth_access_tokens` VALUES ('f06c15fa2800cd39efe4570a0eb09c0a4a36becf7c3671a2c86634fd6b485d9cd6e50a60b706b33b', '1', '6', 'adminApiToken', '[]', '0', '2024-02-20 05:47:07', '2024-02-20 05:47:07', '2025-02-20 05:47:07');

-- ----------------------------
-- Table structure for `oauth_auth_codes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES ('1', null, 'Laravel7 Boilerplate Personal Access Client', 'Ue8FQpWBQqhtri31cNsPRvbNewyfiQZV7oiGglm9', '', 'http://localhost', '1', '0', '0', '2020-07-12 21:40:52', '2020-07-12 21:40:52');
INSERT INTO `oauth_clients` VALUES ('2', null, 'Laravel7 Boilerplate Password Grant Client', 'YnLJHdBV6qJSQHnAzCD4MAOVTpJ9sSmdnM8T78xY', 'users', 'http://localhost', '0', '1', '0', '2020-07-12 21:40:52', '2020-07-12 21:40:52');
INSERT INTO `oauth_clients` VALUES ('3', null, 'Moblie Apps', 'ZlnWXAvjeW1CoeKWb6PXI2GfnvjZ3vxrNoQ045E1', 'users', 'http://localhost', '0', '1', '0', '2020-07-18 12:22:38', '2020-07-18 12:22:38');
INSERT INTO `oauth_clients` VALUES ('4', null, 'Laravel 8 Boilerplate Personal Access Client', 'EE4IEqacN39YjXXXV5LWWzN3odRfeB5Wu9DA9Qfb', null, 'http://localhost', '1', '0', '0', '2020-09-26 17:58:06', '2020-09-26 17:58:06');
INSERT INTO `oauth_clients` VALUES ('5', null, 'Laravel 8 Boilerplate Password Grant Client', 'PHyBfYRldhPzj3UGafU0nuEoh1xiARC9dJi316oe', 'users', 'http://localhost', '0', '1', '0', '2020-09-26 17:58:06', '2020-09-26 17:58:06');
INSERT INTO `oauth_clients` VALUES ('6', null, 'Laravel Personal Access Client', 'iTQ1dMfoDNOteWTofEJhuGjGAXyzg0DgGkhbrX5O', null, 'http://localhost', '1', '0', '0', '2024-02-02 10:35:52', '2024-02-02 10:35:52');
INSERT INTO `oauth_clients` VALUES ('7', null, 'Laravel Password Grant Client', 'nXURUh5g1jlLv74YyVSTDmcZujKkDq5Wuu2JIBeT', 'users', 'http://localhost', '0', '1', '0', '2024-02-02 10:35:52', '2024-02-02 10:35:52');

-- ----------------------------
-- Table structure for `oauth_personal_access_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES ('1', '1', '2020-07-12 21:40:52', '2020-07-12 21:40:52');
INSERT INTO `oauth_personal_access_clients` VALUES ('2', '4', '2020-09-26 17:58:06', '2020-09-26 17:58:06');
INSERT INTO `oauth_personal_access_clients` VALUES ('3', '6', '2024-02-02 10:35:52', '2024-02-02 10:35:52');

-- ----------------------------
-- Table structure for `oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `pekerjaans`
-- ----------------------------
DROP TABLE IF EXISTS `pekerjaans`;
CREATE TABLE `pekerjaans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `perusahaan_id` bigint(20) unsigned DEFAULT NULL,
  `jenis_kontrak` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) unsigned DEFAULT NULL,
  `quotation_id` int(20) DEFAULT NULL,
  `status_pajak` varchar(255) DEFAULT NULL,
  `nama_pekerjaan` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_spk` varchar(255) DEFAULT NULL,
  `tgl_spk` date DEFAULT NULL,
  `nilai_kontrak` decimal(15,2) DEFAULT NULL,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `status_proyek` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of pekerjaans
-- ----------------------------
INSERT INTO `pekerjaans` VALUES ('1', '1', 'a', '1', '1', 'j', 'n', 'n', '1', '2024-02-21', '1.00', 'sd', '2024-02-21', '2024-02-22', 'aktic', '2024-02-21 14:24:21', '2024-02-21 14:24:25', '2024-02-21', null);
INSERT INTO `pekerjaans` VALUES ('2', '22', 'Jenis Kontrak 1', '1', '1', 'Status Pajak 1', 'koding', 'tes', '112', '2024-03-08', '1231.00', 'Metode Pembayaran 1', '2024-02-21', '2024-02-23', null, '2024-02-21 15:16:41', '2024-02-21 15:16:41', null, null);
INSERT INTO `pekerjaans` VALUES ('3', '25', 'Jenis Kontrak 1', '1', '1', 'Status Pajak 1', 'koding', 'tes', '112', '2024-03-08', '1231.00', 'Metode Pembayaran 1', '2024-02-21', '2024-02-23', null, '2024-02-21 15:22:34', '2024-02-21 15:22:34', null, null);
INSERT INTO `pekerjaans` VALUES ('4', '22', 'Jenis Kontrak 1', '1', '1', 'Status Pajak 1', 'koding', 'tes', '112', '2024-03-08', '1231.00', 'Metode Pembayaran 1', '2024-02-21', '2024-02-23', null, '2024-02-21 15:23:01', '2024-02-21 15:28:57', null, '2024-02-21 15:28:57');

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'role-view', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('2', 'role-create', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('3', 'role-edit', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('4', 'role-delete', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('5', 'permission-view', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('6', 'permission-create', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('7', 'permission-edit', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('8', 'permission-delete', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('9', 'user-view', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('10', 'user-create', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('11', 'user-edit', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('12', 'user-delete', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `permissions` VALUES ('13', 'blog-view', 'admin', '2020-07-13 19:37:29', '2020-07-13 19:37:29');
INSERT INTO `permissions` VALUES ('14', 'blog-create', 'admin', '2020-07-13 19:37:41', '2020-07-13 19:37:41');
INSERT INTO `permissions` VALUES ('15', 'blog-edit', 'admin', '2020-07-13 19:37:49', '2020-07-13 19:37:49');
INSERT INTO `permissions` VALUES ('16', 'blog-delete', 'admin', '2020-07-13 19:37:59', '2020-07-13 19:37:59');
INSERT INTO `permissions` VALUES ('17', 'operator-create', 'user', '2020-10-14 16:18:41', '2020-10-14 16:18:41');
INSERT INTO `permissions` VALUES ('18', 'range-create', 'user', '2020-10-15 11:22:11', '2020-10-15 11:22:11');
INSERT INTO `permissions` VALUES ('19', 'range-view', 'user', '2020-10-15 11:22:18', '2020-10-15 11:22:18');
INSERT INTO `permissions` VALUES ('20', 'range-edit', 'user', '2020-10-15 11:22:31', '2020-10-15 11:22:31');
INSERT INTO `permissions` VALUES ('21', 'range-delete', 'user', '2020-10-15 11:22:37', '2020-10-15 11:22:37');

-- ----------------------------
-- Table structure for `perusahaans`
-- ----------------------------
DROP TABLE IF EXISTS `perusahaans`;
CREATE TABLE `perusahaans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `nama_direktur` varchar(255) DEFAULT NULL,
  `rekening_bank` enum('Mandiri','BRI','BCA','BNI') DEFAULT NULL,
  `kop_surat` varchar(255) DEFAULT NULL,
  `stempel` varchar(255) DEFAULT NULL,
  `tanda_tangan` varchar(255) DEFAULT NULL,
  `pajak` varchar(255) DEFAULT NULL,
  `NPWP` varchar(255) DEFAULT NULL,
  `status` enum('Inactive','Active') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of perusahaans
-- ----------------------------
INSERT INTO `perusahaans` VALUES ('1', 'Nigmagrid', 'Dwijaya', '0887521512', 'pak Ikbal', 'Mandiri', 'SASa', 'Nigmagrid', 'KSkda', '10', 'sad', 'Inactive', '2024-02-13 06:02:40', '2024-02-15 16:10:53', '2024-02-15 16:10:53');
INSERT INTO `perusahaans` VALUES ('2', 'n', null, null, null, null, null, null, null, null, null, 'Inactive', null, '2024-02-15 17:12:27', '2024-02-15 17:12:27');
INSERT INTO `perusahaans` VALUES ('3', 'm', null, null, null, null, null, null, null, null, null, 'Inactive', '2024-02-15 13:49:53', '2024-02-15 17:10:50', '2024-02-15 17:10:50');
INSERT INTO `perusahaans` VALUES ('4', 'qewesadasd', 'awdaweqeq', null, null, null, null, null, null, null, null, 'Inactive', '2024-02-15 14:01:29', '2024-02-15 17:18:18', '2024-02-15 17:18:18');
INSERT INTO `perusahaans` VALUES ('5', 'dasd', 'asdas', '1234213414', null, null, null, null, null, null, null, 'Inactive', '2024-02-15 14:02:19', '2024-02-15 16:09:17', '2024-02-15 16:09:17');
INSERT INTO `perusahaans` VALUES ('6', 'hsad', 'jsadh', '2131421341', 'askndas', null, null, null, null, null, null, 'Inactive', '2024-02-15 14:03:39', '2024-02-15 17:20:56', '2024-02-15 17:20:56');
INSERT INTO `perusahaans` VALUES ('7', 'dwa', 'sad', '123123', '21312312', 'Mandiri', null, null, null, null, null, 'Inactive', '2024-02-15 14:08:52', '2024-02-15 17:43:02', '2024-02-15 17:43:02');
INSERT INTO `perusahaans` VALUES ('8', 'eqeweq', 'eqweq', '213213', 'dasdas', 'Mandiri', null, null, null, null, '21312', 'Inactive', '2024-02-15 14:35:52', '2024-02-15 17:27:14', '2024-02-15 17:27:14');
INSERT INTO `perusahaans` VALUES ('9', 'dsa', 'dsad', '321123', 'sdads', 'Mandiri', null, null, null, null, '2e131', 'Active', '2024-02-15 14:37:30', '2024-02-15 17:43:50', '2024-02-15 17:43:50');
INSERT INTO `perusahaans` VALUES ('10', 'adsad', 'sada', '21313', 'dsad', 'Mandiri', null, null, null, null, '231321', 'Active', '2024-02-15 14:41:14', '2024-02-15 16:09:06', '2024-02-15 16:09:06');
INSERT INTO `perusahaans` VALUES ('11', 'fadly', 'as', '1', 's', 'BRI', 'assets/images/perusahaan/HGqqyj5JmGUCJC8PbBBvuQGQmYpO1oTA5Hp2kOU0.jpg', null, null, null, '1', 'Active', '2024-02-15 15:41:08', '2024-02-15 17:21:56', '2024-02-15 17:21:56');
INSERT INTO `perusahaans` VALUES ('12', 'fadly', 'cigombong', '1234', 'asda', 'Mandiri', 'assets/images/perusahaan/IYcu4nwbCJCG5BktjMMtVT9AhDbGl5Txwlbw6hsD.png', null, 'assets/images/perusahaan/dVDJQwE5q9ZCA3oLEwTUO5Gd58gYQuDTZmAnQPWf.jpg', null, '1222', 'Inactive', '2024-02-15 16:57:48', '2024-02-15 17:10:03', '2024-02-15 17:10:03');
INSERT INTO `perusahaans` VALUES ('13', 'dsa', 'sdaads', '3e24', '42324', 'BRI', 'assets/images/perusahaan/jqnsGfwfT6dR3wa4LKRqux0cKDoD21P1yRLXhxyr.jpg', null, 'assets/images/perusahaan/gKVsSADi9FMu0lVSMCBKNMl5gZYnc3yyahDKeyTf.jpg', null, '342', 'Active', '2024-02-15 17:45:22', '2024-02-15 17:45:32', '2024-02-15 17:45:32');
INSERT INTO `perusahaans` VALUES ('14', '3eqwq', 'eqw', 'eqweq', 'eqw', 'Mandiri', 'assets/images/perusahaan/d2om6GPwio9aWq4jLaZQgGdexNYApI7L5D6wJKGA.jpg', null, 'assets/images/perusahaan/Jl4okm54FDLyZizts7uIU32O7UaTeN0JcWOaRHnM.jpg', null, '213', 'Active', '2024-02-15 17:48:19', '2024-02-15 17:48:50', '2024-02-15 17:48:50');
INSERT INTO `perusahaans` VALUES ('15', 'fadly', '111', '2131', 'asda', 'Mandiri', 'assets/images/perusahaan/kUpb7xcTUkndLUoHXQiKSUReucQwkQYLegzFtofx.jpg', null, 'assets/images/perusahaan/rspGqVSfLSkt8qmcZkqFZ1vcOCp2e209DCZzEoLI.jpg', null, '121', 'Active', '2024-02-15 17:58:00', '2024-02-15 18:16:36', '2024-02-15 18:16:36');
INSERT INTO `perusahaans` VALUES ('16', 'fadly', 'a', '121', 'a', 'Mandiri', 'assets/images/perusahaan/JzR2WCgxYDifsptXuQSqKVThFI67YwfbOm7HBE0X.jpg', null, 'assets/images/perusahaan/UyuaWXhGgolUSEzzHBwFXWTCodqpENFeGTLVQkfg.jpg', null, '1', 'Active', '2024-02-15 17:59:29', '2024-02-15 18:19:01', '2024-02-15 18:19:01');
INSERT INTO `perusahaans` VALUES ('17', 'asd', 'aa', '1', 'aa1', 'Mandiri', 'assets/images/perusahaan/nRNLRy47EOLulCrEqEyq32N5g2XkBzV6BgzTjEOT.jpg', null, 'assets/images/perusahaan/kdeROo3R2eVzzV7LDkC02Hz8xDTEPkESR8mp8Qow.jpg', null, '1', 'Active', '2024-02-15 18:00:34', '2024-02-15 18:07:33', '2024-02-15 18:07:33');
INSERT INTO `perusahaans` VALUES ('18', 'ad', 'a', '21', 'a', 'Mandiri', 'assets/images/perusahaan/zeQ3UKtORH799RRfyMc0fWId9cpRKtIhv5p6bU9e.jpg', null, 'assets/images/perusahaan/gIJgT0GWrvP4gTGZquYljlfIYdBQOXxn0rRRNeMB.jpg', null, '1', 'Active', '2024-02-15 18:02:22', '2024-02-15 18:20:25', '2024-02-15 18:20:25');
INSERT INTO `perusahaans` VALUES ('19', 'A', 'a', '2', 'a', 'Mandiri', 'assets/images/perusahaan/K033fjTZEFHA24FuZzgwnWEpZlt98CvNuE620Gr4.jpg', null, 'assets/images/perusahaan/yh8tJSnG084EkXlBF5MW8S6SgHtXB8oguv3JYpeC.jpg', null, '2', 'Active', '2024-02-15 18:04:02', '2024-02-15 18:20:37', '2024-02-15 18:20:37');
INSERT INTO `perusahaans` VALUES ('20', 'q', 'q', '1', 'q', 'Mandiri', 'assets/images/perusahaan/Gk2nOHVZawucWN2xHbWZe0I6Yp5cDkCKpmzwIy9G.jpg', null, 'assets/images/perusahaan/xilu3QaR1Lrodszx8gUR8bvrT33bnaaQIffsD9k2.jpg', null, '1', 'Active', '2024-02-15 18:05:24', '2024-02-15 18:13:32', '2024-02-15 18:13:32');
INSERT INTO `perusahaans` VALUES ('21', '12', '12', '112', '12', 'Mandiri', 'assets/images/perusahaan/l33rAIuMKkTwtjk1QNRGgtWG36wOztSrkP8S75eF.jpg', null, 'assets/images/perusahaan/Dgyhr2FHAYEflla3vLcnPi3WnyQAxQTGBiilJUut.jpg', null, '12', 'Active', '2024-02-15 18:06:39', '2024-02-15 18:12:18', '2024-02-15 18:12:18');
INSERT INTO `perusahaans` VALUES ('22', 'fadly', 'cigombong', '2131', 'asda', 'Mandiri', 'assets/images/perusahaan/AT8LCv7OiOzvFF47VhSkg8dbTmr4lfIFTzP2rcun.jpg', null, 'assets/images/perusahaan/gp4J8bOQR57Grsk1LdsCLi0zvI0dv8TgNGs4WmYt.jpg', null, '1231', 'Active', '2024-02-15 18:21:35', '2024-02-15 18:21:35', null);
INSERT INTO `perusahaans` VALUES ('23', 'a', 'a', 't', 't', 'Mandiri', 'assets/images/perusahaan/GxuhrRyurmQINWHWiQD39U84GqDYcg5NKJK3LhpM.jpg', null, 'assets/images/perusahaan/rtTnXyu3x4NjhxFhAtuhb81ntYX143VoWlCEH64f.jpg', null, 's', 'Active', '2024-02-15 18:24:23', '2024-02-15 18:58:47', '2024-02-15 18:58:47');
INSERT INTO `perusahaans` VALUES ('24', 'a', 's', '1', 'a', 'Mandiri', 'assets/images/perusahaan/p7cH8o4URoK2vKxVbuhVwwRKafn6F1tO2gedpaGQ.jpg', null, 'assets/images/perusahaan/z0v5dfxUcyCjrKphJBj2lZk6D3SAtjIKr2YU8WGQ.jpg', null, '1', 'Active', '2024-02-15 18:50:59', '2024-02-15 18:58:13', '2024-02-15 18:58:13');
INSERT INTO `perusahaans` VALUES ('25', 'saddsa1', 'weq', 'wq', 'dsa', 'Mandiri', 'assets/images/perusahaan/Yx5bIz7IKhOePlQxPZTU72TAMEO9Oair8S9VjzIv.jpg', null, 'assets/images/perusahaan/tdYlmgTCBxoK9LLETwvNCFWavvo74npKrjs54fs6.jpg', null, '12w1', 'Active', '2024-02-15 20:11:36', '2024-02-20 18:41:02', null);

-- ----------------------------
-- Table structure for `print_settings`
-- ----------------------------
DROP TABLE IF EXISTS `print_settings`;
CREATE TABLE `print_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) NOT NULL,
  `footer` longtext NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of print_settings
-- ----------------------------
INSERT INTO `print_settings` VALUES ('1', 'assets/images/logo/ss_nigma.png', '<div>\r\n<div>www.nigmagrid.net</div>\r\n<div>\r\n<div>\r\n<div>Puri Botanical H9-8</div>\r\n<div>\r\n<div>\r\n<div>Jakarta Barat 11640</div>\r\n<div>\r\n<div>\r\n<div>Indonesia</div>\r\n<div>\r\n<div>\r\n<div>62 21 589066608</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '1', '2024-02-02 19:39:20', '2024-02-02 19:39:20', '1');

-- ----------------------------
-- Table structure for `proyeks`
-- ----------------------------
DROP TABLE IF EXISTS `proyeks`;
CREATE TABLE `proyeks` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `perusahaan` int(2) DEFAULT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `jenis_kontrak` int(1) DEFAULT NULL,
  `client_id` int(2) DEFAULT NULL,
  `nama_pekerjaan` varchar(200) DEFAULT NULL,
  `no_spk` varchar(100) DEFAULT NULL,
  `tgl_spk` date DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `nilai_kontrak` double(100,0) DEFAULT NULL,
  `tgl_bast` date DEFAULT NULL,
  `no_bast` varchar(20) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `status_proyek` int(1) DEFAULT NULL,
  `metode_pembayaran` varchar(250) DEFAULT NULL,
  `id_quotation` int(2) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of proyeks
-- ----------------------------
INSERT INTO `proyeks` VALUES ('1', '1', 'BATS1', '1', '13', 'Jasa Pengembangan Aplikasi CV Karyawan', '02.B/KONTRAK-DIT/2019', '2019-01-24', '2019-01-24', '2019-02-22', '18', '0000-00-00', '', '', '0', 'Transfer ke no. rekening 1010077703377', '0', '2', '2020-03-04 11:01:14', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('2', '1', 'BATS2', '1', '8', 'PERJANJIAN PEMBERIAN JASA PENYUSUNAN ELECTRONIC DOCUMENT SYSTEM (EDMS)', 'No. KU.09.01/WB-0A.1936/2014', '2014-11-28', '2014-12-08', '2015-03-06', '1', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:14:08', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('3', '1', 'BATS3', '1', '5', 'PEKERJAAN PEMBUATAN SISTEM MONITORING READY MIX QR CODE PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA - CIKAMPEK II ELEVATED', '064/SPK-SUB/WK-ACSET/DIII/2018', '2018-01-22', '2018-01-22', '2018-12-22', '455', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:26:08', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('4', '1', 'BATS4', '1', '10', 'JNE ENTERPRISE PORTAL (SHAREPOINT)', 'P.O. No. :POHMS/1609/0010', '2016-09-01', '2016-09-01', '2016-11-01', '412', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:22:46', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('5', '1', 'BATS5', '1', '16', 'PERJANJIAN PENGADAAN APLIKASI MEMBERSHIP KFA ANTARA PT SIGMA CIPTA CARAKA', '185-PRC/SCC/BATS/A/15', '2015-09-09', '2015-09-04', '2015-10-04', '750', '0000-00-00', '', '', '0', 'Transfer Bank Kesejahteraan Ekonomi', '0', '2', '2020-03-04 10:52:14', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('6', '1', 'BATS6', '2', '3', 'PERJANJIAN JUAL BELI - MATERIAL NON OA', '07 .Amd01/SPBJ/DIVISI-EPC/PP/IX/2017', '2017-09-04', '2017-05-15', '2017-09-30', '5', '0000-00-00', '', '', '2', '', '0', '2', '2020-03-09 14:21:26', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('7', '1', 'BATS7', '2', '3', 'ADDENDUM PERTAMA ATAS PERJANJIAN IMPLEMENTASI ENTERPRISE CONTENT MANAGEMENT MENGGUNAKAN SHAREPOINT', ' ADD/88/PP/DVSCM/VU2019', '2019-06-27', '2019-04-24', '2019-06-24', '5', '0000-00-00', '', '', '0', 'Penagihan lmbalan Jasa akan dilakukan secara berta', '0', '2', '2020-03-04 11:02:32', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('8', '1', 'BATS8', '1', '5', 'PEKERJAAN PEMBUATAN SISTEM MONITORING READY MIX QR CODE PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA - CIKAMPEK II ELEVATED', '430/WK/D.III/2017', '2017-12-22', '2017-12-22', '2018-12-22', '455', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:12:38', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('9', '1', 'BATS9', '1', '13', 'PEKERJAAN JASA LAIN PEMBANGUNAN APLIKASI MONITORING PENGADAAN DIVISI GENERAL AFFAIR', '21.A/KONTRAK-DIT/2018', '2018-06-08', '2018-06-08', '2018-12-08', '97', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 13:24:31', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('10', '1', 'BATS10', '1', '13', 'PENGADAAN JASA PENGEMBANGAN APLIKASI ALIH PROFESI DAN BIDIK JABATAN', '35/KONTRAK-DIT/2018', '2018-08-16', '2018-08-16', '2018-09-24', '85', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 13:28:08', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('11', '1', 'BATS11', '1', '4', 'JASA ASET TRACKING TAHAP 2 (INVENTARIS) DI PERUM PERURI', '48-PDS/SP/410.346/2018/VII/2018', '2018-07-26', '2018-07-26', '2019-03-22', '900', '0000-00-00', '', '', '0', 'Transfer ke rek Bank Mandiri, no rek 1010077703377', '0', '2', '2020-03-04 13:37:07', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('12', '1', 'BATS12', '1', '4', 'JASA SEWA PERANGKAT SERVER DAN PC', '12-PDS/SP/410.382/2019/I/2019', '2019-01-31', '2019-03-08', '2022-03-07', '713', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 13:39:58', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('13', '1', 'BATS13', '1', '21', 'PEKERJAAN PEMBUATAN SISTEM APLIKASI MANAJEMEN LOGLAT PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA - CIKAMPEK SELATAN PAKET III', '27/WK/D.III/2019', '2019-03-04', '2019-03-04', '2019-04-03', '275', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-05 10:51:26', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('14', '1', 'BATS14', '1', '21', 'PEKERJAAN PEMBUATAN FUEL MONITORING SYSTEM SOLAR PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA – CIKAMPEK SELATAN PAKET III', '26/WK/D.III/2019', '2019-03-04', '2019-03-04', '2019-04-03', '110', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-05 10:53:01', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('15', '1', 'BATS15', '1', '6', 'JASA PEMBUATAN DOCUMENT LIBRARY', 'P.O. No. :POSAS/1904/0176', '2019-04-29', '0000-00-00', '0000-00-00', '331', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-05 10:54:12', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('16', '1', 'BATS16', '1', '22', 'Pengadaan Barang dan atau Jasa Aplikasi Integrated Financial dan Accounting System Berbasis Information Communication Technology (IFAS-ICT)', 'K.TEL.3559/HK.810/DES-A1014000/2010', '2010-12-31', '2010-12-31', '2011-07-27', '1', '0000-00-00', '', '', '0', 'Secara Giral Bank BCA Cabang Senayan City Jakarta No. Rek. 5005118899', '0', '2', '2020-03-09 11:23:21', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('17', '1', 'BATS17', '1', '13', 'Jasa Konsultasi Digitalisasi Dokumen Divisi Manajemen Operasi  PT Jasa Marga (Persero) Tbk.', '30/KONTRAK.CB/2010', '2010-12-10', '2010-12-10', '2011-02-10', '350', '0000-00-00', '', '', '0', 'Pembayaran melalui Bendahara Kantor Pusat PT Jasa Marga (Persero)', '0', '2', '2020-03-09 11:33:27', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('18', '1', 'BATS18', '1', '14', 'Pekerjaan Digitalisasi Dokumen', 'CJ.SPK.199.1', '2010-12-03', '2010-12-03', '2010-12-24', '54', '0000-00-00', '', '', '0', 'Pembayaran melalui Bendahara / Bagian Keuangan PT Jasa Marga (Persero) Tbk, Cabang CTC\r\n', '0', '2', '2020-03-09 11:39:24', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('19', '1', 'BATS19', '1', '23', 'Penyedia Solusi Contact Center Untuk RSUP Dr. Cipto Mangunkusumo', '1397/LG.280/PIN.00.00/2012', '2012-11-22', '2012-11-22', '2012-12-20', '559', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-09 12:42:40', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('20', '1', 'BATS20', '1', '7', 'Pembuatan Dashboard Karyawan / Manajemen', '335/KPJ/CD/2013', '2013-06-24', '2013-06-19', '2013-09-17', '342', '0000-00-00', '', '', '0', 'Pembayaran dilakukan secara langsung dalam BAST Pekerjaan', '0', '2', '2020-03-09 13:04:05', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('21', '1', 'BATS21', '1', '13', 'Jasa Konsultan Sosial Media', '005/SPK/2013', '2013-01-15', '2013-01-15', '2013-06-30', '65', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-09 13:10:56', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('22', '1', 'BATS22', '1', '24', 'Design Web Bank Kesejahteraan Ekonomi', '01/2013/PER', '2013-01-09', '2013-01-09', '2013-02-09', '32000000', '0000-00-00', '', '', '0', 'Pembayaran dapat dilakukan Cash / Transfer ke Bank BCA No. Rek. 500-511-8899', '0', '2', '2020-03-09 13:37:24', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('23', '1', 'BATS23', '1', '3', 'Pengadaan Exchange Antispam Type Fortmail', '', '0000-00-00', '0000-00-00', '0000-00-00', '200000000', '2019-06-26', '0026/BAST/VI/2019', '', '2', '', '0', '2', '2020-03-09 15:28:58', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('25', '1', 'BATS25', '1', '3', 'Pek. Jasa perawatan berkala server Internet PP EPC', '5049/EPC/PP-719003/II/2020', '2020-02-01', '2020-02-01', '0000-00-00', '149336990', '0000-00-00', '', 'Lokasi : Proyek PLTU Timor-1 2x50 MW', '0', 'Pembayaran terakhir dibayarkan berdasarkan jumlah pekerjaan yang dikerjakan', '0', '2', '2020-04-16 07:58:05', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('26', '1', 'BATS26', '1', '3', 'Implementasi Integrasi Sistem dan EDMS', '149/SPK/SMT/EPC/PP/III/2020', '2020-03-05', '2020-03-05', '0000-00-00', '404800000', '0000-00-00', '', 'Lokasi Pekerjaan : Kolaka, Sulawesi Tenggara', '0', 'Pembayaran dilakukan sesuai kondisi sebagai berikut :\r\n - 100% Setelah Development Selesai \r\n -  Pembayaran dilaksanakan 90 hari setelah dilaksanakan opname bersama', '0', '2', '2020-04-16 07:56:39', null, null, null, null, '1');
INSERT INTO `proyeks` VALUES ('28', '1', null, '1', '3', 'tes5', 'tes6', '2024-02-17', '2024-02-15', '2024-02-16', '666777', '2024-02-18', 'tes7', 'tes8', '1', 'tes9', '1', null, '2024-02-15 21:10:48', null, null, '1', '2024-02-15 21:10:48', '1');

-- ----------------------------
-- Table structure for `quotations`
-- ----------------------------
DROP TABLE IF EXISTS `quotations`;
CREATE TABLE `quotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(30) DEFAULT NULL,
  `perihal` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_client` int(2) DEFAULT NULL,
  `up_nama` varchar(30) DEFAULT NULL,
  `pekerjaan` varchar(225) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_user_modified` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `perusahaan_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of quotations
-- ----------------------------
INSERT INTO `quotations` VALUES ('1', '0001/NI/SPH/VII/2023', '12345', '2023-07-20', '3', '12', '213', '1', '2023-07-20 13:42:05', null, null, '2024-02-21 20:31:53', '1', '1');
INSERT INTO `quotations` VALUES ('4', 'tas', 'tus', '2024-02-22', '4', 'tes', '3', '1', '2024-02-22 12:49:56', null, null, '2024-02-22 12:49:56', '25', '1');
INSERT INTO `quotations` VALUES ('6', '11', 'aaa', '2024-02-23', '1', null, '3', '1', '2024-02-22 13:21:48', null, null, '2024-02-22 13:21:48', '25', '1');
INSERT INTO `quotations` VALUES ('7', 'sss', null, null, null, null, null, '1', '2024-02-22 13:22:40', null, null, '2024-02-22 13:22:40', '22', '1');
INSERT INTO `quotations` VALUES ('8', 'aasss', 'ddff', '2024-02-24', '7', null, '1', '1', '2024-02-22 13:25:07', null, null, '2024-02-22 13:25:07', '25', '1');
INSERT INTO `quotations` VALUES ('9', 'tes', 'tas', '2024-02-23', '6', 'tus', '3', '1', '2024-02-22 14:08:35', null, null, '2024-02-22 14:08:35', null, '1');
INSERT INTO `quotations` VALUES ('10', 'tes1', 'tes2', '2024-02-15', '1', 'tes3', '2', '1', '2024-02-22 14:14:13', null, null, '2024-02-22 14:14:13', '25', '1');
INSERT INTO `quotations` VALUES ('11', 'tes1', 'tes2', '2024-02-24', '5', 'tes3', '3', '1', '2024-02-23 14:02:27', null, null, '2024-02-23 14:02:27', '25', '1');
INSERT INTO `quotations` VALUES ('12', null, null, null, null, null, null, '1', '2024-02-23 14:06:22', null, null, '2024-02-23 14:06:22', null, '1');

-- ----------------------------
-- Table structure for `quotation_details`
-- ----------------------------
DROP TABLE IF EXISTS `quotation_details`;
CREATE TABLE `quotation_details` (
  `id_quotation_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_quotation` int(11) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `qty` varchar(20) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `upprice` varchar(50) DEFAULT NULL,
  `selling` varchar(50) DEFAULT NULL,
  `totalprice` varchar(50) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_quotation_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of quotation_details
-- ----------------------------
INSERT INTO `quotation_details` VALUES ('1', '1', '11', '22', '33', '44', '968', '55', '24.2', '68.2', '1500.4', null, null);
INSERT INTO `quotation_details` VALUES ('2', '1', '10', '20', '30', '40', '800', '50', '20', '60', '1200', null, null);
INSERT INTO `quotation_details` VALUES ('3', '10', '1', '3', '5', '7', '9', '11', '13', '15', '17', '2024-02-22 14:14:13', '2024-02-22 14:14:13');
INSERT INTO `quotation_details` VALUES ('4', '10', '2', '4', '6', '8', '10', '12', '14', '16', '18', '2024-02-22 14:14:13', '2024-02-22 14:14:13');
INSERT INTO `quotation_details` VALUES ('5', '11', 'print', '10', 'pcs', '150,000', '1500000', '25', '37500', '187500', '1875000', '2024-02-23 14:02:27', '2024-02-23 14:02:27');
INSERT INTO `quotation_details` VALUES ('6', '11', 'kertas', '20', 'rim', '50,000', '1000000', '10', '5000', '55000', '1100000', '2024-02-23 14:02:27', '2024-02-23 14:02:27');
INSERT INTO `quotation_details` VALUES ('7', '12', 'baju', '20', 'pcs', '200000', '4000000', '17', '34000', '234000', '4680000', '2024-02-23 14:06:22', '2024-02-23 14:06:22');

-- ----------------------------
-- Table structure for `ref_bank`
-- ----------------------------
DROP TABLE IF EXISTS `ref_bank`;
CREATE TABLE `ref_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(50) DEFAULT NULL,
  `rekening` varchar(50) DEFAULT NULL,
  `atas_nama` varchar(50) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_bank
-- ----------------------------
INSERT INTO `ref_bank` VALUES ('1', 'Mandiri KCP Jakarta Botanical Garden', '1180010964194', 'PT. Nigmagrid Indo Nesia', '1');
INSERT INTO `ref_bank` VALUES ('3', 'Mandiri', '1260004567177', 'Andri Royantara', '2');

-- ----------------------------
-- Table structure for `ref_client`
-- ----------------------------
DROP TABLE IF EXISTS `ref_client`;
CREATE TABLE `ref_client` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `client_name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `npwp` varchar(30) DEFAULT NULL,
  `pic_name` varchar(50) DEFAULT NULL,
  `pic_phone` varchar(13) DEFAULT NULL,
  `pic_email` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_user` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_client
-- ----------------------------
INSERT INTO `ref_client` VALUES ('3', '0003', 'PT Pembangunan Perumahan (Persero) Tbk', 'Jalan TB Simatupang No. 57 kel. Gedong, Kec. Pasar Rebo, Jakarta Timur', '01.001.613.7-093.000', 'Dicky', '0', 'dicky.jousty@pt-pp.com', '-', '1', '2020-02-26 14:26:19', null, null);
INSERT INTO `ref_client` VALUES ('4', '0004', 'PT. Peruri Digital Security', 'Ruko Lantai 3 Jl. Sunan Kalijaga No. 65B RT: 002 / RW: 001 Kel. Melawai, Kec. Kebayoran Baru Jakarta Selatan', '03.053.382.2-064.000', 'Kusnoto Daheng', '0', 'kusnoto.dae@peruridigit.co.id', '-', '1', '2020-02-26 14:33:30', null, null);
INSERT INTO `ref_client` VALUES ('5', '0005', 'PT. Waskita - Acset KSO', 'Ruko Celebration Boulevard Blok AA 5 No. 8-9 Kel. Lambangsari, Kec. Tambun Selatan, Bekasi - Jawa Barat', '81.232.225.3-435.000', 'Farid Askary', '0', 'farid.askary92@gmail.com', '-', '1', '2020-02-26 14:39:24', null, null);
INSERT INTO `ref_client` VALUES ('6', '0006', 'PT Intikom Berlian Mustika', 'Jl. Kuningan Barat II No. 11, RT: 003 RW: 002 Kel. Kuningan Barat, Kec. Mampang Prapatan Jakarta Selatan', '01.348.611.3-062.000', 'Davit Wijaya', '0', 'Davit.Wijaya@intikom.co.id', '-', '1', '2020-02-26 14:50:41', null, null);
INSERT INTO `ref_client` VALUES ('7', '0007', 'PT Jasa Marga (Persero) Tbk - Kantor Cabang Jagorawi', 'Jagorawi Toll Plaza TMII RT.008 / RW.002, Kel. Dukuh, Kec. Kramat Jati Jakarta Timur', '01.001.675.6-093.000', '-', '0', '-', '-', '1', '2020-02-26 14:57:46', null, '2020-03-09 12:53:12');
INSERT INTO `ref_client` VALUES ('8', '0008', ' PT Wijaya Karya Beton Tbk', 'Jl. Raya Jatiwaringin No. 54 RT: 001 / RW: 004 Jati Cempaka, Pondok Gede, Bekasi - Jawa Barat', '01.061.154.9-093.000', '-', '0', '-', '-', '1', '2020-02-26 15:03:29', null, null);
INSERT INTO `ref_client` VALUES ('9', '0009', 'PT. Marga Lingkar Jakarta (MLJ)', 'Plaza 3 Blok B No. 7 Pondok Indah, Jl. TB Simatupang Jakarta Selatan', '21.119.784.3-023.000', '-', '0', '-', '-', '1', '2020-02-26 15:09:51', null, null);
INSERT INTO `ref_client` VALUES ('10', '0010', 'PT. Jalur Nugraha Ekakurir', 'Jl. Tomang Raya No. 11, Jakarta Barat', '0', '-', '0', '-', '-', '1', '2020-03-02 14:36:53', null, null);
INSERT INTO `ref_client` VALUES ('11', '0011', 'PT. Multiguna International Persada', 'Rukan Business Park Kirana Cawang Blok B15, Jalan DI. Panjaitan Kav. 48, RT.8/RW.2, 13340, RT.8/RW.2, \r\nCipinang Cempedak, Jatinegara - Jakarta Timur', '0', '-', '0', '-', '-', '1', '2020-03-02 14:45:47', null, null);
INSERT INTO `ref_client` VALUES ('12', '0012', 'PT. Khong Guan Biscuit Factory Indonesia (Ltd)', 'Gedung Wira Usaha Kav. C5, Jalan Haji R. Rasuna Said No.5, \r\nKuningan Timur, RT.3/RW.1, Karet, Jakarta Selatan', '0', '-', '0', '-', '-', '1', '2020-03-02 14:50:32', null, null);
INSERT INTO `ref_client` VALUES ('13', '0013', 'PT Jasa Marga (Persero) Tbk - Pusat', 'Jl. Dukuh V Blok Haji Sairi No.21, RT.8/RW.2, Dukuh, Kec. Kramat jati, Kota Jakarta Timur', '0', '-', '0', '-', '-', '1', '2020-03-02 15:00:48', null, null);
INSERT INTO `ref_client` VALUES ('14', '0014', 'PT Jasa Marga (PERSERO) Tbk - Cabang CTC', 'Plaza Tol Cililitan, JL. Cililitan Besar, Jakarta, 13510, RW.3, Kramat Jati - Jakarta Timur', '0', '-', '0', '-', '-', '1', '2020-03-02 15:02:27', null, '2020-03-03 13:39:19');
INSERT INTO `ref_client` VALUES ('15', '0015', 'Kementerian Kesehatan Republik Indonesia', 'Jalan H. R. Rasuna Said Blok X 5 Kav. 4-9, Jakarta Selatan 12950', '0', '-', '0', '-', '-', '1', '2020-03-02 15:04:32', null, null);
INSERT INTO `ref_client` VALUES ('16', '0016', 'PT SIGMA CIPTA CARAKA', 'Graha Telkomsigma Jl. Kapten Subijanto DJ\r\nBumi Serpong Damai, Tangerang Selatan ', '-', '-', '0', '-', '-', '1', '2020-03-03 13:43:39', null, null);
INSERT INTO `ref_client` VALUES ('17', '0017', 'Kementerian Pertanian Republik Indonesia', 'Jl. Harsono RM No.3, Ragunan, Kec. Ps. Minggu, Kota Jakarta Selatan', '-', '-', '0', '-', '-', '1', '2020-03-03 14:52:29', null, '2020-03-03 14:52:47');
INSERT INTO `ref_client` VALUES ('18', '0018', 'PT Mitra Pinasthika Mustika Tbk', 'LIPPO Kuningan, 26th Floor\r\nJl. H.R. Rasuna Said Kav B-12\r\nKuningan, Jakarta Selatan', '-', '-', '0', '-', '-', '1', '2020-03-03 14:58:28', null, null);
INSERT INTO `ref_client` VALUES ('19', '0019', 'Dinas Pendidikan Provinsi DKI Jakarta', 'Jl. Gatot Subroto No.Kav. 40-41, RT.8/RW.3, Kuningan, Kuningan Timur, \r\nSetia Budi, Kota Jakarta Selatan, DKI Jakarta\r\n', '-', '-', '0', '-', '-', '1', '2020-03-03 15:05:46', null, null);
INSERT INTO `ref_client` VALUES ('20', '0020', 'Pusdatikomdik ', 'Gedung PKG Rawa Bunga, Jalan Jatinegara Timur IV, Jatinegara, RT.1/RW.8, Rawa Bunga, \r\nKecamatan Jatinegara, Kota Jakarta Timur', '-', '-', '0', '-', '-', '1', '2020-03-03 15:06:26', null, null);
INSERT INTO `ref_client` VALUES ('21', '0021', 'PT Waskita Karya (Persero) Tbk ', 'Jl, MT Haryono No.10, RT.11/RW.11, Cawang, Kecamatan Jatinegara, Kota Jakarta Timur', '-', '-', '0', '-', '-', '1', '2020-03-05 10:49:27', null, null);
INSERT INTO `ref_client` VALUES ('22', '0022', 'PT. ASDP Indonesia Ferry (Persero)', 'Jalan Jendral A. Yani Kav No.52 A, RT.10/RW.2, Cemp. Putih Tim., \r\nKec. Cemp. Putih, Kota Jakarta Pusat', '-', '-', '0', '-', '-', '1', '2020-03-09 11:13:32', null, '2020-03-09 12:32:23');
INSERT INTO `ref_client` VALUES ('23', '0023', 'RSUP Dr. Cipto Mangunkusumo', 'Jl. Pangeran Diponegoro No.71, Kenari, Kec. Senen, Kota Jakarta Pusat', '-', '-', '0', '-', '-', '1', '2020-03-09 12:37:28', null, null);
INSERT INTO `ref_client` VALUES ('24', '0024', 'PT. Bank Kesejahteraan Ekonomi', 'Gedung IKP-RI Jalan R.P. Soeroso No.21 Jakarta Pusat 10330', '-', '-', '0', '-', '-', '1', '2020-03-09 13:21:53', null, null);

-- ----------------------------
-- Table structure for `ref_employee`
-- ----------------------------
DROP TABLE IF EXISTS `ref_employee`;
CREATE TABLE `ref_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `tempat` varchar(30) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` int(1) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ref_employee
-- ----------------------------
INSERT INTO `ref_employee` VALUES ('1', 'Lutfi Muladi', 'Bogor', '1998-07-21', '2', 'Kp. Jogjogan Kec.Cisarua', '081316992135', 'muladilutfi21@gmail.com', 'Pujaan Ariel', 'ariel.jpg', '2020-07-24 10:11:36', null);
INSERT INTO `ref_employee` VALUES ('2', 'Muhammad Iqbal Fikri', 'Jakarta', '1985-04-09', '1', 'Jl. Cempaka III BS - 17/17 KR. Permai Rt : 019 / Rw : 012 Jatisampurna, Bekasi - Jawa Barat', '08118884296', '2@batcrew.net', '-', 'Foto_Iqbal.jpeg', '2020-11-14 15:23:14', null);
INSERT INTO `ref_employee` VALUES ('3', 'Nipho Septiawan', 'Jakarta', '1985-09-09', '1', 'Komp. Pelni Blok J-3 No. 10 Rt : 009 / Rw : 019 Bakti Jaya, Sukma Jaya, Depok - Jawa Barat', '081289010007', '3@batcrew.net ', '-', '', '2020-03-10 10:21:01', null);
INSERT INTO `ref_employee` VALUES ('4', 'Iskandar', 'Jakarta', '1959-10-22', '1', 'Jl. Nakula I Blok U No. 7 Rt : 003 / Rw: 006 Duren Sawit - Jakarta Timur', '087783220631', 'batcrewnday@gmail.com', '-', '', '2020-03-10 10:50:13', null);
INSERT INTO `ref_employee` VALUES ('5', 'Muhamad Maulana Abidin', 'Bogor', '1993-08-30', '1', 'KP. Pangarakan Rt : 016 / Rw : 006 Srogol, Cigombong, Bogor - Jawa Barat ', '085819994989', '7@batcrew.net', '-', '', '2020-03-11 09:56:50', null);
INSERT INTO `ref_employee` VALUES ('6', 'Eka Astuti', 'Wonogiri', '1990-11-22', '2', 'Jl. Batu Bulat Rt : 003 / Rw : 005 Batu Ampar, Kramat Jati - Jakarta Timur', '087889510052', 'mickyastyeka@gmail.com', '-', '', '2020-03-11 09:58:27', null);
INSERT INTO `ref_employee` VALUES ('7', 'Herlansyah', 'Jakarta', '1989-04-16', '1', 'Jl. H. Murtadho VIII/B 45 Rt : 015 / Rw: 005 Paseban Senen - Jakarta Pusat', '085283398737', 'erlansyah160488@gmail.com', '-', '', '2020-03-11 10:00:17', null);
INSERT INTO `ref_employee` VALUES ('8', 'Nanang Santoso', 'Bogor', '1997-09-01', '1', 'Griya Katulampa B.2 No. 16 Rt : 003 / Rw : 010 Katulampa, Kota Bogor Timur,  Bogor - Jawa Barat', '081283120180', 'nanangsantoso1997@gmail.com', '-', '', '2020-03-11 10:03:13', null);

-- ----------------------------
-- Table structure for `ref_expense`
-- ----------------------------
DROP TABLE IF EXISTS `ref_expense`;
CREATE TABLE `ref_expense` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_expense
-- ----------------------------
INSERT INTO `ref_expense` VALUES ('3', 'ATK');
INSERT INTO `ref_expense` VALUES ('4', 'Transportasi ');
INSERT INTO `ref_expense` VALUES ('5', 'Kantor');
INSERT INTO `ref_expense` VALUES ('6', 'Test');

-- ----------------------------
-- Table structure for `ref_group`
-- ----------------------------
DROP TABLE IF EXISTS `ref_group`;
CREATE TABLE `ref_group` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `name_group` varchar(225) NOT NULL,
  `create_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_group
-- ----------------------------
INSERT INTO `ref_group` VALUES ('1', 'Administrator', '2016-08-21 04:10:11', '2022-03-08 16:30:38');
INSERT INTO `ref_group` VALUES ('2', 'Operator', '2020-03-02 18:19:28', '2022-03-08 16:30:38');
INSERT INTO `ref_group` VALUES ('3', 'Staff', '2020-07-01 21:06:52', '2022-03-08 16:30:38');
INSERT INTO `ref_group` VALUES ('4', 'Staff 2', '2020-07-02 15:07:36', '2022-03-08 16:30:38');
INSERT INTO `ref_group` VALUES ('5', 'Krakatau', '2022-03-08 15:19:04', '2022-03-08 16:30:38');

-- ----------------------------
-- Table structure for `ref_icon`
-- ----------------------------
DROP TABLE IF EXISTS `ref_icon`;
CREATE TABLE `ref_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `name_icon` varchar(225) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_icon
-- ----------------------------
INSERT INTO `ref_icon` VALUES ('1', 'adjust');
INSERT INTO `ref_icon` VALUES ('2', 'anchor');
INSERT INTO `ref_icon` VALUES ('3', 'archive');
INSERT INTO `ref_icon` VALUES ('4', 'area-chart');
INSERT INTO `ref_icon` VALUES ('5', 'arrows');
INSERT INTO `ref_icon` VALUES ('6', 'arrows-h');
INSERT INTO `ref_icon` VALUES ('7', 'arrows-v\r\n');
INSERT INTO `ref_icon` VALUES ('8', 'asterisk');
INSERT INTO `ref_icon` VALUES ('9', 'at');
INSERT INTO `ref_icon` VALUES ('10', 'automobile');
INSERT INTO `ref_icon` VALUES ('11', 'ban');
INSERT INTO `ref_icon` VALUES ('12', 'bank');
INSERT INTO `ref_icon` VALUES ('13', 'bar-chart');
INSERT INTO `ref_icon` VALUES ('14', 'bar-chart-o');
INSERT INTO `ref_icon` VALUES ('15', 'barcode');
INSERT INTO `ref_icon` VALUES ('16', 'bars');
INSERT INTO `ref_icon` VALUES ('17', 'bed');
INSERT INTO `ref_icon` VALUES ('18', 'beer');
INSERT INTO `ref_icon` VALUES ('19', 'bell');
INSERT INTO `ref_icon` VALUES ('20', 'bell-o');
INSERT INTO `ref_icon` VALUES ('21', 'bell-slash');
INSERT INTO `ref_icon` VALUES ('22', 'bell-slash-o');
INSERT INTO `ref_icon` VALUES ('23', 'bicycle');
INSERT INTO `ref_icon` VALUES ('24', 'binoculars');
INSERT INTO `ref_icon` VALUES ('25', 'birthday-cake');
INSERT INTO `ref_icon` VALUES ('26', 'bolt');
INSERT INTO `ref_icon` VALUES ('27', 'bomb');
INSERT INTO `ref_icon` VALUES ('28', 'book');
INSERT INTO `ref_icon` VALUES ('29', 'bookmark');
INSERT INTO `ref_icon` VALUES ('30', 'bookmark-o');
INSERT INTO `ref_icon` VALUES ('31', 'briefcase');
INSERT INTO `ref_icon` VALUES ('32', 'bug');
INSERT INTO `ref_icon` VALUES ('33', 'building');
INSERT INTO `ref_icon` VALUES ('34', 'building-o');
INSERT INTO `ref_icon` VALUES ('35', 'bullhorn');
INSERT INTO `ref_icon` VALUES ('36', 'bullseye');
INSERT INTO `ref_icon` VALUES ('37', 'bus');
INSERT INTO `ref_icon` VALUES ('38', 'cab');
INSERT INTO `ref_icon` VALUES ('39', 'calculator');
INSERT INTO `ref_icon` VALUES ('40', 'calendar');
INSERT INTO `ref_icon` VALUES ('41', 'calendar-o');
INSERT INTO `ref_icon` VALUES ('42', 'camera');
INSERT INTO `ref_icon` VALUES ('43', 'camera-retro');
INSERT INTO `ref_icon` VALUES ('44', 'car');
INSERT INTO `ref_icon` VALUES ('45', 'caret-square-o-down');
INSERT INTO `ref_icon` VALUES ('46', 'caret-square-o-left');
INSERT INTO `ref_icon` VALUES ('47', 'caret-square-o-right');
INSERT INTO `ref_icon` VALUES ('48', 'caret-square-o-up');
INSERT INTO `ref_icon` VALUES ('49', 'cart-arrow-down');
INSERT INTO `ref_icon` VALUES ('50', 'cart-plus');
INSERT INTO `ref_icon` VALUES ('51', 'cc');
INSERT INTO `ref_icon` VALUES ('52', 'certificate');
INSERT INTO `ref_icon` VALUES ('53', 'check');
INSERT INTO `ref_icon` VALUES ('54', 'check-circle');
INSERT INTO `ref_icon` VALUES ('55', 'check-circle-o');
INSERT INTO `ref_icon` VALUES ('56', 'check-square');
INSERT INTO `ref_icon` VALUES ('57', 'check-square-o');
INSERT INTO `ref_icon` VALUES ('58', 'child');
INSERT INTO `ref_icon` VALUES ('59', 'circle');
INSERT INTO `ref_icon` VALUES ('60', 'circle-o');
INSERT INTO `ref_icon` VALUES ('61', 'circle-o-notch');
INSERT INTO `ref_icon` VALUES ('62', 'circle-thin');
INSERT INTO `ref_icon` VALUES ('63', 'clock-o');
INSERT INTO `ref_icon` VALUES ('64', 'close');
INSERT INTO `ref_icon` VALUES ('65', 'cloud');
INSERT INTO `ref_icon` VALUES ('66', 'cloud-download');
INSERT INTO `ref_icon` VALUES ('67', 'cloud-upload');
INSERT INTO `ref_icon` VALUES ('68', 'code');
INSERT INTO `ref_icon` VALUES ('69', 'code-fork');
INSERT INTO `ref_icon` VALUES ('70', 'coffee');
INSERT INTO `ref_icon` VALUES ('71', 'cog');
INSERT INTO `ref_icon` VALUES ('72', 'cogs');
INSERT INTO `ref_icon` VALUES ('73', 'comment');
INSERT INTO `ref_icon` VALUES ('74', 'comment-o');
INSERT INTO `ref_icon` VALUES ('75', 'comments');
INSERT INTO `ref_icon` VALUES ('76', 'comments-o');
INSERT INTO `ref_icon` VALUES ('77', 'compass');
INSERT INTO `ref_icon` VALUES ('78', 'copyright');
INSERT INTO `ref_icon` VALUES ('79', 'credit-card');
INSERT INTO `ref_icon` VALUES ('80', 'crop');
INSERT INTO `ref_icon` VALUES ('81', 'crosshairs');
INSERT INTO `ref_icon` VALUES ('82', 'cube');
INSERT INTO `ref_icon` VALUES ('83', 'cubes');
INSERT INTO `ref_icon` VALUES ('84', 'cutlery');
INSERT INTO `ref_icon` VALUES ('85', 'dashboard');
INSERT INTO `ref_icon` VALUES ('86', 'database');
INSERT INTO `ref_icon` VALUES ('87', 'desktop');
INSERT INTO `ref_icon` VALUES ('88', 'diamond');
INSERT INTO `ref_icon` VALUES ('89', 'dot-circle-o');
INSERT INTO `ref_icon` VALUES ('90', 'download');
INSERT INTO `ref_icon` VALUES ('91', 'edit');
INSERT INTO `ref_icon` VALUES ('92', 'ellipsis-h');
INSERT INTO `ref_icon` VALUES ('93', 'ellipsis-v');
INSERT INTO `ref_icon` VALUES ('94', 'envelope');
INSERT INTO `ref_icon` VALUES ('95', 'envelope-o');
INSERT INTO `ref_icon` VALUES ('96', 'envelope-square');
INSERT INTO `ref_icon` VALUES ('97', 'eraser');
INSERT INTO `ref_icon` VALUES ('98', 'exchange');
INSERT INTO `ref_icon` VALUES ('99', 'exclamation');
INSERT INTO `ref_icon` VALUES ('100', 'exclamation-circle');
INSERT INTO `ref_icon` VALUES ('101', 'exclamation-triangle');
INSERT INTO `ref_icon` VALUES ('102', 'external-link');
INSERT INTO `ref_icon` VALUES ('103', 'external-link-square');
INSERT INTO `ref_icon` VALUES ('104', 'eye');
INSERT INTO `ref_icon` VALUES ('105', 'eye-slash');
INSERT INTO `ref_icon` VALUES ('106', 'eyedropper');
INSERT INTO `ref_icon` VALUES ('107', 'fax');
INSERT INTO `ref_icon` VALUES ('108', 'female');
INSERT INTO `ref_icon` VALUES ('109', 'fighter-jet');
INSERT INTO `ref_icon` VALUES ('110', 'file-archive-o');
INSERT INTO `ref_icon` VALUES ('111', 'file-audio-o');
INSERT INTO `ref_icon` VALUES ('112', 'file-code-o');
INSERT INTO `ref_icon` VALUES ('113', 'file-excel-o');
INSERT INTO `ref_icon` VALUES ('114', 'file-image-o');
INSERT INTO `ref_icon` VALUES ('115', 'file-movie-o');
INSERT INTO `ref_icon` VALUES ('116', 'file-pdf-o');
INSERT INTO `ref_icon` VALUES ('117', 'file-photo-o');
INSERT INTO `ref_icon` VALUES ('118', 'file-picture-o');
INSERT INTO `ref_icon` VALUES ('119', 'file-powerpoint-o');
INSERT INTO `ref_icon` VALUES ('120', 'file-sound-o');
INSERT INTO `ref_icon` VALUES ('121', 'file-video-o');
INSERT INTO `ref_icon` VALUES ('122', 'file-word-o');
INSERT INTO `ref_icon` VALUES ('123', 'file-zip-o');
INSERT INTO `ref_icon` VALUES ('124', 'film');
INSERT INTO `ref_icon` VALUES ('125', 'filter');
INSERT INTO `ref_icon` VALUES ('126', 'fire');
INSERT INTO `ref_icon` VALUES ('127', 'fire-extinguisher');
INSERT INTO `ref_icon` VALUES ('128', 'flag');
INSERT INTO `ref_icon` VALUES ('129', 'flag-checkered');
INSERT INTO `ref_icon` VALUES ('130', 'flag-o');
INSERT INTO `ref_icon` VALUES ('131', 'flash');
INSERT INTO `ref_icon` VALUES ('132', 'flask');
INSERT INTO `ref_icon` VALUES ('133', 'folder');
INSERT INTO `ref_icon` VALUES ('134', 'folder-o');
INSERT INTO `ref_icon` VALUES ('135', 'folder-open');
INSERT INTO `ref_icon` VALUES ('136', 'folder-open-o');
INSERT INTO `ref_icon` VALUES ('137', 'frown-o');
INSERT INTO `ref_icon` VALUES ('138', 'futbol-o');
INSERT INTO `ref_icon` VALUES ('139', 'gamepad');
INSERT INTO `ref_icon` VALUES ('140', 'gavel');
INSERT INTO `ref_icon` VALUES ('141', 'gear');
INSERT INTO `ref_icon` VALUES ('142', 'gears');
INSERT INTO `ref_icon` VALUES ('143', 'genderless');
INSERT INTO `ref_icon` VALUES ('144', 'gift');
INSERT INTO `ref_icon` VALUES ('145', 'glass');
INSERT INTO `ref_icon` VALUES ('146', 'globe');
INSERT INTO `ref_icon` VALUES ('147', 'graduation-cap');
INSERT INTO `ref_icon` VALUES ('148', 'group');
INSERT INTO `ref_icon` VALUES ('149', 'hdd-o');
INSERT INTO `ref_icon` VALUES ('150', 'headphones');
INSERT INTO `ref_icon` VALUES ('151', 'heart');
INSERT INTO `ref_icon` VALUES ('152', 'heart-o');
INSERT INTO `ref_icon` VALUES ('153', 'heartbeat');
INSERT INTO `ref_icon` VALUES ('154', 'history');
INSERT INTO `ref_icon` VALUES ('155', 'home');
INSERT INTO `ref_icon` VALUES ('156', 'hotel');
INSERT INTO `ref_icon` VALUES ('157', 'image');
INSERT INTO `ref_icon` VALUES ('158', 'inbox');
INSERT INTO `ref_icon` VALUES ('159', 'info');
INSERT INTO `ref_icon` VALUES ('160', 'info-circle');
INSERT INTO `ref_icon` VALUES ('161', 'institution');
INSERT INTO `ref_icon` VALUES ('162', 'key');
INSERT INTO `ref_icon` VALUES ('163', 'keyboard-o');
INSERT INTO `ref_icon` VALUES ('164', 'language');
INSERT INTO `ref_icon` VALUES ('165', 'laptop');
INSERT INTO `ref_icon` VALUES ('166', 'leaf');
INSERT INTO `ref_icon` VALUES ('167', 'legal');
INSERT INTO `ref_icon` VALUES ('168', 'lemon-o');
INSERT INTO `ref_icon` VALUES ('169', 'level-down');
INSERT INTO `ref_icon` VALUES ('170', 'level-up');
INSERT INTO `ref_icon` VALUES ('171', 'life-bouy');
INSERT INTO `ref_icon` VALUES ('172', 'life-buoy');
INSERT INTO `ref_icon` VALUES ('173', 'life-ring');
INSERT INTO `ref_icon` VALUES ('174', 'life-saver');
INSERT INTO `ref_icon` VALUES ('175', 'lightbulb-o');
INSERT INTO `ref_icon` VALUES ('176', 'line-chart');
INSERT INTO `ref_icon` VALUES ('177', 'location-arrow');
INSERT INTO `ref_icon` VALUES ('178', 'lock');
INSERT INTO `ref_icon` VALUES ('179', 'magic');
INSERT INTO `ref_icon` VALUES ('180', 'magnet');
INSERT INTO `ref_icon` VALUES ('181', 'mail-forward');
INSERT INTO `ref_icon` VALUES ('182', 'mail-reply');
INSERT INTO `ref_icon` VALUES ('183', 'mail-reply-all');
INSERT INTO `ref_icon` VALUES ('184', 'male');
INSERT INTO `ref_icon` VALUES ('185', 'map-marker');
INSERT INTO `ref_icon` VALUES ('186', 'meh-o');
INSERT INTO `ref_icon` VALUES ('187', 'microphone');
INSERT INTO `ref_icon` VALUES ('188', 'microphone-slash');
INSERT INTO `ref_icon` VALUES ('189', 'minus');
INSERT INTO `ref_icon` VALUES ('190', 'minus-circle');
INSERT INTO `ref_icon` VALUES ('191', 'minus-square');
INSERT INTO `ref_icon` VALUES ('192', 'minus-square-o');
INSERT INTO `ref_icon` VALUES ('193', 'mobile');
INSERT INTO `ref_icon` VALUES ('194', 'mobile-phone');
INSERT INTO `ref_icon` VALUES ('195', 'money');
INSERT INTO `ref_icon` VALUES ('196', 'moon-o');
INSERT INTO `ref_icon` VALUES ('197', 'mortar-board');
INSERT INTO `ref_icon` VALUES ('198', 'motorcycle');
INSERT INTO `ref_icon` VALUES ('199', 'music');
INSERT INTO `ref_icon` VALUES ('200', 'navicon');
INSERT INTO `ref_icon` VALUES ('202', 'newspaper-o');
INSERT INTO `ref_icon` VALUES ('203', 'paint-brush');
INSERT INTO `ref_icon` VALUES ('204', 'paper-plane');
INSERT INTO `ref_icon` VALUES ('205', 'paper-plane-o');
INSERT INTO `ref_icon` VALUES ('206', 'paw');
INSERT INTO `ref_icon` VALUES ('207', 'pencil');
INSERT INTO `ref_icon` VALUES ('208', 'pencil-square');
INSERT INTO `ref_icon` VALUES ('209', 'pencil-square-o');
INSERT INTO `ref_icon` VALUES ('210', 'phone');
INSERT INTO `ref_icon` VALUES ('211', 'phone-square');
INSERT INTO `ref_icon` VALUES ('212', 'photo');
INSERT INTO `ref_icon` VALUES ('213', 'picture-o');
INSERT INTO `ref_icon` VALUES ('214', 'pie-chart');
INSERT INTO `ref_icon` VALUES ('215', 'plane');
INSERT INTO `ref_icon` VALUES ('216', 'plug');
INSERT INTO `ref_icon` VALUES ('217', 'plus');
INSERT INTO `ref_icon` VALUES ('218', 'plus-circle');
INSERT INTO `ref_icon` VALUES ('219', 'plus-square');
INSERT INTO `ref_icon` VALUES ('220', 'plus-square-o');
INSERT INTO `ref_icon` VALUES ('221', 'power-off');
INSERT INTO `ref_icon` VALUES ('222', 'print');
INSERT INTO `ref_icon` VALUES ('223', 'puzzle-piece');
INSERT INTO `ref_icon` VALUES ('224', 'qrcode');
INSERT INTO `ref_icon` VALUES ('225', 'question');
INSERT INTO `ref_icon` VALUES ('226', 'question-circle');
INSERT INTO `ref_icon` VALUES ('227', 'quote-left');
INSERT INTO `ref_icon` VALUES ('228', 'quote-right');
INSERT INTO `ref_icon` VALUES ('229', 'random');
INSERT INTO `ref_icon` VALUES ('230', 'recycle');
INSERT INTO `ref_icon` VALUES ('231', 'refresh');
INSERT INTO `ref_icon` VALUES ('232', 'remove');
INSERT INTO `ref_icon` VALUES ('233', 'reorder');
INSERT INTO `ref_icon` VALUES ('234', 'reply');
INSERT INTO `ref_icon` VALUES ('235', 'reply-all');
INSERT INTO `ref_icon` VALUES ('236', 'retweet');
INSERT INTO `ref_icon` VALUES ('237', 'road');
INSERT INTO `ref_icon` VALUES ('238', 'rocket');
INSERT INTO `ref_icon` VALUES ('239', 'rss');
INSERT INTO `ref_icon` VALUES ('240', 'rss-square');
INSERT INTO `ref_icon` VALUES ('241', 'search');
INSERT INTO `ref_icon` VALUES ('242', 'search-minus');
INSERT INTO `ref_icon` VALUES ('243', 'search-plus');
INSERT INTO `ref_icon` VALUES ('244', 'send');
INSERT INTO `ref_icon` VALUES ('245', 'send-o');
INSERT INTO `ref_icon` VALUES ('246', 'server');
INSERT INTO `ref_icon` VALUES ('247', 'share');
INSERT INTO `ref_icon` VALUES ('248', 'share-alt');
INSERT INTO `ref_icon` VALUES ('249', 'share-alt-square');
INSERT INTO `ref_icon` VALUES ('250', 'share-square');
INSERT INTO `ref_icon` VALUES ('251', 'share-square-o');
INSERT INTO `ref_icon` VALUES ('252', 'shield');
INSERT INTO `ref_icon` VALUES ('253', 'ship');
INSERT INTO `ref_icon` VALUES ('254', 'shopping-cart');
INSERT INTO `ref_icon` VALUES ('255', 'sign-in');
INSERT INTO `ref_icon` VALUES ('256', 'sign-out');
INSERT INTO `ref_icon` VALUES ('257', 'signal');
INSERT INTO `ref_icon` VALUES ('258', 'sitemap');
INSERT INTO `ref_icon` VALUES ('259', 'sliders');
INSERT INTO `ref_icon` VALUES ('260', 'smile-o');
INSERT INTO `ref_icon` VALUES ('261', 'soccer-ball-o');
INSERT INTO `ref_icon` VALUES ('262', 'sort');
INSERT INTO `ref_icon` VALUES ('263', 'sort-alpha-asc');
INSERT INTO `ref_icon` VALUES ('264', 'sort-alpha-desc');
INSERT INTO `ref_icon` VALUES ('265', 'sort-amount-asc');
INSERT INTO `ref_icon` VALUES ('266', 'sort-amount-desc');
INSERT INTO `ref_icon` VALUES ('267', 'sort-asc');
INSERT INTO `ref_icon` VALUES ('268', 'sort-desc');
INSERT INTO `ref_icon` VALUES ('269', 'sort-down');
INSERT INTO `ref_icon` VALUES ('270', 'sort-numeric-asc');
INSERT INTO `ref_icon` VALUES ('271', 'sort-numeric-desc');
INSERT INTO `ref_icon` VALUES ('272', 'sort-up');
INSERT INTO `ref_icon` VALUES ('273', 'space-shuttle');
INSERT INTO `ref_icon` VALUES ('274', 'spinner');
INSERT INTO `ref_icon` VALUES ('275', 'spoon');
INSERT INTO `ref_icon` VALUES ('276', 'square');
INSERT INTO `ref_icon` VALUES ('277', 'square-o');
INSERT INTO `ref_icon` VALUES ('278', 'star');
INSERT INTO `ref_icon` VALUES ('279', 'star-half');
INSERT INTO `ref_icon` VALUES ('280', 'star-half-empty');
INSERT INTO `ref_icon` VALUES ('281', 'star-half-full');
INSERT INTO `ref_icon` VALUES ('282', 'star-half-o');
INSERT INTO `ref_icon` VALUES ('283', 'star-o');
INSERT INTO `ref_icon` VALUES ('284', 'street-view');
INSERT INTO `ref_icon` VALUES ('285', 'suitcase');
INSERT INTO `ref_icon` VALUES ('286', 'sun-o');
INSERT INTO `ref_icon` VALUES ('287', 'support');
INSERT INTO `ref_icon` VALUES ('288', 'tablet');
INSERT INTO `ref_icon` VALUES ('289', 'tachometer');
INSERT INTO `ref_icon` VALUES ('290', 'tag');
INSERT INTO `ref_icon` VALUES ('291', 'tags');
INSERT INTO `ref_icon` VALUES ('292', 'tasks');
INSERT INTO `ref_icon` VALUES ('293', 'taxi');
INSERT INTO `ref_icon` VALUES ('294', 'terminal');
INSERT INTO `ref_icon` VALUES ('295', 'thumb-tack');
INSERT INTO `ref_icon` VALUES ('296', 'thumbs-down');
INSERT INTO `ref_icon` VALUES ('297', 'thumbs-o-down');
INSERT INTO `ref_icon` VALUES ('298', 'thumbs-o-up');
INSERT INTO `ref_icon` VALUES ('299', 'thumbs-up');
INSERT INTO `ref_icon` VALUES ('300', 'ticket');
INSERT INTO `ref_icon` VALUES ('301', 'times');
INSERT INTO `ref_icon` VALUES ('302', 'times-circle');
INSERT INTO `ref_icon` VALUES ('303', 'times-circle-o');
INSERT INTO `ref_icon` VALUES ('304', 'tint');
INSERT INTO `ref_icon` VALUES ('305', 'toggle-down');
INSERT INTO `ref_icon` VALUES ('306', 'toggle-left');
INSERT INTO `ref_icon` VALUES ('307', 'toggle-off');
INSERT INTO `ref_icon` VALUES ('308', 'toggle-on');
INSERT INTO `ref_icon` VALUES ('309', 'toggle-right');
INSERT INTO `ref_icon` VALUES ('310', 'toggle-up');
INSERT INTO `ref_icon` VALUES ('311', 'trash');
INSERT INTO `ref_icon` VALUES ('312', 'trash-o');
INSERT INTO `ref_icon` VALUES ('313', 'tree');
INSERT INTO `ref_icon` VALUES ('314', 'trophy');
INSERT INTO `ref_icon` VALUES ('315', 'truck');
INSERT INTO `ref_icon` VALUES ('316', 'tty');
INSERT INTO `ref_icon` VALUES ('317', 'umbrella');
INSERT INTO `ref_icon` VALUES ('318', 'university');
INSERT INTO `ref_icon` VALUES ('319', 'unlock');
INSERT INTO `ref_icon` VALUES ('320', 'unlock-alt');
INSERT INTO `ref_icon` VALUES ('321', 'unsorted');
INSERT INTO `ref_icon` VALUES ('322', 'upload');
INSERT INTO `ref_icon` VALUES ('323', 'user');
INSERT INTO `ref_icon` VALUES ('324', 'user-plus');
INSERT INTO `ref_icon` VALUES ('325', 'user-secret');
INSERT INTO `ref_icon` VALUES ('326', 'user-times');
INSERT INTO `ref_icon` VALUES ('327', 'users');
INSERT INTO `ref_icon` VALUES ('328', 'video-camera');
INSERT INTO `ref_icon` VALUES ('329', 'volume-down');
INSERT INTO `ref_icon` VALUES ('330', 'volume-off');
INSERT INTO `ref_icon` VALUES ('331', 'volume-up');
INSERT INTO `ref_icon` VALUES ('332', 'warning');
INSERT INTO `ref_icon` VALUES ('333', 'wheelchair');
INSERT INTO `ref_icon` VALUES ('334', 'wifi');
INSERT INTO `ref_icon` VALUES ('335', 'cc-amex');
INSERT INTO `ref_icon` VALUES ('336', 'cc-discover');
INSERT INTO `ref_icon` VALUES ('337', 'cc-mastercard');
INSERT INTO `ref_icon` VALUES ('338', 'cc-paypal');
INSERT INTO `ref_icon` VALUES ('339', 'cc-stripe');
INSERT INTO `ref_icon` VALUES ('340', 'cc-visa');
INSERT INTO `ref_icon` VALUES ('341', 'credit-card');
INSERT INTO `ref_icon` VALUES ('342', 'google-wallet');
INSERT INTO `ref_icon` VALUES ('343', 'paypal');
INSERT INTO `ref_icon` VALUES ('344', 'bitcoin');
INSERT INTO `ref_icon` VALUES ('345', 'btc');
INSERT INTO `ref_icon` VALUES ('346', 'cny');
INSERT INTO `ref_icon` VALUES ('347', 'dollar');
INSERT INTO `ref_icon` VALUES ('348', 'eur');
INSERT INTO `ref_icon` VALUES ('349', 'euro');
INSERT INTO `ref_icon` VALUES ('350', 'gbp');
INSERT INTO `ref_icon` VALUES ('351', 'ils');
INSERT INTO `ref_icon` VALUES ('352', 'inr');
INSERT INTO `ref_icon` VALUES ('353', 'jpy');
INSERT INTO `ref_icon` VALUES ('354', 'krw');
INSERT INTO `ref_icon` VALUES ('355', 'money');
INSERT INTO `ref_icon` VALUES ('356', 'th');
INSERT INTO `ref_icon` VALUES ('357', 'th-list');
INSERT INTO `ref_icon` VALUES ('358', 'th-large');
INSERT INTO `ref_icon` VALUES ('359', 'chain-broken');
INSERT INTO `ref_icon` VALUES ('360', 'angle-double-down');
INSERT INTO `ref_icon` VALUES ('361', 'angle-double-left');
INSERT INTO `ref_icon` VALUES ('362', 'angle-double-right');
INSERT INTO `ref_icon` VALUES ('363', 'angle-double-up');
INSERT INTO `ref_icon` VALUES ('364', 'angle-down');
INSERT INTO `ref_icon` VALUES ('365', 'angle-left');
INSERT INTO `ref_icon` VALUES ('366', 'angle-right');
INSERT INTO `ref_icon` VALUES ('367', 'angle-up');

-- ----------------------------
-- Table structure for `ref_jabatan`
-- ----------------------------
DROP TABLE IF EXISTS `ref_jabatan`;
CREATE TABLE `ref_jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_jabatan
-- ----------------------------

-- ----------------------------
-- Table structure for `ref_module`
-- ----------------------------
DROP TABLE IF EXISTS `ref_module`;
CREATE TABLE `ref_module` (
  `id_module` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL DEFAULT 0,
  `name_module` varchar(225) NOT NULL,
  `name_controller` varchar(225) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `sort` int(3) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id_module`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_module
-- ----------------------------
INSERT INTO `ref_module` VALUES ('1', '0', 'Configuratio Users', '#', 'gears', '99', '2017-02-02 15:29:12', '2018-01-05 09:25:01');
INSERT INTO `ref_module` VALUES ('2', '1', 'Group Management', 'group', 'plus-square', '1', '2017-02-02 15:31:48', '2017-02-02 15:42:11');
INSERT INTO `ref_module` VALUES ('3', '1', 'User Management', 'user', 'street-view', '2', '2017-02-02 15:32:50', '2020-03-02 20:33:13');
INSERT INTO `ref_module` VALUES ('4', '0', 'Master Data', '#', 'bars', '11', '2020-01-16 19:13:52', '2020-03-02 20:33:13');
INSERT INTO `ref_module` VALUES ('5', '0', 'Proyek', 'proyek', 'bars', '13', '2020-01-16 19:14:19', '2020-03-02 20:33:13');
INSERT INTO `ref_module` VALUES ('6', '0', 'Penagihan', 'penagihan', 'bars', '17', '2020-01-16 19:17:49', '2020-03-02 20:33:43');
INSERT INTO `ref_module` VALUES ('7', '0', 'Report', '#', 'bars', '21', '2020-01-16 19:18:18', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('8', '4', 'Client', 'client', 'circle-thin', '1', '2020-01-16 19:18:53', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('12', '4', 'Vendor', 'vendor', 'circle-thin', '2', '2020-01-21 15:25:31', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('13', '4', 'Expense', 'master_expense', 'circle-thin', '3', '2020-02-20 15:32:45', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('14', '0', 'Transaksi', '#', 'bars', '14', '2020-02-20 15:33:44', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('15', '14', 'Expense', 'expense', 'circle-thin', '1', '2020-02-20 15:34:23', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('16', '4', 'Perusahaan', 'perusahaan', 'circle-thin', '4', '2020-03-02 20:45:29', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('17', '0', 'Employee', 'employee', 'users', '12', '2020-03-02 20:47:05', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('18', '0', 'Quotation', 'quotation', 'circle-thin', '15', '2020-03-03 09:47:47', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('19', '0', 'Tanda Terima', 'tanda_terima', 'circle-thin', '20', '2020-03-03 09:48:06', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('20', '0', 'Invoice', 'invoice', 'circle-thin', '18', '2020-03-20 09:47:51', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('21', '0', 'Kwitansi', 'kwitansi', 'circle-thin', '19', '2020-03-20 09:48:05', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('22', '0', 'implementasi', 'implementasi', 'circle-thin', '22', '2022-03-08 15:18:37', '2022-03-08 15:18:43');
INSERT INTO `ref_module` VALUES ('23', '0', 'Pekerjaan', 'pekerjaan', 'bars', '16', '2023-07-25 09:02:53', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `ref_perusahaan`
-- ----------------------------
DROP TABLE IF EXISTS `ref_perusahaan`;
CREATE TABLE `ref_perusahaan` (
  `id_perusahaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `akronim` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `npwp` varchar(25) DEFAULT NULL,
  `pimpinan` varchar(255) DEFAULT NULL,
  `logo_kop` text DEFAULT NULL,
  `logo_stempel` text DEFAULT NULL,
  `logo_ttd` text DEFAULT NULL,
  `status_pajak` varchar(10) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `id_bank` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_perusahaan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_perusahaan
-- ----------------------------
INSERT INTO `ref_perusahaan` VALUES ('1', 'PT. Nigmagrid Indo Nesia', 'NI', 'Botanical Junction H9-8 Jakarta Barat 11640 Indonesia', '021-58906608', '0', 'Andri Royantara', '1', '1', '1', 'Ya', '1', '1');
INSERT INTO `ref_perusahaan` VALUES ('2', 'PT. Bramanty Adhikari Tibra Syandana', 'BATS', 'Botanical Junction H9-8 Jakarta Barat 11640 Indonesia', '021-58906608', '0', 'Andri Royantara', '1', '1', '1', 'Ya', '1', '1');
INSERT INTO `ref_perusahaan` VALUES ('3', 'NigmaStore', 'NS', 'Botanical Junction H9-8 Jakarta Barat 11640 Indonesia', '021-58906608', '0', 'Andri Royantara', '1', '1', '1', 'Tidak', '1', '1');
INSERT INTO `ref_perusahaan` VALUES ('4', 'NigmaSky', 'NSKY', 'Botanical Junction H9-8 Jakarta Barat 11640 Indonesia', '085264145693', '0', 'Andri Royantara', '1', '1', '1', 'Tidak', '1', '1');
INSERT INTO `ref_perusahaan` VALUES ('6', 'sad', null, 'wad', '23', '2', '23', 'F0hJIpcaAAELyLG.jpg', 'F0hNd0LaEAACPOm1.jpg', 'WhatsApp_Image_2023-07-05_at_10_45_09_AM1.jpeg', 'Ya', '1', '1');

-- ----------------------------
-- Table structure for `ref_project`
-- ----------------------------
DROP TABLE IF EXISTS `ref_project`;
CREATE TABLE `ref_project` (
  `id` int(2) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `client_code` int(2) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `contract_value` decimal(20,0) DEFAULT NULL,
  `file` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_project
-- ----------------------------

-- ----------------------------
-- Table structure for `ref_toc`
-- ----------------------------
DROP TABLE IF EXISTS `ref_toc`;
CREATE TABLE `ref_toc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urutan` int(11) DEFAULT NULL,
  `keterangan` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_toc
-- ----------------------------
INSERT INTO `ref_toc` VALUES ('1', '1', 'A');
INSERT INTO `ref_toc` VALUES ('2', '2', 'B');
INSERT INTO `ref_toc` VALUES ('3', '3', 'C');
INSERT INTO `ref_toc` VALUES ('4', '4', 'D');
INSERT INTO `ref_toc` VALUES ('5', '5', 'E');
INSERT INTO `ref_toc` VALUES ('6', '6', 'F');

-- ----------------------------
-- Table structure for `ref_user`
-- ----------------------------
DROP TABLE IF EXISTS `ref_user`;
CREATE TABLE `ref_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL,
  `name_user` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_user
-- ----------------------------
INSERT INTO `ref_user` VALUES ('1', '1', 'Administrator', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', '2016-08-21 00:00:00', '2020-07-24 10:07:32');
INSERT INTO `ref_user` VALUES ('3', '3', 'Herlan', 'herlan164', '21232f297a57a5a743894a0e4a801fc3', '2020-07-01 21:08:21', '2020-07-16 16:32:18');
INSERT INTO `ref_user` VALUES ('4', '4', 'Iskandar', 'iskandar', '21232f297a57a5a743894a0e4a801fc3', '2020-07-02 15:08:53', '2022-03-08 15:21:05');
INSERT INTO `ref_user` VALUES ('5', '1', 'Admin', 'batcrew2', 'c3284d0f94606de1fd2af172aba15bf3', '2022-03-08 15:21:05', '2022-03-08 15:21:05');
INSERT INTO `ref_user` VALUES ('6', '5', 'herlan', 'herlan', '8a667c9429f347c7b102d59f5c617d40', '2022-03-08 15:19:39', '2022-03-08 15:21:05');

-- ----------------------------
-- Table structure for `ref_user_access`
-- ----------------------------
DROP TABLE IF EXISTS `ref_user_access`;
CREATE TABLE `ref_user_access` (
  `id_user_access` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `akses` int(1) NOT NULL DEFAULT 0,
  `tambah` int(1) NOT NULL DEFAULT 0,
  `lihat` int(1) NOT NULL DEFAULT 0,
  `edit` int(1) NOT NULL DEFAULT 0,
  `hapus` int(1) NOT NULL DEFAULT 0,
  `ex_excel` int(1) NOT NULL DEFAULT 0,
  `ex_pdf` int(1) NOT NULL DEFAULT 0,
  `id_parent` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id_user_access`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_user_access
-- ----------------------------
INSERT INTO `ref_user_access` VALUES ('1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '2016-08-24 00:00:00', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('2', '1', '2', '1', '1', '1', '1', '1', '1', '1', '1', '2016-08-24 00:00:00', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('3', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '2016-08-24 00:00:00', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('4', '1', '4', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('5', '1', '5', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('6', '1', '6', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('7', '1', '7', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('8', '1', '8', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('12', '1', '12', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('13', '1', '13', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('14', '1', '14', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('15', '1', '15', '1', '1', '1', '1', '1', '1', '1', '14', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('16', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('17', '2', '2', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('18', '2', '3', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('19', '2', '4', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('20', '2', '5', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('21', '2', '6', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('22', '2', '7', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('23', '2', '8', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('27', '2', '12', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('28', '2', '13', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('29', '2', '14', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('30', '2', '15', '1', '1', '1', '1', '1', '1', '1', '14', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('31', '1', '16', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('32', '2', '16', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('33', '1', '17', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('34', '2', '17', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-03 09:28:03');
INSERT INTO `ref_user_access` VALUES ('35', '1', '18', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('36', '2', '18', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-20 09:49:20');
INSERT INTO `ref_user_access` VALUES ('37', '1', '19', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('38', '2', '19', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-20 09:49:20');
INSERT INTO `ref_user_access` VALUES ('39', '1', '20', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('40', '2', '20', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-20 09:49:20');
INSERT INTO `ref_user_access` VALUES ('41', '1', '21', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('42', '2', '21', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-03-20 09:49:20');
INSERT INTO `ref_user_access` VALUES ('43', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('44', '3', '2', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('45', '3', '3', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('46', '3', '4', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('47', '3', '5', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('48', '3', '6', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('49', '3', '7', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('50', '3', '8', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('51', '3', '12', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('52', '3', '13', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('53', '3', '14', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('54', '3', '15', '1', '1', '1', '1', '1', '1', '1', '14', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('55', '3', '16', '1', '1', '1', '1', '1', '1', '1', '4', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('56', '3', '17', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('57', '3', '18', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('58', '3', '19', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('59', '3', '20', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('60', '3', '21', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2020-07-01 21:07:28');
INSERT INTO `ref_user_access` VALUES ('61', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('62', '4', '2', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('63', '4', '3', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('64', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('65', '4', '5', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('66', '4', '6', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('67', '4', '7', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('68', '4', '8', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('69', '4', '12', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('70', '4', '13', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('71', '4', '14', '1', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('72', '4', '15', '1', '1', '1', '1', '1', '1', '1', '14', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('73', '4', '16', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('74', '4', '17', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('75', '4', '18', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('76', '4', '19', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('77', '4', '20', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('78', '4', '21', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2020-07-02 15:09:18');
INSERT INTO `ref_user_access` VALUES ('79', '1', '22', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('80', '2', '22', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('81', '3', '22', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('82', '4', '22', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('83', '5', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('84', '5', '2', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('85', '5', '3', '0', '0', '0', '0', '0', '0', '0', '1', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('86', '5', '4', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('87', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('88', '5', '6', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('89', '5', '7', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('90', '5', '8', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('91', '5', '12', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('92', '5', '13', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('93', '5', '14', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('94', '5', '15', '0', '0', '0', '0', '0', '0', '0', '14', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('95', '5', '16', '0', '0', '0', '0', '0', '0', '0', '4', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('96', '5', '17', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('97', '5', '18', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('98', '5', '19', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('99', '5', '20', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('100', '5', '21', '0', '0', '0', '0', '0', '0', '0', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('101', '5', '22', '1', '1', '1', '1', '1', '1', '1', '0', '2020-03-20 09:49:20', '2022-03-08 15:19:11');
INSERT INTO `ref_user_access` VALUES ('102', '1', '23', '1', '1', '1', '1', '1', '1', '1', '0', '0000-00-00 00:00:00', '2023-07-25 09:04:15');
INSERT INTO `ref_user_access` VALUES ('103', '2', '23', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `ref_user_access` VALUES ('104', '3', '23', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `ref_user_access` VALUES ('105', '4', '23', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `ref_user_access` VALUES ('106', '5', '23', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `ref_vendor`
-- ----------------------------
DROP TABLE IF EXISTS `ref_vendor`;
CREATE TABLE `ref_vendor` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `suplier_name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `npwp` varchar(30) DEFAULT NULL,
  `pic_name` varchar(50) DEFAULT NULL,
  `pic_phone` varchar(13) DEFAULT NULL,
  `pic_email` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `id_user` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of ref_vendor
-- ----------------------------
INSERT INTO `ref_vendor` VALUES ('1', '0001', 'PT. Telekomunikasi Indonesia, Tbk', 'Plaza Lantai 22, Jalan Jend. Sudirman Kav. 21 Jakarta Selatan', '-', '-', '0', '-', '-', '1', '2020-03-09 11:07:59', null, null);
INSERT INTO `ref_vendor` VALUES ('2', '0002', 'PT. Pramindo Ikat Nusantara (PINs)', 'Plaza kuningan Annex building, lantai 7, Jl. HR. Rasuna Said, RT.4/RW.12, Menteng Dalam, Kec. Tebet, Kota Jakarta Selatan', '-', '-', '0', '-', '-', '1', '2020-03-09 12:35:51', null, null);

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'superadmin', 'admin', '2020-07-08 15:27:14', '2020-07-08 15:27:14');
INSERT INTO `roles` VALUES ('2', 'Operator', 'user', '2020-10-15 11:25:02', '2020-10-15 11:25:02');

-- ----------------------------
-- Table structure for `role_has_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES ('18', '2');
INSERT INTO `role_has_permissions` VALUES ('19', '2');
INSERT INTO `role_has_permissions` VALUES ('20', '2');
INSERT INTO `role_has_permissions` VALUES ('21', '2');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `eiin` varchar(255) DEFAULT NULL,
  `pabx` varchar(255) DEFAULT NULL,
  `reg` varchar(255) DEFAULT NULL,
  `stablished` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT 'assets/images/logo/favicon.png',
  `social_facebook` varchar(255) DEFAULT 'https://www.facebook.com/',
  `social_twitter` varchar(255) DEFAULT 'https://www.twitter.com/',
  `social_linkedin` varchar(255) DEFAULT 'https://www.linkedin.com/',
  `social_google` varchar(255) DEFAULT 'https://www.google.com/',
  `social_youtube` varchar(255) DEFAULT 'https://www.youtube.com/',
  `layout` varchar(255) NOT NULL DEFAULT '1',
  `maps` text DEFAULT NULL,
  `running_year` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'Laravel Boilerplate', 'Knowledge is Power', '123', '123', '12345', '2013', 'riyadhahmed777@gmail.com', '+8801531117886', 'Chattogram, Bangladesh', 'http://riyadh.com/', 'assets/images/logo/1598681688.png', 'assets/images/logo/1571036986.png', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.linkedin.com/', 'https://www.google.com/', 'https://www.youtube.com/', '0', null, '2019-2020', '2020-10-14 15:29:11', '2020-10-14 15:29:11');

-- ----------------------------
-- Table structure for `tabel_log`
-- ----------------------------
DROP TABLE IF EXISTS `tabel_log`;
CREATE TABLE `tabel_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_user` varchar(255) DEFAULT NULL,
  `log_tipe` int(11) DEFAULT NULL,
  `log_desc` varchar(255) DEFAULT NULL,
  `keterangan` varchar(225) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tabel_log
-- ----------------------------
INSERT INTO `tabel_log` VALUES ('1', '2022-03-08 15:58:46', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('2', '2022-03-08 15:59:08', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('3', '2022-03-08 15:59:08', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('4', '2022-03-08 16:17:31', 'herlan', '2', 'add', 'Id User  : Berhasil Menambahkan Data Implemntasi', null);
INSERT INTO `tabel_log` VALUES ('5', '2022-03-08 16:18:19', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('6', '2022-03-08 16:18:33', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('7', '2022-03-08 16:18:53', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('8', '2022-03-08 16:25:08', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('9', '2022-03-08 16:27:45', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('10', '2022-03-08 16:54:35', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('11', '2022-03-08 16:54:56', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');
INSERT INTO `tabel_log` VALUES ('12', '2022-03-30 09:53:13', 'herlan', '5', 'index', 'Id User 6 : Membuka Halaman Data Implemntasi', '::1');

-- ----------------------------
-- Table structure for `tanda_terimas`
-- ----------------------------
DROP TABLE IF EXISTS `tanda_terimas`;
CREATE TABLE `tanda_terimas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL,
  `date` date DEFAULT NULL,
  `penerima` varchar(255) DEFAULT '',
  `pengirim` varchar(255) DEFAULT '',
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of tanda_terimas
-- ----------------------------
INSERT INTO `tanda_terimas` VALUES ('5', 'testing aplikasi', '2024-02-01', 'nerima', 'kirim', '1', '2024-02-02 19:39:20', '2024-02-02 19:39:20', '1', null);
INSERT INTO `tanda_terimas` VALUES ('6', 'testing tester3', '2024-02-04', 'tes terma2', 'tes kirimn1', '1', '2024-02-02 20:48:38', '2024-02-02 20:49:12', '1', null);
INSERT INTO `tanda_terimas` VALUES ('7', '<p><em>dcsdfsdfsf</em></p>\r\n<p><em>dfkjsdlfkjsldkfjlsdkfjdakhaskdhkasdhakdj</em></p>\r\n<p style=\"padding-left: 160px; text-align: left;\"><strong><em>asdasdasddasdasdasd</em></strong></p>\r\n<p style=\"padding-left: 160px; text-align: left;\"><strong><em>asdasdasd<span style=\"font-family: \'times new roman\', times, serif;\">ssssss</span></em></strong><span style=\"font-family: \'times new roman\', times, serif;\">ssssss</span></p>\r\n<p style=\"padding-left: 160px; text-align: left;\"><span style=\"font-family: \'times new roman\', times, serif;\">asdasdasdasd<span style=\"font-family: \'comic sans ms\', sans-serif;\">asdasdasdasd</span></span></p>', '2024-02-14', 'tes kirimin', 'tes terima', '1', '2024-02-07 13:38:04', '2024-02-07 13:38:04', '1', null);
INSERT INTO `tanda_terimas` VALUES ('8', '<div>\r\n<div>www.nigmagrid.net</div>\r\n<div>\r\n<div>\r\n<div>Puri Botanical H9-8</div>\r\n<div>\r\n<div>\r\n<div>Jakarta Barat 11640</div>\r\n<div>\r\n<div>\r\n<div>Indonesia</div>\r\n<div>\r\n<div>\r\n<div>62 21 589066608</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '2024-02-13', 'terima dataya', 'kirimin datanya', '1', '2024-02-07 13:43:56', '2024-02-07 13:43:56', '1', null);

-- ----------------------------
-- Table structure for `tb_expense`
-- ----------------------------
DROP TABLE IF EXISTS `tb_expense`;
CREATE TABLE `tb_expense` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `no` varchar(8) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kategori` int(2) DEFAULT NULL,
  `deskripsi` varchar(225) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_expense
-- ----------------------------
INSERT INTO `tb_expense` VALUES ('3', '0001', '2020-02-26', '5', 'Snapy Tanjung Barat', '47500', '1', '2020-02-27 13:12:23', null, '2020-03-06 13:52:42');
INSERT INTO `tb_expense` VALUES ('4', '0004', '2020-02-25', '5', 'Toko Bangunan Bumi Indah', '50000', '1', '2020-02-27 13:14:51', null, '2020-03-06 13:48:47');
INSERT INTO `tb_expense` VALUES ('5', '0005', '2020-02-17', '5', 'Jawa Advertising ', '3000000', '1', '2020-02-27 13:16:04', null, '2020-03-06 13:45:28');
INSERT INTO `tb_expense` VALUES ('6', '0006', '2020-02-18', '5', 'Toko Bangunan Bumi Indah', '600000', '1', '2020-02-27 13:17:01', null, '2020-03-06 13:46:26');
INSERT INTO `tb_expense` VALUES ('7', '0007', '2020-02-18', '5', 'Tri Jaya Servis', '970000', '1', '2020-02-27 13:18:02', null, '2020-03-06 12:52:59');
INSERT INTO `tb_expense` VALUES ('8', '0008', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '150000', '1', '2020-02-27 13:22:41', null, '2020-03-06 11:06:38');
INSERT INTO `tb_expense` VALUES ('9', '0009', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '200000', '1', '2020-02-27 13:23:33', null, '2020-03-06 11:05:48');
INSERT INTO `tb_expense` VALUES ('10', '0010', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '150000', '1', '2020-02-27 13:24:21', null, '2020-03-06 11:04:44');
INSERT INTO `tb_expense` VALUES ('11', '0011', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '150000', '1', '2020-02-27 13:24:58', null, '2020-03-06 11:02:58');
INSERT INTO `tb_expense` VALUES ('12', '0012', '2020-02-07', '5', 'PT. Lumya Dinamiks International', '150000', '1', '2020-02-27 13:25:39', null, '2020-03-06 10:36:40');
INSERT INTO `tb_expense` VALUES ('13', '0013', '2019-03-25', '5', 'Global Computer', '900000', '1', '2020-02-27 13:30:12', null, '2020-03-06 10:24:31');
INSERT INTO `tb_expense` VALUES ('14', '0014', '2019-02-02', '5', 'Global Computer', '8485000', '1', '2020-02-27 13:31:17', null, '2020-03-06 10:22:56');
INSERT INTO `tb_expense` VALUES ('15', '0015', '2019-02-28', '5', 'Global Computer', '1385000', '1', '2020-02-27 13:31:58', null, '2020-03-06 09:56:03');
INSERT INTO `tb_expense` VALUES ('16', '0016', '2020-02-28', '3', 'Kertas A4 80 gr', '51000', '1', '2020-02-28 20:37:54', null, null);
INSERT INTO `tb_expense` VALUES ('17', '0017', '2020-03-02', '5', 'Lumia Building ', '900000', '1', '2020-03-02 15:11:33', null, '2020-03-06 09:52:41');
INSERT INTO `tb_expense` VALUES ('18', '0018', '2020-02-28', '5', 'UD. Nurmailah Production', '790000', '2', '2020-03-03 10:42:03', null, '2020-03-06 09:48:32');
INSERT INTO `tb_expense` VALUES ('19', '0019', '2020-03-02', '5', 'PT. Lumya Dinamiks International ', '150000', '2', '2020-03-03 10:46:58', null, '2020-03-06 10:34:42');
INSERT INTO `tb_expense` VALUES ('20', '0020', '2020-03-02', '5', 'PT. Lumya Dinamiks International ', '100000', '2', '2020-03-03 10:47:31', null, '2020-03-06 10:34:15');
INSERT INTO `tb_expense` VALUES ('21', '0021', '2020-03-02', '5', 'PT. Lumya Dinamiks International', '100000', '2', '2020-03-03 10:48:21', null, '2020-03-06 10:33:48');
INSERT INTO `tb_expense` VALUES ('22', '0022', '2020-03-02', '5', 'PT. Lumya Dinamiks International', '100000', '2', '2020-03-03 10:53:22', null, '2020-03-06 10:33:20');
INSERT INTO `tb_expense` VALUES ('23', '0023', '2020-03-02', '5', 'PT. Lumya Dinamiks International ', '100000', '2', '2020-03-03 10:53:51', null, '2020-03-06 10:32:55');
INSERT INTO `tb_expense` VALUES ('24', '0024', '2020-02-25', '5', 'Jawa Advertising  ', '750000', '2', '2020-03-04 12:50:54', null, '2020-03-06 09:49:35');
INSERT INTO `tb_expense` VALUES ('25', '0025', '2020-03-04', '3', 'PD Makmur Suci  ', '95000', '2', '2020-03-04 15:09:01', null, '2020-03-06 09:38:25');
INSERT INTO `tb_expense` VALUES ('26', '0026', '2020-03-04', '5', 'Toko Bangunan Bumi Indah', '91000', '2', '2020-03-04 15:12:59', null, '2020-03-06 11:14:40');
INSERT INTO `tb_expense` VALUES ('27', '0027', '2020-03-04', '5', 'Toko Listrik ', '115000', '2', '2020-03-05 13:36:27', null, '2020-03-06 09:32:41');
INSERT INTO `tb_expense` VALUES ('28', '0028', '2020-03-06', '5', 'Ezra Stationary', '433000', '2', '2020-03-09 10:00:29', null, null);
INSERT INTO `tb_expense` VALUES ('29', '0029', '2020-02-25', '5', 'Jawa Advertising', '1900000', '2', '2020-03-10 13:57:37', null, '2020-03-10 13:57:58');
INSERT INTO `tb_expense` VALUES ('30', '0030', '2020-03-10', '5', 'Deppo Air Minum', '14000', '2', '2020-03-10 13:59:22', null, '2020-03-11 10:44:41');
INSERT INTO `tb_expense` VALUES ('39', '0039', '2020-03-02', '5', 'PT. Lumya Dinamiks International', '550000', '2', '2020-05-12 18:44:06', null, '2020-06-03 20:43:33');
INSERT INTO `tb_expense` VALUES ('40', '0040', '2020-04-07', '5', 'PT. Lumya Dinamiks International', '550000', '2', '2020-05-12 18:48:36', null, '2020-06-03 20:43:04');
INSERT INTO `tb_expense` VALUES ('41', '0041', '2020-05-11', '5', 'PT. Lumya Dinamiks International', '350000', '2', '2020-05-12 18:51:04', null, '2020-06-03 20:42:39');
INSERT INTO `tb_expense` VALUES ('42', '0042', '2020-04-08', '4', 'E TOL', '50000', '2', '2020-05-12 18:53:49', null, null);
INSERT INTO `tb_expense` VALUES ('43', '0043', '2020-05-15', '5', 'Token Listrik', '307500', '2', '2020-05-15 01:18:48', null, null);
INSERT INTO `tb_expense` VALUES ('44', '0044', '2020-05-26', '5', 'Token Listrik', '202750', '1', '2020-05-26 14:48:42', null, '2020-05-26 14:51:25');
INSERT INTO `tb_expense` VALUES ('45', '0045', '2020-05-26', '5', 'PT. Lumya Dinamiks International', '100000', '1', '2020-05-26 15:46:50', null, '2020-06-03 20:42:23');
INSERT INTO `tb_expense` VALUES ('46', '0046', '2020-05-31', '5', 'Token Listrik', '21500', '1', '2020-06-02 11:51:54', null, '2020-06-02 11:53:04');
INSERT INTO `tb_expense` VALUES ('47', '0047', '2020-05-31', '5', 'Token Listrik', '102500', '1', '2020-06-02 11:54:55', null, null);
INSERT INTO `tb_expense` VALUES ('48', '0048', '2020-06-03', '4', 'BOP ( MH.Thamrin Service IPad )', '25000', '1', '2020-06-03 20:32:22', null, '2020-06-03 20:32:48');
INSERT INTO `tb_expense` VALUES ('49', '0049', '2020-06-02', '5', 'Deppo Air Minum', '23000', '1', '2020-06-03 20:34:53', null, '2020-06-03 20:39:05');
INSERT INTO `tb_expense` VALUES ('50', '0050', '2020-06-03', '5', 'Token Listrik', '201500', '1', '2020-06-03 20:40:43', null, null);
INSERT INTO `tb_expense` VALUES ('51', '0051', '2020-05-18', '5', 'Lumia Building', '200000', '1', '2020-06-03 20:49:33', null, null);
INSERT INTO `tb_expense` VALUES ('52', '0052', '2020-05-20', '5', 'Lumia Building', '100000', '1', '2020-06-03 20:50:40', null, null);
INSERT INTO `tb_expense` VALUES ('53', '0053', '2020-06-04', '5', 'PT. Lumya Dinamiks International', '550000', '1', '2020-06-04 14:49:13', null, null);
INSERT INTO `tb_expense` VALUES ('54', '0054', '2020-06-09', '5', 'Token Listrik', '201500', '1', '2020-06-09 12:36:27', null, null);
INSERT INTO `tb_expense` VALUES ('55', '0055', '2020-06-12', '5', 'Deppo Air Minum', '12000', '1', '2020-06-15 09:43:37', null, '2020-06-15 09:46:07');
INSERT INTO `tb_expense` VALUES ('56', '0056', '2020-06-15', '5', 'Token Listrik', '201500', '1', '2020-06-15 09:45:36', null, null);
INSERT INTO `tb_expense` VALUES ('57', '0057', '2020-06-21', '5', 'Token Listrik', '202750', '1', '2020-06-22 11:00:24', null, '2020-06-22 11:01:47');
INSERT INTO `tb_expense` VALUES ('58', '0058', '2020-06-25', '4', 'BOP (Gedung PP Pasang Ram)', '50000', '1', '2020-06-28 22:00:33', null, '2020-06-28 22:08:14');
INSERT INTO `tb_expense` VALUES ('59', '0059', '2020-06-27', '5', 'Drain gun blaster', '150000', '1', '2020-06-28 22:06:08', null, null);
INSERT INTO `tb_expense` VALUES ('60', '0060', '2020-06-29', '5', 'Toko Listrik', '50000', '1', '2020-06-29 13:55:24', null, null);
INSERT INTO `tb_expense` VALUES ('61', '0061', '2020-05-30', '5', 'Token Listrik', '102500', '3', '2020-07-01 21:14:30', null, null);
INSERT INTO `tb_expense` VALUES ('62', '0062', '2020-07-01', '4', 'BOP (IDC Data Center)', '250000', '3', '2020-07-01 23:03:26', null, null);
INSERT INTO `tb_expense` VALUES ('63', '0063', '2020-07-02', '4', 'BOP ( Service Ipad )', '50000', '3', '2020-07-06 13:29:48', null, null);
INSERT INTO `tb_expense` VALUES ('64', '0064', '2020-07-03', '5', 'PT. Lumya Dinamiks International', '550000', '3', '2020-07-07 11:00:26', null, '2020-07-07 12:35:25');
INSERT INTO `tb_expense` VALUES ('65', '0065', '2020-07-03', '4', 'BOP (IDC Data Center)', '30000', '3', '2020-07-07 11:17:19', null, null);
INSERT INTO `tb_expense` VALUES ('66', '0066', '2020-01-06', '5', 'Satnet \r\n010.003-20.70183257\r\n013/SAT/I/2020\r\n', '2', '1', '2020-07-27 04:45:42', null, null);
INSERT INTO `tb_expense` VALUES ('67', '0067', '2020-07-01', '5', 'Satnet\r\n010.003-20.70183421\r\n159/SAT/VII/2020\r\n', '2', '1', '2020-07-27 04:46:42', null, null);
INSERT INTO `tb_expense` VALUES ('68', '0068', '2020-02-03', '5', 'Satnet\r\n010.003-20.70183285\r\n037/SAT/II/2020', '2', '1', '2020-07-27 04:48:08', null, null);
INSERT INTO `tb_expense` VALUES ('69', '0069', '2020-03-04', '5', 'Satnet\r\n010.003-20.70183315\r\n064/SAT/III/2020', '2', '1', '2020-07-27 04:48:31', null, null);
INSERT INTO `tb_expense` VALUES ('70', '0070', '2020-04-01', '5', 'Satnet\r\n010.003-20.70183340\r\n088/SAT/IV/2020\r\n', '2', '1', '2020-07-27 04:48:49', null, null);
INSERT INTO `tb_expense` VALUES ('71', '0071', '2020-07-01', '5', 'Satnet\r\n010.003-20.70183368\r\n112/SAT/V/2020', '2', '1', '2020-07-27 04:49:11', null, null);
INSERT INTO `tb_expense` VALUES ('72', '0072', '2020-06-02', '5', 'Satnet\r\n010.003-20.70183394\r\n135/SAT/VI/2020', '2', '1', '2020-07-27 04:49:27', null, null);
INSERT INTO `tb_expense` VALUES ('73', '0073', '2020-08-06', '5', 'PT. Lumya Dinamiks International', '550000', '3', '2020-08-06 11:43:26', null, '2022-10-04 13:10:04');

-- ----------------------------
-- Table structure for `tb_expense_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_expense_detail`;
CREATE TABLE `tb_expense_detail` (
  `id_expense_detail` int(2) NOT NULL AUTO_INCREMENT,
  `id_expense` varchar(8) DEFAULT NULL,
  `nama_detail` varchar(150) DEFAULT NULL,
  `qty` varchar(2) DEFAULT NULL,
  `harga_satuan` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_expense_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_expense_detail
-- ----------------------------
INSERT INTO `tb_expense_detail` VALUES ('2', '27', 'Kabel ', '3', '5000', '15000');
INSERT INTO `tb_expense_detail` VALUES ('3', '27', 'Bohlam Eurotion', '2', '50000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('4', '25', 'Bolpoint Joyko Hitam', '1', '21000', '21000');
INSERT INTO `tb_expense_detail` VALUES ('5', '25', 'Plastic Laminating Folio Joyko', '1', '74000', '74000');
INSERT INTO `tb_expense_detail` VALUES ('6', '24', 'Logo Nigmarid Indonesia Stainless (30 x 30)', '1', '750000', '750000');
INSERT INTO `tb_expense_detail` VALUES ('7', '23', 'Bayar Parkir Motor Bulan Maret 2020 - Venti Aniver Sari', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('8', '22', 'Bayar Parkir Motor Bulan Maret 2020   - Andri Royantara', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('9', '21', 'Bayar Parkir Motor Bulan Maret 2020 - Yuli Wulandari', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('10', '20', 'Bayar Parkir Motor Bulan Maret 2020 - Herlansyah', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('11', '19', 'Bayar Parkir Mobil Bulan Maret 2020  - Billy Citra Saputra', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('12', '18', 'Kain kanopi Merah (3m x 1,5 m)', '1', '790000', '790000');
INSERT INTO `tb_expense_detail` VALUES ('13', '17', 'Biaya Keamanan RK H09 08 DRA I  Blok H9 - 8', '1', '900000', '900000');
INSERT INTO `tb_expense_detail` VALUES ('14', '15', 'Hardisk SEAGATE 320GB R_', '3', '235000', '705000');
INSERT INTO `tb_expense_detail` VALUES ('15', '15', 'Cashing Alcatroz Futura Black Pro N5000', '2', '340000', '680000');
INSERT INTO `tb_expense_detail` VALUES ('16', '14', 'MEMORY DDR2 2GB PC6400 V-GEN', '12', '350000', '4200000');
INSERT INTO `tb_expense_detail` VALUES ('17', '14', 'Hardisk SEAGATE 320GB R_', '2', '235000', '470000');
INSERT INTO `tb_expense_detail` VALUES ('18', '14', 'CASHING ALCATROZ FUTURA BLACK PRO N5000', '10', '340000', '3400000');
INSERT INTO `tb_expense_detail` VALUES ('19', '14', 'MOUSE LOGITECH USB B100', '5', '70000', '350000');
INSERT INTO `tb_expense_detail` VALUES ('20', '14', 'DEEP COOL THERMAL GREASE Z3', '1', '65000', '65000');
INSERT INTO `tb_expense_detail` VALUES ('21', '13', 'SAMSUNG SSD V-NAND 860 EVO 250GB', '1', '900000', '900000');
INSERT INTO `tb_expense_detail` VALUES ('22', '9', 'Bayar Parkir Mobil Bulan Februari 2020 - Billy Citra Saputra', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('23', '9', 'Biaya Kartu Parkir Mobil', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('24', '12', 'Bayar Parkir Motor Bulan Februari 2020 - Andri Royantara', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('25', '12', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('26', '11', 'Bayar Parkir Motor Bulan Februari 2020 - Yuli Wulandari', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('27', '11', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('28', '10', 'Bayar Parkir Motor Bulan Februari 2020 - Venti Aniver Sari', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('29', '10', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('30', '8', 'Bayar Parkir Motor Bulan Februari 2020 - Herlansyah', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('31', '8', 'Biaya Kartu Parkir Motor', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('32', '26', 'Dina Bor 8 x 40', '10', '1000', '10000');
INSERT INTO `tb_expense_detail` VALUES ('33', '26', 'Mata Bor Irwin 8', '1', '35000', '35000');
INSERT INTO `tb_expense_detail` VALUES ('34', '26', 'Double Tape 3m', '1', '25000', '25000');
INSERT INTO `tb_expense_detail` VALUES ('35', '26', 'Aibon', '1', '15000', '15000');
INSERT INTO `tb_expense_detail` VALUES ('36', '26', 'Paku Beton 4', '2', '3000', '6000');
INSERT INTO `tb_expense_detail` VALUES ('37', '7', 'Service Cuci AC', '1', '70000', '70000');
INSERT INTO `tb_expense_detail` VALUES ('38', '7', 'Jasa Kerja Bongkar Pasang AC + Vacum', '1', '450000', '450000');
INSERT INTO `tb_expense_detail` VALUES ('39', '7', 'Isi Ulang Freon R410 A', '1', '450000', '450000');
INSERT INTO `tb_expense_detail` VALUES ('40', '6', 'Kabel  Eter 3 x 2,5', '1', '600000', '600000');
INSERT INTO `tb_expense_detail` VALUES ('41', '5', 'Huruf Timbul Stainless \\\"Nigmarid Indonesia\\\" 21 x 213 cm', '1', '3000000', '3000000');
INSERT INTO `tb_expense_detail` VALUES ('42', '4', 'Double Tape 3 m', '2', '25000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('43', '3', 'Box Kartu Nama Kecil (30 pcs)', '1', '4500', '4500');
INSERT INTO `tb_expense_detail` VALUES ('44', '3', 'Ongkos Potongan', '1', '2000', '2000');
INSERT INTO `tb_expense_detail` VALUES ('45', '3', 'Smooth Canova White A3 (47x32)', '1', '6000', '6000');
INSERT INTO `tb_expense_detail` VALUES ('46', '3', 'Print Color Kn A3 Minipack (1 Klik) BB', '1', '35000', '35000');
INSERT INTO `tb_expense_detail` VALUES ('47', '28', 'Tinta 85 N Epson 1390', '1', '390000', '390000');
INSERT INTO `tb_expense_detail` VALUES ('48', '28', 'JNE YES', '1', '43000', '43000');
INSERT INTO `tb_expense_detail` VALUES ('49', '29', 'Latar Acrylik Logo Logo PT Bramanty (30 x 30)', '1', '350000', '350000');
INSERT INTO `tb_expense_detail` VALUES ('50', '29', 'Laser Acrylik PT Bramanty Adhikari Tibra Syandana', '1', '1550000', '1550000');
INSERT INTO `tb_expense_detail` VALUES ('51', '30', 'Air Minum', '2', '6000', '12000');
INSERT INTO `tb_expense_detail` VALUES ('52', '30', 'Ongkir', '1', '2000', '2000');
INSERT INTO `tb_expense_detail` VALUES ('53', '39', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('54', '39', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('55', '39', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('56', '39', 'B 3171 PXA', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('57', '39', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('58', '40', 'B 3171 PXA', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('59', '40', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('60', '40', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('61', '40', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('62', '40', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('63', '41', 'B 6396 PPQ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('64', '41', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('65', '41', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('66', '42', 'Top Up E tol ', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('67', '43', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `tb_expense_detail` VALUES ('68', '43', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `tb_expense_detail` VALUES ('69', '43', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `tb_expense_detail` VALUES ('70', '44', 'Tokopedia (Iqbal Fikri)', '1', '202750', '202750');
INSERT INTO `tb_expense_detail` VALUES ('71', '45', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('72', '46', 'Dana (Listrik) Abi Maulana', '1', '21500', '21500');
INSERT INTO `tb_expense_detail` VALUES ('73', '47', 'M Banking BCA Abi Maulana', '1', '102500', '102500');
INSERT INTO `tb_expense_detail` VALUES ('74', '48', 'Bensin Motor', '1', '15000', '15000');
INSERT INTO `tb_expense_detail` VALUES ('75', '48', 'Parkir', '1', '10000', '10000');
INSERT INTO `tb_expense_detail` VALUES ('77', '49', 'Ongkir', '1', '2000', '2000');
INSERT INTO `tb_expense_detail` VALUES ('78', '49', 'Air Minum', '3', '7000', '21000');
INSERT INTO `tb_expense_detail` VALUES ('79', '50', 'Dana (Listrik) Lutfi ', '1', '201500', '201500');
INSERT INTO `tb_expense_detail` VALUES ('80', '51', 'Tunjangan Hari Raya ( Security )', '1', '200000', '200000');
INSERT INTO `tb_expense_detail` VALUES ('81', '52', 'Tunjangan Hari Raya ( Rukun Tetangga )', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('82', '53', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('83', '53', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('84', '53', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('85', '53', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('86', '53', 'B 6396 PPQ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('87', '54', 'M Banking BCA Lutfi ', '1', '201500', '201500');
INSERT INTO `tb_expense_detail` VALUES ('88', '55', 'Isi Ulang Aqua', '2', '6000', '12000');
INSERT INTO `tb_expense_detail` VALUES ('89', '56', 'Dana (Listrik) Lutfi ', '1', '201500', '201500');
INSERT INTO `tb_expense_detail` VALUES ('90', '57', 'Tokopedia (Listrik) Iqbal Fikri', '1', '202750', '202750');
INSERT INTO `tb_expense_detail` VALUES ('92', '59', 'Drain gun blaster (Tembakan Pipa Saluran Air)', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('93', '58', 'Makan', '1', '25000', '25000');
INSERT INTO `tb_expense_detail` VALUES ('94', '58', 'Bensin', '1', '25000', '25000');
INSERT INTO `tb_expense_detail` VALUES ('95', '60', 'Bohlam LED In Lite 7watt', '2', '25000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('96', '61', 'M Banking BCA Herlansyah', '1', '102500', '102500');
INSERT INTO `tb_expense_detail` VALUES ('97', '62', 'Pemasangan Server Dell  (sn:D6JDT92)', '1', '250000', '250000');
INSERT INTO `tb_expense_detail` VALUES ('98', '63', 'Bensin Motor + Parkir', '1', '50000', '50000');
INSERT INTO `tb_expense_detail` VALUES ('99', '64', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('100', '64', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('101', '64', 'B 3011 SWZ', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('102', '64', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('103', '65', 'Restart Server', '1', '30000', '30000');
INSERT INTO `tb_expense_detail` VALUES ('104', '64', 'B 6598 SMY', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('105', '73', 'B 6598 SMY', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('106', '73', 'B 3987 BVL', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('107', '73', 'B 3082 TMI', '1', '100000', '100000');
INSERT INTO `tb_expense_detail` VALUES ('108', '73', 'B 2116 QT', '1', '150000', '150000');
INSERT INTO `tb_expense_detail` VALUES ('109', '73', 'B 3011 SWZ', '1', '100000', '100000');

-- ----------------------------
-- Table structure for `tb_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `tb_invoice`;
CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(30) DEFAULT NULL,
  `curr` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_invoice
-- ----------------------------
INSERT INTO `tb_invoice` VALUES ('1', '0001/INV/I/2022', '1', '2022-01-14', '3', '1', '2022-01-14 11:42:57', null, null);

-- ----------------------------
-- Table structure for `tb_invoice_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_invoice_detail`;
CREATE TABLE `tb_invoice_detail` (
  `id_invoice_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_invoice` int(30) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `total` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_invoice_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_invoice_detail
-- ----------------------------
INSERT INTO `tb_invoice_detail` VALUES ('1', '1', '2', '2', '2');

-- ----------------------------
-- Table structure for `tb_kwitansi`
-- ----------------------------
DROP TABLE IF EXISTS `tb_kwitansi`;
CREATE TABLE `tb_kwitansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(50) DEFAULT NULL,
  `terima` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_kwitansi
-- ----------------------------
INSERT INTO `tb_kwitansi` VALUES ('1', '0001/K/BATS/VII/2023', 'PT PP (PERSERO) TBK', 'Pembayaran I sebesar 95% (Sembilan Puluh Lima Persen)\r\nPekerjaan Peremajaan Hardware UTM\r\n\r\nBerdasar', '790875000', '1', '2023-07-24 12:49:04', null, null);

-- ----------------------------
-- Table structure for `tb_pekerjaan`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pekerjaan`;
CREATE TABLE `tb_pekerjaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perusahaan_id` int(11) DEFAULT NULL,
  `jenis_kontrak` varchar(20) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL,
  `status_pajak` varchar(10) DEFAULT NULL,
  `nama_pekerjaan` varchar(200) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_spk` varchar(100) DEFAULT NULL,
  `tgl_spk` date DEFAULT NULL,
  `nilai_kontrak` varchar(50) DEFAULT NULL,
  `metode_pembayaran` varchar(20) DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `status_proyek` varchar(20) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_pekerjaan
-- ----------------------------
INSERT INTO `tb_pekerjaan` VALUES ('1', '1', 'Kontak', '3', '1', 'Ya', '234', '234', '234', '2023-08-10', '234', 'Termin', '2023-08-10', '2023-08-10', 'On Proggress', '1', '2023-08-10 11:20:51');

-- ----------------------------
-- Table structure for `tb_pekerjaanbast_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pekerjaanbast_detail`;
CREATE TABLE `tb_pekerjaanbast_detail` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `id_pekerjaan` varchar(8) DEFAULT NULL,
  `deskripsi` varchar(150) DEFAULT NULL,
  `persen` varchar(10) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `metode_pembayaran` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_pekerjaanbast_detail
-- ----------------------------
INSERT INTO `tb_pekerjaanbast_detail` VALUES ('1', '1', '234', '23', '3455', 'Termin');
INSERT INTO `tb_pekerjaanbast_detail` VALUES ('2', '1', '234', '34', '43534', 'Termin');

-- ----------------------------
-- Table structure for `tb_pekerjaan_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pekerjaan_detail`;
CREATE TABLE `tb_pekerjaan_detail` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `id_pekerjaan` varchar(8) DEFAULT NULL,
  `deskripsi` varchar(150) DEFAULT NULL,
  `qty` varchar(2) DEFAULT NULL,
  `harga_satuan` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_pekerjaan_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_proyek`
-- ----------------------------
DROP TABLE IF EXISTS `tb_proyek`;
CREATE TABLE `tb_proyek` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `perusahaan` int(2) DEFAULT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `jenis_kontrak` int(1) DEFAULT NULL,
  `client_id` int(2) DEFAULT NULL,
  `nama_pekerjaan` varchar(200) DEFAULT NULL,
  `no_spk` varchar(100) DEFAULT NULL,
  `tgl_spk` date DEFAULT NULL,
  `tgl_awal` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `nilai_kontrak` varchar(20) DEFAULT NULL,
  `tgl_bast` date DEFAULT NULL,
  `no_bast` varchar(20) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `status_proyek` int(1) DEFAULT NULL,
  `metode_pembayaran` varchar(250) DEFAULT NULL,
  `id_quotation` int(2) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_proyek
-- ----------------------------
INSERT INTO `tb_proyek` VALUES ('1', '1', 'BATS1', '1', '13', 'Jasa Pengembangan Aplikasi CV Karyawan', '02.B/KONTRAK-DIT/2019', '2019-01-24', '2019-01-24', '2019-02-22', '18.414.000', '0000-00-00', '', '', '0', 'Transfer ke no. rekening 1010077703377', '0', '2', '2020-03-04 11:01:14', null, null);
INSERT INTO `tb_proyek` VALUES ('2', '1', 'BATS2', '1', '8', 'PERJANJIAN PEMBERIAN JASA PENYUSUNAN ELECTRONIC DOCUMENT SYSTEM (EDMS)', 'No. KU.09.01/WB-0A.1936/2014', '2014-11-28', '2014-12-08', '2015-03-06', '1.127.177.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:14:08', null, null);
INSERT INTO `tb_proyek` VALUES ('3', '1', 'BATS3', '1', '5', 'PEKERJAAN PEMBUATAN SISTEM MONITORING READY MIX QR CODE PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA - CIKAMPEK II ELEVATED', '064/SPK-SUB/WK-ACSET/DIII/2018', '2018-01-22', '2018-01-22', '2018-12-22', '454.527.920', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:26:08', null, null);
INSERT INTO `tb_proyek` VALUES ('4', '1', 'BATS4', '1', '10', 'JNE ENTERPRISE PORTAL (SHAREPOINT)', 'P.O. No. :POHMS/1609/0010', '2016-09-01', '2016-09-01', '2016-11-01', '412.500.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:22:46', null, null);
INSERT INTO `tb_proyek` VALUES ('5', '1', 'BATS5', '1', '16', 'PERJANJIAN PENGADAAN APLIKASI MEMBERSHIP KFA ANTARA PT SIGMA CIPTA CARAKA', '185-PRC/SCC/BATS/A/15', '2015-09-09', '2015-09-04', '2015-10-04', '750.000.000', '0000-00-00', '', '', '0', 'Transfer Bank Kesejahteraan Ekonomi', '0', '2', '2020-03-04 10:52:14', null, null);
INSERT INTO `tb_proyek` VALUES ('6', '1', 'BATS6', '2', '3', 'PERJANJIAN JUAL BELI - MATERIAL NON OA', '07 .Amd01/SPBJ/DIVISI-EPC/PP/IX/2017', '2017-09-04', '2017-05-15', '2017-09-30', '5.390.000.000', '0000-00-00', '', '', '2', '', '0', '2', '2020-03-09 14:21:26', null, null);
INSERT INTO `tb_proyek` VALUES ('7', '1', 'BATS7', '2', '3', 'ADDENDUM PERTAMA ATAS PERJANJIAN IMPLEMENTASI ENTERPRISE CONTENT MANAGEMENT MENGGUNAKAN SHAREPOINT', ' ADD/88/PP/DVSCM/VU2019', '2019-06-27', '2019-04-24', '2019-06-24', '5.242.116.000', '0000-00-00', '', '', '0', 'Penagihan lmbalan Jasa akan dilakukan secara berta', '0', '2', '2020-03-04 11:02:32', null, null);
INSERT INTO `tb_proyek` VALUES ('8', '1', 'BATS8', '1', '5', 'PEKERJAAN PEMBUATAN SISTEM MONITORING READY MIX QR CODE PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA - CIKAMPEK II ELEVATED', '430/WK/D.III/2017', '2017-12-22', '2017-12-22', '2018-12-22', '454.527.920', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 11:12:38', null, null);
INSERT INTO `tb_proyek` VALUES ('9', '1', 'BATS9', '1', '13', 'PEKERJAAN JASA LAIN PEMBANGUNAN APLIKASI MONITORING PENGADAAN DIVISI GENERAL AFFAIR', '21.A/KONTRAK-DIT/2018', '2018-06-08', '2018-06-08', '2018-12-08', '97.350.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 13:24:31', null, null);
INSERT INTO `tb_proyek` VALUES ('10', '1', 'BATS10', '1', '13', 'PENGADAAN JASA PENGEMBANGAN APLIKASI ALIH PROFESI DAN BIDIK JABATAN', '35/KONTRAK-DIT/2018', '2018-08-16', '2018-08-16', '2018-09-24', '84.645.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 13:28:08', null, null);
INSERT INTO `tb_proyek` VALUES ('11', '1', 'BATS11', '1', '4', 'JASA ASET TRACKING TAHAP 2 (INVENTARIS) DI PERUM PERURI', '48-PDS/SP/410.346/2018/VII/2018', '2018-07-26', '2018-07-26', '2019-03-22', '900.000.000', '0000-00-00', '', '', '0', 'Transfer ke rek Bank Mandiri, no rek 1010077703377', '0', '2', '2020-03-04 13:37:07', null, null);
INSERT INTO `tb_proyek` VALUES ('12', '1', 'BATS12', '1', '4', 'JASA SEWA PERANGKAT SERVER DAN PC', '12-PDS/SP/410.382/2019/I/2019', '2019-01-31', '2019-03-08', '2022-03-07', '712.800.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-04 13:39:58', null, null);
INSERT INTO `tb_proyek` VALUES ('13', '1', 'BATS13', '1', '21', 'PEKERJAAN PEMBUATAN SISTEM APLIKASI MANAJEMEN LOGLAT PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA - CIKAMPEK SELATAN PAKET III', '27/WK/D.III/2019', '2019-03-04', '2019-03-04', '2019-04-03', '275.000.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-05 10:51:26', null, null);
INSERT INTO `tb_proyek` VALUES ('14', '1', 'BATS14', '1', '21', 'PEKERJAAN PEMBUATAN FUEL MONITORING SYSTEM SOLAR PADA PROYEK PEMBANGUNAN JALAN TOL JAKARTA – CIKAMPEK SELATAN PAKET III', '26/WK/D.III/2019', '2019-03-04', '2019-03-04', '2019-04-03', '110.000.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-05 10:53:01', null, null);
INSERT INTO `tb_proyek` VALUES ('15', '1', 'BATS15', '1', '6', 'JASA PEMBUATAN DOCUMENT LIBRARY', 'P.O. No. :POSAS/1904/0176', '2019-04-29', '0000-00-00', '0000-00-00', '330.721.875', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-05 10:54:12', null, null);
INSERT INTO `tb_proyek` VALUES ('16', '1', 'BATS16', '1', '22', 'Pengadaan Barang dan atau Jasa Aplikasi Integrated Financial dan Accounting System Berbasis Information Communication Technology (IFAS-ICT)', 'K.TEL.3559/HK.810/DES-A1014000/2010', '2010-12-31', '2010-12-31', '2011-07-27', '1.308.600.000', '0000-00-00', '', '', '0', 'Secara Giral Bank BCA Cabang Senayan City Jakarta No. Rek. 5005118899', '0', '2', '2020-03-09 11:23:21', null, null);
INSERT INTO `tb_proyek` VALUES ('17', '1', 'BATS17', '1', '13', 'Jasa Konsultasi Digitalisasi Dokumen Divisi Manajemen Operasi  PT Jasa Marga (Persero) Tbk.', '30/KONTRAK.CB/2010', '2010-12-10', '2010-12-10', '2011-02-10', '349.629.500', '0000-00-00', '', '', '0', 'Pembayaran melalui Bendahara Kantor Pusat PT Jasa Marga (Persero)', '0', '2', '2020-03-09 11:33:27', null, null);
INSERT INTO `tb_proyek` VALUES ('18', '1', 'BATS18', '1', '14', 'Pekerjaan Digitalisasi Dokumen', 'CJ.SPK.199.1', '2010-12-03', '2010-12-03', '2010-12-24', '54.346.875', '0000-00-00', '', '', '0', 'Pembayaran melalui Bendahara / Bagian Keuangan PT Jasa Marga (Persero) Tbk, Cabang CTC\r\n', '0', '2', '2020-03-09 11:39:24', null, null);
INSERT INTO `tb_proyek` VALUES ('19', '1', 'BATS19', '1', '23', 'Penyedia Solusi Contact Center Untuk RSUP Dr. Cipto Mangunkusumo', '1397/LG.280/PIN.00.00/2012', '2012-11-22', '2012-11-22', '2012-12-20', '559.360.355', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-09 12:42:40', null, null);
INSERT INTO `tb_proyek` VALUES ('20', '1', 'BATS20', '1', '7', 'Pembuatan Dashboard Karyawan / Manajemen', '335/KPJ/CD/2013', '2013-06-24', '2013-06-19', '2013-09-17', '341.737.000', '0000-00-00', '', '', '0', 'Pembayaran dilakukan secara langsung dalam BAST Pekerjaan', '0', '2', '2020-03-09 13:04:05', null, null);
INSERT INTO `tb_proyek` VALUES ('21', '1', 'BATS21', '1', '13', 'Jasa Konsultan Sosial Media', '005/SPK/2013', '2013-01-15', '2013-01-15', '2013-06-30', '65.340.000', '0000-00-00', '', '', '0', '', '0', '2', '2020-03-09 13:10:56', null, null);
INSERT INTO `tb_proyek` VALUES ('22', '1', 'BATS22', '1', '24', 'Design Web Bank Kesejahteraan Ekonomi', '01/2013/PER', '2013-01-09', '2013-01-09', '2013-02-09', '32000000', '0000-00-00', '', '', '0', 'Pembayaran dapat dilakukan Cash / Transfer ke Bank BCA No. Rek. 500-511-8899', '0', '2', '2020-03-09 13:37:24', null, null);
INSERT INTO `tb_proyek` VALUES ('23', '1', 'BATS23', '1', '3', 'Pengadaan Exchange Antispam Type Fortmail', '', '0000-00-00', '0000-00-00', '0000-00-00', '200000000', '2019-06-26', '0026/BAST/VI/2019', '', '2', '', '0', '2', '2020-03-09 15:28:58', null, null);
INSERT INTO `tb_proyek` VALUES ('25', '1', 'BATS25', '1', '3', 'Pek. Jasa perawatan berkala server Internet PP EPC', '5049/EPC/PP-719003/II/2020', '2020-02-01', '2020-02-01', '0000-00-00', '149336990', '0000-00-00', '', 'Lokasi : Proyek PLTU Timor-1 2x50 MW', '0', 'Pembayaran terakhir dibayarkan berdasarkan jumlah pekerjaan yang dikerjakan', '0', '2', '2020-04-16 07:58:05', null, null);
INSERT INTO `tb_proyek` VALUES ('26', '1', 'BATS26', '1', '3', 'Implementasi Integrasi Sistem dan EDMS', '149/SPK/SMT/EPC/PP/III/2020', '2020-03-05', '2020-03-05', '0000-00-00', '404800000', '0000-00-00', '', 'Lokasi Pekerjaan : Kolaka, Sulawesi Tenggara', '0', 'Pembayaran dilakukan sesuai kondisi sebagai berikut :\r\n - 100% Setelah Development Selesai \r\n -  Pembayaran dilaksanakan 90 hari setelah dilaksanakan opname bersama', '0', '2', '2020-04-16 07:56:39', null, null);

-- ----------------------------
-- Table structure for `tb_quotation`
-- ----------------------------
DROP TABLE IF EXISTS `tb_quotation`;
CREATE TABLE `tb_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` varchar(30) DEFAULT NULL,
  `perihal` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_client` int(2) DEFAULT NULL,
  `up_nama` varchar(30) DEFAULT NULL,
  `pekerjaan` varchar(225) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_quotation
-- ----------------------------
INSERT INTO `tb_quotation` VALUES ('1', '0001/NI/SPH/VII/2023', '123', '2023-07-20', '3', '12', '213', '1', '2023-07-20 13:42:05', null, null);

-- ----------------------------
-- Table structure for `tb_quotation_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_quotation_detail`;
CREATE TABLE `tb_quotation_detail` (
  `id_quotation_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_quotation` int(11) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `qty` varchar(20) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `upprice` varchar(50) DEFAULT NULL,
  `selling` varchar(50) DEFAULT NULL,
  `totalpriece` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_quotation_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_quotation_detail
-- ----------------------------
INSERT INTO `tb_quotation_detail` VALUES ('1', '1', '11', '22', '33', '44', '968', '55', '24.2', '68.2', '1500.4');
INSERT INTO `tb_quotation_detail` VALUES ('2', '1', '10', '20', '30', '40', '800', '50', '20', '60', '1200');

-- ----------------------------
-- Table structure for `tb_tanda_terima`
-- ----------------------------
DROP TABLE IF EXISTS `tb_tanda_terima`;
CREATE TABLE `tb_tanda_terima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pilih_pt` int(1) DEFAULT NULL,
  `nomor` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nama_pengirim` varchar(50) DEFAULT NULL,
  `nama_penerima` varchar(50) DEFAULT NULL,
  `id_user` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_tanda_terima
-- ----------------------------
INSERT INTO `tb_tanda_terima` VALUES ('1', '1', '0001', '0000-00-00', 'AA', 'AA', '1', '2020-07-24 10:17:53', null, null);

-- ----------------------------
-- Table structure for `tb_tanda_terima_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_tanda_terima_detail`;
CREATE TABLE `tb_tanda_terima_detail` (
  `id_tt_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_tanda_terima` int(1) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tt_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tb_tanda_terima_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `texpenses`
-- ----------------------------
DROP TABLE IF EXISTS `texpenses`;
CREATE TABLE `texpenses` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `no` varchar(8) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kategori` int(2) DEFAULT NULL,
  `deskripsi` varchar(225) DEFAULT NULL,
  `amount` decimal(20,3) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_user_modified` int(2) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of texpenses
-- ----------------------------
INSERT INTO `texpenses` VALUES ('3', '0001', '2020-02-26', '5', 'Snapy Tanjung Barat', '47500.000', '1', '2020-02-27 13:12:23', null, '2020-03-06 13:52:42', '1', null, null);
INSERT INTO `texpenses` VALUES ('4', '0004', '2020-02-25', '5', 'Toko Bangunan Bumi Indah', '50000.000', '1', '2020-02-27 13:14:51', null, '2020-03-06 13:48:47', '1', null, null);
INSERT INTO `texpenses` VALUES ('5', '0005', '2020-02-17', '5', 'Jawa Advertising ', '3000000.000', '1', '2020-02-27 13:16:04', null, '2020-03-06 13:45:28', '1', null, null);
INSERT INTO `texpenses` VALUES ('6', '0006', '2020-02-18', '5', 'Toko Bangunan Bumi Indah', '600000.000', '1', '2020-02-27 13:17:01', null, '2020-03-06 13:46:26', '1', null, null);
INSERT INTO `texpenses` VALUES ('7', '0007', '2020-02-18', '5', 'Tri Jaya Servis', '970000.000', '1', '2020-02-27 13:18:02', null, '2020-03-06 12:52:59', '1', null, null);
INSERT INTO `texpenses` VALUES ('8', '0008', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '150000.000', '1', '2020-02-27 13:22:41', null, '2020-03-06 11:06:38', '1', null, null);
INSERT INTO `texpenses` VALUES ('9', '0009', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '200000.000', '1', '2020-02-27 13:23:33', null, '2020-03-06 11:05:48', '1', null, null);
INSERT INTO `texpenses` VALUES ('10', '0010', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '150000.000', '1', '2020-02-27 13:24:21', null, '2020-03-06 11:04:44', '1', null, null);
INSERT INTO `texpenses` VALUES ('11', '0011', '2020-02-01', '5', 'PT. Lumya Dinamiks International ', '150000.000', '1', '2020-02-27 13:24:58', null, '2020-03-06 11:02:58', '1', null, null);
INSERT INTO `texpenses` VALUES ('12', '0012', '2020-02-07', '5', 'PT. Lumya Dinamiks International', '150000.000', '1', '2020-02-27 13:25:39', null, '2020-03-06 10:36:40', '1', null, null);
INSERT INTO `texpenses` VALUES ('13', '0013', '2019-03-25', '5', 'Global Computer', '900000.000', '1', '2020-02-27 13:30:12', null, '2020-03-06 10:24:31', '1', null, null);
INSERT INTO `texpenses` VALUES ('14', '0014', '2019-02-02', '5', 'Global Computer', '8485000.000', '1', '2020-02-27 13:31:17', null, '2020-03-06 10:22:56', '1', null, null);
INSERT INTO `texpenses` VALUES ('15', '0015', '2019-02-28', '5', 'Global Computer', '1385000.000', '1', '2020-02-27 13:31:58', null, '2020-03-06 09:56:03', '1', null, null);
INSERT INTO `texpenses` VALUES ('16', '0016', '2020-02-28', '3', 'Kertas A4 80 gr', '51000.000', '1', '2020-02-28 20:37:54', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('17', '0017', '2020-03-02', '5', 'Lumia Building ', '900000.000', '1', '2020-03-02 15:11:33', null, '2020-03-06 09:52:41', '1', null, null);
INSERT INTO `texpenses` VALUES ('18', '0018', '2020-02-28', '5', 'UD. Nurmailah Production', '790000.000', '2', '2020-03-03 10:42:03', null, '2020-03-06 09:48:32', '1', null, null);
INSERT INTO `texpenses` VALUES ('19', '0019', '2020-03-02', '5', 'PT. Lumya Dinamiks International ', '150000.000', '2', '2020-03-03 10:46:58', null, '2020-03-06 10:34:42', '1', null, null);
INSERT INTO `texpenses` VALUES ('20', '0020', '2020-03-02', '5', 'PT. Lumya Dinamiks International ', '100000.000', '2', '2020-03-03 10:47:31', null, '2020-03-06 10:34:15', '1', null, null);
INSERT INTO `texpenses` VALUES ('21', '0021', '2020-03-02', '5', 'PT. Lumya Dinamiks International', '100000.000', '2', '2020-03-03 10:48:21', null, '2020-03-06 10:33:48', '1', null, null);
INSERT INTO `texpenses` VALUES ('22', '0022', '2020-03-02', '5', 'PT. Lumya Dinamiks International', '100000.000', '2', '2020-03-03 10:53:22', null, '2020-03-06 10:33:20', '1', null, null);
INSERT INTO `texpenses` VALUES ('23', '0023', '2020-03-02', '5', 'PT. Lumya Dinamiks International ', '100000.000', '2', '2020-03-03 10:53:51', null, '2020-03-06 10:32:55', '1', null, null);
INSERT INTO `texpenses` VALUES ('24', '0024', '2020-02-25', '5', 'Jawa Advertising  ', '750000.000', '2', '2020-03-04 12:50:54', null, '2020-03-06 09:49:35', '1', null, null);
INSERT INTO `texpenses` VALUES ('25', '0025', '2020-03-04', '3', 'PD Makmur Suci  ', '95000.000', '2', '2020-03-04 15:09:01', null, '2020-03-06 09:38:25', '1', null, null);
INSERT INTO `texpenses` VALUES ('26', '0026', '2020-03-04', '5', 'Toko Bangunan Bumi Indah', '91000.000', '2', '2020-03-04 15:12:59', null, '2020-03-06 11:14:40', '1', null, null);
INSERT INTO `texpenses` VALUES ('27', '0027', '2020-03-04', '5', 'Toko Listrik ', '115000.000', '2', '2020-03-05 13:36:27', null, '2020-03-06 09:32:41', '1', null, null);
INSERT INTO `texpenses` VALUES ('28', '0028', '2020-03-06', '5', 'Ezra Stationary', '433000.000', '2', '2020-03-09 10:00:29', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('29', '0029', '2020-02-25', '5', 'Jawa Advertising', '1900000.000', '2', '2020-03-10 13:57:37', null, '2020-03-10 13:57:58', '1', null, null);
INSERT INTO `texpenses` VALUES ('30', '0030', '2020-03-10', '5', 'Deppo Air Minum', '14000.000', '2', '2020-03-10 13:59:22', null, '2020-03-11 10:44:41', '1', null, null);
INSERT INTO `texpenses` VALUES ('39', '0039', '2020-03-02', '5', 'PT. Lumya Dinamiks International', '550000.000', '2', '2020-05-12 18:44:06', null, '2020-06-03 20:43:33', '1', null, null);
INSERT INTO `texpenses` VALUES ('40', '0040', '2020-04-07', '5', 'PT. Lumya Dinamiks International', '550000.000', '2', '2020-05-12 18:48:36', null, '2020-06-03 20:43:04', '1', null, null);
INSERT INTO `texpenses` VALUES ('41', '0041', '2020-05-11', '5', 'PT. Lumya Dinamiks International', '350000.000', '2', '2020-05-12 18:51:04', null, '2020-06-03 20:42:39', '1', null, null);
INSERT INTO `texpenses` VALUES ('42', '0042', '2020-04-08', '4', 'E TOL', '50000.000', '2', '2020-05-12 18:53:49', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('43', '0043', '2020-05-15', '5', 'Token Listrik', '307500.000', '2', '2020-05-15 01:18:48', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('44', '0044', '2020-05-26', '5', 'Token Listrik', '202750.000', '1', '2020-05-26 14:48:42', null, '2020-05-26 14:51:25', '1', null, null);
INSERT INTO `texpenses` VALUES ('45', '0045', '2020-05-26', '5', 'PT. Lumya Dinamiks International', '100000.000', '1', '2020-05-26 15:46:50', null, '2020-06-03 20:42:23', '1', null, null);
INSERT INTO `texpenses` VALUES ('46', '0046', '2020-05-31', '5', 'Token Listrik', '21500.000', '1', '2020-06-02 11:51:54', null, '2020-06-02 11:53:04', '1', null, null);
INSERT INTO `texpenses` VALUES ('47', '0047', '2020-05-31', '5', 'Token Listrik', '102500.000', '1', '2020-06-02 11:54:55', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('48', '0048', '2020-06-03', '4', 'BOP ( MH.Thamrin Service IPad )', '25000.000', '1', '2020-06-03 20:32:22', null, '2020-06-03 20:32:48', '1', null, null);
INSERT INTO `texpenses` VALUES ('49', '0049', '2020-06-02', '5', 'Deppo Air Minum', '23000.000', '1', '2020-06-03 20:34:53', null, '2020-06-03 20:39:05', '1', null, null);
INSERT INTO `texpenses` VALUES ('50', '0050', '2020-06-03', '5', 'Token Listrik', '201500.000', '1', '2020-06-03 20:40:43', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('51', '0051', '2020-05-18', '5', 'Lumia Building', '200000.000', '1', '2020-06-03 20:49:33', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('52', '0052', '2020-05-20', '5', 'Lumia Building', '100000.000', '1', '2020-06-03 20:50:40', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('53', '0053', '2020-06-04', '5', 'PT. Lumya Dinamiks International', '550000.000', '1', '2020-06-04 14:49:13', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('54', '0054', '2020-06-09', '5', 'Token Listrik', '201500.000', '1', '2020-06-09 12:36:27', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('55', '0055', '2020-06-12', '5', 'Deppo Air Minum', '12000.000', '1', '2020-06-15 09:43:37', null, '2020-06-15 09:46:07', '1', null, null);
INSERT INTO `texpenses` VALUES ('56', '0056', '2020-06-15', '5', 'Token Listrik', '201500.000', '1', '2020-06-15 09:45:36', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('57', '0057', '2020-06-21', '5', 'Token Listrik', '202750.000', '1', '2020-06-22 11:00:24', null, '2020-06-22 11:01:47', '1', null, null);
INSERT INTO `texpenses` VALUES ('58', '0058', '2020-06-25', '4', 'BOP (Gedung PP Pasang Ram)', '50000.000', '1', '2020-06-28 22:00:33', null, '2020-06-28 22:08:14', '1', null, null);
INSERT INTO `texpenses` VALUES ('59', '0059', '2020-06-27', '5', 'Drain gun blaster', '150000.000', '1', '2020-06-28 22:06:08', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('60', '0060', '2020-06-29', '5', 'Toko Listrik', '50000.000', '1', '2020-06-29 13:55:24', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('61', '0061', '2020-05-30', '5', 'Token Listrik', '102500.000', '3', '2020-07-01 21:14:30', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('62', '0062', '2020-07-01', '4', 'BOP (IDC Data Center)', '250000.000', '3', '2020-07-01 23:03:26', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('63', '0063', '2020-07-02', '4', 'BOP ( Service Ipad )', '50000.000', '3', '2020-07-06 13:29:48', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('64', '0064', '2020-07-03', '5', 'PT. Lumya Dinamiks International', '550000.000', '3', '2020-07-07 11:00:26', null, '2020-07-07 12:35:25', '1', null, null);
INSERT INTO `texpenses` VALUES ('65', '0065', '2020-07-03', '4', 'BOP (IDC Data Center)', '30000.000', '3', '2020-07-07 11:17:19', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('66', '0066', '2020-01-06', '5', 'Satnet \r\n010.003-20.70183257\r\n013/SAT/I/2020\r\n', '2.000', '1', '2020-07-27 04:45:42', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('67', '0067', '2020-07-01', '5', 'Satnet\r\n010.003-20.70183421\r\n159/SAT/VII/2020\r\n', '2.000', '1', '2020-07-27 04:46:42', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('68', '0068', '2020-02-03', '5', 'Satnet\r\n010.003-20.70183285\r\n037/SAT/II/2020', '2.000', '1', '2020-07-27 04:48:08', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('69', '0069', '2020-03-04', '5', 'Satnet\r\n010.003-20.70183315\r\n064/SAT/III/2020', '2.000', '1', '2020-07-27 04:48:31', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('70', '0070', '2020-04-01', '5', 'Satnet\r\n010.003-20.70183340\r\n088/SAT/IV/2020\r\n', '2.000', '1', '2020-07-27 04:48:49', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('71', '0071', '2020-07-01', '5', 'Satnet\r\n010.003-20.70183368\r\n112/SAT/V/2020', '2.000', '1', '2020-07-27 04:49:11', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('72', '0072', '2020-06-02', '5', 'Satnet\r\n010.003-20.70183394\r\n135/SAT/VI/2020', '2.000', '1', '2020-07-27 04:49:27', null, null, '1', null, null);
INSERT INTO `texpenses` VALUES ('73', '0073', '2020-08-06', '5', 'PT. Lumya Dinamiks International', '550000.000', '3', '2020-08-06 11:43:26', null, '2022-10-04 13:10:04', '1', null, null);

-- ----------------------------
-- Table structure for `tr_barcode`
-- ----------------------------
DROP TABLE IF EXISTS `tr_barcode`;
CREATE TABLE `tr_barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tr_barcode
-- ----------------------------
INSERT INTO `tr_barcode` VALUES ('1', 'Server', '21013379-HCP2001');
INSERT INTO `tr_barcode` VALUES ('2', 'Server', '21013379-HCP2002');
INSERT INTO `tr_barcode` VALUES ('3', 'Server', '21013379-HCP2003');
INSERT INTO `tr_barcode` VALUES ('4', 'Server', '21013379-HCP2004');
INSERT INTO `tr_barcode` VALUES ('5', 'Server', '21013379-HCP2005');
INSERT INTO `tr_barcode` VALUES ('6', 'Server', '21013379-HCP2006');
INSERT INTO `tr_barcode` VALUES ('7', 'Server', '21013379-HCP2007');
INSERT INTO `tr_barcode` VALUES ('8', 'Server', '21013379-HCP2008');
INSERT INTO `tr_barcode` VALUES ('9', 'Server', '21013379-HCP2009');
INSERT INTO `tr_barcode` VALUES ('10', 'Server', '21013379-HCP2010');
INSERT INTO `tr_barcode` VALUES ('11', 'Server', '21013379-HCP2011');
INSERT INTO `tr_barcode` VALUES ('12', 'Server', '21013379-HCP2012');
INSERT INTO `tr_barcode` VALUES ('13', 'Network', '21013380-HCP2013');
INSERT INTO `tr_barcode` VALUES ('14', 'Network', '21013380-HCP2014');
INSERT INTO `tr_barcode` VALUES ('15', 'Server', '21013379-HCP2015');
INSERT INTO `tr_barcode` VALUES ('16', 'Server', '21013379-HCP2016');
INSERT INTO `tr_barcode` VALUES ('17', 'Server', '21013379-HCP2017');
INSERT INTO `tr_barcode` VALUES ('18', 'Server', '21013379-HCP2018');
INSERT INTO `tr_barcode` VALUES ('19', 'Server', '21013379-HCP2019');
INSERT INTO `tr_barcode` VALUES ('20', 'Server', '21013379-HCP2020');
INSERT INTO `tr_barcode` VALUES ('21', 'Server', '21013379-HCP2021');
INSERT INTO `tr_barcode` VALUES ('22', 'Server', '21013379-HCP2022');
INSERT INTO `tr_barcode` VALUES ('23', 'Server', '21013379-HCP2023');
INSERT INTO `tr_barcode` VALUES ('24', 'Server', '21013379-HCP2024');
INSERT INTO `tr_barcode` VALUES ('25', 'Server', '21013379-HCP2025');
INSERT INTO `tr_barcode` VALUES ('26', 'Server', '21013379-HCP2026');
INSERT INTO `tr_barcode` VALUES ('27', 'Server', '21013379-HCP2027');
INSERT INTO `tr_barcode` VALUES ('28', 'Server', '21013379-HCP2028');
INSERT INTO `tr_barcode` VALUES ('29', 'Server', '21013379-HCP2029');
INSERT INTO `tr_barcode` VALUES ('30', 'Server', '21013379-HCP2030');
INSERT INTO `tr_barcode` VALUES ('31', 'Server', '21013379-HCP2031');
INSERT INTO `tr_barcode` VALUES ('32', 'Server', '21013379-HCP2032');
INSERT INTO `tr_barcode` VALUES ('33', 'Server', '21013379-HCP2033');
INSERT INTO `tr_barcode` VALUES ('34', 'Server', '21013379-HCP2034');
INSERT INTO `tr_barcode` VALUES ('35', 'Server', '21013379-HCP2035');
INSERT INTO `tr_barcode` VALUES ('36', 'Server', '21013379-HCP2036');
INSERT INTO `tr_barcode` VALUES ('37', 'Server', '21013379-HCP2037');
INSERT INTO `tr_barcode` VALUES ('38', 'Server', '21013379-HCP2038');
INSERT INTO `tr_barcode` VALUES ('39', 'Server', '21013379-HCP2039');
INSERT INTO `tr_barcode` VALUES ('40', 'Server', '21013379-HCP2040');
INSERT INTO `tr_barcode` VALUES ('41', 'Server', '21013379-HCP2041');
INSERT INTO `tr_barcode` VALUES ('42', 'Server', '21013379-HCP2042');
INSERT INTO `tr_barcode` VALUES ('43', 'Server', '21013379-HCP2043');
INSERT INTO `tr_barcode` VALUES ('44', 'Server', '21013379-HCP2044');
INSERT INTO `tr_barcode` VALUES ('45', 'Server', '21013379-HCP2045');
INSERT INTO `tr_barcode` VALUES ('46', 'Server', '21013379-HCP2046');
INSERT INTO `tr_barcode` VALUES ('47', 'Server', '21013379-HCP2047');
INSERT INTO `tr_barcode` VALUES ('48', 'Server', '21013379-HCP2048');
INSERT INTO `tr_barcode` VALUES ('49', 'Server', '21013379-HCP2049');
INSERT INTO `tr_barcode` VALUES ('50', 'Server', '21013379-HCP2050');
INSERT INTO `tr_barcode` VALUES ('51', 'Server', '21013379-HCP2051');
INSERT INTO `tr_barcode` VALUES ('52', 'Server', '21013379-HCP2052');
INSERT INTO `tr_barcode` VALUES ('53', 'Server', '21013379-HCP2053');
INSERT INTO `tr_barcode` VALUES ('54', 'Server', '21013379-HCP2054');
INSERT INTO `tr_barcode` VALUES ('55', 'Server', '21013379-HCP2055');
INSERT INTO `tr_barcode` VALUES ('56', 'Server', '21013379-HCP2056');
INSERT INTO `tr_barcode` VALUES ('57', 'Server', '21013379-HCP2057');
INSERT INTO `tr_barcode` VALUES ('58', 'Server', '21013379-HCP2058');
INSERT INTO `tr_barcode` VALUES ('59', 'Server', '21013379-HCP2059');
INSERT INTO `tr_barcode` VALUES ('60', 'Server', '21013379-HCP2060');
INSERT INTO `tr_barcode` VALUES ('61', 'Server', '21013379-HCP2061');
INSERT INTO `tr_barcode` VALUES ('62', 'Server', '21013379-HCP2062');
INSERT INTO `tr_barcode` VALUES ('63', 'Server', '21013379-HCP2063');
INSERT INTO `tr_barcode` VALUES ('64', 'Server', '21013379-HCP2064');
INSERT INTO `tr_barcode` VALUES ('65', 'Server', '21013379-HCP2065');
INSERT INTO `tr_barcode` VALUES ('66', 'Server', '21013379-HCP2066');
INSERT INTO `tr_barcode` VALUES ('67', 'Server', '21013379-HCP2067');
INSERT INTO `tr_barcode` VALUES ('68', 'Server', '21013379-HCP2068');
INSERT INTO `tr_barcode` VALUES ('69', 'Server', '21013379-HCP2069');
INSERT INTO `tr_barcode` VALUES ('70', 'Server', '21013379-HCP2070');
INSERT INTO `tr_barcode` VALUES ('71', 'Server', '21013379-HCP2071');
INSERT INTO `tr_barcode` VALUES ('72', 'Server', '21013379-HCP2072');
INSERT INTO `tr_barcode` VALUES ('73', 'Server', '21013379-HCP2073');
INSERT INTO `tr_barcode` VALUES ('74', 'Server', '21013379-HCP2074');
INSERT INTO `tr_barcode` VALUES ('75', 'Server', '21013379-HCP2075');
INSERT INTO `tr_barcode` VALUES ('76', 'Server', '21013379-HCP2076');
INSERT INTO `tr_barcode` VALUES ('77', 'Server', '21013379-HCP2077');
INSERT INTO `tr_barcode` VALUES ('78', 'Server', '21013379-HCP2078');
INSERT INTO `tr_barcode` VALUES ('79', 'Server', '21013379-HCP2079');
INSERT INTO `tr_barcode` VALUES ('80', 'Server', '21013379-HCP2080');
INSERT INTO `tr_barcode` VALUES ('81', 'Server', '21013379-HCP2081');
INSERT INTO `tr_barcode` VALUES ('82', 'Server', '21013379-HCP2082');
INSERT INTO `tr_barcode` VALUES ('83', 'Server', '21013379-HCP2083');
INSERT INTO `tr_barcode` VALUES ('84', 'Server', '21013379-HCP2084');
INSERT INTO `tr_barcode` VALUES ('85', 'Server', '21013379-HCP2085');
INSERT INTO `tr_barcode` VALUES ('86', 'Server', '21013379-HCP2086');
INSERT INTO `tr_barcode` VALUES ('87', 'Server', '21013379-HCP2087');
INSERT INTO `tr_barcode` VALUES ('88', 'Server', '21013379-HCP2088');
INSERT INTO `tr_barcode` VALUES ('89', 'Server', '21013379-HCP2089');
INSERT INTO `tr_barcode` VALUES ('90', 'Server', '21013379-HCP2090');
INSERT INTO `tr_barcode` VALUES ('91', 'Server', '21013379-HCP2091');
INSERT INTO `tr_barcode` VALUES ('92', 'Server', '21013379-HCP2092');
INSERT INTO `tr_barcode` VALUES ('93', 'Server', '21013379-HCP2093');
INSERT INTO `tr_barcode` VALUES ('94', 'Server', '21013379-HCP2094');
INSERT INTO `tr_barcode` VALUES ('95', 'Server', '21013379-HCP2095');
INSERT INTO `tr_barcode` VALUES ('96', 'Server', '21013379-HCP2096');
INSERT INTO `tr_barcode` VALUES ('97', 'Server', '21013379-HCP2097');
INSERT INTO `tr_barcode` VALUES ('98', 'Server', '21013379-HCP2098');
INSERT INTO `tr_barcode` VALUES ('99', 'Server', '21013379-HCP2099');
INSERT INTO `tr_barcode` VALUES ('100', 'Server', '21013379-HCP2100');

-- ----------------------------
-- Table structure for `tr_bast`
-- ----------------------------
DROP TABLE IF EXISTS `tr_bast`;
CREATE TABLE `tr_bast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pertama` varchar(255) DEFAULT NULL,
  `jabatan_pertama` varchar(255) DEFAULT NULL,
  `nama_kedua` varchar(255) DEFAULT NULL,
  `jabatan_kedua` varchar(255) DEFAULT NULL,
  `nobast` varchar(255) DEFAULT NULL,
  `tgl_bast` date DEFAULT NULL,
  `bast_pembayaran` varchar(100) DEFAULT NULL,
  `bast_keterangan` varchar(100) DEFAULT NULL,
  `id_pekerjaan` int(11) DEFAULT NULL,
  `status_tagihan` int(11) DEFAULT 0,
  `autonumber` int(11) DEFAULT NULL,
  `tanggal_gen` date DEFAULT NULL,
  `noinv_gen` varchar(50) DEFAULT NULL,
  `nokwi_gen` varchar(50) DEFAULT NULL,
  `nospp_gen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tr_bast
-- ----------------------------
INSERT INTO `tr_bast` VALUES ('1', 'Mr A', 'MR AA', 'MR AAA', 'MR AAAA', '123', '2023-07-26', '1', '11', '1', '0', null, null, null, null, null);
INSERT INTO `tr_bast` VALUES ('2', 'Mr B', 'MR BB', 'MR BBB', 'MR BBBB', '456', '2023-07-27', '2', '22', '1', '0', null, null, null, null, null);
INSERT INTO `tr_bast` VALUES ('3', 'Mr C', 'MR CC', 'MR CCC', 'MR CCCC', '789', '2023-07-28', '3', '33', '1', '0', null, '2023-08-02', '789/INV/VIII/2023', '789/K/BATS/VIII/2023', '789/SPP/INV/VIII/2023');
INSERT INTO `tr_bast` VALUES ('4', 'Adam', 'Direksi', 'Levin', 'Koprasi', '998', '2023-08-08', '100', 'abc', '1', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `tr_implementasi_krakatau`
-- ----------------------------
DROP TABLE IF EXISTS `tr_implementasi_krakatau`;
CREATE TABLE `tr_implementasi_krakatau` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar_file` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Records of tr_implementasi_krakatau
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `file_path` varchar(255) DEFAULT 'assets/images/users/default.png',
  `status` tinyint(4) DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Riyadh Ahmed', 'userone@admin.com', null, '$2y$10$NqE8kc.TK6aDdzZurouYleAWOdz7xs654tc6Lt6tvn08RAVerO2tS', 'assets/images/users/1594563348.png', '1', null, '2020-07-12 20:15:48', '2020-07-12 20:58:16');
