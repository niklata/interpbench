#!/usr/bin/env python3

def sieve_sundaram(n):
    m,s = n // 2, [2]
    a = [x for i in range(1, n) for j in range(i, n) if (x:=i+j+2*i*j) <= n]
    a = {p:True for p in a}
    s.extend([2 * k + 1 for k in range(1, m+1) if k not in a])
    return s

[print(f"{v} ", end='') for v in sieve_sundaram(1000)]
print('')
