(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

;List is produced in reverse prder because push first element at the last with cdr



(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(square-list-2 (list 1 2 3 4))
;((((() . 1) . 4) . 9) . 16)
;The procedure dosent work because it produces list of list
;(nil 1) is passed onto next iteration ((nil 1) 4) and so on