(define member?
  (lambda (lis a)
    (cond [(null? lis) #f]
          [(eq? (car lis) a) #t]
          [else (member? (cdr lis) a)])))

(member? '(a b) 'a)
(member? '(a b) 'c)
(member? '() 'a)
