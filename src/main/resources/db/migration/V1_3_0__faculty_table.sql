CREATE TABLE IF NOT EXISTS `obe`.`user` (
                              `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                              `first_name` VARCHAR(45) NULL,
                              `middle_name` VARCHAR(45) NULL,
                              `last_name` VARCHAR(45) NULL,
                              `username` VARCHAR(100) NOT NULL,
                              `email` VARCHAR(100) NOT NULL,
                              `password` VARCHAR(200) NOT NULL,
                              `enabled` TINYINT(1) NULL,
                              `date_created` DATETIME NULL,
                              PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS  `obe`.`roles` (
                               `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                               `roles` VARCHAR(45) NOT NULL,
                               `description` VARCHAR(45) NULL,
                               PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS  `obe`.`user_roles` (
                                    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                    `user_id` INT UNSIGNED NOT NULL,
                                    `roles` INT UNSIGNED NOT NULL,
                                    `enabled` TINYINT(1) NOT NULL DEFAULT 1,
                                    PRIMARY KEY (`id`),
                                    INDEX `user_Roles_user_idx` (`user_id` ASC) VISIBLE,
                                    INDEX `user_Roles_roles_idx` (`roles` ASC) VISIBLE,
                                    CONSTRAINT `user_Roles_user`
                                        FOREIGN KEY (`user_id`)
                                            REFERENCES `obe`.`user` (`id`)
                                            ON DELETE NO ACTION
                                            ON UPDATE NO ACTION,
                                    CONSTRAINT `user_Roles_roles`
                                        FOREIGN KEY (`roles`)
                                            REFERENCES `obe`.`roles` (`id`)
                                            ON DELETE NO ACTION
                                            ON UPDATE NO ACTION);
