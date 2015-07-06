
;Recursive
(define (cont-frac n d k)
  (define (iter a b)
    (if(= a b)
      (/ (n a) (d a))  
      (/ (n a) (+ (d a) (iter (+ a 1) b))) ))
  (iter 1 k))

(cont-frac (lambda (i) 1)
            (lambda (i) (if(= (remainder i 3) 2)
                            (- i (floor (/ i 3)))
                            1))
            10)

;719 / 1001
;0.71828171828