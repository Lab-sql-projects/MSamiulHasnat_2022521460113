-- Inserting data into the department table
INSERT INTO department (dept_name, building, budget) VALUES
('Computer Science', 'Watson', 1000000.00),
('Biology', 'Darwin', 850000.50),
('Physics', 'Einstein', 920000.00),
('History', 'Herodotus', 500000.75),
('Music', 'Mozart', 450000.00),
('Mathematics', 'Euler', 750000.00);

-- Inserting data into the classroom table
INSERT INTO classroom (building, room_number, capacity) VALUES
('Watson', '101', 50),
('Watson', '102', 40),
('Watson', '205', 60),
('Darwin', '101', 30),
('Darwin', '210', 35),
('Einstein', '301', 70),
('Einstein', '302', 70),
('Herodotus', '110', 25),
('Herodotus', '120', 30),
('Mozart', 'Auditorium', 150),
('Mozart', '105', 20),
('Euler', '201', 45),
('Euler', '202', 45);

-- Inserting data into the instructor table
INSERT INTO instructor (ID, name, dept_name, salary) VALUES
(10101, 'Srinivasan', 'Computer Science', 65000.00),
(12121, 'Wu', 'Physics', 90000.00),
(15151, 'Mozart', 'Music', 40000.00),
(22222, 'Einstein', 'Physics', 95000.00),
(32343, 'El Said', 'History', 60000.00),
(33456, 'Gold', 'Computer Science', 87000.00),
(45565, 'Katz', 'Computer Science', 75000.00),
(58583, 'Califieri', 'History', 62000.00),
(76543, 'Singh', 'Mathematics', 80000.00),
(76766, 'Crick', 'Biology', 72000.00),
(83821, 'Brandt', 'Computer Science', 92000.00),
(98345, 'Kim', 'Biology', 80000.00),
(11223, 'Newton', 'Physics', 85000.00),
(44556, 'Bach', 'Music', 78000.00);

-- Inserting data into the student table
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES
(00128, 'Zhang', 'Computer Science', 102),
(12345, 'Shankar', 'Computer Science', 32),
(19991, 'Brandt', 'History', 80),
(23121, 'Chavez', 'Mathematics', 110),
(44553, 'Peltier', 'Physics', 56),
(45678, 'Levy', 'Physics', 46),
(54321, 'Williams', 'Computer Science', 54),
(55739, 'Sanchez', 'Music', 38),
(70557, 'Snow', 'Physics', 0),
(76543, 'Brown', 'Computer Science', 58),
(76653, 'Aoi', 'Biology', 60),
(98765, 'Bourikas', 'Computer Science', 98),
(98988, 'Tanaka', 'Biology', 120),
(11122, 'Smith', 'History', 15),
(22334, 'Johnson', 'Mathematics', 45),
(33445, 'Davis', 'Biology', 70),
(44556, 'Miller', 'Music', 90),
(55667, 'Garcia', 'Physics', 22),
(66778, 'Rodriguez', 'History', 5),
(77889, 'Martinez', 'Computer Science', 75),
(88990, 'Hernandez', 'Biology', 28),
(99001, 'Lopez', 'Mathematics', 88),
(10011, 'Gonzalez', 'Music', 62);

-- Inserting data into the course table
INSERT INTO course (course_id, title, dept_name, credits) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer Science', 'Computer Science', 4),
('CS-190', 'Game Design', 'Computer Science', 4),
('CS-315', 'Robotics', 'Computer Science', 3),
('CS-319', 'Image Processing', 'Computer Science', 3),
('CS-347', 'Database System Concepts', 'Computer Science', 3),
('EE-181', 'Intro. to Digital Systems', 'Physics', 3), -- Assuming EE is related to Physics dept for simplicity
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'General Physics', 'Physics', 4),
('MAT-231', 'Calculus I', 'Mathematics', 4),
('MAT-232', 'Calculus II', 'Mathematics', 4);

