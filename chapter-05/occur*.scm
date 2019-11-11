(define (occur* a l)
  (cond [(null? l) 0]
        [(atom? (car l))
         (cond [(eq? a (car l)) (add1 (occur* a (cdr l)))]
               [else (occur* a (cdr l))])]
        [else (+ (occur* a (car l)) (occur* a (cdr l)))]))

(occur* 'banana '((banana)
                  (split ((((banana ice)))
                          (cream (banana))
                          sherbet))
                  (banana)
                  (bread)
                  (banana brandy)))

         
                
