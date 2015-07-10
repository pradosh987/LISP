;(define (cc amount coin-list)
;  (cond ((= amount 0) 1)
;        ((or (< amount 0) (= (length coin-list) 0)) 0)
;        (else (+ (cc amount (cdr coin-list))
;                 (cc (- amount (car coin-list))
;                     (coin-list))))))

(define (no-more? l)
  (if(null? l)
      true
      false))

(define (first-denomination value)
  (car value))
  
(define (except-first-denomination value)
  (cdr value))
(define (cc amount coin-values)
	(cond ((= amount 0) 1)
       ((or (< amount 0) (no-more? coin-values)) 0)
       (else 
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 50 uk-coins)
;6149