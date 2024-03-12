#!/usr/bin/env perl
use strict;
use warnings;
use v5.32;
sub sieve_sundaram {
    my $n = shift;
    my %a;
    my @s = ( 2 );
    my $m = $n / 2;
    foreach my $i (1..($n-1)) {
        foreach my $j ($i..($n-1)) {
            my $p = $i + $j + 2 * $i * $j;
            if ($p <= $n) {
                $a{$p} = 1
            }
        }
    }
    foreach my $k (1..$m) {
        if (!$a{$k}) {
            push(@s, (2 * $k + 1))
        }
    }
    return @s;
}

my @t = sieve_sundaram(1000);
foreach my $i (@t) {
    printf("%d ", $i);
}
printf("\n");
