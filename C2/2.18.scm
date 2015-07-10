(define (append l1 l2)
  (if(null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(define (reverse l)
  (define (iterate li rev)
    (if(null? li)
        rev
        (iterate (cdr li) (append (list (car li)) rev ))))
  (iterate l (list )))

(reverse (list 1 4 9 16 25))