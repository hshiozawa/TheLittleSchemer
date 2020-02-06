(define (subst new old l)
  (cond [(null? l) '()]
        [(eq? old (car l))
         (cons new (cdr l))]
        [else (cons (car l) (subst new old (cdr l)))]))

(subst 'a 'A '(A b c d))

(define subst
  (insert-g
   (lambda ()
               
