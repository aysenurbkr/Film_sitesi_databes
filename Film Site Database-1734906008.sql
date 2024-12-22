CREATE TABLE IF NOT EXISTS `admins` (
	`email` varchar(255) NOT NULL DEFAULT '100',
	`created_at` datetime NOT NULL,
	`updated_at` datetime,
	`last_login` datetime,
	`status` enum NOT NULL DEFAULT '10',
	`date_of_birth` date,
	`address` varchar(255) DEFAULT '255',
	`phone_number` varchar(255) DEFAULT '15',
	`bio` text,
	`profile_picture` varchar(255) DEFAULT '255',
	`last_name` varchar(255) DEFAULT '50',
	`first_name` varchar(255) DEFAULT '50',
	`role` enum NOT NULL DEFAULT '10',
	`admin_id` int NOT NULL,
	`username` varchar(255) NOT NULL DEFAULT '50',
	`password` varchar(255) NOT NULL DEFAULT '255',
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE IF NOT EXISTS `films` (
	`poster_url` varchar(255) DEFAULT '255',
	`duration` int NOT NULL,
	`rating` float,
	`language` varchar(255) DEFAULT '50',
	`country` varchar(255) DEFAULT '50',
	`created_at` datetime NOT NULL,
	`updated_at` datetime,
	`admin_id` int NOT NULL,
	`trailer_url` varchar(255) DEFAULT '255',
	`budget` float,
	`box_office` float,
	`status` enum NOT NULL DEFAULT '10',
	`film_id` int NOT NULL,
	`title` varchar(255) NOT NULL DEFAULT '255',
	`description` text,
	`release_date` date NOT NULL,
	PRIMARY KEY (`film_id`)
);

CREATE TABLE IF NOT EXISTS `genres` (
	`created_by` int,
	`genre_id` int NOT NULL,
	`name` varchar(255) NOT NULL DEFAULT '100',
	`description` text,
	`created_at` datetime NOT NULL,
	`updated_at` datetime,
	`status` enum NOT NULL DEFAULT '10',
	`parent_genre_id` int,
	`icon_url` varchar(255) DEFAULT '255',
	`order` int,
	`slug` varchar(255) DEFAULT '100',
	`meta_title` varchar(255) DEFAULT '255',
	`meta_description` text,
	`meta_keywords` text,
	`updated_by` int,
	`visibility` enum NOT NULL DEFAULT '10',
	`is_featured` boolean,
	PRIMARY KEY (`genre_id`)
);

CREATE TABLE IF NOT EXISTS `film_genres` (
	`deleted_at` datetime,
	`film_genre_id` int NOT NULL,
	`film_id` int NOT NULL,
	`genre_id` int NOT NULL,
	`created_at` datetime NOT NULL,
	`updated_at` datetime,
	`status` enum NOT NULL DEFAULT '10',
	`order` int,
	`created_by` int,
	`updated_by` int,
	`visibility` enum NOT NULL DEFAULT '10',
	`is_primary` boolean,
	`is_featured` boolean,
	`notes` text,
	`last_updated_by` int,
	`last_updated_at` datetime,
	`is_deleted` boolean,
	PRIMARY KEY (`film_genre_id`)
);


ALTER TABLE `films` ADD CONSTRAINT `films_fk7` FOREIGN KEY (`admin_id`) REFERENCES `admins`(`admin_id`);

ALTER TABLE `film_genres` ADD CONSTRAINT `film_genres_fk2` FOREIGN KEY (`film_id`) REFERENCES `films`(`film_id`);

ALTER TABLE `film_genres` ADD CONSTRAINT `film_genres_fk3` FOREIGN KEY (`genre_id`) REFERENCES `genres`(`genre_id`);