# 1.������� ������ �� ����������� ��
DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
PRIMARY KEY (`id`),
UNIQUE KEY `email` (`email`),
UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 2. ������� ��� ��
DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 3. ������� ��� ��������������� ��
DROP TABLE IF EXISTS `type_company`;

CREATE TABLE `type_company` (
  `registration_id` int(9) unsigned NOT NULL,
  `type_id` int(9) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
PRIMARY KEY (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# 4. ������� ������ (� ������������������ ������� ���� ��� �� ���������������� ������������� ������ �����; 
# ���� ������ � ���������������� �� ������� ����������� �����������, ������� �� ��������������� � ������ ����� ��������� �������; ��� ������ ������ � ������� ������ ��)  
DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 5.������� ������� (��)
DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `region_name` (`region_name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 6. ��������� �� � �������
DROP TABLE IF EXISTS `region_type`;

CREATE TABLE `region_type` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` int(9) unsigned NOT NULL,
  `region_id` int(9) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`,`registration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;


# 7. ������� ��� ������� � ������������, ��������������, ���������
DROP TABLE IF EXISTS `inspection`;

CREATE TABLE `inspection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inspection_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `inspection_name` (`inspection_name`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 8. ������� �� � ��� �������
DROP TABLE IF EXISTS `inspection_type`;

CREATE TABLE `inspection_type` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` int(9) unsigned NOT NULL,
  `inspection_id` int(9) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;


# 9. ������� ��� ��������� �� � �������� 
DROP TABLE IF EXISTS `connection`;

CREATE TABLE `connection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `connection_name` (`connection_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 10. ������� � ��������� �� � ��������
DROP TABLE IF EXISTS `connection_type`;

CREATE TABLE `connection_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection_id` int(9) unsigned NOT NULL,
  `registry_company_id` int(9) unsigned NOT NULL,
  `address_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# 11. ������� �������� (������ ������������ ������������� ������������)
DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` int(9) unsigned NOT NULL,
  `actual_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 12. ������� ������ �� (����� �����������)
DROP TABLE IF EXISTS `registry_company`;

CREATE TABLE `registry_company` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` int(9) unsigned NOT NULL,
  `address_id` int(9) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`,`registration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;


# 13. ������� � ���������� ���������� �� (� ���������� � ����������� �������� ����)
DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registration_id` int(9) unsigned NOT NULL,
  `faxnumber` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
PRIMARY KEY (`id`),
UNIQUE KEY `faxnumber` (`faxnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 14. ������� ��� ������������ �� ��
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `user_type` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


# 15. ������������������ ������������ ��
DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registry_company_id` int(9) unsigned NOT NULL,
  `user_id` int(9) unsigned NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# 16. ������� ������ �����������
DROP TABLE IF EXISTS `size`;

CREATE TABLE `size` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `size_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `size_name` (`size_name`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# 17. ������ ����������� ������������������� ��
DROP TABLE IF EXISTS `size_company`;

CREATE TABLE `size_company` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `registry_company_id` int(9) unsigned NOT NULL,
  `size_id` int(9) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`,`registry_company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

# 18. ������� � ������ �� ��������
DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# 19. ������� ������ � ������� �� ����� �����������
DROP TABLE IF EXISTS `status_company`;

CREATE TABLE `status_company` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `registry_company_id` int(9) unsigned NOT NULL,
  `status_id` int(9) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;


