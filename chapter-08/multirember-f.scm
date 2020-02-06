(define (multirember a lat)
  (cond [(null? lat) '()]
        [(eq? a (car lat))
         (multirember a (cdr lat))]
        [else (cons (car lat) (multirember a (cdr lat)))]))

(multirember 'A '(A A A))
(multirember 'A '(A B A C A D))

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond [(null? lat) '()]
            [(test? a (car lat))
             ((multirember-f test?) a (cdr lat))]
            [else (cons (car lat)
                        ((multirember-f test?) a (cdr lat)))]))))

(multirember-f eq?)
             
        
