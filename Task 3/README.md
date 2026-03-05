# College Club Membership Management
<p align="left">
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" />
</p>

## Overview

This project demonstrates:
* **Database Normalization**: Progressive transformation from unnormalized data through 1NF, 2NF, and 3NF
* **Docker Deployment**: Containerized MySQL database for reproducible testing
* **Real-world Application**: Campus Clubs management system simulation
* **ER-Model**: Portray a database schema as an ER-Diagram.

### Learning Objectives
* Apply First, Second, and Third Normal Forms on unnormalized data
* Implement normalized schemas using SQL  
* Simulate realisic and practical database behavior  
* Understand normalization as a security mechanism  

### Prior Information to Know: 
* Primary Key : It is a column which has unique values and is used to identify each record in a table.
* Foreign Key : It is a column or set of columns that references the primary key of another table.
* Composite Key : It is a set of primary keys made up of two or more columns used together to uniquely identify each record in a table.
* Redundant Data: It refers to the unnecessary duplication of data due to improper table structure which occurs intentionally. 
* Duplicate Data: It refers to data repetition of data that occurs unintentionally. 
* Insert Anomaly: It occurs when it is impossible to insert new data in a table without also inserting redundant/ incomplete data. 
* Update Anomaly: It occurs when updating data in one place also requires updating it in multiple other places. If one place is missed, it leads to inconsistency. 
* Deletion Anomaly: It occurs when deleting information about one entity also deletes important information about something else.
---
### Initial Database

![initial databse](https://github.com/Mikayn/FCS/blob/main/Task%203/Pictures/Unnormalized%20Database.png)


### Problems:

* Redundant Data: Students appear multiple times for different clubs.
* Insert Anomaly: Adding a new club without members requires NULLs.
* Update Anomaly: Changing a mentor’s name must be repeated in multiple rows.
* Delete Anomaly: Removing the last student in a club deletes the club information.

---

## Repository Structure 
```
Task 3/
├── README.md                            # Main documentation
├── Images/
│   ├── ER diagram.png                   # Entity Relationship Diagram
│   └── Unnormalized Database.png        # Unnormalized database schema
├── commands/
│   ├── join.sql                         # JOIN operations queries
│   ├── normalization.sql                # Database normalization scripts
│   ├── originaltable.sql                # Original unnormalized table creation
│   └── otherSQLoperations.sql           # Additional SQL operations
└── output/
    ├── Clubs.txt                        # Clubs table data output
    ├── Enrollment.txt                   # Enrollment table data output
    ├── JoinOutput.txt                   # Results of JOIN operations
    ├── Mentors.txt                      # Mentors table data output
    ├── OriginalTable.txt                # Original table data output
    ├── Students.txt                     # Students table data output
    └── otherSQLoperations.txt           # Results of basic SQL operations
```

---

## Quick Start

### 1. Clone the Repository

```bash
https://github.com/Mikayn/FCS.git
cd Task 3/
```

### 2. Start MySQL Docker Container
```bash
docker run --name clubs_db \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=club_information \
  -d -p 3306:3306 \
  mysql:8.0
```

### 3. Execute the Demo SQL Script
```bash
# Create original table
docker exec -i clubs_db mysql -uroot -proot club_information < commands/originaltable.sql

# Normalize the table
docker exec -i clubs_db mysql -uroot -proot club_information < commands/normalization.sql

# Basic SQL operations
docker exec -i clubs_db mysql -uroot -proot club_information < commands/otherSQLoperations.sql

# Run JOIN queries
docker exec -i clubs_db mysql -uroot -proot club_information < commands/join.sql
```

### 4. Verify Results
```bash
# Display all students
docker exec clubs_db mysql -uroot -proot -t club_information -e "SELECT * FROM Students;"

# Display all clubs
docker exec clubs_db mysql -uroot -proot -t club_information -e "SELECT * FROM Clubs_3NF;"

# Display all mentors
docker exec clubs_db mysql -uroot -proot -t club_information -e "SELECT * FROM Mentors;"

# Display all enrollments
docker exec clubs_db mysql -uroot -proot -t club_information -e "SELECT * FROM Enrollments;"
```

---

## Database Normalization
### (Initial Table)

```
studentinfo(StudentID, StudentName, Email, ClubName, ClubRoom, ClubMentor, JoinDate)
```

### First Normal Form (1NF)

* Ensure each field is atomic.
* Primary Key: (StudentID, ClubName) .

Output table:

<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/OriginalTable.txt">Original Table</a>


### Second Normal Form (2NF)

* Remove partial dependencies.
* Separate club details, student details and enrollment details.

Output tables:

<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Students.txt">Students Table</a>   
<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Clubs.txt">Clubs Table</a>   
<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Enrollment.txt">Enrollment Table</a>    

### Third Normal Form (3NF)

* Remove transitive dependencies.
* Ensure all attributes depend only on the primary key.

Tables:

<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Students.txt">Students Table</a>   
<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Clubs_3NF.txt">Clubs_3NF Table</a>    
<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Enrollment.txt">Enrollment Table</a>    
<a href="https://github.com/Mikayn/FCS/blob/main/Task%203/output/Mentors.txt">Mentors Table</a>    

## Entity Relation Diagram

![ER Diagram](https://github.com/Mikayn/FCS/blob/main/Task%203/Pictures/ER%20diagram.png)

### Relationships: 
* One student can join many clubs
* One club can have many students

---

## SQL Operations

### Insert New Records
```sql
INSERT INTO STUDENT(StudentID, StudentName, Email) VALUES (8, 'Riya', 'riya@email.com');
INSERT INTO CLUB(ClubID, ClubName, ClubRoom, ClubMentor) VALUES (104, 'Photography Club', 'Lab2', 'Ms. Tara');
```

### Display Records
```sql
SELECT * FROM STUDENT;
SELECT * FROM CLUB;
```
Output Tables: [Inserting student and club](https://github.com/Mikayn/FCS/blob/main/Task%203/output/otherSQLoperations.txt)

### Join Query
```sql
SELECT s.StudentName, c.ClubName, e.JoinDate
FROM Enrollment e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Clubs_3NF c ON e.ClubName = e.ClubName;
```
Output Table: [Join Query](https://github.com/Mikayn/FCS/blob/main/Task%203/output/JoinOutput.txt)

### The importance of JOIN in a normalized database

In a normalized database, information is scattered into multiple tables to reduce data redundancy and repetition. But, most queries require the data from two or more tables. So, JOIN can be used to join them into a single table. For instance, the data of students, their clubs and the club mentors may be needed. Instead of doing 3 SELECT statements for 3 tables, one JOIN statement can retrieve the information and combine them into a single table. 

---

## References

* Database Management System By PK Yadav Book. (2026). Bookpremiumfree.com.
* DBMS By gdcnagari
