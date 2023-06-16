INSERT INTO student
VALUES
(1,'Ava Johnson', '2002-06-03'),
(2,'Ethan Lee', '2003-08-12'),
(3,'Olivia Chen', '2005-10-21'),
(4,'Liam Kim', '2004-07-07'),
(5,'Emily Brown', '2001-01-15'),
(6,'Noah Patel', '2002-12-29'),
(7,'Chloe Davis', '2006-04-10'),
(8,'William Hernandez', '2007-09-05'),
(9,'Sophia Singh', '2004-05-26'),
(10,'Michael Jones', '2005-11-11');

INSERT INTO department
VALUES
    ('Mathematics', 'Rosenberg Hall', 100000),
    ('History', 'Gates Hall', 75000),
    ('Physics', 'Einstein Building', 125000),
    ('English', 'Whitman Hall', 90000),
    ('Computer Science', 'Turing Hall', 150000),
    ('Biology', 'Darwin Hall', 80000),
    ('Psychology', 'Freud Hall', 110000),
    ('Sociology', 'Durkheim Building', 70000),
    ('Economics', 'Friedman Hall', 130000),
    ('Chemistry', 'Curie Building', 95000);

INSERT INTO instructor (I_ID, Name, Dept_Name)
VALUES
  (1, 'John Doe', 'Mathematics'),
  (2, 'Jane Smith', 'Biology'),
  (3, 'Bob Johnson', 'Computer Science'),
  (4, 'Tom Williams', 'Psychology'),
  (5, 'Emily Davis', 'English'),
  (6, 'Michael Lee', 'Physics'),
  (7, 'Sarah Kim', 'Chemistry'),
  (8, 'David Chen', 'Economics'),
  (9, 'Jessica Brown', 'History'),
  (10, 'Brian Wilson', 'Sociology'),
  (11, 'Karen Taylor', 'Mathematics'),
  (12, 'Jason Anderson', 'Biology'),
  (13, 'Rachel Kim', 'Computer Science'),
  (14, 'Samuel Lee', 'Psychology'),
  (15, 'Laura Davis', 'English'),
  (16, 'Daniel Park', 'Physics'),
  (17, 'Kevin Brown', 'Economics'),
  (18, 'Eric Wilson', 'History'),
  (19, 'Catherine Taylor', 'Sociology'),
  (20, 'Amanda Johnson', 'Mathematics'),
  (21, 'James Anderson', 'Biology'),
  (22, 'Alex Kim', 'Computer Science'),
  (23, 'Mary Lee', 'Psychology'),
  (24, 'Olivia Davis', 'English'),
  (25, 'Andrew Park', 'Physics'),
  (26, 'Stephanie Brown', 'Economics'),
  (27, 'Jacob Wilson', 'History'),
  (28, 'Natalie Taylor', 'Sociology');

-- SET SQL_SAFE_UPDATES = 0;
-- DELETE FROM instructor;
-- delete from section;
-- delete from takes;
INSERT INTO course
VALUES
    (1, 'Calculus I', 4, 'Mathematics'),
    (2, 'World History', 3, 'History'),
    (3, 'Mechanics', 4, 'Physics'),
    (4, 'Introduction to Literature', 3, 'English'),
    (5, 'Data Structures', 4, 'Computer Science'),
    (6, 'Introduction to Biology', 3, 'Biology'),
    (7, 'Introduction to Psychology', 3, 'Psychology'),
    (8, 'Introduction to Sociology', 3, 'Sociology'),
    (9, 'Microeconomics', 3, 'Economics'),
    (10, 'General Chemistry', 4, 'Chemistry');

INSERT INTO Student_Phone (S_ID, Phone_no)
VALUES
    (1, '123-456-7890'),
    (1, '555-555-5555'),
    (2, '987-654-3210'),
    (3, '111-222-3333'),
    (4, '444-555-6666'),
    (4, '777-888-9999'),
    (5, '123-123-1234'),
    (6, '555-1212'),
    (6, '555-1313'),
    (7, '555-1414'),
    (8, '555-1515'),
    (9, '555-1616'),
    (10, '555-1717'),
    (10, '555-1818');

