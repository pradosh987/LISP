(define (inc x) (+ x 1))

(define (compose f g)
  (lambda(x)
    (f (g x)) ))





(define (repeated a b)
  (lambda (x)
    (define (proc c result)
      (if(< c 1)
          result
          (proc (- c 1) (a result))))
    (proc b x)
    ))

((repeated square 2) 5)
;625