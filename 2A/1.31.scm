(define (cube a) (* a a a))
(define (inc a) (+ 1 a))
(define (identity a) a)


(define (product term a next b)
	(if (> a b)
     1
     (* (term a)
        (product term 
             (next a)
             next
        	 b))))

(define (product-iterative term a next b)
  (define (iter x result)
    (if (> x b)
        (display result)
        (iter (next x) (* result (term x)))))
  (iter a 1))

(define (mul-all a b)
  (product-iterative identity a inc b))

(define (factorial n)`
  (product identity 1 inc n))


(define (appx-pie n)
  (define (next x)(+ x 2))
  (define (term x ) x)
  
  (/ (* 2 (square (product term 4 next n))) (square (product term 3 next (- n 1)) ) ))




;(mul-all 1 4)

;(factorial 4)

(appx-pie 8)