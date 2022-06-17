
-- create database kahoot;
-- use kahoot;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rfToken` varchar(255) NULL,
  `isTeacher` boolean NOT NULL default false,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `quizId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `quiz` varchar(255) NOT NULL,
  `isOpened` boolean NOT NULL,
  `userId` smallint(5) unsigned NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`quizId`),
  CONSTRAINT `fkQuizUser` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `quizId` smallint(5) unsigned NOT NULL,
  `a` varchar(255) NOT NULL,
  `b`  varchar(255) NOT NULL,
  `c` varchar(255) NOT NULL,
  `d` varchar(255) NOT NULL,
   `answer` varchar(5) not null,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`questionId`),
  CONSTRAINT `fkQuestionQuiz` FOREIGN KEY (`quizId`) REFERENCES `quiz` (`quizId`) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

