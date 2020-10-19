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
(apply
 (apply
  (apply-closure
   '(() (y) (lambda (x)
              (lambda (f)
                (f x y))))
   '(2))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; apply-closure を評価
(apply
 (apply
  (meaning '(lambda (x)
              (lambda (f)
                (f x y)))
           '(((y) (2))))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; meaning を評価
(apply
 (apply
  '(non-primitive ((((y) (2))) (x) (lambda (f)
                                     (f x y))))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; apply を評価
(apply
 (apply-closure
  '((((y) (2))) (x) (lambda (f)
                      (f x y)))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
;; apply-closure を評価
(apply
 (meaning '(lambda (f)
             (f x y))
          '(((x) (1)) ((y) (2))))
 '((non-primitive (() (a b) (cons a b)))))
;; meaning を評価
(apply
 '(non-primitive ((((x) (1)) ((y) (2))) (f) (f x y)))
 '((non-primitive (() (a b) (cons a b)))))
;; apply を評価
(meaning '(f x y)
         '(((f) ((non-primitive (() (a b) (cons a b)))))
           ((x) (1)) ((y) (2))))
;; meaning を評価
(apply
 (meaning 'f
          '(((f) ((non-primitive (() (a b) (cons a b)))))
            ((x) (1)) ((y) (2))))
 (evlis '(x y)
        '(((f) ((non-primitive (() (a b) (cons a b)))))
          ((x) (1)) ((y) (2)))))
;; evlis を評価
(apply
 (meaning 'f
          '(((f) ((non-primitive (() (a b) (cons a b)))))
            ((x) (1)) ((y) (2))))
 '(1 2))
;; meaning を評価
(apply
 (*identifier 'f
          '(((f) ((non-primitive (() (a b) (cons a b)))))
            ((x) (1)) ((y) (2))))
 '(1 2))
;; identifier を評価
(apply
 '(non-primitive (() (a b) (cons a b)))
 '(1 2))
;; apply を評価
(meaning
 '(cons a b)
 '(((a b) (1 2))))
;; meaning を評価
(apply
 (meaning 'cons '(((a b) (1 2))))
 (evlis '(a b) '(((a b) (1 2)))))
;; elivs を評価
(apply
 (meaning 'cons '(((a b) (1 2))))
 '(1 2))
;; meaning を評価
(apply
 '(primitve cons)
 '(1 2)))
;; apply を評価
(cons 1 2)
;; cons を評価
(1 . 2)

((lambda (f)
  ((lambda (x)
    ((lambda (y)
       (f x y))
     2))
   1))
 (lambda (a b)
   (cons a b)))
    
