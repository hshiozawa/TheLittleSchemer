(define (value aexp)
  (cond [(atom? aexp) aexp]
        [(eq? (car (cdr aexp)) '+)
         (+ (value (car aexp)) (value (car (cdr (cdr aexp)))))]
        [(eq? (car (cdr aexp)) '*)
         (* (value (car aexp)) (value (car (cdr (cdr aexp)))))]
        [(eq? (car (cdr aexp)) '^)
         (expt (value (car aexp)) (value (car (cdr (cdr aexp)))))]))

(value '(1 + 3))
(value '(1 * 3))
(value '(2 ^ 3))
(value '(2 ^ (3 + 4)))
