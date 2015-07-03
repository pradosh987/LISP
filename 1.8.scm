(define (cuberoot guess a)
  
   
     (if(good? guess a)
  	(exact->inexact guess)
    (cuberoot (iterate guess a) a)))

(define (cube x)
  (* x ( * x x)
   ))

(define (iterate guess a)
  (* (/ 1 3) (+ (* 2 guess)  (/ a (* guess guess) )))
  )

(define (good? guess a)
  (< (abs (- guess (iterate guess a))) 0.0001)
  )

(define (abs x)
(if (< x 0)
(- x)
x))

(cuberoot 1 100)