INSERT INTO Section (C_ID, Section_ID, Building, Time, Room, I_ID)
VALUES
    (1, 1, 'Rosenberg Hall', '09:00:00', 101, 1),
    (1, 2, 'Rosenberg Hall', '10:30:00', 102, 11),
    (1, 3, 'Rosenberg Hall', '13:00:00', 103, 20),
    (2, 1, 'Gates Hall', '09:00:00', 201, 9),
    (2, 2, 'Gates Hall', '10:30:00', 202, 18),
    (2, 3, 'Gates Hall', '13:00:00', 203, 27),
    (3, 1, 'Einstein Building', '09:00:00', 301, 16),
    (3, 2, 'Einstein Building', '10:30:00', 302, 6),
    (3, 3, 'Einstein Building', '13:00:00', 303, 25),
    (4, 1, 'Whitman Hall', '09:00:00', 401, 24),
    (4, 2, 'Whitman Hall', '10:30:00', 402, 15),
    (4, 3, 'Whitman Hall', '13:00:00', 403, 5),
    (5, 1, 'Turing Hall', '09:00:00', 501, 3),
    (5, 2, 'Turing Hall', '10:30:00', 502, 13),
    (5, 3, 'Turing Hall', '13:00:00', 503, 22),
    (6, 1, 'Darwin Hall', '09:00:00', 601, 12),
    (6, 2, 'Darwin Hall', '10:30:00', 602, 2),
    (6, 3, 'Darwin Hall', '13:00:00', 603, 21),
    (7, 1, 'Freud Hall', '09:00:00', 701, 14),
    (7, 2, 'Freud Hall', '10:30:00', 702, 23),
    (7, 3, 'Freud Hall', '13:00:00', 703, 4),
    (8, 1, 'Durkheim Building', '09:00:00', 801, 19),
    (8, 2, 'Durkheim Building', '10:30:00', 802, 10),
    (8, 3, 'Durkheim Building', '13:00:00', 803, 28),
    (9, 1, 'Friedman Hall', '09:00:00', 901, 17),
    (9, 2, 'Friedman Hall', '10:30:00', 902, 26),
    (9, 3, 'Friedman Hall', '13:00:00', 903, 8),
    (10, 1, 'Curie Building', '09:00:00', 1001, 7);

INSERT INTO takes (S_ID, C_ID, Section_ID)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3),
    (2, 1, 3),
    (2, 2, 1),
    (2, 3, 2),
    (3, 1, 2),
    (3, 2, 3),
    (3, 3, 1),
    (4, 4, 1),
    (4, 5, 2),
    (4, 6, 3),
    (5, 4, 3),
    (5, 5, 1),
    (5, 6, 2),
    (6, 4, 2),
    (6, 5, 3),
    (6, 6, 1),
    (7, 7, 1),
    (7, 8, 2),
    (7, 9, 3),
    (8, 7, 3),
    (8, 8, 1),
    (8, 9, 2),
    (9, 7, 2),
    (9, 8, 3),
    (9, 9, 1),
    (10, 10, 1);

INSERT INTO user (Uname, S_ID, Pwd, Role)
VALUES
  ('alice', 1, SHA2('password', 256), 'user'),
  ('bob', 2, SHA2('secret', 256), 'user'),
  ('charlie', 3, SHA2('123456', 256), 'user'),
  ('david', 4, SHA2('qwerty', 256), 'user'),
  ('admin1', NULL, SHA2('admin123', 256), 'admin'),
  ('admin2', NULL, SHA2('admin456', 256), 'admin'),
  ('fancyuser', 5, SHA2('mypassword', 256), 'user'),
  ('uniqueuser', 6, SHA2('letmein', 256), 'user'),
  ('cooluser', 7, SHA2('password1', 256), 'user'),
  ('awesomeuser', 8, SHA2('hello123', 256), 'user'),
  ('eliteuser', 9, SHA2('p@ssword', 256), 'user'),
  ('superuser', 10, SHA2('password123', 256), 'user');

