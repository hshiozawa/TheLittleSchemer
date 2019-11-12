(define (member* a l)
  (cond [(null? l) #f]
        [(atom? (car l))
         (or (eq? a (car l))
             (member* a (cdr l)))]
        [else (or (member* a (car l)) (member* a (cdr l)))]))

(member* 'chips '((potato) (chips ((with) fish) (chips))))
               
                
