#!/usr/bin/env perl
sub sieve_sundaram {
    my $n = shift;
    my %a;
    my @s = ( 2 );
    my $m = $n / 2;
    foreach my $i (1..($n-1)) {
        foreach my $j ($i..($n-1)) {
            my $p = $i + $j + 2 * $i * $j;
            $a{$p} = 1 if ($p <= $n)
        }
    }
    foreach my $k (1..$m) {
        push(@s, (2 * $k + 1)) if (!$a{$k})
    }
    return @s;
}

foreach my $i (sieve_sundaram(1000)) {
    printf("%d ", $i);
}
print("\n");
