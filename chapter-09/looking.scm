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

(define (looking a lat)
  (keep-looking a (pick 1 lat) lat))

(looking 'caviar '(6 2 4 caviar 5 7 3))

(define (pick n lat)
  (cond [(= n 1) (car lat)]
        [else (pick (- n 1) (cdr lat))]))

(define (keep-looking a to lat)
  (cond [(number? to)
         (keep-looking a (pick to lat) lat)]
        [else (eq? a to)]))
          
(pick 3 '(a b c))
(pick 1 '(a b c))

(looking 'caviar '(6 2 4 caviar 5 7 3))
(looking 'caviar '(6 2 grits caviar 5 7 3))
