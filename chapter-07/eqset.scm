(define (eqset? set1 set2)
  (and (subset? set1 set2)
       (subset? set2 set1)))

(eqset? '() '())
(eqset? '(A) '(A))
(eqset? '(A) '(B A))
(eqset? '(B A) '(B A))
                   
