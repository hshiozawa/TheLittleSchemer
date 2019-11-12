(define (leftmost l)
  (cond [(null? l) nil]
        [(atom? (car l)) (car l)]
        [else (leftmost (car l))]))

(leftmost '((potato) (chips ((with) fish) (chips))))
(leftmost '(((hot) (tuna (and))) cheese))