-- Inserting data into the prereq table
INSERT INTO prereq (course_id, prereq_id) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('MAT-232', 'MAT-231');

-- Inserting data into the section table
INSERT INTO section (course_id, sec_id, semester, year, building, room_number) VALUES
('BIO-101', '1', 'Fall', 2023, 'Darwin', '101'),
('BIO-101', '1', 'Spring', 2024, 'Darwin', '101'),
('BIO-301', '1', 'Spring', 2024, 'Darwin', '210'),
('CS-101', '1', 'Fall', 2023, 'Watson', '101'),
('CS-101', '2', 'Fall', 2023, 'Watson', '102'),
('CS-101', '1', 'Spring', 2024, 'Watson', '101'),
('CS-190', '1', 'Spring', 2023, 'Watson', '205'),
('CS-190', '2', 'Spring', 2023, 'Watson', '205'),
('CS-315', '1', 'Fall', 2024, 'Watson', '102'),
('CS-347', '1', 'Fall', 2023, 'Watson', '101'),
('CS-347', '1', 'Fall', 2024, 'Watson', '101'),
('EE-181', '1', 'Spring', 2023, 'Einstein', '301'),
('HIS-351', '1', 'Fall', 2024, 'Herodotus', '110'),
('MU-199', '1', 'Spring', 2024, 'Mozart', 'Auditorium'),
('PHY-101', '1', 'Fall', 2023, 'Einstein', '301'),
('PHY-101', '1', 'Spring', 2024, 'Einstein', '302'),
('MAT-231', '1', 'Fall', 2023, 'Euler', '201'),
('MAT-231', '1', 'Fall', 2024, 'Euler', '201'),
('MAT-232', '1', 'Spring', 2024, 'Euler', '202');


-- Inserting data into the teaches table
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES
(10101, 'CS-101', '1', 'Fall', 2023),
(10101, 'CS-315', '1', 'Fall', 2024),
(10101, 'CS-347', '1', 'Fall', 2023),
(12121, 'PHY-101', '1', 'Fall', 2023),
(15151, 'MU-199', '1', 'Spring', 2024),
(22222, 'PHY-101', '1', 'Spring', 2024),
(32343, 'HIS-351', '1', 'Fall', 2024),
(33456, 'CS-101', '1', 'Spring', 2024),
(45565, 'CS-101', '2', 'Fall', 2023),
(45565, 'CS-190', '1', 'Spring', 2023),
(45565, 'CS-190', '2', 'Spring', 2023),
(76543, 'MAT-231', '1', 'Fall', 2023),
(76543, 'MAT-232', '1', 'Spring', 2024),
(76766, 'BIO-101', '1', 'Spring', 2024),
(83821, 'CS-347', '1', 'Fall', 2024),
(98345, 'BIO-101', '1', 'Fall', 2023),
(98345, 'BIO-301', '1', 'Spring', 2024),
(11223, 'EE-181', '1', 'Spring', 2023);

