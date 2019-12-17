(define (union set1 set2)
  (cond [(null? set1) set2]
        [(member? (car set1) set2) (union (cdr set1) set2)]
        [else (cons (car set1) (union (cdr set1) set2))]))

(union '(A B C) '(B C A))

(union '(A C D E B) '(B C A))
        
