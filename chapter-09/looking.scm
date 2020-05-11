(define (looking a lat)
  (keep-looking a (pick 1 lat) lat))

(define (pick n lat)
  (cond [(<= n 0) (error "n <= 0")]
        [(null? lat) (error "lat is empty")]
        [(= n 1) (car lat)]
        [else (pick (- n 1) (cdr lat))]))

(define (keep-looking a sorn lat)
  (cond [(number? sorn) (keep-looking a (pick sorn lat) lat)]
        [else (eq? sorn a)]))

(looking 'a '(6 2 4 a 5 7 3))
(looking 'b '(6 2 4 a 5 7 3))
(looking 'a '(6 2 c a 5 7 3))
(looking 'a '(a 2 c a 5 7 3))
(looking 'a '(7 2 4 7 5 6 3))
