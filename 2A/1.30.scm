(define (sum term a next b)
	(if (> a b)
     0
     (+ (term a)
        (sum term 
             (next a)
             next
        	 b))))

(define (sum-iterative term a next b)
  (define (iter x result)
    (if (> x b)
        (display result)
        (iter (next x) (+ result (term x)))))
  (iter a 0))

(define (cube a) (* a a a))
(define (inc a) (+ 1 a))

(define (sum-all a b)
  (sum-iterative cube a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
 
 (define (simpsons-integral f a b n)
   (define (inc x) (+ x 1))
   (define (find-h a b n) (/ (- b a) n ))
   (define get-h (/ (- b a) n ))
    
   (define (next-y x)(f(+ a (* x get-h))))
   (define (term x)(* (cond ((even? x) 2)
                            ((odd? x) 4)
                            ((= x 0) 1)
                            ((= x n) 1))
                      (next-y x)))
   (* (sum term 0 inc n) (/ get-h 3))) 
   

;(simpsons-integral cube 0 1 1000)
 
;55 
(sum-all 1 10)