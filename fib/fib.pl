#!/usr/bin/env perl
sub fib {
    my $n = shift;
    return $n < 2 ? $n : fib($n - 1) + fib($n - 2);
}
printf("%d\n", fib(18));
