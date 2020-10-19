(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define (build a b)
  (cons a (cons b '())))

(define (first x)
  (car x))

(define (second x)
  (car (cdr x)))

(define (third x)
  (car (cdr (cdr x))))

(define new-entry build)

(define x (new-entry '(a b c) '(1 2 3)))

(define y (new-entry '(d a e) '(4 5 6)))

(define z (new-entry '(f g h) '(7 8 9)))

(define (lookup-in-entry-help name keys values entry-f)
  (cond [(null? keys) (entry-f name)]
        [(eq? name (car keys)) (car values)]
        [else (lookup-in-entry-help
               name (cdr keys) (cdr values) entry-f)]))

(define (lookup-in-entry name entry entry-f)
  (lookup-in-entry-help name
                        (first entry)
                        (second entry)
                        entry-f))

(lookup-in-entry 'f z (lambda (x) #f))

(lookup-in-entry 'c x (lambda (name) #f))

(define extend-table cons)

(define env (extend-table x (extend-table y (extend-table z '()))))

(define (lookup-in-table name table table-f)
  (cond [(null? table) (table-f name)]
        [else (lookup-in-entry
               name (car table)
               (lambda (name)
                 (lookup-in-table name (cdr table) table-f)))]))

(lookup-in-table 'h env (lambda (name) #f))

;; (cons rep-car
;;       (cons (cons rep-quote
;;                   (cons
;;                    (cons rep-a
;;                          (cons rep-b
;;                                (cons rep-c
;;                                      '())))
;;                   '()))
;;             '()))

;; '(car (quote (a b c)))

(define (expression-to-action e)
  (format #t "expression-to-action [e=~a]~%" e)
  (cond [(atom? e) (atom-to-action e)]
        [else (list-to-action e)]))

(define (atom-to-action e)
  (format #t "atom-to-action [e=~a]~%" e)
  (cond [(number? e) *const]
        [(eq? e #t) *const]
        [(eq? e #f) *const]
        [(eq? e (quote cons)) *const]
        [(eq? e (quote car)) *const]
        [(eq? e (quote cdr)) *const]
        [(eq? e (quote null?)) *const]
        [(eq? e (quote eq?)) *const]
        [(eq? e (quote atom?)) *const]
        [(eq? e (quote zero?)) *const]
        [(eq? e (quote add1)) *const]
        [(eq? e (quote sub1)) *const]
        [(eq? e (quote number?)) *const]
        [else *identifier]))

(expression-to-action 'cons)

(define (list-to-action e)
  (cond [(atom? (car e))
         (cond [(eq? (car e) (quote quote)) *quote]
               [(eq? (car e) (quote lambda)) *lambda]
               [(eq? (car e) (quote cond)) *cond]
               [else *application])]
        [else *application]))

(define (value e)
  (meaning e '()))

(define (meaning e table)
  (format #t "meaning [e=~a]~%" e)
  ((expression-to-action e) e table))

(value '#t)
(value '#f)
(value 'cons)
(value '1)

(define (*const e table)
  (format #t "const [e=~a]~%" e)
  (cond [(number? e) e]
        [(eq? e #t) #t]
        [(eq? e #f) #f]
        [else (build (quote primitive) e)]))

(define (*quote e table)
  (text-of e))

(define text-of second)

(value (quote (quote (1 2 3))))

(define (*identifier e table)
  (lookup-in-table e table initial-table))

(define (initial-table name)
  (car '()))

(meaning (quote b) '(((a b) (1 3)) ))

(define (*lambda e table)
  (build 'non-primitive (cons table (cdr e))))

(define table-of first)
(define formals-of second)
(define body-of third)

(value (quote (lambda (x) (cons x '()))))

(define (evcon lines table)
  (cond [(else? (question-of (car lines)))
         (meaning (answer-of (car lines)) table)]
        [(meaning (question-of (car lines)) table)
         (meaning (answer-of (car lines)) table)]
        [else (evcon (cdr lines) table)]))

(define (else? e)
  (cond [(atom? e) (eq? e (quote else))]
        [else #f]))               

(define question-of first)
(define answer-of second)

(evcon (quote ((#f 1) (#f 2) (else 3))) '())
(evcon (quote ((#t 1) (#f 2) (else 3))) '())

(define (*cond e table)
  (evcon (cond-lines-of e) table))
(define cond-lines-of cdr)

(value (quote (cond (#f 1) (#f 2) (else 3))))
(value (quote (cond (#t 1) (#f 2) (else 3))))

(*cond (quote (cond (cofee klatsch) (klatsch party)))
       '(((cofee) (#f))
         ((klatsch party) (5 (6)))))

(define (evlis args table)
  (cond [(null? args) '()]
        [else (cons (meaning (car args) table)
                    (evlis (cdr args) table))]))

(define (*application e table)
  (apply (meaning (function-of e) table)
         (evlis (arguments-of e) table)))

(define function-of car)
(define arguments-of cdr)

(define (primitive? l)
  (eq? (first l) (quote primitive)))
(define (non-primitive? l)
  (eq? (first l) (quote non-primitive)))

(define (apply fun vals)
  (cond [(primitive? fun) (apply-primitive (second fun) vals)]
        [(non-primitive? fun) (apply-closure (second fun) vals)]))

(define (apply-primitive e vals)
  (format #t "prim[e=~a, vals=~a]~%" e vals)
  (cond [(eq? e (quote cons)) (cons (first vals) (second vals))]
        [(eq? e (quote car)) (car (first vals))]
        [(eq? e (quote cdr)) (cdr (first vals))]
        [(eq? e (quote null?)) (null? (first vals))]
        [(eq? e (quote eq?)) (eq? (first vals) (second vals))]
        [(eq? e (quote atom?)) (atom?? (first vals) (second vals))]
        [(eq? e (quote zero?)) (zero? (first vals))]
        [(eq? e (quote add1)) (add1 (first vals))]
        [(eq? e (quote sub1)) (sub1 (first vals))]
        [(eq? e (quote number?)) (number? (first vals))]))

(define (atom?? x)
  (cond [(atom? x) #t]
        [(null? x) #f]
        [(eq? (car x) (quote primitve)) #t]
        [(eq? (car x) (quote non-primitve)) #f]
        [else #f]))

;; 非基本関数（クロージャ）を適用するということ。
;; → (formals vals) でテーブルを拡張して、body を評価する
(define (apply-closure closure vals) 
  (meaning (body-of closure)
           (extend-table
            (new-entry (formals-of closure) vals)
            (table-of closure))))

(meaning '(lambda (x y) (cons z x))
         '(((u v w) (1 2 3)) ((x y z) (4 5 6))))

(meaning '((lambda (x) x) 1) '())

(meaning '((lambda (x y) (cons z x)) (quote (a b c)) (quote (d e f)))
         '(((u v w) (1 2 3)) ((x y z) (4 5 6))))

(cons '(1 2 3) (cons '(4 5 6) '()))

