#!/usr/bin/env fennel

(fn sieve_sundaram [n]
  (let [a {}
        s [2]
        m (/ n 2)]
    (for [i 1 n]
        (for [j i n]
            (let [p (+ i j (* 2 i j))]
              (if (<= p n)
                (tset a p true)))))
    (for [k 1 m]
        (if (not (. a k))
          (table.insert s (+ (* 2 k) 1))))
    s))

(let [t (sieve_sundaram 1000)]
  (var s "")
  (each [k v (pairs t)]
    (set s (.. s v " ")))
  (print s))
