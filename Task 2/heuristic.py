students = ["A", "B", "C", "D"]

conflicts = {
    "A": {"B", "C"},    # B (friend), C (same city)
    "B": {"A"},
    "C": {"A"},
    "D": {}             # No conflicts
}

def is_valid(arrangement):
    for i in range(len(arrangement) - 1):
        current_student = arrangement[i]
        next_student = arrangement[i + 1]
        
        if next_student in conflicts[current_student]:
            return False
    return True


def heuristic_seating(students, conflicts):
    # Sort students by number of conflicts (descending)
    students_sorted = sorted(
        students,
        key=lambda s: len(conflicts[s]),
        reverse=True
    )
    
    arrangement = []
    
    for student in students_sorted:
        is_placed = False
        
        # Try inserting student at every possible position
        for pos in range(len(arrangement) + 1):
            current_student = arrangement[:pos] + [student] + arrangement[pos:]
            
            if is_valid(current_student):
                arrangement = current_student
                is_placed = True
                break
        
        if not is_placed:
            arrangement.append(student)  # Place it for now
    
    return arrangement


result = heuristic_seating(students, conflicts)

if result:
    print("Heuristic seating arrangement:", result)
else:
    print("No valid arrangement found.")

