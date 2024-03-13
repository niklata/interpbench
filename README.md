# Interpreter benchmark

## Introduction

This is meant as a simple benchmark of dynamic language runtime performance.  I'm focusing mostly on embeddable or shell-script languages.  If a language runtime has a JIT or AOT compiler that generates machine code, it's not in context for these tests.

Since the focus here is on scripting, either at the shell, or as embedded languages, startup time is important.

I'm going for approximate numbers.  CPU clock scaling is still enabled.
This level of precision is good enough to distinguish the general performance groupings.

## Language versions

Everything runs on amd64.

Lua 5.4.6
Fennel 1.4.0 on PUC Lua 5.4
QuickJS-ng version 0.4.0dev
Python 3.11.8
Perl v5.38.2
GNU Awk 5.3.0
mawk 1.3.4 20231126
Janet 1.33.0-03ae2ec1
Tcl 8.6.13
zsh 5.9
GNU bash, version 5.1.16(1)-release
ksh 93u+m/1.0.8 2024-01-01
dash 0.5.12

## Missing languages

* dash (sieve) - Possible to do via eval trickery to simulate associative arrays.
* ruby - Just haven't gotten to it yet.
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

Time to start, print "Hello world", and exit.  Measures the fixed cost of
starting up the language runtime.

Benchmark 1: ./hello.mawk
  Time (mean ± σ):       0.4 ms ±   0.1 ms    [User: 0.3 ms, System: 0.1 ms]
  Range (min … max):     0.3 ms …   0.9 ms    5774 runs

Benchmark 2: ./hello.lua
  Time (mean ± σ):       0.5 ms ±   0.1 ms    [User: 0.3 ms, System: 0.1 ms]
  Range (min … max):     0.5 ms …   0.9 ms    4229 runs

