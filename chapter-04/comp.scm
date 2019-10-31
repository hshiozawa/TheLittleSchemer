(define (> m n)
  (cond [(zero? m) #f]
        [(zero? n) #t]
        [else (> (sub1 m) (sub1 n))]))

(define (< m n)
  (cond [(zero? n) #f]
        [(zero? m) #t]
        [else (< (sub1 m) (sub1 n))]))

(> 10 9)
(> 9 9)
(> 9 10)
(> 0 0)
(> 0 1)
(> 1 0)

(< 10 9)
(< 9 9)
(< 9 10)
(< 0 0)
(< 0 1)
(< 1 0)

(define (= n m)
  (cond [(> n m) #f]
        [(< n m) #f]
        [else #t]))

(= 1 0)
(= 0 1)
(= 0 0)



