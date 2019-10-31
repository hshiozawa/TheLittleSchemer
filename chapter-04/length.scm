(define (length lat)
  (cond [(null? lat) 0]
        [else (add1 (length (cdr lat)))]))

(length '())
(length '(1))
(length '(1 2))
(length '(1 2 3))
