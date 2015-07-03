(define (function a b c n)
(cond
  ((< n 1) a)
  (else (function b c (+ c  (* 2 b) (* 3 a)) (- n 1) ))))

(define (f n) (function 0 1 2 n))

(f 4)