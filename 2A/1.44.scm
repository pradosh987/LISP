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


(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)
    ))

(define (n-fold-smooth f n)
  (lambda (x)
    ((repeated f n) x)))


((repeated (smooth (lambda (x) x)) 5) ((smooth (lambda (x) (* x x x))) 3.55))

;((smooth (lambda (x) (* x x x))) 3.55)
;44.73887500071

;((n-fold-smooth (smooth f) 
;                0) 
; ((smooth (lambda (x) (* x x x))) 3))
