;incomeplete  

(define (prime-test n)
(newline)
(display n)
;(display (runtime))
(start-prime-test n (runtime))
(newline))


(define (start-prime-test n start-time)
(if (prime? n)
(report-prime (- (runtime) start-time))))


(define (report-prime elapsed-time)
(display " *** ")
(newline)
;(display (runtime))
(display elapsed-time)
)

(define (prime? n)
(= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
(= (remainder b a) 0))

(define (square x)
  (* x x))

(define (find-small-prime start)
  (find-primes start 0 3))


(define (find-primes number found total)
  (cond ((= found total) found)
        ((prime-test (+ number 1))(find-primes (+ number 1) (+ found 1) total ) )
        
        (else (find-primes (+ number 1) found total )))
        ) 

(find-small-prime 1000)
;(prime-test 100123456789)