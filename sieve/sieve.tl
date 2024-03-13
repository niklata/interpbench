#!/usr/bin/env txr

(defun sieve_sundaram (n)
  (let ((a (make-hash nil nil t))
        (s '(2))
        (m (/ n 2)))
    (each ((i (range 1 n)))
         (each ((j (range i n)))
              (let ((p (+ i j (* 2 i j))))
                (if (<= p n)
                    (sethash a p t)))))
    (each ((k (range 1 m)))
         (unless (gethash a k)
           (set s (append s (list (+ (* 2 k) 1))))))
    s))

(sieve_sundaram 1000)
