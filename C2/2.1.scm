(define (make-rat x y)
  (cond ((and (< x 0) (< y 0)) 
          (make-rat (* -1 x) (* -1 y)))
        ((and (> x 0) (< y 0))
          (make-rat (- x) (- y)))
        (else (cons (/ x 1) (/ y 1)))            
        ))

(define (gcd a b)
  (if(= a b)
      a 
      (if(> a b)
        (gcd (- a b) b)
        (gcd a (- b a)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x ) (car x))
(define (denom x ) (cdr x))

(print-rat (make-rat  6	(- 9)))