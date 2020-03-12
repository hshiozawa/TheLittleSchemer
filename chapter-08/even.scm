(define (even? n)
  (= (remainder n 2) 0))

(define (evens-only* lat)
  (cond [(null? lat) '()]
        [(atom? (car lat))
         (cond [(even? (car lat))
                (cons (car lat) (evens-only* (cdr lat)))]
               [else (evens-only* (cdr lat))])]
        [else (cons (evens-only* (car lat)) (evens-only* (cdr lat)))]))

(evens-only* '(1 2 3 4))

(evens-only* '((1 2 3 4)))
(evens-only* '(((1 2) (3 2 5) 4) 6))
(evens-only* '((9 1 2 8) 3 10 ((9 9) 7 6) 2))

(define (evens-only*&co lat col)
  (cond [(null? lat) (col '() 0 1)]
        [(atom? (car lat))
         (cond [(even? (car lat))
                (evens-only*&co
                 (cdr lat)
                 (lambda (newLat sum product)
                   (col (cons (car lat) newLat)
                        sum
                        (* (car lat) product))))]
               [else
                (evens-only*&co
                 (cdr lat)
                 (lambda (newLat sum product)
                   (col newLat
                        (+ (car lat) sum)
                        product)))])]
        [else (evens-only*&co
               (car lat)
               (lambda (al as ap)
                 (evens-only*&co
                  (cdr lat)
                  (lambda (dl ds dp)
                    (col (cons al dl)
                         (+ as ds)
                         (* ap dp))))))]))

(evens-only*&co
 '((9 1 2 8) 3 10 ((9 9) 7 6) 2)
 (lambda (l s p) (cons s (cons p l))))

(evens-only*&co lat col)
