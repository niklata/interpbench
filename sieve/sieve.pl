#!/usr/bin/env perl
sub sieve_sundaram {
    my ($n,@s) = (shift, (2));
    my %a;
    for my $i (1..($n-1)) {
        for my $j ($i..($n-1)) {
            my $p = $i + $j + 2 * $i * $j;
            $a{$p} = 1 if $p <= $n;
        }
    }
    map { push @s, 2 * $_ + 1 if !$a{$_}; } 1..($n/2);
    return @s;
}

map { print $_, " "; } sieve_sundaram(1000);
print "\n";
