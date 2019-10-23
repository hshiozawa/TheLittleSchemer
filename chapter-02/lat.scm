(define (lat? lis)
  (cond [(atom? lis) #f]
        [(null? lis) #t]
        [(atom? (car lis)) (lat? (cdr lis))]
        [else #f]))

(lat? 'a)
(lat? '())
(lat? '(A))
(lat? '(A B C))
(lat? '((A) B C))
                    
              
