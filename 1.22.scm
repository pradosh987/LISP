(define(square x)(* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
   	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
	
(define (start-prime-test n start-time)
  (if (prime? n)
	(report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display "     ***     ")
  (display elapsed-time))

 
(define (iterate n count)
 (cond((> count 0) 
  (if(prime? n)
      ((iterate (+ 2 n) (- count 1))
      	(timed-prime-test n))
      (iterate (+ 2 n) count)))
       ))


(define (next d)
  (cond((= (remainder d 2) 0) (+ d 1))
        (else(+ d 2))))
  
(define (search-for-primes n count)  
  (if(even? n) 
    (iterate (+ n 1) 3)
    (iterate n 3)))

(search-for-primes 10000000000 3)


;100000007     ***     2.0000000000000018e-2
;100000037     ***     2.0000000000000018e-2
;100000039     ***     1.9999999999999962e-2

;1000000007     ***     .06000000000000005
;1000000009     ***     .07999999999999996
;1000000021     ***     .07999999999999996

;10000000019     ***     .20000000000000018
;10000000033     ***     .19999999999999996
;10000000061     ***     .20000000000000018


