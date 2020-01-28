(define (rember-f test? a l)
  (cond [(null? l) '()]
        [(test? a (car l)) (cdr l)]
        [else (cons (car l) (rember-f test? a (cdr l)))]))

(rember-f eq? '1 '(1 2 3))
(rember-f equal? '(1 2) '((1) (1 2) (3 4)))

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond [(null? l) '()]
            [(test? (car l) a) (cdr l)]
            [else (cons (car l)
                        ((rember-f test?) a (cdr l)))]))))

(define rember-eq? (rember-f test?))

((rember-f eq?) '1 '(1 2 3))
((rember-f equal?) '(1 2) '((1) (1 2) (3 4)))
