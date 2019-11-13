(define (equal? s1 s2)
  (cond [(and (atom? s1) (atom? s2)) (eqan? s1 s2)]
        [(atom? s1) #f]
        [(atom? s2) #f]
        [else (eqlist? s1 s2)]))

(define (equal? s1 s2)
  (cond [(and (atom? s1) (atom? s2)) (eqan? s1 s2)]
        [(or (atom? s1) (atom? s2)) #f]
        [else (eqlist? s1 s2)]))

(equal? 'a 'a)
(equal? 'a '())
(equal? '() '())
(equal? '(a) '(a)) 
