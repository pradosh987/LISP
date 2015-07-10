
;(define (for-eac h-2 func items)
;  (if(not (null? items))
;      ((func (car items))
;       (for-each func (cdr items)))))

(define (for-each func items)
  (define (do func items)
    (func (car items))
    (for-each func (cdr items)))
  (if(not (null? items))
      (do func items)))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))