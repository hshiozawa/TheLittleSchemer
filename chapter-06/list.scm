(define (sero? n)
  (null? n))

(define (edd1 n)
  (cons '() n))

(define (zub1 n)
  (cdr n))

(define (add n m)
  (cond [(sero? m) n]
        [else (edd1 (add n (zub1 m))]))

(add '(() () ()) '(() () ()))
