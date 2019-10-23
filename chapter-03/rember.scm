(define (rember a lat)
  (cond [(null? lat) '()]
        [(eq? a (car lat)) (cdr lat)]
        [else (cons (car lat) (rember a (cdr lat)))]))

(rember 'a '(a))
(rember 'a '(a a))
(rember 'a '(b a c))
(rember 'a '(b a c a))
