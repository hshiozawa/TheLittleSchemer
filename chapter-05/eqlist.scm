(define (eqlist? l1 l2)
  (cond [(and (null? l1) (null? l2)) #t] ;1
        [(and (null? l1) (atom? (car l))) #f] ;2
        [(null? l1) #f] ;3
        [(and (atom? (car l1)) (null? l2)) #f] ;4
        [(and (atom? (car l1)) (atom? (car l2)))
         (and (eqan? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))] ;5
        [(atom? (car l1)) #f] ;6
        [(null? l2) #f] ;7 
        [(atom? l2) #f] ;8 
        [else (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))])) ; 9

(define (eqlist? l1 l2)
  (cond [(and (null? l1) (null? l2)) #t]
        [(or (null? l1) (null? l2)) #f]
        [(and (atom? (car l1)) (atom? (car l2)))
         (and (eq? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))]
        [(or (atom? (car l1)) (atom? (car l2))) #f]
        [else (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))]))
         

(eqlist? '(strawberry ice cream)
         '(strawberry ice cream))

(eqlist? '(strawberry ice cream)
         '(strawberry cream ice))

(eqlist? '(banana ((split)))
         '((banana) (split)))

(eqlist? '(beef ((sausage)) (and (soda)))
         '(beef ((salami)) (and (soda))))

(eqlist? '(beef ((sausage)) (and (soda)))
         '(beef ((sausage)) (and (soda))))
         
