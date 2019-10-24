(define insertR
  (lambda (new old lat)
    (cond [(null? lat) '()]
          [(eq? old (car lat)) (cons (car lat) (cons new (cdr lat)))]
          [else (cons (car lat) (insertR new old (cdr lat)))])))

(define insertL
  (lambda (new old lat)
    (cond [(null? lat) '()]
          [(eq? old (car lat)) (cons new lat)]
          [else (cons (car lat) (insertL new old (cdr lat)))])))

(define multiinsertR
  (lambda (new old lat)
    (cond [(null? lat) '()]
          [(eq? old (car lat))
           (cons (car lat) (cons new (multiinsertR new old (cdr lat))))]
          [else (cons (car lat) (multiinsertR new old (cdr lat)))])))

(define multiinsertL
  (lambda (new old lat)
    (cond [(null? lat) '()]
          [(eq? old (car lat))
           (cons new (cons old (multiinsertL new old (cdr lat))))]
          [else (cons (car lat) (multiinsertL new old (cdr lat)))])))         

(insertR 'e 'd '(a b c d f g h))
(insertL 'e 'f '(a b c d f g h))
(multiinsertR 'e 'd '(d a b c d f g h d))
(multiinsertL 'e 'd '(d a b c d f g h d))
           
          
           
