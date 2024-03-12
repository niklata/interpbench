#!/usr/bin/env python3

def sieve_sundaram(n):
    a = {}
    s = [2]
    m = n // 2
    for i in range(1, n):
        for j in range(i, n):
            p = i + j + 2 * i * j
            if p <= n:
                a[p] = True
    s.extend([2 * k + 1 for k in range(1, m+1) if k not in a])
    return s

t = sieve_sundaram(1000)
for v in t:
    print(f"{v} ", end='')
print('')
