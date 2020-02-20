(define (multirember a lat)
  (cond [(null? lat) '()]
        [(eq? a (car lat))
         (multirember a (cdr lat))]
        [else (cons (car lat) (multirember a (cdr lat)))]))

(multirember 'A '(A A A))
(multirember 'A '(A B A C A D))

(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond [(null? lat) '()]
            [(test? a (car lat))
             ((multirember-f test?) a (cdr lat))]
            [else (cons (car lat)
                        ((multirember-f test?) a (cdr lat)))]))))

(multirember-f eq?)

(define eq?-c
  (lambda (k)
    (lambda (a)
      (eq? k a))))
    
(define eq?-tuna
  (eq?-c 'tuna))

(define multirember-t
  (lambda (test? lat)
    (cond [(null? lat) '()]
          [(test? (car lat))
           (multirember-t test? (cdr lat))]
          [else (cons (car lat)
                      (multirember-t test? (cdr lat)))])))

(multirember-t eq?-tuna '(a b c tuna a b c tuna))

(define (a-friend x y)
  (null? y))

#|
a:'a, lat:'(), c:a-friend
-> (a-friend '() '())
-> #t

a:'a, lat:'(a), c:a-friend
-> (multirember 'a '() (lambda (newlat seen) (a-friend newlat (cons 'a seen))))
-> (lambda ('() '()) (a-friend '() (cons 'a '())))
-> #f

a:'a lat: '(b a), c:a-friend
-> (multirember 'a '(a) new-friend)
   new-friend = (lambda (newlat seen) (a-friend (cons 'b newlat) seen)))
-> (multirember 'a '() newnew-friend)
   newnew-friend = (lambda (newlat seen) (new-friend newlat (cons 'a seen))))
-> (newnewfriend '() '())
-> (new-friend '() (a))
-> (a-friend '(b) '(a))
-> #f
|#

(define (multirember&co a lat col)
  (cond [(null? lat) (col '() '())]
        [(eq? 'a (car lat))
         (multirember&co 'a (cdr lat)
                         #?=(lambda (newlat seen)
                           (col newlat (cons (car lat) seen))))]
        [else
         (multirember&co 'a (cdr lat)
                         #?=(lambda (newlat seen)
                           (col (cons (car lat) newlat) seen)))]))

(multirember&co 'a '(a b c a d e) (lambda (a b) (list a b)))
(multirember&co 'a '(a b c a d e) (lambda (a b) a))
