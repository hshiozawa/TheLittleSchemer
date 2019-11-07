(define (rember* a l)
  (cond [(null? l) '()]
        [(pair? (car l)) (cons (rember* a (car l)) (rember* a (cdr l)))]
        [(eq? a (car l)) (rember* a (cdr l))]
        [else (cons (car l) (rember* a (cdr l)))]))

(define (rember* a l)
  (cond [(null? l) '()]
        [(atom? (car l))
         (cond [(eq? a (car l)) (rember* a (cdr l))]
               [else (cons (car l) (rember* a (cdr l)))])]
        [else (cons (rember* a (car l)) (rember* a (cdr l)))]))
               

(rember* 'a '(a b c a b c))
(rember* 'cup '((cofee) cup ((tea) cup)
                (and (hick)) cup))
(rember* 'sauce '(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce)))
