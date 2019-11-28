(define (value3 aexp)
  (cond [(atom? aexp) aexp]
        [(eq? '+ (operator aexp))
         (+ (value3 (1st-sub-exp aexp)) (value3 (2nd-sub-exp aexp)))]
        [(eq? '* (operator aexp))
         (* (value3 (1st-sub-exp aexp)) (value3 (2nd-sub-exp aexp)))]
        [(eq? '^ (operator aexp))
         (expt (value3 (1st-sub-exp aexp)) (value3 (2nd-sub-exp aexp)))]))
        
