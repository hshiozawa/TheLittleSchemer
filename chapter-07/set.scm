(define (member? a lat)
  (cond [(null? lat) #f]
        [(equal? (car lat) a) #t]
        [else (member? a (cdr lat))]))

(define (set? lat)
  (cond [(null? lat) #t]
        [(member? (car lat) (cdr lat)) #f]
        [else (set? (cdr lat))]))

(define (set? lat)
  (or (null? lat)
      (and (not (member? (car lat) (cdr lat)))
           (set? (cdr lat)))))

(define (makeset lat)
  (cond ((null? lat) '())
        ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
        (else (cons (car lat) (makeset (cdr lat))))))

(define (makeset lat)
  (cond [(null? lat) '()]
        [else (cons (car lat)
                    (makeset (multirember (car lat) (cdr lat))))]))

(set? '(A B C D))

(makeset '())
(makeset '(A B C D))
(makeset '(A B A D))
(makeset '(A B A A B D))
-> (A B B D)
-> (A B D)
-> (A B D)

