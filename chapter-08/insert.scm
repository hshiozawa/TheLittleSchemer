(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond [(null? l) '()]
            [(test? old (car l)) (cons new l)]
            [else (cons (car l) ((insertL-f test?) new old (cdr l)))]))))

((insert-L eq?) 'b 'c '(a c d e))

(define insert-R
  (lambda (test?)
    (lambda (new old l)
      (cond [(null? l) '()]
            [(test? old (car l))
             (cons old (cons new (cdr l)))]
            [else (cons (car l) ((insert-R test?) new old (cdr l)))]))))

((insert-R eq?) 'c 'b '(a b d e))

(define insert-g
  (lambda (build)
    (lambda (test?)
      (lambda (new old l)
        (cond [(null? l) '()]
              [(test? old (car l))
               (build new old (cdr l))]
              [else (cons (car l)
                          (((insert-g build) test?) new old (cdr l)))])))))

(define (build-left new old l)
  (cons new (cons old l)))

(define (build-right new old l)
  (cons old (cons new l)))


(((insert-g build-left) eq?) 'b 'c '(a c d e))

(((insert-g build-right) eq?) 'c 'b '(a b d e))


(define subst
  ((insert-g
    (lambda (new old l)
      (cons new l))) eq?))

(subst 'a 'A '(A b c d))
