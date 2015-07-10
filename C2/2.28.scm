(define (append l1 l2)
  (if(null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))

(define (fringes x)
  (cond ((null? x) (car x))
         '())
        ((pair? (car x))
         (append (fringe (car x)) (fringe (cdr x))))
        (else (append (list (car x)) (fringe (cdr x)))))





(fringe (list (list 1 2) (list 3 4)))
