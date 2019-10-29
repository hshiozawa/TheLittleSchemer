(define (addtup tup)
  (cond [(null? tup) 0]
        [else (+ (car tup) (addtup (cdr tup)))]))

(addtup '(1 2 3 4 5))

(define (* n m)
  (cond [(zero? m) 0]
        [else (+ n (* n (sub1 m)))]))

(* 3 4)
