(define (average x y) (/ (+ x y) 2))

(define (make-point x y)
  (cons x y))

(define (x-point x) (car x))
 
(define (y-point x) (cdr x))

(define (make-segment x y)
  (cons x y))

(define (start-segment x) (car x))

(define (end-segment x) (cdr x))

(define (mid-point x)
  (print-point 
	(make-point 
	  (average 
	    (x-point (start-segment x)) 
	    (x-point (end-segment x))) 
	  (average 
	    (y-point (start-segment x)) 
	    (y-point (end-segment x))))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-segment x)
  (newline)
  (display "Start point: ")
  (print-point (start-segment x))
  (newline)
  (display "End Segment: ")
  (print-point (end-segment x))
  0)

(define (create-segment a b c d)
  (define segment (make-segment (make-point a b) (make-point c d)))
  (mid-point segment))

(create-segment 2 4 8 12)