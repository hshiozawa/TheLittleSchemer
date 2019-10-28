(define o-
  (lambda (a b)
    (cond [(zero? b) a]
          [else (sub1 (o- a (sub1 b)))])))

(o- 3 2)
(o- 3 1)
