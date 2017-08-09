-- Set up the database and user
CREATE DATABASE IF NOT EXISTS `slimmvc`;
USE `slimmvc`;
GRANT ALL ON `slimmvc`.* to `smvc`@`localhost` identified by "smvc42";

-- Make the tables
CREATE TABLE IF NOT EXISTS `posts` (
    `title` VARCHAR(255),
    `content` TEXT,
    `author_id` INT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `id` INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS `users` (
    `username` VARCHAR(255),
    `password` VARCHAR(200),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `id` INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID)
);

-- And now some sample data to play with
INSERT INTO `users` VALUES ('adent', '$2y$10$uJC4OtAefiZ7NJeRURBet.oBu7NSo9hOaDg1isbvc5yKteggWZy2.', NOW(), NOW(), NULL);
INSERT INTO `users` VALUES ('trillian', '$2y$10$uJC4OtAefiZ7NJeRURBet.oBu7NSo9hOaDg1isbvc5yKteggWZy2.', NOW(), NOW(), NULL);

INSERT INTO `posts` VALUES (
    'Test Post #1',
    'This is just some test content we can use to show the listing on the main page.',
    (select id from `users` where `username` = 'adent'),
    NOW(), NOW(), NULL
);

INSERT INTO `posts` VALUES (
    'Test Post #2',
    "More test data to work with and get the ball rolling. I love test data, don't you?",
    (select id from `users` where `username` = 'trillian'),
    NOW(), NOW(), NULL
);

INSERT INTO `posts` VALUES (
    'Test Post #3',
    "A final post because the number three is a nice number and this is even more test data to work with",
    (select id from `users` where `username` = 'trillian'),
    NOW(), NOW(), NULL
);
