#!/usr/bin/env -S gawk -f

function sieve_sundaram(s, n,   a,m,i,j,k)
{
    s[0] = 2
    m = n / 2
    for (i = 1; i < n; ++i) {
        for (j = i; j < n; ++j) {
            p = i + j + 2 * i * j
            if (p <= n) {
                a[p] = 1
            }
        }
    }
    for (k = 1; k <= m; ++k) {
        t = k in a
        if (!t) {
            s[length(s)] = 2 * k + 1
        }
    }
}

BEGIN {
    s[0] = 0
    sieve_sundaram(s, 1000)
    for (i = 0; i < length(s); ++i) {
        printf("%d ", s[i])
    }
    printf("\n")
}