-- Inserting data into the enrollment table
INSERT INTO enrollment (student_ID, course_id, sec_id, semester, year, grade) VALUES
(00128, 'CS-101', '1', 'Fall', 2023, 'A'),
(00128, 'CS-347', '1', 'Fall', 2023, 'A-'),
(12345, 'CS-101', '1', 'Fall', 2023, 'C'),
(12345, 'CS-190', '1', 'Spring', 2023, 'B+'),
(12345, 'CS-315', '1', 'Fall', 2024, NULL), -- Enrolled, no grade yet
(19991, 'HIS-351', '1', 'Fall', 2024, NULL),
(23121, 'MAT-231', '1', 'Fall', 2023, 'A'),
(23121, 'MAT-232', '1', 'Spring', 2024, 'B'),
(44553, 'PHY-101', '1', 'Fall', 2023, 'B-'),
(45678, 'CS-101', '1', 'Fall', 2023, 'F'),
(45678, 'CS-101', '1', 'Spring', 2024, 'B+'),
(45678, 'CS-347', '1', 'Fall', 2024, NULL),
(54321, 'CS-101', '1', 'Fall', 2023, 'A-'),
(54321, 'CS-190', '2', 'Spring', 2023, 'B'),
(55739, 'MU-199', '1', 'Spring', 2024, 'A'),
(76543, 'CS-101', '1', 'Fall', 2023, 'A'),
(76543, 'CS-315', '1', 'Fall', 2024, NULL),
(76653, 'BIO-101', '1', 'Fall', 2023, 'B'),
(76653, 'BIO-301', '1', 'Spring', 2024, 'A'),
(98765, 'CS-101', '1', 'Fall', 2023, 'C+'),
(98765, 'CS-315', '1', 'Fall', 2024, NULL),
(98988, 'BIO-101', '1', 'Fall', 2023, 'A'),
(98988, 'BIO-301', '1', 'Spring', 2024, 'A'),
(11122, 'HIS-351', '1', 'Fall', 2024, NULL),
(33445, 'BIO-101', '1', 'Spring', 2024, 'B+'),
(44556, 'MU-199', '1', 'Spring', 2024, 'A-'),
(55667, 'PHY-101', '1', 'Spring', 2024, 'C'),
(66778, 'HIS-351', '1', 'Fall', 2024, NULL),
(77889, 'CS-101', '2', 'Fall', 2023, 'B'),
(88990, 'BIO-101', '1', 'Fall', 2023, 'C-'),
(99001, 'MAT-231', '1', 'Fall', 2023, 'B'),
(10011, 'MU-199', '1', 'Spring', 2024, 'B+');

-- Inserting data into the advisor table
INSERT INTO advisor (s_id, i_id) VALUES
(00128, 45565), -- Zhang advised by Katz
(12345, 10101), -- Shankar advised by Srinivasan
(19991, 32343), -- Brandt advised by El Said
(23121, 76543), -- Chavez advised by Singh
(44553, 22222), -- Peltier advised by Einstein
(45678, 12121), -- Levy advised by Wu
(54321, 83821), -- Williams advised by Brandt (CS)
(55739, 15151), -- Sanchez advised by Mozart
(76543, 33456), -- Brown advised by Gold
(76653, 98345), -- Aoi advised by Kim
(98765, 10101), -- Bourikas advised by Srinivasan
(98988, 76766), -- Tanaka advised by Crick
(11122, 58583), -- Smith advised by Califieri
(22334, 76543), -- Johnson advised by Singh
(33445, 98345), -- Davis advised by Kim
(44556, 44556), -- Miller advised by Bach
(55667, 11223), -- Garcia advised by Newton
(77889, 45565), -- Martinez advised by Katz
(88990, 76766), -- Hernandez advised by Crick
(99001, 76543), -- Lopez advised by Singh
(10011, 15151); -- Gonzalez advised by Mozart

-- Inserting data into the time_slot table
-- Note: Your schema doesn't directly link time_slot to section via FK,
-- which is common. Adding data here as requested, but it won't be
-- automatically enforced/used by the section/teaches/enrollment tables as defined.
INSERT INTO time_slot (time_slot_id, day, start_time, end_time) VALUES
(1, 'M W F', '08:00:00', '08:50:00'),
(2, 'M W F', '09:00:00', '09:50:00'),
(3, 'M W F', '10:00:00', '10:50:00'),
(4, 'M W F', '11:00:00', '11:50:00'),
(5, 'M W F', '13:00:00', '13:50:00'),
(6, 'M W F', '14:00:00', '14:50:00'),
(7, 'T Th', '08:30:00', '09:45:00'),
(8, 'T Th', '10:00:00', '11:15:00'),
(9, 'T Th', '13:00:00', '14:15:00'),
(10, 'T Th', '14:30:00', '15:45:00');