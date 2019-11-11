(define (subst* new old l)
  (cond [(null? l) '()]
        [(atom? (car l))
         (cond [(eq? old (car l)) (cons new (subst* new old (cdr l)))]
               [else (cons (car l) (subst* new old (cdr l)))])]
        [else (cons (subst* new old (car l))
                    (subst* new old (cdr l)))]))

(subst* 'orange 'banana '((banana)
                          (split ((((banana ice)))
                                  (cream (banana))
                                  sherbet))
                          (banana)
                          (bread)
                          (banana brandy)))


                   
