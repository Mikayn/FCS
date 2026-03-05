SELECT s.StudentName, c.ClubName, e.JoinDate
    FROM Enrollment e
    JOIN Students s ON s.StudentID = e.StudentID
    JOIN Clubs_3NF c ON e.ClubName = c.ClubName;