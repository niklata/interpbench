#!/usr/bin/env qjs
function sieve_sundaram(n)
{
    let a = {};
    let s = [2];
    let m = n / 2;
    for (let i = 1; i <= n; ++i) {
        for (let j = i; j <= n; ++j) {
            let p = i + j + 2*i*j;
            if (p <= n) a[p] = true;
        }
    }
    for (let k = 1; k <= m; ++k) {
        if (!a[k]) s.push(2*k + 1);
    }
    return s;
}

let t = sieve_sundaram(1000);
let s = "";
for (let v of t) {
    s += v + " ";
}
console.log(s);
