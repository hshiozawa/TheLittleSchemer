(define (insertL* new old l)
  (cond [(null? l) '()]
        [(atom? (car l))
         (cond [(eq? old (car l)) (cons new (cons old (insertL* new old (cdr l))))]
               [else (cons (car l) (insertL* new old (cdr l)))])]
        [else (cons (insertL* new old (car l))
                    (insertL* new old (cdr l)))]))

(insertL* 'pecker
          'chuck
          '((how much (wood))
            could
            ((a (wood) chuck))
            (((chuck)))
            (if (a) ((wood chuck)))
            could chuck wood))
