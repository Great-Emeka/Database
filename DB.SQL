CREATE TABLE department(
	dept_name CHAR(3) NOT NULL,
    building varchar(15),
    budget numeric(7,4),
    PRIMARY KEY(dept_name)

)
FOREIGN KEY (`dept_name`) REFERENCES `department`(`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE TABLE advisor(
	s_id INT(11) NOT NULL,
    i_id INT(11),
    PRIMARY KEY(s_id),
FOREIGN KEY (`s_id`) REFERENCES `student`(`ID`) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE instructor(
	ID INT(11) AUTO_INCREMENT NOT NULL,
    name VARCHAR(70),
    dept_name CHAR(3),
    salary NUMERIC(7,3),
    PRIMARY KEY(ID),
FOREIGN KEY (`dept_name`) REFERENCES `department`(`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE time_slot(
	time_slot_id INT(11) AUTO_INCREMENT,
day VARCHAR(15),
    start_time NUMERIC(3,2),
    end_time NUMERIC(3,2),
    PRIMARY KEY(time_slot_id)
)
CREATE TABLE course(
	course_id INT(11) AUTO_INCREMENT,
title VARCHAR(150),
    dept_name CHAR(3),
    credits NUMERIC(3,0),
    PRIMARY KEY(course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name) ON UPDATE CASCADE ON DELETE CASCADE );
CREATE TABLE prereq(
	course_id INT(11) NOT NULL,
    prereq_id INT(11) NOT NULL,

    PRIMARY KEY(course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id) ON UPDATE CASCADE ON DELETE CASCADE, 
FOREIGN KEY (prereq_id) REFERENCES course(course_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE section(
	course_id INT(11) AUTO_INCREMENT,
    sec_id INT(4) NOT NULL,
    semester INT(4),
    `year` INT (4),
    building CHAR(3),
    room_no INT(4),
    time_slot_id CHAR(4),
    PRIMARY KEY(course_id,sec_id,semester, year),
    FOREIGN KEY(building) REFERENCES classroom(building) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (room_no) REFERENCES classroom(room_no) ON UPDATE CASCADE ON DELETE CASCADE
); 