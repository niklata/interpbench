#!/usr/bin/env janet

(defn sieve_sundaram [n]
  (def a @{})
  (def s @[2])
  (def m (/ n 2))
  (loop [i :range [1 n]]
    (loop [j :range [i n]]
      (def p (+ i j (* 2 i j)))
      (if (<= p n)
        (set (a p) true))))
  (loop [k :range [1 m]]
    (unless (get a k)
      (array/push s (+ (* 2 k) 1))))
  s)

(defn main [&]
  (def t (sieve_sundaram 1000))
  (def s @"")
  (each v t
    (buffer/push-string s (string/format "%i " v)))
  (print s))
