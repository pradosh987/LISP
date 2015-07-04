(define (next d)
  (cond((= d 2) 3)
        (else(+ d 2))))

(define(square x)(* x x))

(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
	  ((divides? test-divisor n) test-divisor)
   	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
(= n (smallest-divisor n)))

(define (fast-prime? n times)
(cond ((= times 0) true)
((fermat-test n) (fast-prime? n (- times 1)))
(else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
    (remainder (square (expmod base (/ exp 2) m)) m))
    (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
(define (try-itado a)
(= (expmod a n n) a))
(try-itado (+ 1 (random (- n 1)))))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
	
(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
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

  
(define (search-for-primes n count)  
  (if(even? n) 
    (iterate (+ n 1) 3)
    (iterate n 3)))

(search-for-primes 1000000000 3)
 
;OUTPUT
;1000003     ***     .06000000000000005
;1000033     ***     .06000000000000005
;1000037     ***     .06000000000000005


;1000000007     ***     .09999999999999987
;1000000009     ***     .08000000000000007
;1000000021     ***     .08000000000000007
