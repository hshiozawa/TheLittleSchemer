(define subst
  (lambda (new old lat)
    (cond [(null? lat) '()]
          [(eq? old (car lat)) (cons new (cdr lat))]
          [else (cons (car lat) (subst new old (cdr lat)))])))

(define subst2
  (lambda (new o1 o2 lat)
    (cond [(null? lat) '()]
          [(or (eq? o1 (car lat)) (eq? o2 (car lat)))
           (cons new (cdr lat))]
          [else (cons (car lat) (subst2 new o1 o2 (cdr lat)))])))

(define multisubst
  (lambda (new old lat)
    (cond [(null? lat) '()]
          [(eq? old (car lat))
           (cons new (multisubst new old (cdr lat)))]
          [else (cons (car lat) (multisubst new old (cdr lat)))])))
                
           

(subst 'd 'A '(a b c A e f g))
(subst2 'd 'A 'B '(a b c A e f g))
(subst2 'd 'A 'B '(a b c B e f g))
(multisubst 'd 'A '(a b c A e f g A))          
