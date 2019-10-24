(define (rember a lat)
  (cond [(null? lat) '()]
        [(eq? a (car lat)) (cdr lat)]
        [else (cons (car lat) (rember a (cdr lat)))]))

(define multirember
  (lambda (a lat)
    (cond [(null? lat) '()]
          [(eq? a (car lat)) (multirember a (cdr lat))]
          [else (cons (car lat) (multirember a (cdr lat)))])))
           

(rember 'a '(a))
(rember 'a '(a a))
(rember 'a '(b a c))
(rember 'a '(b a c a))

(multirember 'a '(b a c d))
(multirember 'a '(b a c a))
(multirember 'a '(a a))
