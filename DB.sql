DROP DATABASE IF EXISTS `project_25`;
CREATE DATABASE `project_25`;
USE `project_25`;

CREATE TABLE `user` (
   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   regDate DATETIME NOT NULL,
   updateDate DATETIME NOT NULL,
   loginId CHAR(30) NOT NULL,
   loginPw CHAR(100) NOT NULL,
   `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자,5=물리치료사)', 
   `name` CHAR(20) NOT NULL,
   nickname CHAR(20) NOT NULL,
   cellphoneNum CHAR(20) NOT NULL,
   email CHAR(20) NOT NULL,
   delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
   delDate DATETIME COMMENT '탈퇴 날짜',
   google_loginId CHAR(100) UNIQUE,
   kakao_loginId CHAR(100) UNIQUE
);

CREATE TABLE category (
   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `code` CHAR(50) NOT NULL UNIQUE COMMENT '신체부위 등',
   `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
   delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
   delDate DATETIME COMMENT '삭제 날짜'
);

CREATE TABLE article (
   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   regDate DATETIME NOT NULL,
   updateDate DATETIME NOT NULL,
   title CHAR(100) NOT NULL,
   `body` TEXT NOT NULL,
   userId INT(10) UNSIGNED NOT NULL,
   hitCount INT(10) UNSIGNED NOT NULL,
   goodPoint INT(10) UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE cartoon (
   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   regDate DATETIME NOT NULL,
   updateDate DATETIME NOT NULL,
   delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
   delDate DATETIME COMMENT '삭제 날짜',
   img TEXT NOT NULL
);


CREATE TABLE info (
   id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항) free(자유) QnA(질의응답)...',
   delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
   delDate DATETIME COMMENT '삭제 날짜'
)


#회원 추가 데이터
INSERT INTO `user`
SET
regDate = NOW(),
updateDate = NOW(),
loginId = "test1",
loginPw = "test1",
`name` = "test1",
nickname = "test1",
cellphoneNum = "67676767",
email = "test1@gamail.com";
=======================

SELECT *
FROM `user`;

SELECT *
FROM board;

SELECT *
FROM article;

SELECT *
FROM cartoon;

=======

SELECT *
		FROM `user`
		WHERE
		loginId = 'test1'