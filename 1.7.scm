(define (average x y)
  (/ (+ x y) 2))


(define (improve guess x)
  (average guess (/ x guess)))

(define 
  (goodenough? guess x)
    (< (abs (- (* guess guess) x)) 0.0001))

(define 
  (newgoodenough? guess x)
    (< (abs (-  guess (improve guess x)) ) 0.0001))


(define (sqroot guess x)
  (if(goodenough? guess x)
  	(exact->inexact guess)
    (sqroot (improve guess x)
    	x))
 )
(define (abs x)
(if (< x 0)
(- x)
x))

(define (sqrt x)
	
 (sqroot 1 x)
   )

(sqrt 100)






