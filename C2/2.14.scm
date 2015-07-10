(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (abs (- (lower-bound x) (lower-bound y)))
                 (abs(- (upper-bound x) (upper-bound y)))))

(define (width x)
  (/ 
    (- (upper-bound x) (lower-bound x))
    2))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if(or (= (upper-bound y) 0) (= (lower-bound y) 0))
  (display "Divide by zero error")
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))
(define (make-interval a b) 
   (cons a b))

(define (upper-bound a) (a 2))
(define (lower-bound z) (z 1))

(define (make-center-width  c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound)) 2))

(define (make-center-percent c p)
  (make-interval (- c (/ (* c p) 100)) (+ c (/ (* c p) 100))))

(define (percentage i)
  (/ (* 100 (- (upper-bound i) (center i))) (center i)))

(define (part1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (part2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define (run)
  (define i (make-center-percent 6.8 10))
  (display (upper-bound i))
  (newline)
  (display (lower-bound i))
  (newline)
  (display (percentage i)))
(run)
  

;(load "2.10.scm")
