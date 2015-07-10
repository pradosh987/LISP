(define (append l1 l2)
  (if(null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(define (deep-reverse l)
  (cond ((null? l) 
         '())
        ((pair? (car l))
         (append (deep-reverse (cdr l)) 
               (list (deep-reverse (car l)))))
        (else 
         (append (deep-reverse (cdr l)) 
                 (list (car l))))))


(deep-reverse (list (list 1 2) (list 3 4)))