create database if not exists ucsy_lms_db;
use ucsy_lms_db;

create table if not exists Departments(
	department_id int primary key,
    department_name varchar(255) not null
);

create table if not exists Students(
	ykpt int primary key,
    first_name varchar(255) not null,
    middle_name varchar(255),
    last_name varchar(255) not null,
    dob date not null,
    semester int not null,
    edu_mail varchar(255) not null unique,
    telephone varchar(15) not null,
    password varchar(255) not null, 
    created_at timestamp default current_timestamp
);

create table if not exists Parents(
	parent_id int primary key,
    ykpt int not null,
    father_name varchar(255) not null,
    mother_name varchar(255) not null,
    email varchar(255) not null,
    telephone varchar(15) not null
);

create table if not exists Instructors(
	instructor_id int primary key,
    first_name varchar(255) not null,
    middle_name varchar(255),
    last_name varchar(255) not null,
    department_id int not null,
    edu_mail varchar(255) not null unique,
    telephone varchar(255) not null unique,
    password varchar(255) not null,
    created_at timestamp not null default current_timestamp,
    foreign key (department_id) references Departments(department_id)
);

create table if not exists Courses(
	course_id int primary key,
    instructor_id int not null,
    department_id int not null,
	course_name varchar(255) not null,
    course_description text,
    start_date date not null,
    end_date date,
	foreign key (instructor_id) references Instructors(instructor_id),
    foreign key (department_id) references Departments(department_id)
);

create table if not exists Classes(
	class_id int primary key,
    course_id int not null,
    department_id int not null,
    class_name varchar(255) not null,
    class_description text,
    class_date date not null,
    start_time timestamp not null,
    end_time timestamp,
    foreign key (course_id) references Courses(course_id),
    foreign key (department_id) references Departments(department_id)
);

create table if not exists Enrollments(
	enrollment_id int primary key,
    ykpt int not null,
    course_id int not null,
    enrolled_at timestamp not null default current_timestamp,
    completion_status boolean default 0,
    foreign key (ykpt) references Students(ykpt),
    foreign key (course_id) references Courses(course_id)
);

create table if not exists Assessments(
	assessment_id int primary key,
    course_id int not null,
    assessment_type varchar(255) not null,
    assessment_name varchar(255) not null,
    assessment_description text,
    due_date datetime not null,
    assessment_score int not null,
    completion_status boolean default 0,
    foreign key (course_id) references Courses(course_id)
);

create table if not exists Announcements(
	announcement_id int primary key,
    course_id int not null,
    instructor_id int not null,
    announcement_description text not null,
    announced_at timestamp not null,
    foreign key (course_id) references Courses(course_id),
    foreign key (instructor_id) references Instructors(instructor_id)
);

create table if not exists Attendance(
	attendance_id int primary key,
    ykpt int not null,
    class_id int not null,
    time_arrived timestamp not null,
    time_left timestamp not null,
    foreign key (ykpt) references Students(ykpt),
    foreign key (class_id) references Classes(class_id)
);

create table if not exists Resources(
	resource_id int primary key,
    course_id int not null,
    lecture_slide_url varchar(255),
    lecture_video_url varchar(255),
    textbook_url varchar(255),
    foreign key (course_id) references Courses(course_id)
);

