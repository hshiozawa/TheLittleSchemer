(define (a-pair? x)
  (cond [(atom? x) #f]
        [(null? x) #f]
        [(null? (cdr x)) #f]
        [(null? (cdr (cdr x))) #t]
        [else #f]))

(define (align para)
  (cond [(atom? para) para]
        [(a-pair? (first para))
                  (align (shift para))]
        [else (build (first para)
                     (align (second para)))]))


(align 'a)
(align '((a b) c))
(align '(a b c))
(align '((a b c) (c d)))
