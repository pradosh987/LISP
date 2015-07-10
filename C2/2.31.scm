(define (tree-map factor tree)
  (map (lambda (sub-tree)
         (if(pair? sub-tree)
             (tree-map factor sub-tree)
             (factor sub-tree)))
       tree ))

(define tree 
  (list 1 
        (list 2 (list 3 4) 5)
        (list 6 7)))

(tree-map square tree)
;(define (square-tree tree) (tree-map square tree))

