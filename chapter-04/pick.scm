(define (pick n lat)
  (cond [(zero? (sub1 n)) (car lat)]
        [else (pick (sub1 n) (cdr lat))]))

(pick 1 '(1 2 3 4))
(pick 2 '(1 2 3 4))
(pick 3 '(1 2 3 4))
(pick 4 '(1 2 3 4))

(define (rempick n lat)
  (cond [(null? lat) '()]
        [(zero? (sub1 n)) (cdr lat)]
        [else (cons (car lat) (rempick (sub1 n) (cdr lat)))]))

(rempick 1 '(1 2 3 4))
(rempick 2 '(1 2 3 4))
(rempick 3 '(1 2 3 4))
(rempick 4 '(1 2 3 4))

