;;;----
((((lambda (y)
     (lambda (x)
       (lambda (f)
         (f x y))))
   2)
  1)
 (lambda (a b)
   (cons a b)))
;; => (1 . 2)
;;;----
(value
 '((((lambda (y)
       (lambda (x)
         (lambda (f)
           (f x y))))
     2)
    1)
   (lambda (a b)
     (cons a b))))
;; ↓ value を評価
(meaning
  '((((lambda (y)
       (lambda (x)
         (lambda (f)
           (f x y))))
     2)
    1)
   (lambda (a b)
     (cons a b)))
  '())
;; ↓ meaning を評価
(apply
 (meaning '(((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2)
            1) '())
 (evlis '((lambda (a b)
            (cons a b))) '()))
;; ↓ evlis を評価
(apply
  (meaning '(((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2)
            1) '())
  '((non-primitive (() (a b) (cons a b)))))

;; ↓ meaning を評価
(apply
 (apply
  (meaning '((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2) '())
  (evlis '(1) '()))
 '((non-primitive (() (a b) (cons a b)))))
;; ↓ elvis を評価
(apply
 (apply
  (meaning '((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2) '())
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; ↓ meaning を評価
(apply
 (apply
  (apply
   (meaning '(lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
            '())
   (evlis '(2) '()))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; ↓ evlis を評価
(apply
 (apply
  (apply
   (meaning '(lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
            '())
   '(2))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; ↓ meaning を評価
(apply
 (apply
  (apply
   '(non-primitive (() (y) (lambda (x)
                             (lambda (f)
                               (f x y)))))
   '(2))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; 一番内側の apply を評価
