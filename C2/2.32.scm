
(define (subset s)
  (if(null? s)
      (list '())
      (let ((rest (subset (cdr s))))
        (append rest (map (lambda (x) (append (list (car s)) x )) rest)))))

(subset (list 1 2 3 4))

;procedure breaks the list till the last element and
;appends list to itself each time adding one element from the end