(define (addtup tup)
  (cond [(null? tup) 0]
        [else (+ (car tup) (addtup (cdr tup)))]))

(addtup '(1 2 3 4 5))

(define (* n m)
  (cond [(zero? m) 0]
        [else (+ n (* n (sub1 m)))]))

(* 3 4)

(define (tup+ tup1 tup2)
  (cond [(null? tup1) tup2]
        [(null? tup2) tup1]
        [else (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))]))


(tup+ '(1 2 3) '(4 5 6))
(tup+ '(1 2) '(4 5 6))
(tup+ '(1 2 3) '(4 5))

