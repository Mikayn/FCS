# Classroom Seating Arrangement Problem  
**P vs NP, Brute Force, and Heuristic Analysis**

## Overview

This repository presents a theoretical and practical analysis of a **classroom seating arrangement problem** under constraints.  
The task is used to demonstrate:

* The difference between **P problems** and **NP problems**
* Why **verification** can be easy while **solution discovery** is hard
* The limitations of **brute force**
* The benefits and trade-offs of **heuristic approaches**

### Constraints
1. Friends must not sit next to each other  
2. Students from the same city must not sit next to each other  

The classroom has **one row of seats**, and each student must be seated **exactly once**.

The core question:  
**Is it possible to arrange the students such that all constraints are satisfied?**

---

## Task 1: Understanding the Problem (P vs NP)

### P Problems
P (Polynomial Time) problems are problems that can be **solved efficiently**.  
Their time complexity grows at a polynomial rate, typically **O(n<sup>k</sup>)**
