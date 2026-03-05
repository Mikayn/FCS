import itertools

students = ["A", "B", "C", "D"]

# These students cannot sit next to each other
friend_pairs = [("A", "B")]
same_city_pairs = [("A", "C")]

def is_valid(arrangement):

    # For n students, n-1 pairs are checked
    for i in range(len(arrangement) - 1):
        pair = (arrangement[i], arrangement[i+1])

        # Check if the pair is allowed or not
        if pair in friend_pairs or pair[::-1] in friend_pairs:
            return False
        if pair in same_city_pairs or pair[::-1] in same_city_pairs:
            return False
    
    # If allowed returns true
    return True

count = 0
for perm in itertools.permutations(students):
    count += 1
    if is_valid(perm):
        print("Valid arrangement:", perm)

print("Total arrangements checked:", count)

