-- Create Department Table
CREATE TABLE department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget DECIMAL(10, 2)
);

-- Create Instructor Table
CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    dept_name VARCHAR(50),
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- Create Student Table
CREATE TABLE student (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    dept_name VARCHAR(50),
    tot_cred INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- Create Course Table
CREATE TABLE course (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- Create Classroom Table
CREATE TABLE classroom (
    building VARCHAR(50),
    room_number VARCHAR(10),
    capacity INT,
    PRIMARY KEY (building, room_number)
);

-- Create Section Table
CREATE TABLE section (
    course_id VARCHAR(10),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    building VARCHAR(50),
    room_number VARCHAR(10),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES classroom(building, room_number)
);

-- Create Enrollment Table
CREATE TABLE enrollment (
    student_ID INT,
    course_id VARCHAR(10),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    grade CHAR(2),
    PRIMARY KEY (student_ID, course_id, sec_id, semester, year),
    FOREIGN KEY (student_ID) REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

-- Create Advisor Table
CREATE TABLE advisor (
    s_id INT,
    i_id INT,
    PRIMARY KEY (s_id),
    FOREIGN KEY (s_id) REFERENCES student(ID),
    FOREIGN KEY (i_id) REFERENCES instructor(ID)
);

-- Create Time_Slot Table
CREATE TABLE time_slot (
    time_slot_id INT PRIMARY KEY,
    day VARCHAR(10),
    start_time TIME,
    end_time TIME
);

-- Create Teaches Table
CREATE TABLE teaches (
    ID INT,
    course_id VARCHAR(10),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

-- Create Prereq Table
CREATE TABLE prereq (
    course_id VARCHAR(10),
    prereq_id VARCHAR(10),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES course(course_id)
);
