(define (add1 n)
  (+ n 1))
(define (length l)
  (cond [(null? l) 0]
        [else (add1 (length (cdr l)))]))

(length '(1 2 3 4))

(lambda (l)
  (cond [(null? l) 0]
        [else (eternity (cdr l))])) '())

(lambda (l)
  (cond [(null? l) 0]
        [else (add1 (length-0 (cdr l)))]))

(lambda (l)
  (cond [(null? l) 0]
        [else (add1
               ((lambda (l)
                  (cond [(null? l) 0]
                        [else (eternity (cdr l))])) (cdr l)))]))
                
((lambda (l)
  (cond [(null? l) 0]
        [else (add1
               ((lambda (l)
                  (cond [(null? l) 0]
                        [else (eternity (cdr l))])) (cdr l)))])) '(a))


(define (add1 n)
  (+ n 1))

(define (eternity x)
  (eternity x))

((lambda (length)
   (lambda (l)
     (cond [(null? l) l]
           [else (add1 (length (cdr l)))])))
 eternity)

((lambda (length)
  (lambda (l)
    (cond [(null? l) 0]
          [else (add1 (length (cdr l)))])))
 eternity))

(((lambda (length)
  (lambda (l)
    (cond [(null? l) 0]
          [else (add1 (length (cdr l)))])))
 ((lambda (length)
    (lambda (l)
      (cond [(null? l) 0]
            [else (add1 (length (cdr l)))])))
  eternity)) '(a))

(((lambda (length)
   (lambda (l)
     (cond [(null? l) 0]
           [else (add1 (length (cdr l)))])))
 ((lambda (length)
    (lambda (l)
      (cond [(null? l) 0]
            [else (add1 (length (cdr l)))])))
  ((lambda (length)
     (lambda (l)
       (cond [(null? l) 0]
             [else (add1 (length (cdr l)))])))
   eternity))) '(a b c))

           
