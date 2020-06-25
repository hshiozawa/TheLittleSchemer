(define (revpair pair)
  (build (second pair)
         (first pair)))

(define (shuffle pora)
  (cond [(atom? pora) pora]
        [(a-pair? (first pora))
         (shuffle (revpair pora))]
        [else (build (first pora)
                     (shuffle (second pora)))]))
