(define (subset? set1 set2)
  (cond [(and (null? set1) (null? set2)) #t]
        [(or (null? set1)) #t]
        [(or (null? set2)) #f]
        [else (and (member? (car set1) set2)
                   (subset? (cdr set1) set2))]))

(define (subset? set1 set2)
  (cond  [(null? set1) #t]
         [(member? (car set1) set2)
          (subset? (cdr set1) set2)]
         [else #f]))

(define (subset? set1 set2)
  (cond  [(null? set1) #t]
         [else (and (member? (car set1) set2)
                    (subset? (cdr set1) set2))]))

(subset? '() '())
(subset? '(A) '())
(subset? '() '(B))
(subset? '(A) '(B))
(subset? '(A) '(B A))
(subset? '(A B) '(B A))
(subset? '(A B C) '(B A))
      
