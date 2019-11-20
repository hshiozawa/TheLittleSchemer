(define (numbered? aexp)
  (cond [(atom? aexp) (number? aexp)]
        [(eq? (car (cdr aexp)) '+)
         (and (numbered? (car aexp)) (numbered? (car (cdr (cdr aexp)))))]
        [(eq? (car (cdr aexp)) '*)
         (and (numbered? (car aexp)) (numbered? (car (cdr (cdr aexp)))))]
        [(eq? (car (cdr aexp)) '^)
         (and (numbered? (car aexp)) (numbered? (car (cdr (cdr aexp)))))]
        ))

(define (numbered? aexp)
  (cond [(atom? aexp) (number? aexp)]
        [else (and (numbered? (car aexp)) (numbered? (car (cdr (cdr aexp)))))]
        ))

(numbered? '())
(numbered? '(1 + 3))
(numbered? '(3))
(numbered? '(1 + (3 + cons)))
