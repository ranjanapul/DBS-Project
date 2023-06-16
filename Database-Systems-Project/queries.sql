-- Query 1) Insert records for administrators
INSERT INTO User (Uname, S_ID, Pwd, Role) 
    VALUES ('admin1', NULL, SHA2('password123', 256), 'admin'); 
INSERT INTO User (Uname, S_ID, Pwd, Role)
    VALUES ('admin2', NULL, SHA2('adminpassword', 256), 'admin');

-- Query 2) Admin creating profiles for students and instructors
-- Create profile for a student
INSERT INTO Student (S_ID, Name, DOB) 
    VALUES (1001, 'John Doe', '2000-05-01');
 -- Create profile for an instructor 
INSERT INTO Instructor (I_ID, Name, Dept_Name) 
    VALUES (2001, 'Jane Smith', 'Computer Science');

-- Query 3) Admin updating details of students and instructors
-- Update phone number of a student 
UPDATE Student_Phone 
SET Phone_no = '987-654-3211' 
WHERE S_ID = 2; 
-- Update ID of an instructor 
UPDATE Instructor 
SET Name = 'Jane Doe' 
WHERE I_ID = 2;

-- -- Query 4) Admin can record attandance of employees
-- -- Record attendance for an instructor
-- INSERT INTO Attendance_Record (S_ID, C_ID, Section_ID, Date, Status, Permission_taken)
--     VALUES (NULL, course_id, section_id, '2023-04-10', 'absent', NULL);

-- Query 5) Signin authentication to verify if provided credentials by students are correct
SELECT COUNT(*) FROM User 
WHERE Uname = 'alice' AND Pwd = SHA2('password', 256); -- returns 1 if valid else return 0

-- Query 6) Password reset to update the stored password against username
-- Verify security question answer before updating password 
SELECT COUNT(*) FROM Student_Phone JOIN User USING(S_ID) WHERE Phone_no = '123-456-7890' AND Uname = 'alice'; -- here phone number is entered by user.
-- The query above returns 0 if security q has failed
-- Update password for a user 
UPDATE User SET Pwd = SHA2('newpassword', 256) WHERE Uname = 'alice';

-- Query 7) User should be able to manage the profile
-- Update phone number of a student 
UPDATE Student_Phone SET Phone_no = '111-222-3344' WHERE S_ID = 3; 
-- Update name of a student 
UPDATE Student SET Name = 'Jane Doe' WHERE S_ID = 1001;

-- Query 8) Query to search for students based on simple filters like attendance, student name
-- Search for students with attendance status of 'present' 
SELECT * FROM Student WHERE S_ID IN ( SELECT S_ID FROM Attendance_Record WHERE Status = 'present' );
-- Search for students with name containing 'John' 
SELECT * FROM Student WHERE Name LIKE '%Emily%';

-- Query 9) Query to search for students based on filters such as 
-- average percentage of classes attended, requests for leave permission, absent without permission
-- Search for students with attendance rate less than 80% 
SELECT * FROM Student WHERE S_ID IN ( SELECT S_ID FROM Attendance_Record GROUP BY S_ID HAVING AVG(CASE WHEN Status = 'present' THEN 1 ELSE 0 END) < 0.8 ); 
-- Search for students who have requested for leave permission 
SELECT * FROM Student WHERE S_ID IN ( SELECT S_ID FROM Attendance_Record WHERE Permission_taken = TRUE );
-- Search for students who have been absent without permission 
SELECT * FROM Student WHERE S_ID IN ( SELECT S_ID FROM Attendance_Record WHERE Permission_taken = FALSE AND Status = 'absent' );

-- Query 10) Teachers can mark the attendance for students every day
-- Format:
--      INSERT INTO Attendance_Record (S_ID, C_ID, Section_ID, Date, Status, Permission_taken) 
--      VALUES (student_id, course_id, section_id, current_date, 'present', false);
INSERT INTO Attendance_Record (S_ID, C_ID, Section_ID, Date, Status, Permission_taken) VALUES (1, 1, 1, current_date, 'present', NULL);
INSERT INTO Attendance_Record (S_ID, C_ID, Section_ID, Date, Status, Permission_taken) VALUES (2, 3, 2, current_date, 'present', NULL);
INSERT INTO Attendance_Record (S_ID, C_ID, Section_ID, Date, Status, Permission_taken) VALUES (3, 2, 3, current_date, 'absent', TRUE);
-- Replace student_id, course_id, and section_id with the corresponding IDs of the 
-- student, course, and section for which attendance is being marked.

