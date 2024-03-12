#!/usr/bin/env zsh

typeset -a s

sieve_sundaram () {
    typeset -A a
    s+=(2)
    local n="$1"
    local m=$(( $n / 2 ))
    local i j k
    for (( i = 1; $i < $n; ++i )) do
        for (( j = $i; $j < $n; ++j )) do
                local p=$(( $i + $j + 2 * $i * $j ))
                if (( $p <= $n )); then
                        a[${p}]=t
                fi
        done
    done
    for (( k = 1; $k <= $m; ++k )) do
        if [[ -z ${a[$k]} ]]; then
                s+=( $(( 2 * $k + 1 )) )
        fi
    done
}

sieve_sundaram 1000
echo $s
