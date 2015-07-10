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
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
(define (make-interval a b) 
   (cons a b))

(define (upper-bound a) (a 2))
(define (lower-bound z) (z 1))

(define (run) 
(let ((sum (add-interval (make-interval 6.18 7.48) 
                       (make-interval 4.46 4.93)))
      (dif (sub-interval (make-interval 6.18 7.48) 
                       (make-interval 4.46 4.93)))
      (mul (mul-interval (make-interval 6.18 7.48) 
                       (make-interval 4.46 4.93)))
      (div (div-interval (make-interval 6.18 7.48) 
                       (make-interval 4.46 4.93)))
      (a (make-interval 6.18 7.48))
      (b (make-interval 4.46 4.93)))
  (newline)
  (display "Width of A: ")
  (display (width a))
  (newline)
  (display "Width of B: ")
  (display (width b))
  (newline)
  (display "Sum of Width ")
  (display (+ (width a) (width b)))
  (newline)
  (display "Diff of  Width ")
  (display (- (width a) (width b)))
  (newline)
  (display "Width after sum: ")
  (display (width sum))
  (newline)
  (display "Width after dif: ")
  (display (width dif))
  (newline)
  (display "Width after mul: ")
  (display (width mul))
  (newline)
  (display "Width after div: ")
  (display (width div))))
(run)


;Width of A: .6500000000000004
;Width of B: .23499999999999988
;Sum of Width .8850000000000002
;Diff of  Width .4150000000000005
;Width after sum: .8849999999999998
;Width after dif: .4150000000000005
;Width after mul: 4.656799999999999
;Width after div: .2117901745513422

