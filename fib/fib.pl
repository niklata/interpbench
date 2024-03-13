#!/usr/bin/env perl
sub fib {
    my $n = shift;
    return $n if $n < 2;
    return fib($n - 1) + fib($n - 2);
}
printf("%d\n", fib(18));
