(define (rember s l)
  (cond [(null? l) '()]
        [(atom? (car l))
         (cond [(equal? (car l) s) (cdr l)]
               [else (cons (car l) (rember s (cdr l)))])]
        [else
         (cond [(equal? (car l) s) (cdr l)]
               [else (cons (car l) (rember s (cdr l)))])]))

(define (rember s l)
  (cond [(null? l) '()]
        [(equal? (car l) s) (cdr l)]
        [else (cons (car l) (rember s (cdr l)))]))
         

(rember 'a '(a b c))
(rember '(a) '((a) b c))
(rember '(b) '((a) (a (b)) c))
