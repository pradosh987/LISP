(define (fast-munltiply a b)
  (cond ((< b 2) a)
        ((even? b) (fast-munltiply (double a) (havle b)))
        
        (else (+ a (fast-munltiply a (- b 1) )))
        ) )

(define (double x)
  (* 2 x))

(define (havle x)
  (/ x 2))

(define (even? n)
(= (remainder n 2) 0))

(fast-munltiply 9 9)