(define (eq?-c a)
  (lambda (x) (eq? x a)))
      
(define eq?-salad (eq?-c 'salad))
