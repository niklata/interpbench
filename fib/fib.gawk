#!/usr/bin/env -S gawk -f

function fib(n)
{
    if (n < 2) return n
    return fib(n - 1) + fib(n - 2)
}

BEGIN {
    printf("%d\n", fib(18))
}
