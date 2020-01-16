(define (a-pair? x)
  (cond [(atom? x) #f]
        [(null? x) #f]
        [(null? (cdr x)) #f]
        [(null? (cdr (cdr x))) #t]
        [else #f]))

(define (first x)
  (car x))

(define (second x)
  (car (cdr x)))

(define (build a1 a2)
  (cons a1 (cons a2 '())))

(define (fun? rel)
  (set? (firsts rel)))

(define (fullfun? rel)
  (set? (seconds rel)))

(define (seconds lat)
  (cond [(null? lat) '()]
        [else (cons (second (car lat)) (seconds (cdr lat)))]))

(define (one-to-one? rel)
  (fun? (revrel rel)))

(a-pair? '(1 2))

(a-pair? '(1))

(a-pair? '(1 2 3))

(fun? '((1 2) (2 4) (3 4)))

(fun? '((1 2) (2 4) (2 4)))

(seconds '((1 2) (2 4) (2 4)))

(fullfun? '((1 2) (2 4) (3 4)))

(fullfun? '((1 2) (2 4) (2 3)))


