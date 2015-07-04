
(define (find-carmichael n)
		(fermite-test n (- n 1))) 

(define (fast-prime? n t)
  (cond ((= t 0) true)
        ((fermite-test n) (fast-prime? n (- t 1)))
        (else false)))

(define (fermite-test n a)
  (if( = (expmod a n n) a)
      ( display a) 
      (fermite-test n (- a 1))
      ))
	
 (define (expmod base exp m)
  (cond ((= exp 0) 1)
         ((even? exp )
          (remainder (square (expmod base (/ exp 2) m)) m))
 		  (else (remainder (* base (expmod base (- exp 1) m)) m))))

 (define (fermite? n a)
   (if( = (expmod a n n) a)
      (display "Fooled")
      (display "Passed")
      ))
 
 
 (fermite? 1000 625)
; (find-carmichael 100)