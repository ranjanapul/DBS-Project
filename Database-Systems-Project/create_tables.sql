CREATE TABLE Student (
  S_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  DOB DATE
);

CREATE TABLE User (
  Uname VARCHAR(50) PRIMARY KEY,
  S_ID INT,
  Pwd VARCHAR(256) NOT NULL,
  Role ENUM('user', 'admin') NOT NULL,
  FOREIGN KEY (S_ID) REFERENCES Student(S_ID) ON DELETE CASCADE
);

CREATE TABLE Department (
  Dept_Name VARCHAR(50) PRIMARY KEY,
  Building VARCHAR(50),
  Budget FLOAT
);

CREATE TABLE Instructor (
  I_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Dept_Name VARCHAR(50),
  FOREIGN KEY (Dept_Name) REFERENCES Department(Dept_Name) ON DELETE RESTRICT
);

CREATE TABLE Course (
  C_ID INT PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Credits INT CHECK (Credits >= 1 AND Credits <= 20),
  Dept_Name VARCHAR(50),
  FOREIGN KEY (Dept_Name) REFERENCES Department(Dept_Name) ON DELETE CASCADE
);

CREATE TABLE Section (
  C_ID INT,
  Section_ID INT,
  Building VARCHAR(50),
  Time TIME,
  Room INT,
  I_ID INT,
  PRIMARY KEY (C_ID, Section_ID),
  FOREIGN KEY (C_ID) REFERENCES Course(C_ID) ON DELETE CASCADE,
  FOREIGN KEY (I_ID) REFERENCES Instructor(I_ID) ON DELETE RESTRICT
);

CREATE TABLE Student_Phone (
  S_ID INT,
  Phone_no VARCHAR(50),
  PRIMARY KEY (S_ID, Phone_no),
  FOREIGN KEY (S_ID) REFERENCES Student(S_ID) ON DELETE CASCADE
);

CREATE TABLE Attendance_Record (
  A_ID INT AUTO_INCREMENT PRIMARY KEY AUTOINCREMENT,
  S_ID INT,
  C_ID INT,
  Section_ID INT,
  Date DATE,
  Status ENUM('present', 'absent'),
  Permission_taken BOOLEAN,
  FOREIGN KEY (S_ID) REFERENCES Student(S_ID) ON DELETE CASCADE,
  FOREIGN KEY (C_ID, Section_ID) REFERENCES Section(C_ID, Section_ID) ON DELETE CASCADE
);

CREATE TABLE Takes (
  S_ID INT,
  C_ID INT,
  Section_ID INT,
  PRIMARY KEY (S_ID, C_ID, Section_ID),
  FOREIGN KEY (S_ID) REFERENCES Student(S_ID) ON DELETE CASCADE,
  FOREIGN KEY (C_ID, Section_ID) REFERENCES Section(C_ID, Section_ID) ON DELETE CASCADE
);
