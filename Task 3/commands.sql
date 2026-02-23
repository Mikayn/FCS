-- Go into the database
USE club_information;

-- 1NF TABLE
CREATE TABLE studentinfo (
    StudentID INT,
    StudentName VARCHAR(100),
    Email VARCHAR(100),
    ClubName VARCHAR(100),
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubName)
);

INSERT INTO studentinfo VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');

-- 2NF TABLE

CREATE TABLE Students (          
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Students VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

CREATE TABLE Clubs (            
    ClubName VARCHAR(100) PRIMARY KEY,
    ClubRoom VARCHAR(50),
    ClubMentor VARCHAR(100)
);

INSERT INTO Clubs VALUES
('Music Club', 'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club', 'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

CREATE TABLE Enrollment (
    StudentID INT,
    ClubName VARCHAR(100),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubName),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClubName) REFERENCES Clubs(ClubName)
);

INSERT INTO Enrollment VALUES
(1, 'Music Club', '2024-01-10'),
(2, 'Sports Club', '2024-01-12'),
(1, 'Sports Club', '2024-01-15'),
(3, 'Music Club', '2024-01-20'),
(4, 'Drama Club', '2024-01-18'),
(5, 'Music Club', '2024-01-22'),
(2, 'Drama Club', '2024-01-25'),
(6, 'Sports Club', '2024-01-27'),
(3, 'Coding Club', '2024-01-28'),
(7, 'Coding Club', '2024-01-30');

-- 3NF TABLE

-- Students Table and Enrollment Table does not need to be changed

CREATE TABLE Mentors (
    MentorID INT PRIMARY KEY,
    MentorName VARCHAR(100)
);

INSERT INTO Mentors (MentorName) VALUES
(1, 'Mr. Raman'),
(2, 'Ms. Sita'),
(3, 'Mr. Kiran'),
('4, Mr. Anil');

CREATE TABLE Clubs_3NF (
    ClubName VARCHAR(100) PRIMARY KEY,
    ClubRoom VARCHAR(50),
    MentorID INT,
    FOREIGN KEY (MentorID) REFERENCES Mentors(MentorID)
);

INSERT INTO Clubs_3NF (ClubName, ClubRoom, MentorID) VALUES
('Music Club', 'R101', 1),
('Sports Club', 'R202', 2),
('Drama Club', 'R303', 3),
('Coding Club', 'Lab1', 4);
