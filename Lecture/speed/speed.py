import numpy as np
import time

def Test():
    start = time.time()
    A = np.zeros(10**8)
    for i in range(len(A)):
        A[i] = i**2
    end = time.time()
    return end-start

print(Test())

# Output : 37.91