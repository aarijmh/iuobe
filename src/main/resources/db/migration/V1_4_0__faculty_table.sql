CREATE TABLE IF NOT EXISTS `obe`.`department` (
                                                  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                  `faculty` INT UNSIGNED NOT NULL,
                                                  `name` VARCHAR(60) NULL,
                                                  `description` VARCHAR(45) NULL,
                                                  PRIMARY KEY (`id`),
                                                  INDEX `dept_fk_idx` (`faculty` ASC) VISIBLE,
                                                  CONSTRAINT `dept_fk`
                                                      FOREIGN KEY (`faculty`)
                                                          REFERENCES `obe`.`faculty` (`id`)
                                                          ON DELETE NO ACTION
                                                          ON UPDATE NO ACTION)
    COMMENT = '	';

CREATE TABLE IF NOT EXISTS`obe`.`program` (
                                 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `department` INT UNSIGNED NOT NULL,
                                 `name` VARCHAR(100) NULL,
                                 `short_name` VARCHAR(45) NULL,
                                 `duration` VARCHAR(45) NULL,
                                 `description` VARCHAR(200) NULL,
                                 PRIMARY KEY (`id`),
                                 INDEX `prg_fk_idx` (`department` ASC) VISIBLE,
                                 CONSTRAINT `prg_fk`
                                     FOREIGN KEY (`department`)
                                         REFERENCES `obe`.`department` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS`obe`.`peo` (
                             `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                             `program` INT UNSIGNED NOT NULL,
                             `name` VARCHAR(45) NULL,
                             `description` VARCHAR(200) NULL,
                             PRIMARY KEY (`id`),
                             INDEX `peo_fk_idx` (`program` ASC) VISIBLE,
                             CONSTRAINT `peo_fk`
                                 FOREIGN KEY (`program`)
                                     REFERENCES `obe`.`program` (`id`)
                                     ON DELETE NO ACTION
                                     ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS`obe`.`plo` (
                             `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                             `program` INT UNSIGNED NOT NULL,
                             `name` VARCHAR(45) NULL,
                             `description` VARCHAR(200) NULL,
                             PRIMARY KEY (`id`),
                             INDEX `plo_fk_idx` (`program` ASC) VISIBLE,
                             CONSTRAINT `plo_fk`
                                 FOREIGN KEY (`program`)
                                     REFERENCES `obe`.`program` (`id`)
                                     ON DELETE NO ACTION
                                     ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS`obe`.`peo_plo` (
                                 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `peo` INT UNSIGNED NOT NULL,
                                 `plo` INT UNSIGNED NOT NULL,
                                 `description` VARCHAR(100) NULL,
                                 PRIMARY KEY (`id`),
                                 INDEX `peo_pl_idx` (`peo` ASC) VISIBLE,
                                 INDEX `plo_pl_fk_idx` (`plo` ASC) VISIBLE,
                                 CONSTRAINT `peo_pl`
                                     FOREIGN KEY (`peo`)
                                         REFERENCES `obe`.`peo` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION,
                                 CONSTRAINT `plo_pl_fk`
                                     FOREIGN KEY (`plo`)
                                         REFERENCES `obe`.`plo` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS`obe`.`session` (
                                 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `name` VARCHAR(45) NULL,
                                 PRIMARY KEY (`id`));
CREATE TABLE IF NOT EXISTS`obe`.`semester` (
                                  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                  `session` INT UNSIGNED NOT NULL,
                                  `year` INT UNSIGNED NOT NULL,
                                  `description` VARCHAR(45) NULL,
                                  PRIMARY KEY (`id`),
                                  INDEX `semester_fk_idx` (`session` ASC) VISIBLE,
                                  CONSTRAINT `semester_fk`
                                      FOREIGN KEY (`session`)
                                          REFERENCES `obe`.`session` (`id`)
                                          ON DELETE NO ACTION
                                          ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS`obe`.`course` (
                                `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                `program` INT UNSIGNED NOT NULL,
                                `code` VARCHAR(45) NULL,
                                `name` VARCHAR(45) NULL,
                                `crdt_hrs` INT NULL,
                                `objective` TEXT NULL,
                                `contents` TEXT NULL,
                                `sdg` TEXT NULL,
                                `description` VARCHAR(100) NULL,
                                PRIMARY KEY (`id`),
                                UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
                                INDEX `course_fk1_idx` (`program` ASC) VISIBLE,
                                CONSTRAINT `course_fk1`
                                    FOREIGN KEY (`program`)
                                        REFERENCES `obe`.`program` (`id`)
                                        ON DELETE NO ACTION
                                        ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS`obe`.`grading_tools` (
                                       `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `name` VARCHAR(45) NULL,
                                       `description` VARCHAR(45) NULL,
                                       PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS`obe`.`course_grading` (
                                        `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                        `course` INT UNSIGNED NOT NULL,
                                        `grading_tools` INT UNSIGNED NOT NULL,
                                        `percentage` INT NOT NULL,
                                        `description` VARCHAR(45) NULL,
                                        PRIMARY KEY (`id`),
                                        INDEX `course_grading_fk1_idx` (`course` ASC) VISIBLE,
                                        INDEX `course_grading_fk2_idx` (`grading_tools` ASC) VISIBLE,
                                        CONSTRAINT `course_grading_fk1`
                                            FOREIGN KEY (`course`)
                                                REFERENCES `obe`.`course` (`id`)
                                                ON DELETE NO ACTION
                                                ON UPDATE NO ACTION,
                                        CONSTRAINT `course_grading_fk2`
                                            FOREIGN KEY (`grading_tools`)
                                                REFERENCES `obe`.`grading_tools` (`id`)
                                                ON DELETE NO ACTION
                                                ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS`obe`.`book` (
                              `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                              `name` VARCHAR(200) NOT NULL,
                              `isbn` VARCHAR(45) NULL,
                              `isbn_13` VARCHAR(45) NULL,
                              `author` VARCHAR(100) NULL,
                              `edition` VARCHAR(45) NULL,
                              `description` VARCHAR(45) NULL,
                              `tags` VARCHAR(45) NULL,
                              PRIMARY KEY (`id`));


CREATE TABLE IF NOT EXISTS`obe`.`course_book` (
                                     `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                     `course` INT UNSIGNED NOT NULL,
                                     `book` INT UNSIGNED NOT NULL,
                                     `primary_text` TINYINT(1) NOT NULL,
                                     PRIMARY KEY (`id`),
                                     INDEX `course_book_fk1_idx` (`course` ASC) VISIBLE,
                                     INDEX `course_book_fk2_idx` (`book` ASC) VISIBLE,
                                     CONSTRAINT `course_book_fk1`
                                         FOREIGN KEY (`course`)
                                             REFERENCES `obe`.`course` (`id`)
                                             ON DELETE NO ACTION
                                             ON UPDATE NO ACTION,
                                     CONSTRAINT `course_book_fk2`
                                         FOREIGN KEY (`book`)
                                             REFERENCES `obe`.`book` (`id`)
                                             ON DELETE NO ACTION
                                             ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS`obe`.`clo` (
                             `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                             `course` INT UNSIGNED NOT NULL,
                             `name` TEXT NOT NULL,
                             `description` VARCHAR(200) NULL,
                             `domain` VARCHAR(45) NULL,
                             PRIMARY KEY (`id`),
                             INDEX `clo_fk1_idx` (`course` ASC) VISIBLE,
                             CONSTRAINT `clo_fk1`
                                 FOREIGN KEY (`course`)
                                     REFERENCES `obe`.`course` (`id`)
                                     ON DELETE NO ACTION
                                     ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS`obe`.`taxonomy` (
                                  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                  `name` VARCHAR(45) NULL,
                                  `description` TEXT NULL,
                                  PRIMARY KEY (`id`));


CREATE TABLE IF NOT EXISTS`obe`.`domains` (
                                 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `taxonomy` INT UNSIGNED NOT NULL,
                                 `name` VARCHAR(45) NULL,
                                 `description` VARCHAR(45) NULL,
                                 PRIMARY KEY (`id`),
                                 INDEX `domains_fk_idx` (`taxonomy` ASC) VISIBLE,
                                 CONSTRAINT `domains_fk`
                                     FOREIGN KEY (`taxonomy`)
                                         REFERENCES `obe`.`taxonomy` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS`obe`.`domain_level` (
                                      `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                      `domain` INT UNSIGNED NOT NULL,
                                      `level` INT NULL,
                                      `description` VARCHAR(45) NULL,
                                      PRIMARY KEY (`id`),
                                      INDEX `domain_level_fk_idx` (`domain` ASC) VISIBLE,
                                      CONSTRAINT `domain_level_fk`
                                          FOREIGN KEY (`domain`)
                                              REFERENCES `obe`.`domains` (`id`)
                                              ON DELETE NO ACTION
                                              ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS`obe`.`level_verb` (
                                    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                    `domain_level` INT UNSIGNED NOT NULL,
                                    `verb` VARCHAR(45) NULL,
                                    `description` VARCHAR(45) NULL,
                                    PRIMARY KEY (`id`),
                                    INDEX `level_verb_fk1_idx` (`domain_level` ASC) VISIBLE,
                                    CONSTRAINT `level_verb_fk1`
                                        FOREIGN KEY (`domain_level`)
                                            REFERENCES `obe`.`domain_level` (`id`)
                                            ON DELETE NO ACTION
                                            ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS`obe`.`clo_plo` (
                                 `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `clo` INT UNSIGNED NOT NULL,
                                 `plo` INT UNSIGNED NOT NULL,
                                 `domain_level` INT UNSIGNED NOT NULL,
                                 `description` VARCHAR(100) NULL,
                                 PRIMARY KEY (`id`),
                                 INDEX `clo_plo_fk1_idx` (`clo` ASC) VISIBLE,
                                 INDEX `clo_plo_fk2_idx` (`plo` ASC) VISIBLE,
                                 INDEX `clo_plo_fk3_idx` (`domain_level` ASC) VISIBLE,
                                 CONSTRAINT `clo_plo_fk1`
                                     FOREIGN KEY (`clo`)
                                         REFERENCES `obe`.`clo` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION,
                                 CONSTRAINT `clo_plo_fk2`
                                     FOREIGN KEY (`plo`)
                                         REFERENCES `obe`.`plo` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION,
                                 CONSTRAINT `clo_plo_fk3`
                                     FOREIGN KEY (`domain_level`)
                                         REFERENCES `obe`.`domain_level` (`id`)
                                         ON DELETE NO ACTION
                                         ON UPDATE NO ACTION);
