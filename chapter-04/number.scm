(define (no-nums lat)
  (cond [(null? lat) '()]
        [(number? (car lat)) (no-nums (cdr lat))]
        [else (cons (car lat) (no-nums (cdr lat)))]))

(no-nums '(1 a 2 b 3 c))
(no-nums '(a b c))
(no-nums '(1 2 3))

(define (all-nums lat)
  (cond [(null? lat) '()]
        [(number? (car lat)) (cons (car lat) (all-nums (cdr lat)))]
        [else (all-nums (cdr lat))]))

(all-nums '(1 a 2 b 3 c))
(all-nums '(a b c))
(all-nums '(1 2 3))

(define (eqan? a1 a2)
  (cond [(and (number? a1) (number? a2)) (= a1 a2)]
        [(or (number? a1) (number? a2)) #f]
        [else (eq? a1 a2)]))

(eqan? 1 2)
(eqan? 1 1)

(define (occur a lat)
  (cond [(null? lat) 0]
        [(eqan? a (car lat)) (add1 (occur a (cdr lat)))]
        [else (occur a (cdr lat))]))

(occur 1 '(1 2 3 4 5))
(occur 1 '(1 (2) 3 1 5))

(define (one? n)
  (= n 1))

(define (rempick n lat)
  (cond [(null? lat) '()]
        [(one? n) (cdr lat)]
        [else (cons (car lat) (rempick (sub1 n) (cdr lat)))]))

(rempick 1 '(1 2 3))
(rempick 2 '(1 2 3))
(rempick 3 '(1 2 3))

