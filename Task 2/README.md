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

<img width="571" height="199" alt="image" src="https://github.com/user-attachments/assets/ff3a4d9c-7b1a-45b0-a61a-c1c080edcf22" />

For the sake of argument, let's consider the following constraints: 

<img width="350" height="241" alt="image" src="https://github.com/user-attachments/assets/75a86366-f183-487b-8551-6367801b4f89" />

---

## Repository Structure

```
task2/
├── README.md                          # Project documentation and instructions
├── bigOexample.py                     # Big O notation examples and demonstrations
├── bruteforcer.py                     # Brute force algorithm implementation
└── heuristic.py                       # Heuristic approach implementation
```

---

## Task 1: Understanding the Problem (P vs NP)

### P Problems
P (Polynomial Time) problems are problems that can be **solved efficiently**.  
Their time complexity grows at a polynomial rate, typically **O(n<sup>k</sup>)**

Examples:
* Sorting
* Searching
* Simple nested loops

### NP Problems
NP (Nondeterministic Polynomial Time) problems are problems where:
* Checking a solution is easy
* Finding a solution is computationally hard

Solving these problems often require a time complexity of **O(k<sup>n</sup>)** or **O(n!)**
Checking a solution of these problems remains **O(n<sup>k</sup>)**

Examples:
* Boolean Satisfiability
* Graph Coloring
* Constraint Satisfaction Problems

---

### Why Checking a Seating Plan Is Easy

Given a seating order, only **adjacent pairs** need to be checked.

For `n` students:
* Number of checks = `n - 1`
* Time complexity = `O(n)`

This makes **verification fast and simple**.

---

### Why Finding a Seating Plan Is Hard

For `n` students, the number of possible arrangements is **n!**

Examples:
* 4 students → `4! = 24`
* 10 students → `10! = 3,628,800`
* 15 students → `15! ≈ 1.3 trillion`

Each arrangement must be tested until a valid one is found.
This factorial growth makes solution discovery infeasible for large inputs.

---

### Problem Classification

This seating arrangement problem is **closer to NP** because:

* Verifying a solution is polynomial (`O(n)`)
* Finding a solution requires exploring factorial possibilities (`O(n!)`)

---

## Task 2: Brute Force Approach

### Description

Brute force attempts **every possible seating permutation** until a valid one is found.

Using Python:
* `itertools.permutations` generates all seatings
* Each permutation is checked against constraints

### Why It Works for Small Classes

For small `n`, `n!` remains manageable.

Example:
* `4! = 24` → instant
* `5! = 120` → trivial

---

### Why It Fails for Large Classes

Factorial growth explodes rapidly:

| Students | Arrangements |
|----------|--------------|
| 6        | 720          |
| 7        | 5,040        |
| 10       | 3.6 million  |
| 15       | 1.3 trillion |

Even modern CPUs cannot process this in reasonable time.

Brute force becomes **computationally infeasible**.

---

### Time Complexity

**O(n!)**

Adding one student multiplies the total work.
This growth is significantly worse than polynomial time.

---

## Task 3: Heuristic (Smart) Approach

### Concept

A heuristic reduces the search space by applying **rules early**, instead of evaluating full permutations.
The goal is **speed**, not accuracy.

---

### Example Heuristics

* Seat students with the **most conflicts first**
* Separate students from the **same city early**
* Reject placements immediately when a conflict appears

---

### How It Reduces Time

* Invalid placements are rejected **immediately**
* Full permutations are never generated
* Constraints are enforced during construction

Approximate time complexity becomes **O(n<sup>2</sup>)**

Example:
* Brute force (15 students): `15! ≈ 1.3 trillion`
* Heuristic: at most a few hundred checks

---

### Why the Result May Not Be Perfect

Heuristics trade accuracy for speed.

Possible outcomes:
* Dead ends even when a valid solution exists
* Rare constraint violations

In real-world scenarios:
* A near-optimal solution is acceptable
* Speed is prioritized over perfection

---

## Brute Force vs Heuristic

| Aspect          | Brute Force    | Heuristic      |
|-----------------|----------------|----------------|
| Accuracy        | Guaranteed     | Not guaranteed |
| Speed           | Extremely slow | Very fast      |
| Scalability     | Poor           | Good           |
| Time Complexity | O(n!)          | ~O(n²)         |

---

## References

* Arora, S., & Barak, B.  Computational complexity: A modern approach. Cambridge University Press.
* Sen, S. (n.d.). P, NP, and NP-Completeness. Princeton
* ‌Avnish. (2023, September 22). Time Complexity. Avni.sh.
