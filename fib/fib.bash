#!/usr/bin/env bash

fib ()
{
    (( $1 < 2 )) && { echo $1; return; }
    echo $(( $(fib $(( $1 - 1 ))) + $(fib $(( $1 - 2 ))) ))
}

fib 18
