(define (revrel rel)
  (cond [(null? rel) '()]
        [else (cons
               (build (second (car rel)) (first (car rel)))
               (revrel (cdr rel)))]))

(define (revpair pair)
  (build (second pair) (first pair)))

(define (revrel rel)
  (cond [(null? rel) '()]
        [else (cons (revpair (car rel)) (revrel (cdr rel)))]))
         

(revrel '((1 2) (2 4) (5 7) (9 8)))
