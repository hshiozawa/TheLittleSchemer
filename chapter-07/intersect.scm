(define (intersect? set1 set2)
  (cond [(null? set1) #f]
        [else (or (member? (car set1) set2)
                  (intersect? (cdr set1) set2))]))

(define (intersect set1 set2)
  (cond [(null? set1) '()]
        [(member? (car set1) set2)
         (cons (car set1) (intersect (cdr set1) set2))]
        [else (intersect (cdr set1) set2)]))


(intersect? '(A B C) '(D E F))
(intersect? '(A B C) '(D E F A))

(intersect '(A B C) '(D E F))
(intersect '(A B C) '(D E F A))
(intersect '(A B C) '(C D E F A B))
        
