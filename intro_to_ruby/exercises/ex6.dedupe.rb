arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 3]

arr.uniq!

p arr

# alt: p arr.uniq (doesn't mutate the caller)