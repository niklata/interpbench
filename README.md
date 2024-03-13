# Interpreter benchmark

## Introduction

This is meant as a simple benchmark of dynamic language performance.  I'm focusing mostly on embeddable or shell-script languages.  If a language has a JIT or AOT compiler that generates machine code, it's not in context for these tests.

Since the focus here is on scripting, either at the shell, or as embedded languages, interpreter startup time is important.

I'm going for approximate numbers.  CPU clock scaling is still enabled.  I'm not using hyperfine, just zsh 'time'.
This level of precision is good enough to distinguish the general performance groupings.

## Missing languages

* sh (dash) - Possible to do via eval trickery to simulate associative arrays.
* ruby - Just haven't gotten to it yet; it doesn't embed that well, but since I wrote perl and shell script tests...
* mruby - It's intended for embedding, so it's in scope.
* elisp - Would be fun, but would bend the rules since it's now JIT compiled.

## Sieve performance

This is a test of numerics, loops, hash table lookup and set, and array append.

* Lua, Fennel - 0.006s
* Janet       - 0.013s
* QuickJS     - 0.017s
* mawk        - 0.024s
* Python3     - 0.035s
* Perl        - 0.036s
* gawk        - 0.043s
* Tcl         - 0.048s

* TXR Lisp    - 0.442s (re-run)
* ksh93       - 0.732s
* zsh         - 1.051s
* bash        - 1.748s

## Startup performance

Time to start, print "Hello world", and exit.

TODO; a lot of these are already written