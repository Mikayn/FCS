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

The initial table contains some major errors such as:

* Duplicate information
* Redundant data
* Update anomalies
* Insert anomalies
* Deletion anomalies

