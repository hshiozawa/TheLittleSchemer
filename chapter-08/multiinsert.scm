(define (multiinsertL new old lat)
  (cond [(null? lat) '()]
        [(eq? old (car lat))
         (cons new (cons old (multiinsertL new old (cdr lat))))]
        [else (cons (car lat) (multiinsertL new old (cdr lat)))]))

(multiinsertL 'a 'b '(b b b b))

(define (multiinsertR new old lat)
  (cond [(null? lat) '()]
        [(eq? old (car lat))
         (cons old (cons new (multiinsertR new old (cdr lat))))]
        [else (cons (car lat) (multiinsertR new old (cdr lat)))]))

(multiinsertR 'a 'b '(b b b b))

(define (multiinsertLR new oldL oldR lat)
  (cond [(null? lat) '()]
        [(eq? oldL (car lat))
         (cons new (cons oldL (multiinsertLR new oldL oldR (cdr lat))))]
        [(eq? oldR (car lat))
         (cons oldR (cons new (multiinsertLR new oldL oldR (cdr lat))))]
        [else (cons (car lat) (multiinsertLR new oldL oldR (cdr lat)))]))

(multiinsertLR 'a 'b 'c '(b c b c b c))

(multiinsertLR&co 'a 'b 'c '(b) (lambda (lat 0 0) lat))
                                          
(define (multiinsertLR&co new oldL oldR lat col)
  (cond [(null? lat) (col '() 0 0)]
        [(eq? oldL (car lat))
         (multiinsertLR&co new oldL oldR (cdr lat)
                           (lambda (newlat L R)
                             (col (cons new (cons oldL newlat)) (+ 1 L) R)))]
        [(eq? oldR (car lat))
         (multiinsertLR&co new oldL oldR (cdr lat)
                           (lambda (newlat L R)
                             (col (cons oldR (cons new newlat)) L (+ 1 R))))]
        [else
         (multiinsertLR&co new oldL oldR (cdr lat)
                           (lambda (newlat L R)
                             (col (cons (car lat) newlat) L R)))]))

(multiinsertLR&co 'a 'b 'c '(a b c d) (lambda (newlat L R) newlat))

(multiinsertLR&co 'a 'b 'c '() (lambda (newlat L R) newlat))
-> (lambda ('() 0 0) '())

(define f (lambda (newlat L R) newlat))
(multiinsertLR&co 'a 'b 'c '(x) f)
-> (multiinsertLR&co 'a 'b 'c '()
                     (lambda (newlat L R) (f (cons 'x newLat) L R)))
-> ((lambda (newlat L R) (f (cons 'x newLat) L R)) '() 0 0)

(define f (lambda (newlat L R) newlat))
(multiinsertLR&co 'a 'b 'c '(b x) f)
-> (multiinsertLR&co 'a 'b 'c '(x)
                     (lambda (newlat L R) (f (cons 'a (cons 'b newLat)) L R))
-> (multiinsertLR&co 'a 'b 'c '()
                     (lambda (newlat1 L1 R1
                                      ((lambda (newlat L R) (f (cons 'a (cons 'b newLat)) (+ L 1) R))
                                       (cons 'x newLat1 L1 R1)))))
-> ((lambda (newlat1 L1 R1
                     ((lambda (newlat L R) (f (cons 'a (cons 'b newLat)) (+ L 1) R))
                      (cons 'x newLat1) L1 R1)))) '() 0 0)
    



           
