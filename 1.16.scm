
(define (fast-exp-iter base exp a)
  (if(= exp 0)
      a
   	  (if(even? exp)
          (fast-exp-iter (* base base) (/ exp 2) a)
          (fast-exp-iter base (- exp 1) (* a base )))))


(fast-exp-iter-4 2 10 1)
;1024