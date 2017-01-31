CREATE TABLE users 
(id VARCHAR2(100) PRIMARY KEY NOT NULL,
pwd VARCHAR2(100) NOT NULL,
name VARCHAR2(50),
email VARCHAR2(200),
gender VARCHAR2(10),
phone VARCHAR2(50),
isAdmin VARCHAR2(10),
regdate DATE);

CREATE TABLE users_msg
(num NUMBER PRIMARY KEY NOT NULL,
to_id VARCHAR2(100),
from_id VARCHAR2(100),
msg CLOB);

CREATE SEQUENCE users_msg_seq NOCACHE;

CREATE SEQUENCE t_board_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE TABLE t_board
(num NUMBER PRIMARY KEY,
b_group NUMBER(2),
writer varchar2(20) NOT NULL,
title varchar2(100) NOT NULL,
content CLOB,
image CLOB,
REGDATE DATE);
