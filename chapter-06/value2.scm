(define (value2 aexp)
  (cond [(atom? aexp) aexp]
        [(eq? (car aexp) '+)
         (+ (value2 (car (cdr aexp))) (value2 (car (cdr (cdr aexp)))))]
        [(eq? (car aexp) '*)
         (* (value2 (car (cdr aexp))) (value2 (car (cdr (cdr aexp)))))]
        [(eq? (car aexp) '^)
         (expt (value2 (car (cdr aexp))) (value2 (car (cdr (cdr aexp)))))]))

(value2 '(+ 1 2))
(value2 '(^ 2 2))
(value2 '(* 2 3))
(value2 '(+ (* 2 3) 4))
        
