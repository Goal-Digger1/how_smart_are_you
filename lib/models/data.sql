CREATE TABLE `Category` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `description` varchar(255) NOT NULL,
                            `name` varchar(100) NOT NULL,
                           PRIMARY KEY (`id`),
                       UNIQUE KEY `id_UNIQUE` (`id`)
                       ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
CREATE TABLE `Level` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `category_id` int NOT NULL,
                        `xpRequirement` int NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `id_UNIQUE` (`id`),
                         CONSTRAINT `level_fk` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
                         ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level_id` int NOT NULL,
  `statement` varchar(255) NOT NULL,
  `correct` varchar(50) NOT NULL,
  `wrong1` varchar(50) NOT NULL,
  `wrong2` varchar(50) NOT NULL,
  `wrong3` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `question_fk` (`level_id`),
  CONSTRAINT `question_fk` FOREIGN KEY (`level_id`) REFERENCES `Level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Create table `Data` (  `version` int NOT NULL  )

CREATE TABLE `Username` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

