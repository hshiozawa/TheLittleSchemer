(define (fact n)
  (cond [(= n 1) 1]
        [else (* n (fact (- n 1)))]))

(define (fact&co n col)
  (cond [(= n 1) (col 1)]
        [else (fact&co (- n 1)
                       (lambda (x)
                         (col (* n x))))]))

(fact&co 6 (lambda (x) x))
-> (fact&co 5 (lambda (a)
                ((lambda (x) x)
                 (* 6 a))))

-> (fact&co 4 (lambda (b)
                ((lambda (a)
                   ((lambda (x) x)
                    (* 6 a)))
                 (* 5 b))))

-> (fact&co 3 (lambda (c)
                ((lambda (b)
                   ((lambda (a)
                      ((lambda (x) x)
                       (* 6 a)))
                    (* 5 b)))
                 (* 4 c))))

-> (fact&co 2 (lambda (d)
                ((lambda (c)
                   ((lambda (b)
                      ((lambda (a)
                         ((lambda (x) x)
                          (* 6 a)))
                       (* 5 b)))
                    (* 4 c)))
                 (* 3 d))))

-> (fact&co 1 (lambda (e)
                ((lambda (d)
                   ((lambda (c)
                      ((lambda (b)
                         ((lambda (a)
                            ((lambda (x) x)
                             (* 6 a)))
                          (* 5 b)))
                       (* 4 c)))
                    (* 3 d)))
                 (* 2 e))))

-> ((lambda (e)
      ((lambda (d)
         ((lambda (c)
            ((lambda (b)
               ((lambda (a)
                  ((lambda (x) x)
                   (* 6 a)))
                (* 5 b)))
             (* 4 c)))
          (* 3 d)))
       (* 2 e)))
    1)


(fact&co 2 (lambda (a)
             ((lambda (x) x)
              (* 3 a))))

(fact&co 1 (lambda (b)
             ((lambda (a)
                ((lambda (x) x)
                 (* 3 a)))
              (* 2 b))))

((lambda (b)
   ((lambda (a)
      ((lambda (x) x)
       (* 3 a)))
    (* 2 b)))
 1)
