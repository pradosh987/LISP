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

(define (searchPrime f l)
  (if(even? f) 
    (iterate (+ f 1) l)
    (iterate f l)))
 
(define (iterate f l)
  (cond((<= f l) 
  (and (searchPrime (+ f 2) l) (timed-prime-test f) ))))


 
 (iterate 10000000000 10000000300)
 
;output
;10000000279     ***     .14
;10000000277     ***     .13999999999999999
;10000000259     ***     .12
;10000000207     ***     .12
;10000000147     ***     .12
;10000000141     ***     .12
;10000000121     ***     .12
;10000000103     ***     .14000000000000012
;10000000097     ***     .11999999999999988
;10000000069     ***     .11999999999999988
;10000000061     ***     .1200000000000001
;10000000033     ***     .11999999999999988
;10000000019     ***     .1200000000000001


;increased ration 1.8
