(define o+
  (lambda (a b)
    (cond [(zero? b) a]
          [else (o+ (add1 a) (sub1 b))])))

(define o+
  (lambda (a b)
    (cond [(zero? b) a]
          [else (add1 (o+ a (sub1 b)))])))

(o+ 1 2)
(o+ 100 200)
