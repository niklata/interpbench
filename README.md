# Interpreter benchmark

## Introduction

This is meant as a simple benchmark of dynamic language performance.  I'm focusing mostly on embeddable or shell-script languages.  If a language has a JIT or AOT compiler that generates machine code, it's not in context for these tests.

Since the focus here is on scripting, either at the shell, or as embedded languages, interpreter startup time is important.

I'm going for approximate numbers.  CPU clock scaling is still enabled.
This level of precision is good enough to distinguish the general performance groupings.

## Missing languages

* sh (dash) - Possible to do via eval trickery to simulate associative arrays.
* ruby - Just haven't gotten to it yet; it doesn't embed that well, but since I wrote perl and shell script tests...
* mruby - It's intended for embedding, so it's in scope.
* elisp - Would be fun, but would bend the rules since it's now JIT compiled.

## Sieve performance

This is a test of numerics, loops, hash table lookup and set, and array append.

Benchmark 1: ./sieve.lua
  Time (mean ± σ):       6.1 ms ±   0.2 ms    [User: 5.6 ms, System: 0.5 ms]
  Range (min … max):     5.7 ms …   7.9 ms    467 runs

Benchmark 2: ./sieve-fnl.lua
  Time (mean ± σ):       6.1 ms ±   0.1 ms    [User: 5.6 ms, System: 0.5 ms]
  Range (min … max):     5.8 ms …   7.2 ms    470 runs

Benchmark 3: ./sieve.janet
  Time (mean ± σ):      12.5 ms ±   0.3 ms    [User: 11.8 ms, System: 0.7 ms]
  Range (min … max):    11.3 ms …  13.1 ms    231 runs

Benchmark 4: ./sieve.js
  Time (mean ± σ):      16.8 ms ±   0.5 ms    [User: 16.2 ms, System: 0.6 ms]
  Range (min … max):    15.5 ms …  18.4 ms    185 runs

Benchmark 5: ./sieve.mawk
  Time (mean ± σ):      24.2 ms ±   1.1 ms    [User: 23.6 ms, System: 0.6 ms]
  Range (min … max):    22.8 ms …  28.1 ms    105 runs

Benchmark 6: ./sieve.py
  Time (mean ± σ):      35.3 ms ±   1.1 ms    [User: 33.9 ms, System: 1.4 ms]
  Range (min … max):    32.4 ms …  41.2 ms    83 runs

Benchmark 7: ./sieve.pl
  Time (mean ± σ):      36.7 ms ±   2.6 ms    [User: 35.9 ms, System: 0.8 ms]
  Range (min … max):    34.9 ms …  55.3 ms    83 runs

Benchmark 8: ./sieve.gawk
  Time (mean ± σ):      44.6 ms ±   1.1 ms    [User: 43.9 ms, System: 0.7 ms]
  Range (min … max):    42.8 ms …  51.2 ms    67 runs

Benchmark 9: ./sieve.tcl
  Time (mean ± σ):      47.5 ms ±   1.0 ms    [User: 46.6 ms, System: 0.8 ms]
  Range (min … max):    45.3 ms …  50.1 ms    63 runs

Benchmark 10: ./sieve.ksh
  Time (mean ± σ):     763.9 ms ±  13.6 ms    [User: 763.0 ms, System: 0.8 ms]
  Range (min … max):   741.5 ms … 786.1 ms    10 runs

Benchmark 11: ./sieve.zsh
  Time (mean ± σ):      1.063 s ±  0.017 s    [User: 0.959 s, System: 0.104 s]
  Range (min … max):    1.039 s …  1.094 s    10 runs

Benchmark 12: ./sieve.bash
  Time (mean ± σ):      1.777 s ±  0.034 s    [User: 1.776 s, System: 0.001 s]
  Range (min … max):    1.714 s …  1.824 s    10 runs

Summary
  './sieve-fnl.lua' ran
    1.00 ± 0.04 times faster than './sieve.lua'
    2.04 ± 0.07 times faster than './sieve.janet'
    2.75 ± 0.11 times faster than './sieve.js'
    3.96 ± 0.21 times faster than './sieve.mawk'
    5.79 ± 0.23 times faster than './sieve.py'
    6.01 ± 0.44 times faster than './sieve.pl'
    7.31 ± 0.25 times faster than './sieve.gawk'
    7.78 ± 0.25 times faster than './sieve.tcl'
  125.26 ± 3.72 times faster than './sieve.ksh'
  174.28 ± 4.99 times faster than './sieve.zsh'
  291.36 ± 8.87 times faster than './sieve.bash'

## Startup performance

Time to start, print "Hello world", and exit.

TODO; a lot of these are already written