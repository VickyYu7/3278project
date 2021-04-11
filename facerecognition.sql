-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2020 at 09:41 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facerecognition`
--

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--
DROP TABLE IF EXISTS Student;

# Create TABLE 'Student'
CREATE TABLE Student (
  student_id int NOT NULL,
  name varchar(100) NOT NULL,
  login_time time NOT NULL,
  login_date date NOT NULL,
  logout_time time NOT NULL,
  logout_date date NOT NULL,
  duration time NOT NULL,
  stu_email_address varchar(100) NOT NULL,
  PRIMARY KEY (student_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES Student WRITE;
/*!40000 ALTER TABLE Student DISABLE KEYS */;
INSERT INTO Student VALUES (1, "JACK", NOW(), '2021-04-10', '00:00:00', '2021-04-10', '00:00:00','JACK@gmail.com');
INSERT INTO Student VALUES (2, "Amy", NOW(), '2021-04-10', '00:00:00', '2021-04-10', '00:00:00','AMY@gmail.com');
INSERT INTO Student VALUES (3, "Bob", NOW(), '2021-04-10', '00:00:00', '2021-04-10', '00:00:00','BOB@gmail.com');
INSERT INTO Student VALUES (4, "Charlie", NOW(), '2021-04-10', '00:00:00', '2021-04-10', '00:00:00','CHARLIE@gmail.com');
INSERT INTO Student VALUES (5, "YAN",NOW(),'2021-04-10', '00:00:00', '2021-04-10', '00:00:00','YAN@gmail.com')
/*!40000 ALTER TABLE Student ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS Course;

# Create TABLE 'Course'
CREATE TABLE Course (
course_code varchar(100) NOT NULL,
course_name varchar(100) NOT NULL,
class_date date NOT NULL,
class_time time NOT NULL,
Moodle_page_link varchar(1000) NOT NULL,
Zoom_link varchar(1000) NOT NULL,
classroom_address varchar(100) NOT NULL,
PRIMARY KEY (course_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES Course WRITE;
/*!40000 ALTER TABLE Course DISABLE KEYS */;
INSERT INTO Course VALUES ('COMP3278A', 'Intro to DBMS', '2021-04-10','09:30:00', '1234567', 'https://hku.zoom.us/j/97573036142?pwd=YW9xZG41YVI5dWowMDZqdVB5', 'HKW101' );
INSERT INTO Course VALUES ('COMP3250B', 'Intro to Algorithms', '2021-04-10', '14:30:00', '1234567', 'https://hku.zoom.us/j/97573036142?pwd=YW9xZG41YVI5dWowMDZqdVB5', 'HKW101' );
INSERT INTO Course VALUES ('COMP3410', 'Internship', '2021-04-10', '16:30:00', '1234567', 'https://hku.zoom.us/j/97573036142?pwd=YW9xZG41YVI5dWowMDZqdVB5', 'HKW101' );
/*!40000 ALTER TABLE Course ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS Teacher_Message;

# CREATE TABLE 'Teacher_Message'
CREATE TABLE Teacher_Message(
course_code varchar(100) NOT NULL,
message varchar(1000) NOT NULL,
PRIMARY KEY (course_code, message),
FOREIGN KEY (course_code) REFERENCES Course(course_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES Teacher_Message WRITE;
/*!40000 ALTER TABLE Teacher_Message DISABLE KEYS */;
INSERT INTO Teacher_Message VALUES ('COMP3278A', 'Welcome to DBMS!' );
INSERT INTO Teacher_Message VALUES ('COMP3278A', 'Good luck with your project!' );
INSERT INTO Teacher_Message VALUES ('COMP3250B', 'Welcome to Algorithms!' );

/*!40000 ALTER TABLE Teacher_Message ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS Teacher;

# Create TABLE 'Teacher'
CREATE TABLE Teacher (
work_id INT NOT NULL,
role varchar(100) NOT NULL,
name varchar(100) NOT NULL,
email_address varchar(100) NOT NULL,
office_address varchar(100) NOT NULL,
phone_number varchar(100) NOT NULL,
PRIMARY KEY(work_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES Teacher WRITE;
/*!40000 ALTER TABLE Teacher DISABLE KEYS */;
INSERT INTO Teacher VALUES (3034, 'Teacher', 'Ping Luo', 'pingluo@hku.hk', 'HKW701', '52203130');
INSERT INTO Teacher VALUES (3035, 'Teacher', 'T.W. Lam', 'twlam@cs.hku.hk', 'HKW702', '28592172');
INSERT INTO Teacher VALUES (3036, 'Teacher', 'Anthony', 'atctam@cs.hku.hk', 'HKW703', '28597073');
INSERT INTO Teacher VALUES (3037, 'Tutor', 'Jiannan Wu', 'wjn922@connect.hku.hk', 'HKW704', '12345678');
/*!40000 ALTER TABLE Teacher ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS has;

# Create TABLE 'has'
CREATE TABLE has(
student_id INT NOT NULL,
course_code varchar(100) NOT NULL,
FOREIGN KEY(student_id) REFERENCES Student(student_id),
FOREIGN KEY(course_code) REFERENCES Course(course_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES has WRITE;
/*!40000 ALTER TABLE has DISABLE KEYS */;
INSERT INTO has VALUES (1, 'COMP3278A');
INSERT INTO has VALUES (2, 'COMP3278A');
INSERT INTO has VALUES (1, 'COMP3250B');
INSERT INTO has VALUES (3, 'COMP3250B');
INSERT INTO has VALUES (4, 'COMP3410');
INSERT INTO has VALUES (5, 'COMP3250B');
INSERT INTO has VALUES (5, 'COMP3278A');
/*!40000 ALTER TABLE has ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS teaches;

# Create TABLE 'teaches'
CREATE TABLE teaches(
work_id INT NOT NULL,
course_code varchar(100) NOT NULL,
FOREIGN KEY(work_id) REFERENCES Teacher(work_id),
FOREIGN KEY(course_code) REFERENCES Course(course_code)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES teaches WRITE;
/*!40000 ALTER TABLE teaches DISABLE KEYS */;
INSERT INTO teaches VALUES (3034, 'COMP3278A');
INSERT INTO teaches VALUES (3037, 'COMP3278A');
INSERT INTO teaches VALUES (3035, 'COMP3250B');
INSERT INTO teaches VALUES (3036, 'COMP3410');
/*!40000 ALTER TABLE teaches ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
