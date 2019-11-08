(define (insertR* old new l)
  (cond [(null? l) '()]
        [(atom? (car l))
         (cond [(eq? old (car l))
                (cons old (cons new (insertR* old new (cdr l))))]
               [else (cons (car l) (insertR* old new (cdr l)))])]
        [else (cons (insertR* old new (car l)) (insertR* old new (cdr l)))]))

(insertR* 'a 'A '(a b a b c))
(insertR* 'chuck 'roast '((how much (wood))
                           could
                           ((a (wood) chuck))
                           (((chuck)))
                           (if (a) ((wood chuck)))
                           could chuck wood))