create table if not exists Grades(
	grade_id int primary key,
    ykpt int not null,
    assessment_id int not null,
    earned_score int not null,
    feedback text,
    graded_at timestamp not null,
    foreign key (ykpt) references Students(ykpt),
    foreign key (assessment_id) references Assessments(assessment_id)
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Faculty of Computer Systems and Technologies'),
(2, 'Faculty of Computer Science'),
(3, 'Faculty of Information Science'),
(4, 'Faculty of Computing'),
(5, 'Department of Language'),
(6, 'Department of Natural Science'),
(7, 'Department of Information Technology Supporting and Maintenance'),
(8, 'Department of EuuEeeAhh'),
(9, 'Department of AhhEeeEuu'),
(10, 'Department of Quality Assurance');

INSERT INTO Students (ykpt, first_name, middle_name, last_name, dob, semester, edu_mail, telephone, password, created_at) VALUES
(23001, 'Aung', 'Kkant', 'Kyaw', '2004-05-12', 4, 'aungkhantkyaw@ucsy.edu.mm', '09400111222', 'pass123', NOW()),
(23002, 'Phyo', 'Khant', 'Kyaw', '2005-02-20', 2, 'phyokhantkyaw@ucsy.edu.mm', '09400111223', 'pass123', NOW()),
(23003, 'Min', 'Khant', 'Aung', '2004-11-30', 4, 'minkhantaung@ucsy.edu.mm', '09400111224', 'pass123', NOW()),
(23004, 'Chan', 'Myae', 'Htike', '2005-01-15', 2, 'chanmyaehtike@ucsy.edu.mm', '09400111225', 'pass123', NOW()),
(23005, 'Ye', 'Kyaw', 'Swar', '2003-08-10', 6, 'yekyawswar@ucsy.edu.mm', '09400111226', 'pass123', NOW()),
(23006, 'Htet', 'Thu', 'Aung', '2004-03-25', 4, 'htetthuaung@ucsy.edu.mm', '09400111227', 'pass123', NOW()),
(23007, 'Aung', 'Oo', 'Khant', '2005-07-04', 2, 'aungookhant@ucsy.edu.mm', '09400111228', 'pass123', NOW()),
(23008, 'Nyan', 'Linn', 'Htet', '2004-12-12', 4, 'nyanlinnhtet@ucsy.edu.mm', '09400111229', 'pass123', NOW()),
(23009, 'Aung', 'Myint', 'Myat', '2003-09-18', 6, 'Aung Myint Myat@ucsy.edu.mm', '09400111230', 'pass123', NOW()),
(23010, 'Saw', 'Wutt Yee', 'Htun', '2005-05-05', 2, 'sawwuttyeehtun@ucsy.edu.mm', '09400111231', 'pass123', NOW());

INSERT INTO Parents (parent_id, ykpt, father_name, mother_name, email, telephone) VALUES
(1, 23001, 'U Ba', 'Daw Mya', 'uba@gmail.com', '091111111'),
(2, 23002, 'U Aye', 'Daw Nu', 'uaye@gmail.com', '091111112'),
(3, 23003, 'U Ko', 'Daw Su', 'uko@gmail.com', '091111113'),
(4, 23004, 'U Maung', 'Daw Hla', 'umaung@gmail.com', '091111114'),
(5, 23005, 'U Htun', 'Daw Kyi', 'uhtun@gmail.com', '091111115'),
(6, 23006, 'U Myint', 'Daw Cho', 'umyint@gmail.com', '091111116'),
(7, 23007, 'U Sein', 'Daw Pu', 'usein@gmail.com', '091111117'),
(8, 23008, 'U Tin', 'Daw Win', 'utin@gmail.com', '091111118'),
(9, 23009, 'U Kyaw', 'Daw Khin', 'ukyaw@gmail.com', '091111119'),
(10, 23010, 'U Bo', 'Daw Ni', 'ubo@gmail.com', '091111120');

INSERT INTO Instructors (instructor_id, first_name, middle_name, last_name, department_id, edu_mail, telephone, password, created_at) VALUES
(101, 'Dr.', 'Nilar', 'Aye', 1, 'nilaraye.dr@ucsy.edu.mm', '095001001', 'inst_pass', NOW()),
(102, 'Daw', 'Ei', 'Theint Theint Thu', 2, 'eitheinttheintthu@ucsy.edu.mm', '095001002', 'inst_pass', NOW()),
(103, 'Daw', 'Aye', 'Nyein San', 3, 'ayenyeinsan@ucsy.edu.mm', '095001003', 'inst_pass', NOW()),
(104, 'Daw', 'Shwe', 'Tha Zin', 4, 'shwethazin@ucsy.edu.mm', '095001004', 'inst_pass', NOW()),
(105, 'U', 'Aung', 'Si Thu', 5, 'aungsithu@ucsy.edu.mm', '095001005', 'inst_pass', NOW()),
(106, 'Dr.', 'Yee', 'Mon Thant', 6, 'yeemonthant.dr@ucsy.edu.mm', '095001006', 'inst_pass', NOW()),
(107, 'Dr.', 'Yadanar', 'Oo', 7, 'yadanaroo.dr@ucsy.edu.mm', '095001007', 'inst_pass', NOW()),
(108, 'Daw', 'Aye Cho', 'Cho', 8, 'ayeayecho@ucsy.edu.mm', '095001008', 'inst_pass', NOW()),
(109, 'Daw', 'May', 'Thu Aung', 9, 'maythuaung@ucsy.edu.mm', '095001009', 'inst_pass', NOW()),
(110, 'Dr.', 'Kyaw', 'Kyaw Khing', 1, 'kyawkyawkhing.dr@ucsy.edu.mm', '095001010', 'inst_pass', NOW());

INSERT INTO Courses (course_id, instructor_id, department_id, course_name, course_description, start_date, end_date) VALUES
(501, 101, 1, 'Embedded Systems', 'Introduction to hardware and software.', '2026-01-01', '2026-05-01'),
(502, 102, 2, 'Data Structures', 'Fundamentals of algorithms and data.', '2026-01-01', '2026-05-01'),
(503, 103, 3, 'Network Security', 'Protecting information systems.', '2026-01-01', '2026-05-01'),
(504, 104, 4, 'Cloud Computing', 'Scalable infrastructure services.', '2026-01-01', '2026-05-01'),
(505, 105, 5, 'Professional English', 'Communication skills for IT.', '2026-01-01', '2026-05-01'),
(506, 106, 6, 'Quantum Physics', 'Basic concepts of quantum mechanics.', '2026-01-01', '2026-05-01'),
(507, 107, 7, 'IT Maintenance', 'Hardware troubleshooting and repair.', '2026-01-01', '2026-05-01'),
(508, 108, 8, 'Thermodynamics', 'Applied physics for engineering.', '2026-01-01', '2026-05-01'),
(509, 109, 9, 'Discrete Mathematics', 'Logic and set theory.', '2026-01-01', '2026-05-01'),
(510, 110, 1, 'Computer Architecture', 'Advanced CPU design.', '2026-01-01', '2026-05-01');

INSERT INTO Classes (class_id, course_id, department_id, class_name, class_description, class_date, start_time, end_time) VALUES
(10, 501, 1, 'Lec-01-Hardware', 'Intro to microcontrollers', '2026-02-15', '2026-02-15 09:00:00', '2026-02-15 11:00:00'),
(11, 502, 2, 'Lec-01-Arrays', 'Array operations', '2026-02-15', '2026-02-15 13:00:00', '2026-02-15 15:00:00'),
(12, 503, 3, 'Lec-01-Crypto', 'Basics of encryption', '2026-02-16', '2026-02-16 09:00:00', '2026-02-16 11:00:00'),
(13, 504, 4, 'Lec-01-AWS', 'AWS EC2 instances', '2026-02-16', '2026-02-16 13:00:00', '2026-02-16 15:00:00'),
(14, 505, 5, 'Lec-01-Grammar', 'Advanced technical writing', '2026-02-17', '2026-02-17 09:00:00', '2026-02-17 11:00:00'),
(15, 506, 6, 'Lec-01-Light', 'Wave-particle duality', '2026-02-17', '2026-02-17 13:00:00', '2026-02-17 15:00:00'),
(16, 507, 7, 'Lec-01-BIOS', 'BIOS configuration', '2026-02-18', '2026-02-18 09:00:00', '2026-02-18 11:00:00'),
(17, 508, 8, 'Lec-01-Heat', 'Laws of thermodynamics', '2026-02-18', '2026-02-18 13:00:00', '2026-02-18 15:00:00'),
(18, 509, 9, 'Lec-01-Sets', 'Introduction to Sets', '2026-02-19', '2026-02-19 09:00:00', '2026-02-19 11:00:00'),
(19, 510, 1, 'Lec-01-Pipeline', 'CPU Pipelining', '2026-02-19', '2026-02-19 13:00:00', '2026-02-19 15:00:00');

INSERT INTO Enrollments (enrollment_id, ykpt, course_id, enrolled_at, completion_status) VALUES
(1001, 23001, 501, NOW(), 0),
(1002, 23002, 502, NOW(), 0),
(1003, 23003, 503, NOW(), 0),
(1004, 23004, 504, NOW(), 0),
(1005, 23005, 505, NOW(), 0),
(1006, 23006, 506, NOW(), 0),
(1007, 23007, 507, NOW(), 0),
(1008, 23008, 508, NOW(), 0),
(1009, 23009, 509, NOW(), 0),
(1010, 23010, 510, NOW(), 0);

INSERT INTO Assessments (assessment_id, course_id, assessment_type, assessment_name, assessment_description, due_date, assessment_score, completion_status) VALUES
(201, 501, 'Quiz', 'Quiz 1', 'Basic Hardware Quiz', '2026-03-01 23:59:59', 20, 0),
(202, 502, 'Assignment', 'Lab 1', 'Stack implementation', '2026-03-05 23:59:59', 100, 0),
(203, 503, 'Quiz', 'Security Basics', 'Concepts of CIA triad', '2026-03-01 23:59:59', 20, 0),
(204, 504, 'Project', 'Cloud Setup', 'Setup S3 Bucket', '2026-04-01 23:59:59', 100, 0),
(205, 505, 'Assignment', 'Essay', 'Tech Ethics Essay', '2026-03-10 23:59:59', 50, 0),
(206, 506, 'Quiz', 'Atomic Theory', 'Chapter 1 Quiz', '2026-02-28 23:59:59', 30, 0),
(207, 507, 'Practical', 'PC Assembly', 'Hardware lab test', '2026-03-15 23:59:59', 100, 0),
(208, 508, 'Assignment', 'Problem Set 1', 'Laws of Heat', '2026-03-01 23:59:59', 40, 0),
(209, 509, 'Quiz', 'Logic Quiz', 'Truth tables quiz', '2026-03-01 23:59:59', 20, 0),
(210, 510, 'Midterm', 'Spring Midterm', 'Units 1-4', '2026-04-10 23:59:59', 100, 0);

INSERT INTO Announcements (announcement_id, course_id, instructor_id, announcement_description, announced_at) VALUES
(301, 501, 101, 'Welcome to Embedded Systems! Class starts tomorrow.', NOW()),
(302, 502, 102, 'Please bring your laptops for the lab session.', NOW()),
(303, 503, 103, 'Reading materials for Week 1 are uploaded.', NOW()),
(304, 504, 104, 'Check your AWS student credits.', NOW()),
(305, 505, 105, 'Reminder: Essay submission due next Friday.', NOW()),
(306, 506, 106, 'The quiz is postponed to Monday.', NOW()),
(307, 507, 107, 'Safety goggles required for hardware lab.', NOW()),
(308, 508, 108, 'Additional math tutorial on Saturday.', NOW()),
(309, 509, 109, 'Check the updated syllabus in the resources.', NOW()),
(310, 510, 110, 'Midterm dates have been announced.', NOW());

INSERT INTO Attendance (attendance_id, ykpt, class_id, time_arrived, time_left) VALUES
(401, 23001, 10, '2026-02-15 08:55:00', '2026-02-15 11:05:00'),
(402, 23002, 11, '2026-02-15 12:55:00', '2026-02-15 15:05:00'),
(403, 23003, 12, '2026-02-16 08:55:00', '2026-02-16 11:05:00'),
(404, 23004, 13, '2026-02-16 12:55:00', '2026-02-16 15:05:00'),
(405, 23005, 14, '2026-02-17 08:55:00', '2026-02-17 11:05:00'),
(406, 23006, 15, '2026-02-17 12:55:00', '2026-02-17 15:05:00'),
(407, 23007, 16, '2026-02-18 08:55:00', '2026-02-18 11:05:00'),
(408, 23008, 17, '2026-02-18 12:55:00', '2026-02-18 15:05:00'),
(409, 23009, 18, '2026-02-19 08:55:00', '2026-02-19 11:05:00'),
(410, 23010, 19, '2026-02-19 12:55:00', '2026-02-19 15:05:00');

INSERT INTO Resources (resource_id, course_id, lecture_slide_url, lecture_video_url, textbook_url) VALUES
(601, 501, 'http://lms.ucsy.edu.mm/slide1', 'http://vid.com/v1', 'http://bk.com/b1'),
(602, 502, 'http://lms.ucsy.edu.mm/slide2', 'http://vid.com/v2', 'http://bk.com/b2'),
(603, 503, 'http://lms.ucsy.edu.mm/slide3', 'http://vid.com/v3', 'http://bk.com/b3'),
(604, 504, 'http://lms.ucsy.edu.mm/slide4', 'http://vid.com/v4', 'http://bk.com/b4'),
(605, 505, 'http://lms.ucsy.edu.mm/slide5', 'http://vid.com/v5', 'http://bk.com/b5'),
(606, 506, 'http://lms.ucsy.edu.mm/slide6', 'http://vid.com/v6', 'http://bk.com/b6'),
(607, 507, 'http://lms.ucsy.edu.mm/slide7', 'http://vid.com/v7', 'http://bk.com/b7'),
(608, 508, 'http://lms.ucsy.edu.mm/slide8', 'http://vid.com/v8', 'http://bk.com/b8'),
(609, 509, 'http://lms.ucsy.edu.mm/slide9', 'http://vid.com/v9', 'http://bk.com/b9'),
(610, 510, 'http://lms.ucsy.edu.mm/slide10', 'http://vid.com/v10', 'http://bk.com/b10');

INSERT INTO Grades (grade_id, ykpt, assessment_id, earned_score, feedback, graded_at) VALUES
(1, 23001, 201, 18, 'Great job!', NOW()),
(2, 23002, 202, 95, 'Excellent implementation.', NOW()),
(3, 23003, 203, 15, 'Study CIA triad more.', NOW()),
(4, 23004, 204, 88, 'Good cloud setup.', NOW()),
(5, 23005, 205, 45, 'Strong arguments.', NOW()),
(6, 23006, 206, 28, 'Perfect score.', NOW()),
(7, 23007, 207, 100, 'Perfect assembly.', NOW()),
(8, 23008, 208, 35, 'Watch your units.', NOW()),
(9, 23009, 209, 19, 'Well done.', NOW()),
(10, 23010, 210, 85, 'Good midterm result.', NOW());