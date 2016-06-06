
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- books
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `isbn` VARCHAR(24) NOT NULL,
    `author_id` INTEGER NOT NULL,
    `highlighted` TINYINT(1) DEFAULT 0,
    PRIMARY KEY (`id`),
    INDEX `books_fi_125144` (`author_id`),
    CONSTRAINT `books_fk_125144`
        FOREIGN KEY (`author_id`)
        REFERENCES `authors` (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- authors
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(128) NOT NULL,
    `last_name` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- publishers
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `publishers`;

CREATE TABLE `publishers`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- book_publishers
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `book_publishers`;

CREATE TABLE `book_publishers`
(
    `book_id` INTEGER NOT NULL,
    `publisher_id` INTEGER NOT NULL,
    PRIMARY KEY (`book_id`,`publisher_id`),
    INDEX `book_publishers_fi_e69726` (`publisher_id`),
    CONSTRAINT `book_publishers_fk_19cfd3`
        FOREIGN KEY (`book_id`)
        REFERENCES `books` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT `book_publishers_fk_e69726`
        FOREIGN KEY (`publisher_id`)
        REFERENCES `publishers` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
