(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;(accumulate / 1 (list 1 2 3))
;3/2

(fold-left / 1 (list 1 2 3))
;1/6

;(accumulate list '() (list 1 2 3))
;(1 (2 (3 ())))

;(fold-left list '() (list 1 2 3))
;(((() 1) 2) 3)

;Associative property