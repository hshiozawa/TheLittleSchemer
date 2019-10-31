(define (expt a b)
  (cond [(zero? b) 1]
        [else (* a (expt a (sub1 b)))]))

(expt 2 3)
(expt 1 1)
(expt 1 0)
(expt 5 3)

(define (/ a b)
  (cond [(< a b) 0]
        [else (add1 (/ (- a b) b))]))

(/ 10 2)
