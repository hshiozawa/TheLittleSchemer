(define (C n)
  (cond [(= 1 n) 1]
        [(even? n) (C (/ n 2))]
        [else (C (+ 1 (* 3 n)))]))

(define (A n m)
  (cond [(= n 0) (+ 1 m)]
        [(= m 0) (A (- n 1) 1)]
        [else (A (- n 1)
                 (A n (- m 1)))]))
