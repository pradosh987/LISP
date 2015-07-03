;incomete
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
(define (try-it a)
(= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))

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

(define (searchPrime f l)
  (if(even? f) 
    (iterate (+ f 1) l)
    (iterate f l)))
 
(define (iterate f l)
  (cond((<= f l) 
  (and (searchPrime (+ f 2) l) (timed-prime-test f) ))))


 
 (iterate 10000000000 10000000300)
 
;10000000279     ***     0.
;10000000277     ***     0.
;10000000259     ***     0.
;10000000207     ***     0.
;10000000147     ***     0.
;10000000141     ***     0.
;10000000121     ***     0.
;10000000103     ***     0.
;10000000097     ***     0.
;10000000069     ***     0.
;10000000061     ***     0.
;10000000033     ***     0.
;10000000019     ***     0.