Benchmark 3: ./hello-fnl.lua
  Time (mean ± σ):       0.5 ms ±   0.1 ms    [User: 0.3 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   0.9 ms    4588 runs

Benchmark 4: ./hello.gawk
  Time (mean ± σ):       0.6 ms ±   0.1 ms    [User: 0.3 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   0.9 ms    4115 runs

Benchmark 5: ./hello.bash
  Time (mean ± σ):       0.6 ms ±   0.1 ms    [User: 0.4 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   1.4 ms    3525 runs

Benchmark 6: ./hello.js
  Time (mean ± σ):       0.6 ms ±   0.1 ms    [User: 0.4 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   0.9 ms    3935 runs

Benchmark 7: ./hello.zsh
  Time (mean ± σ):       0.6 ms ±   0.1 ms    [User: 0.3 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   1.0 ms    4431 runs

Benchmark 8: ./hello.ksh
  Time (mean ± σ):       0.6 ms ±   0.1 ms    [User: 0.4 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   1.0 ms    3718 runs

Benchmark 9: ./hello.pl
  Time (mean ± σ):       0.7 ms ±   0.1 ms    [User: 0.4 ms, System: 0.3 ms]
  Range (min … max):     0.6 ms …   1.2 ms    3328 runs

Benchmark 10: ./hello.tcl
  Time (mean ± σ):       1.3 ms ±   0.1 ms    [User: 0.9 ms, System: 0.3 ms]
  Range (min … max):     1.2 ms …   1.8 ms    2069 runs

Benchmark 11: ./hello.janet
  Time (mean ± σ):       1.6 ms ±   0.1 ms    [User: 1.2 ms, System: 0.3 ms]
  Range (min … max):     1.5 ms …   2.1 ms    1789 runs

Benchmark 12: ./hello.py
  Time (mean ± σ):       6.5 ms ±   0.2 ms    [User: 5.4 ms, System: 1.1 ms]
  Range (min … max):     6.2 ms …   7.4 ms    422 runs

Summary
  './hello.mawk' ran
    1.33 ± 0.25 times faster than './hello.lua'
    1.34 ± 0.25 times faster than './hello-fnl.lua'
    1.41 ± 0.26 times faster than './hello.gawk'
    1.51 ± 0.28 times faster than './hello.bash'
    1.51 ± 0.29 times faster than './hello.ksh'
    1.54 ± 0.28 times faster than './hello.zsh'
    1.55 ± 0.28 times faster than './hello.js'
    1.83 ± 0.33 times faster than './hello.pl'
    3.36 ± 0.52 times faster than './hello.tcl'
    4.05 ± 0.60 times faster than './hello.janet'
   16.56 ± 2.21 times faster than './hello.py'

## Fibonacci performance

Tests function call speed.

Benchmark 1: ./fib.mawk
  Time (mean ± σ):       0.6 ms ±   0.1 ms    [User: 0.4 ms, System: 0.2 ms]
  Range (min … max):     0.5 ms …   1.0 ms    3794 runs

Benchmark 2: ./fib.lua
  Time (mean ± σ):       0.7 ms ±   0.1 ms    [User: 0.4 ms, System: 0.2 ms]
  Range (min … max):     0.6 ms …   1.4 ms    2821 runs

Benchmark 3: ./fib-fnl.lua
  Time (mean ± σ):       0.7 ms ±   0.1 ms    [User: 0.4 ms, System: 0.2 ms]
  Range (min … max):     0.6 ms …   1.1 ms    3331 runs

Benchmark 4: ./fib.js
  Time (mean ± σ):       0.9 ms ±   0.1 ms    [User: 0.6 ms, System: 0.3 ms]
  Range (min … max):     0.8 ms …   2.1 ms    1417 runs

Benchmark 5: ./fib.gawk
  Time (mean ± σ):       1.1 ms ±   0.1 ms    [User: 0.8 ms, System: 0.3 ms]
  Range (min … max):     1.0 ms …   1.5 ms    2442 runs

Benchmark 6: ./fib.pl
  Time (mean ± σ):       1.8 ms ±   0.1 ms    [User: 1.4 ms, System: 0.3 ms]
  Range (min … max):     1.6 ms …   2.7 ms    1115 runs

Benchmark 7: ./fib.janet
  Time (mean ± σ):       2.0 ms ±   0.1 ms    [User: 1.5 ms, System: 0.4 ms]
  Range (min … max):     1.8 ms …   3.4 ms    889 runs

Benchmark 8: ./fib.tcl
  Time (mean ± σ):       2.7 ms ±   0.1 ms    [User: 2.2 ms, System: 0.4 ms]
  Range (min … max):     2.5 ms …   3.4 ms    1093 runs

Benchmark 9: ./fib.py
  Time (mean ± σ):       7.0 ms ±   0.2 ms    [User: 5.8 ms, System: 1.1 ms]
  Range (min … max):     6.6 ms …   8.1 ms    400 runs

Benchmark 10: ./fib.ksh
  Time (mean ± σ):      31.6 ms ±   0.4 ms    [User: 30.4 ms, System: 1.1 ms]
  Range (min … max):    30.1 ms …  32.6 ms    94 runs

Benchmark 11: ./fib.dash
  Time (mean ± σ):      1.129 s ±  0.015 s    [User: 1.021 s, System: 0.181 s]
  Range (min … max):    1.109 s …  1.158 s    10 runs

Benchmark 12: ./fib.zsh
  Time (mean ± σ):      2.110 s ±  0.020 s    [User: 1.652 s, System: 0.583 s]
  Range (min … max):    2.084 s …  2.149 s    10 runs

Benchmark 13: ./fib.bash
  Time (mean ± σ):      2.229 s ±  0.033 s    [User: 1.753 s, System: 0.591 s]
  Range (min … max):    2.164 s …  2.274 s    10 runs

Summary
  './fib.mawk' ran
    1.10 ± 0.20 times faster than './fib.lua'
    1.11 ± 0.20 times faster than './fib-fnl.lua'
    1.48 ± 0.24 times faster than './fib.js'
    1.83 ± 0.31 times faster than './fib.gawk'
    2.96 ± 0.43 times faster than './fib.pl'
    3.24 ± 0.46 times faster than './fib.janet'
    4.44 ± 0.60 times faster than './fib.tcl'
   11.67 ± 1.52 times faster than './fib.py'
   52.46 ± 6.75 times faster than './fib.ksh'
 1873.78 ± 241.05 times faster than './fib.dash'
 3501.09 ± 449.06 times faster than './fib.zsh'
 3698.01 ± 476.31 times faster than './fib.bash'