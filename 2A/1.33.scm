(define (mul x y) (* x y))
(define (add x y) (+ x y))
(define (identity a) a)
(define (add-square x y) (+ y (square x )))
(define (inc a) (+ 1 a))

(define (prime? n)
 (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (gcd a b)
  (if(= a b)
      a
      (if(> a b)
        (gcd (- a b) b)
        (gcd a (- b a)))))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (next test-divisor)))))

(define (next d)
  (cond((= d 2) 3)
    (else(+ d 2))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime-filter a)
  (if(prime? a)
    true
    false))

(define (filtered-accumulate combiner filter null-value term a next b)
  (if (> a b)
     null-value
     ( if(filter (term a))
      (combiner (term a)
        (filtered-accumulate
          combiner
          filter
          null-value
          term 
          (next a)
          next
          b)) 
        ;(combiner (term a) 
      (filtered-accumulate
        combiner
        filter
        null-value
        term 
        (next a)
        next
        b)))) 

(define (sum-square-prime a b)
  (filtered-accumulate add-square prime-filter 0 identity a inc b))

(define (product-relatively-prime n)
  (define (gcd-filter i)
    (if(= (gcd i n) 1)
      true
      false))
  (filtered-accumulate mul gcd-filter 1 identity 2 inc n)
  )

(define (sum-all a b)
  (filtered-accumulate mul prime? 0 square a inc b))


;(sum-square-prime 3 12)

(product-relatively-prime 5)

