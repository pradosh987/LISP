(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))


;map
(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if(pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree ))

;recursive
(define (square-tree-rec tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree)) (factor tree))
        (else (cons (square-tree-rec (car tree) factor)
                    (square-tree-rec (cdr tree) factor)))))


(square-tree-rec 
  (list 1 
        (list 2 (list 3 4) 5)
        (list 6 7)) square)
;(1 (4 (9 16) 25) (36 49))

(square-tree-map 
  (list 1 
        (list 2 (list 3 4) 5)
        (list 6 7)))
;(1 (4 (9 16) 25) (36 49))