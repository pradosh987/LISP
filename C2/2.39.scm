(define fold-right accumulate)

(define (reverse sequence)
  (fold-right (lambda (x y) 
                (append y (list x)))
              '()
              sequence))
(define (reverse-2 sequence)
  (fold-left (lambda (x y) 
               (cons y x))
               '()
               sequence))



(reverse-2 (list 1 2 3 4))
;(4 3 2 1)
