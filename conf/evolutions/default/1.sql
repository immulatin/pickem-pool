
# --- !Ups

CREATE TABLE User (
    id bigint(20) NOT NULL AUTO_INCREMENT,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    fullname varchar(255) NOT NULL,
    isAdmin boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE GAMEDATA (
  GAMEID int(10) unsigned NOT NULL AUTO_INCREMENT,
  WEEK int(10) unsigned NOT NULL,
  SEASON int(11) unsigned NOT NULL,
  AWAY int(11) unsigned NOT NULL,
  HOME int(11) unsigned NOT NULL,
  WINNER int(11) NOT NULL,
  KICKOFF bigint(20) unsigned NOT NULL,
  TIMELEFT int(11) NOT NULL,
  TIE int(2) unsigned NOT NULL COMMENT 'True or false if game was tie at end of 4 qtrs',
  PRIMARY KEY (GAMEID)
);

CREATE TABLE INFO (
  ID int(11) NOT NULL AUTO_INCREMENT,
  CURRENTWEEK int(11) NOT NULL,
  CURRENTSEASON int(11) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE options (
  id int(11) NOT NULL AUTO_INCREMENT,
  ques_id int(11) NOT NULL,
  value varchar(300) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE PAYMENTS (
  CREATEDON timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID to identify the payment',
  uid varchar(33) NOT NULL COMMENT 'UID of the person who paid',
  TYPE int(10) unsigned NOT NULL COMMENT 'Type of trans (cash, check)',
  AMOUNT decimal(10,2) unsigned NOT NULL COMMENT 'Amount of payment',
  SEASON int(4) NOT NULL,
  COLLECTEDBY varchar(33) NOT NULL COMMENT 'Who collected the money',
  NOTES varchar(100) DEFAULT NULL COMMENT 'Notes about the payment',
  PRIMARY KEY (id)
);

CREATE TABLE PAYOUTS (
  CREATEDON timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID to identify the payment',
  uid varchar(33) NOT NULL COMMENT 'UID of the person who paid',
  TYPE int(10) unsigned NOT NULL COMMENT 'Type of trans (cash, check)',
  AMOUNT decimal(10,2) unsigned NOT NULL COMMENT 'Amount of payment',
  SEASON int(4) NOT NULL,
  PAIDBY varchar(33) NOT NULL COMMENT 'Who collected the money',
  NOTES varchar(100) DEFAULT NULL COMMENT 'Notes about the payment',
  PRIMARY KEY (id)
);

CREATE TABLE questions (
  id int(11) NOT NULL AUTO_INCREMENT,
  ques text NOT NULL,
  created_on datetime NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE TEAMINFO (
  TEAMID int(11) NOT NULL AUTO_INCREMENT,
  ABRV varchar(3) NOT NULL,
  TEAMNAME varchar(50) NOT NULL,
  SHORTNAME varchar(20) NOT NULL,
  JOKENAME varchar(50) NOT NULL,
  WINS int(11) NOT NULL DEFAULT '0',
  LOSSES int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (TEAMID)
);

CREATE TABLE TEAMRANKINGS (
  GAMEID int(11) NOT NULL,
  TEAMID int(11) NOT NULL,
  RUSHOFFENSERANK int(11) NOT NULL DEFAULT '0',
  RUSHDEFENSERANK int(11) NOT NULL DEFAULT '0',
  PASSOFFENSERANK int(11) NOT NULL DEFAULT '0',
  PASSDEFENSERANK int(11) NOT NULL DEFAULT '0'
);

CREATE TABLE TEAMSCORES (
  SCOREID int(10) unsigned NOT NULL AUTO_INCREMENT,
  GAMEID int(10) unsigned NOT NULL,
  TEAMID int(10) unsigned NOT NULL,
  SCORE int(10) unsigned NOT NULL DEFAULT '0',
  haspossession tinyint(1) NOT NULL DEFAULT '0',
  inredzone tinyint(1) NOT NULL DEFAULT '0',
  spread decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (SCOREID)
);

CREATE TABLE USERPICKS (
  PICKID int(10) unsigned NOT NULL AUTO_INCREMENT,
  UID varchar(33) NOT NULL,
  GAMEID int(10) unsigned NOT NULL,
  WINNER int(10) unsigned NOT NULL,
  CREATEDON timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (PICKID)
);

CREATE TABLE USERS (
  id varchar(75) NOT NULL,
  name varchar(50) DEFAULT NULL,
  source varchar(25) DEFAULT NULL,
  photo varchar(125) DEFAULT 'http://picks.deep-think.net/photo.jpg',
  EMAIL varchar(100) NOT NULL DEFAULT 'admin@deep-think.net',
  FINALIZE tinyint(2) NOT NULL DEFAULT '0',
  admin tinyint(4) DEFAULT '0',
  ALTID varchar(33) DEFAULT NULL COMMENT 'If a user has more than one account to login with, resolve this account to another',
  CREATEDON timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  LASTLOGIN timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id)
);

CREATE TABLE USERSTATS (
  UID varchar(33) NOT NULL,
  `1ST` int(10) unsigned NOT NULL DEFAULT '0',
  `2ND` int(10) unsigned NOT NULL DEFAULT '0',
  `3RD` int(10) unsigned NOT NULL DEFAULT '0',
  CORRECTPICKS int(10) unsigned NOT NULL DEFAULT '0',
  OVERALLPICKS int(10) unsigned NOT NULL DEFAULT '0',
  WEEKSPLAYED int(10) unsigned NOT NULL DEFAULT '0',
  TOTALPLACE decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  SEASON int(10) unsigned NOT NULL
);

CREATE TABLE votes (
  id int(11) NOT NULL AUTO_INCREMENT,
  ques_id int(11) NOT NULL,
  option_id int(11) NOT NULL,
  voted_on datetime NOT NULL,
  uid varchar(33) NOT NULL,
  PRIMARY KEY (id)
) ;

CREATE TABLE WINNERS (
  WINNERID int(11) NOT NULL AUTO_INCREMENT,
  uid varchar(33) NOT NULL,
  PLACE int(5) NOT NULL,
  PAYOUT decimal(65,2) NOT NULL,
  WEEK int(11) NOT NULL,
  SEASON int(10) unsigned NOT NULL,
  PRIMARY KEY (WINNERID)
);

# --- !Downs

DROP TABLE USERS;
DROP TABLE WINNERS;
DROP TABLE GAMEDATA;
DROP TABLE USERPICKS;
DROP TABLE USERSTATS;
DROP TABLE votes;
DROP TABLE questions;
DROP TABLE options;
DROP TABLE PAYMENTS;
DROP TABLE PAYOUTS;
DROP TABLE TEAMINFO;
DROP TABLE TEAMRANKINGS;
DROP TABLE TEAMSCORES;