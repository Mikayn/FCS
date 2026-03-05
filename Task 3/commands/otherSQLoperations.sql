-- Inerting a new student in the Students table. 

INSERT INTO Students VALUES
(8, 'Aryan', 'aryan@email.com');


-- Inserting a new club in the Clubs table

-- First inser the new Mentor of the club into the Mentors table

INSERT INTO Mentors VALUES 
(5, 'Mr. Rikesh');

-- Then insert the Club in the Clubs table
INSERT INTO Clubs_3NF VALUES
('Cybersecurity Club', 'Lab2', 5);


-- Displaying all Students

SELECT * FROM Students;


-- Displaying all Clubs

SELECT * FROM Clubs_3NF;