import numpy as np

def Test():
    A = np.zeros(10**8)
    for i in range(len(A)):
        A[i] = 2*i + 1
    s = 0
    for a in A:
        s += a
    return s

print(Test())

# Output : 37.91
