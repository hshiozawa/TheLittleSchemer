(define (mul x y)
  (* x y))
  
(define (add x y)
  (+ x y))

(mul 3 4) ; => 12
(add 1 2) ; => 3

(define (mul&co x y col)
  (col (* x y)))
 
(define (add&co x y col)
  (col (+ x y)))

(mul&co 3 4 (lambda (n) n)) ; => 12
(add&co 1 2 (lambda (n) n)) ; => 3

(mul 3 (add 1 2)) ; => 9

(add&co 1 2
  (lambda (x)
    (mul&co 3 x
      (lambda (n)
        n))))

(mul (mul 2 3) (add 1 (add 1 2))) => 24

(add&co 1 2
  (lambda (x)
    (add&co 1 x
      (lambda (y)
        (mul&co 2 3
          (lambda (z)
            (mul&co y z
              (lambda (n)
                n))))))))

(add&co 1 2
  (lambda (x)
    (mul&co 3 x
      (lambda (n)
        n))))
