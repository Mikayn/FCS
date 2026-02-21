# College Club Membership Management
<p align="left">
  <img src="https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" />
</p>

### Overview of the Problem: 
The project showcases database normalization for a College Club Membership Management database. The prpject aims to remove redundancy, improve data integrity and fix any existing anomalies within the unnormalized database. 

### This Project Inclues: 
* Step-wise normalization of a database (1NF -> 2NF -> 3NF)
* SQL Queries such as CREATE, SELECT, INSERT, JOIN
* Entity Relation Model and Diagram
---
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

![Unnormalized Dataset]([https://github.com/Mikayn/FCS/blob/main/Task3/diagrams/unnormalized_data.png](https://github.com/Mikayn/FCS/blob/main/Task%203/Pictures/Unnormalized%20Database.png)
