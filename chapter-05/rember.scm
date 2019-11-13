(define (rember s l)
  (cond [(null? l) '()]
        [(equal? s (car l)) (cdr l)]
        [else (cons (rember s (car l)) (rember s (cdr l)))]))

(rember 'a '(a b c))
(rember '(a) '((a) b c))
(rember '(b) '((a) ((b)) c))
         
