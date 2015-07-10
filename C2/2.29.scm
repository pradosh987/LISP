
(define (make-mobile left right)
  (list left right))

(define (make- branch length structure)
  (lit length structure))

(define left-branch car)

(define right-branch cdr)

(define branch-length car)

(define branch-structure cdr)

(define (total-weight mobile)
  (if(not (pair? (right-branch mobile)))
      (right-branch mobile))
  (+ 
    (total-weight (left-branch mobile))
    (total-weight (right-branch mobile))))



;d-> no changes will be requird to the program