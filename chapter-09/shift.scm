(define (shift x)
  (cons (car (car x))
        (cons
         (cons (car (cdr (car x))) (cdr x))
         '())))

(define (first x)
  (car x))

(define (second x)
  (car (cdr x)))

(define (build a1 a2)
  (cons a1 (cons a2 '())))

(define (shift x)
  (build (first (first x))
         (build (second (first x))
                (second x))))

(shift '((a b) c))
(shift '((a b) (c d)))
