create database kahoot;
use kahoot;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NULL,
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
  `name` varchar(50) NOT NULL,
  `isOpened` boolean NOT NULL DEFAULT FALSE,
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
  `content` varchar(255) NOT NULL,
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

insert into `quiz` values (1,'Web 2 Quiz',true,1,'2006-02-15 04:34:33');
insert into `question` values (1,'1 + 1',1,'2','3','4','5','a','2006-02-15 04:34:33');
insert into `question` values (2,'Square root of 9',1,'Pi','9','3.14','3','d','2006-02-15 04:34:33');
insert into `question` values (3,'Sun rises in the',1,'West','East','North','South','b','2006-02-15 04:34:33');
insert into `question` values (4,'Môn nào khó nhất',1,'Web nâng cao','Kỹ thuật lập trình','Nhập môn lập trình','Lập trình hướng đối tượng','a','2006-02-15 04:34:33');
insert into `question` values (5,'Cờ Việt Nam bao nhiêu sao ?',1,'1','2','3','4','a','2006-02-15 04:34:33');
insert into `question` values (6,'Ai là người đẹp trai nhất nhóm ?',1,'Hải','Hòa','Thương','Thầy','c','2006-02-15 04:34:33');
insert into `question` values (7,'Hai cực nam châm cùng dấu thì',1,'Yêu nhau','Đẩy nhau','Ghét nhau','Thương nhau','b','2006-02-15 04:34:33');
insert into `question` values (8,'H2 + O2 =',1,'HOHO','H20','O2H2','H2O2','b','2006-02-15 04:34:33');
insert into `question` values (9,'"Có bao nhiêu mặt trời trong vũ trụ ?',1,'1','Chưa thể tìm ra mặt trời khác','2','3','a','2006-02-15 04:34:33');
insert into `question` values (10,'Nhóm sẽ được bao nhiêu điểm ?',1,'7','Tối đa','9','8','b','2006-02-15 04:34:33');
