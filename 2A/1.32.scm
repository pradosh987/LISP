(define (mul x y) (* x y))
(define (add x y) (+ x y))
(define (identity a) a)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
     null-value
     (combiner (term a)
        (accumulate
          combiner
          null-value
          term 
          (next a)
          next
       	  b)))
  ) 

(define (sum term a next b)
	(if (> a b)
     0
     (+ (term a)
        (sum term 
             (next a)
             next
        	 b))))

(define (cube a) (* a a a))
(define (inc a) (+ 1 a))

(define (sum-all a b)
  (accumulate add 0 identity a inc b))

(define (mul-all a b)
  (accumulate mul 1 identity a inc b))
  
  ;55 )
(sum-all 1 5)

