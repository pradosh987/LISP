(define (make-pair a b) (cons a b))

(define (make-point x y)
  (cons x y))

(define (x-point x) (car x))
 
(define (y-point x) (cdr x))

(define (make-segment x y)
  (cons x y))

(define (start-segment x) (car x))

(define (end-segment x) (cdr x))

;rectangle takes four points
(define (make-rectangle a b c d)
  (make-pair (make-segment a b) (make-segment c d)))

(define (distance a b)
  (sqrt 
    (+ (square (- (x-point b) (x-point a))) 
       (square (- (y-point b) (y-point a))))))

(define (perimeter rec)
  ( * 
   2 
   (+ 
     (distance 
      (get-point rec 1) 
      (get-point rec 2))
     (distance 
       (get-point rec 1)
       (get-point rec 4)))))

(define (area rec)
  (* 
    (distance (get-point rec 1) (get-point rec 2))
    (distance (get-point rec 1) (get-point rec 4))))

(define (get-point rec x)
  (cond ((= x 1) (car (car rec)))
        ((= x 2) (cdr (car rec)))
        ((= x 3) (car (cdr rec)))
        (else (cdr (cdr rec)))))


(define (run)
  (define rec 
    (make-rectangle 
   	 (make-point 1 1)
   	 (make-point 6 1) 
     (make-point 4 6)
     (make-point 4 1)))
 (newline) 
 (display "Perimeter: ")
 (display (perimeter rec))
 (newline)
 (display "Area: ")
 (display (area rec)))
(run)

;Perimeter: 16
;Area: 15


