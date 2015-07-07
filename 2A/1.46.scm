(define (average x y)
  (/ (+ x y) 2))

(define (iterative-improve improve good-enough?)
  (lambda (x)
    (define (iterate improve guess)
      (if(good-enough? guess)
          guess
          (iterate improve (improve guess))))
    (iterate improve (improve x))))

(define (sqr x g)
  (define (improve guess)
  	(average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  ((iterative-improve improve good-enough?) (improve g)))

(define (fixed-point f g)
  (define tolrance 0.00001)
  (define (improve guess)
  	(f guess))
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) tolrance))
  ((iterative-improve improve good-enough? ) (improve g)))

;(fixed-point cos 1.0)
;.7390893414033927

(fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0)
;1.2587228743052672

;(sqr 137 1.0)
;11.704699917758145




