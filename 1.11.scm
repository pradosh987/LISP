(define (function n)
(
 cond ((< n 3 ) n)
 (else ( + (function(- n 1)) ( * 2 (function (- n 2)))  (* 3 (function(- n 3))) )
 )
) )

(function 4)

