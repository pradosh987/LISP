
;Recursive
(define (cont-frac n d k)
  (define (iter a b)
    (if(= a b)
      (/ (n a) (d a))  
      (/ (n a) (+ (d a) (iter (+ a 1) b))) ))
  (iter 1 k))

;Iterative
(define (cont-frac-iterative n d k)
  (define (iter c result)
    (if(< c 1)
        result
        (iter (- c 1) (/ (n c) (+ (d c) result)))))
  (iter k 0))

(define (accuracy count value)
  (if(< (abs (- value 
               (cont-frac 
                  (lambda (i) 1.0) 
                  (lambda (i) 1.0) 
                  (+ count 1)))) 
        0.00001)
      (display count)
      (accuracy (+ count 1) (cont-frac 
                  (lambda (i) 1.0) 
                  (lambda (i) 1.0) 
                  (+ count 1)))))
  
(accuracy 1 (cont-frac 
               (lambda (i) 1.0)
  			   (lambda (i) 1.0)
  				1))



;(cont-frac-iterative (lambda (i) 1.0)
;  (lambda (i) 1.0)
;  100)

;(cont-frac (lambda (i) 1.0)
;  (lambda (i) 1.0)
;  12)