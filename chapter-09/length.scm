(define (add1 n)
  (+ n 1))

(define (length l)
  (cond [(null? l) 0]
        [else (add1 (length (cdr l)))]))

(length '(1 2 3 4))

(lambda (l)
  (cond [(null? l) 0]
        [else (eternity (cdr l))])) '()

((lambda (l)
  (cond [(null? l) 0]
        [else (eternity (cdr l))])) '())

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

((lambda (l)
  (cond [(null? l) 0]
        [else (add1
               ((lambda (l)
                  (cond [(null? l) 0]
                        [else (eternity (cdr l))])) (cdr l)))])) '())


(define (add1 n)
  (+ n 1))

(define (eternity x)
  (fuga x))

((lambda (length) ;=> eternity
   (lambda (l)
     (cond [(null? l) l]
           [else (add1 (length (cdr l)))])))
 eternity)

(((lambda (length)
   (lambda (l)
     (cond [(null? l) 0]
           [else (add1 (length (cdr l)))])))
 eternity) '())

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
   eternity))) '(a b))

;; mk-length
(((lambda (mk-length)
   (mk-length eternity))
 (lambda (length)
   (lambda (l)
     (cond [(null? l) 0]
           [else (add1 (length (cdr l)))]))))
 '())

(((lambda (mk-length)
    (mk-length
     (mk-length eternity)))
 (lambda (length)
   (lambda (l)
     (cond [(null? l) 0]
           [else (add1 (length (cdr l)))]))))
 '(a))

((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond [(null? l) 0]
           [else (add1 (mk-length (cdr l)))]))))

((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   ((lambda (length)
      (lambda (l)
        (cond [(null? l) 0]
              [else (add1
                     (length
                      (cdr l)))])))
    (mk-length mk-length))))
  
(((lambda (mk-length)
    (mk-length mk-length))
  (lambda (mk-length)
    (lambda (l)
      (cond [(null? l) 0]
            [else (add1
                   ((mk-length mk-length)
                    (cdr l)))]))))
 '(apples 3 4))

((lambda (mk-length)
    (mk-length mk-length))
 (lambda (mk-length)
   ((lambda (length)
      (lambda (l)
        (cond [(null? l) 0]
              [else (add1
                     (length
                      (cdr l)))])))
    (mk-length mk-length))))

((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (add1 ((mk-length mk-length) (cdr l))))))))

(((lambda (self)
  (lambda (l)
    (cond ((null? l) 0)
          (else (add1 (self (cdr l)))))))
 (lambda (l)
   (cond ((null? l) 0)
         (else (add1 (self (cdr l)))))))
 '(a b))

(((lambda (le)
  ((lambda (f)
     (f f))
   (lambda (f)
     (le (lambda (x) ((f f) x))))))
 (lambda (length)
   (lambda (l)
     (cond [(null? l) 0]
           [else (add1 (length (cdr l)))]))))
'(1 2 3 4))
