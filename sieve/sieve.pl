#!/usr/bin/env perl
sub sieve_sundaram {
    my $n = shift;
    my %a;
    my @s = ( 2 );
    my $m = $n / 2;
    for my $i (1..($n-1)) {
        for my $j ($i..($n-1)) {
            my $p = $i + $j + 2 * $i * $j;
            $a{$p} = 1 if $p <= $n;
        }
    }
    for my $k (1..$m) {
        push @s, 2 * $k + 1 if !$a{$k};
    }
    return @s;
}

for my $i (sieve_sundaram(1000)) {
    print $i, " ";
}
print("\n");
