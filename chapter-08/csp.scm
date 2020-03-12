(define (return x) x)

(define (k+ a b k)
  (k (+ a b)))

(define (k* a b k)
  (k (* a b)))

(define (fact n)
  (cond [(= n 1) 1]
        [else (* n (fact (- n 1)))]))

(define (kfact n k)
  (cond [(= n 1) (k 1)]
        [else (kfact (- n 1)
                     (lambda (x) (k (* n x))))]))

(define (return x) x)
(kfact 1 return)
-> (return 1)
(kfact 2 return)
-> (kfact 1 (lambda (x) (return (* 2 x))))
-> ((lambda (x) (return (* 2 x))) 1)
(kfact 3 (lambda (x) x))
-> (kfact 2 (lambda (x1) (return (* 3 x1))))
-> (kfact 1 (lambda (x2)
              ((lambda (x1) (return (* 3 x1)))
               (* 2 x2))))
-> ((lambda (x2)
      ((lambda (x1) (return (* 3 x1)))
       (* 2 x2)))
    1)

              
              


                                      

                                      
         
