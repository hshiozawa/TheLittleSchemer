(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define (a-pair? x)
  (cond [(atom? x) #f]
        [(null? x) #f]
        [(null? (cdr x)) #f]
        [(null? (cdr (cdr x))) #t]
        [else #f]))

(define (align para)
  (cond [(atom? para) para]
        [(a-pair? (first para))
                  (align (shift para))]
        [else (build (first para)
                     (align (second para)))]))

(define (length* para)
  (cond [(null? para) 0]
        [(atom? (car para)) (+ 1 (length* (cdr para)))]
        [else (+ (length* (car para)) (length* (cdr para)))]))

(define (length* para)
  (cond [(atom? para) 1]
        [else (+ (length* (first para))
                 (length* (second para)))]))

(define (weight* para)
  (cond [(atom? para) 1]
        [else (+ (* (weight* (first para)) 2)
                 (weight* (second para)))]))

(align 'a)
(align '((a b) c))
(align '(a b c))
(align '((a b c) (c d)))

(length* '(a b))
(length* '((b c) (d e)))
(weight* '(a b))
(weight* '((b c) c))
