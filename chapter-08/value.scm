(define (operator exp)
  (car (cdr exp)))
(define (1st exp)
  (car exp))
(define (2nd exp)
  (car (cdr (cdr exp))))
  
(define (value nexp)
  (cond [(atom? nexp) nexp]
        [(eq? '+ (operator nexp))
         (+ (value (1st nexp)) (value (2nd nexp)))]
        [(eq? '* (operator nexp))
         (* (value (1st nexp)) (value (2nd nexp)))]
        [(eq? '^ (operator nexp))
         (exp (value (1st nexp)) (value (2nd nexp)))]))

(value '(1 + 2))
(value '((1 + 2) + (2 + 2)))

(define (atom-to-function x)
  (cond [(eq? '+ x) +]
        [(eq? '* x) *]
        [(eq? '^ x) exp]))

(define (value nexp)
  (cond [(atom? nexp) nexp]
        [((atom-to-function (operator nexp)) (value (1st nexp)) (value (2nd nexp)))]))
         
        
