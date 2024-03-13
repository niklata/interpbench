#!/usr/bin/env tclsh
proc sieve_sundaram {n} {
    set a [dict create]
    set s { 2 }
    set m [expr {$n / 2}]
    for {set i 1} {$i < $n} {incr i} {
        for {set j $i} {$j < $n} {incr j} {
            set p [expr {$i + $j + 2 * $i * $j}]
            if {$p <= $n} {
                dict set a $p 1
            }
        }
    }
    for {set k 1} {$k <= $m} {incr k} {
        if {![dict exists $a $k]} {
            set q [expr {2 * $k + 1}]
            lappend s $q
        }
    }

    return $s
}

puts [sieve_sundaram 1000]
