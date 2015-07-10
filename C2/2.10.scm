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
  (display "Divide bby zero error")
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))
(define (make-interval a b) 
   (cons a b))

(define (upper-bound a) (a 2))
(define (lower-bound z) (z 1))

(div-interval (make-interval 6.18 7.48) 
                       (make-interval 4.46 0))
  

;(load "2.10.scm")
