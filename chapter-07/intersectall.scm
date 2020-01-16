(define (intersect set1 set2)
  (cond [(null? set1) '()]
        [(member? (car set1) set2)
         (cons (car set1) (intersect (cdr set1) set2))]
        [else (intersect (cdr set1) set2)]))

(define (intersectall l-set)
  (cond [(null? l-set) '()]
        [(null? (cdr l-set)) (car l-set)]
        [else (intersect (car l-set) (intersectall (cdr l-set)))]))


(intersectall '((1 2 3)
                (3 4 5)
                (3 6 7)
                (8 9 3)))
