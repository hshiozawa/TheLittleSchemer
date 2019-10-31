(define (no-nums lat)
  (cond [(null? lat) '()]
        [(number? (car lat)) (no-nums (cdr lat))]
        [else (cons (car lat) (no-nums (cdr lat)))]))

(no-nums '(1 a 2 b 3 c))
(no-nums '(a b c))
