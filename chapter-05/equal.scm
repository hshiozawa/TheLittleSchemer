(define (equal? s1 s2)
  (cond [(and (atom? s1) (atom? s2)) (eqan? s1 s2)]
        [(atom? s1) #f]
        [(atom? s2) #f]
        [else (eqlist? s1 s2)]))

(define (equal? s1 s2)
  (cond [(and (atom? s1) (atom? s2)) (eqan? s1 s2)]
        [(or (atom? s1) (atom? s2)) #f]
        [else (eqlist? s1 s2)]))

(define (eqlist l1 l2)
  (cond [(and (null? l1) (null? l2)) #t]
        [(or (null? l1) (null? l2)) #f]
        [else (and (equal? (car l1) (car l2))
                   (equal? (cdr l1) (cdr l2)))]))        

(equal? 'a 'a)
(equal? 'a '())
(equal? '() '())
(equal? '(a) '(a))
(equal? '((a) b) '((a) b c))
