
n = int(input("Enter how many times the outer loop should run: "))

# Runs n times in total
for i in range(n): 

    # Runs n times for 1 iteration of outer loop
    for j in range(n):
        print(i, j)