(define (member? a lat)
  (cond [(null? lat) #f]
        [(equal? (car lat) a) #t]
        [else (member? a (cdr lat))]))

(define (set? lat)
  (cond [(null? lat) #t]
        [(member? (car lat) (cdr lat)) #f]
        [else (set? (cdr lat))]))

(define (set? lat)
  (or (null? lat)
      (and (not (member? (car lat) (cdr lat)))
           (set? (cdr lat)))))

(set? '(A B C D))