-- Query 11) Teachers can view attendance report for the entire class
-- Format: 
-- SELECT s.Name, a.Date, a.Status 
-- FROM Student s JOIN Takes t ON s.S_ID = t.S_ID JOIN Attendance_Record a ON t.C_ID = a.C_ID AND t.Section_ID = a.Section_ID 
-- WHERE t.C_ID = course_id AND t.Section_ID = section_id;
-- Replace course_id and section_id with the corresponding IDs
SELECT s.Name, a.Date, a.Status 
FROM Student s JOIN Takes t ON s.S_ID = t.S_ID JOIN Attendance_Record a ON t.C_ID = a.C_ID AND t.Section_ID = a.Section_ID 
WHERE t.C_ID = 1 AND t.Section_ID = 1;

SELECT s.Name, a.Date, a.Status 
FROM Student s JOIN Takes t ON s.S_ID = t.S_ID JOIN Attendance_Record a ON t.C_ID = a.C_ID AND t.Section_ID = a.Section_ID 
WHERE t.C_ID = 3 AND t.Section_ID = 1;


-- Query 12) Attendance patterns for the class can be viewed by the teacher
-- Format:
-- SELECT a.Date, COUNT(CASE WHEN a.Status = 'present' THEN 1 END) AS Present, 
-- COUNT(CASE WHEN a.Status = 'absent' THEN 1 END) AS Absent 
-- FROM Takes t JOIN Attendance_Record a ON t.C_ID = a.C_ID AND t.Section_ID = a.Section_ID 
-- WHERE t.C_ID = course_id AND t.Section_ID = section_id GROUP BY a.Date;
-- Replace course_id and section_id with the corresponding IDs
SELECT a.Date, COUNT(CASE WHEN a.Status = 'present' THEN 1 END) AS Present, 
COUNT(CASE WHEN a.Status = 'absent' THEN 1 END) AS Absent 
FROM Takes t JOIN Attendance_Record a ON t.C_ID = a.C_ID AND t.Section_ID = a.Section_ID 
WHERE t.C_ID = 1 AND t.Section_ID = 1 GROUP BY a.Date;


-- Query 13) Students should be able to view their weekly attendance report
-- Format:
-- SELECT a.Date, a.Status FROM Attendance_Record a JOIN Takes t ON a.C_ID = t.C_ID AND a.Section_ID = t.Section_ID 
-- WHERE t.S_ID = student_id AND a.Date BETWEEN current_date - INTERVAL 7 DAY AND current_date;
-- Replace student_id with its corresponding id
SELECT a.Date, a.Status FROM Attendance_Record a JOIN Takes t ON a.C_ID = t.C_ID AND a.Section_ID = t.Section_ID 
WHERE t.S_ID = 1 AND a.Date BETWEEN current_date - INTERVAL 7 DAY AND current_date;

-- Query 14) Admin can generate analysis reports on key metrics such as attendance rates, attendance patterns for students

SELECT Student.S_ID, Student.Name, COUNT(Attendance_Record.Status) AS Total_Classes,
SUM(CASE WHEN Attendance_Record.Status = 'present' THEN 1 ELSE 0 END) AS Present,
SUM(CASE WHEN Attendance_Record.Status = 'absent' THEN 1 ELSE 0 END) AS Absent,
(SUM(CASE WHEN Attendance_Record.Status = 'present' THEN 1 ELSE 0 END) / COUNT(Attendance_Record.Status)) * 100 AS Attendance_Rate
FROM Student
LEFT JOIN Attendance_Record ON Student.S_ID = Attendance_Record.S_ID
GROUP BY Student.S_ID, Student.Name;
