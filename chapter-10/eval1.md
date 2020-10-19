## 適用するコード
```scheme
((((lambda (y)
     (lambda (x)
       (lambda (f)
         (f x y))))
   2)
  1)
 (lambda (a b)
   (cons a b)))
;; => (1 . 2)
```

## value による評価

```scheme
(value
 '((((lambda (y)
       (lambda (x)
         (lambda (f)
           (f x y))))
     2)
    1)
   (lambda (a b)
     (cons a b))))
```

↓ value を評価

```scheme
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
```

↓ meaning を評価

```scheme
(apply
 (meaning '(((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2)
            1) '())
 (evlis '((lambda (a b)
            (cons a b))) '()))
```

↓ evlis を評価

```scheme
(apply
  (meaning '(((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2)
            1) '())
  '((non-primitive (() (a b) (cons a b)))))
```

↓ meaning を評価

``` scheme
(apply
 (apply
  (meaning '((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2) '())
  (evlis '(1) '()))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ evlis を評価

```scheme
(apply
 (apply
  (meaning '((lambda (y)
               (lambda (x)
                 (lambda (f)
                   (f x y))))
             2) '())
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ meaning を評価

```scheme
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
```

↓ evlis を評価

```scheme
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
```

↓ meaning を評価

```scheme
(apply
 (apply
  (apply
   '(non-primitive (() (y) (lambda (x)
                             (lambda (f)
                               (f x y)))))
   '(2))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ 一番内側の apply を評価

```scheme
(apply
 (apply
  (apply-closure
   '(() (y) (lambda (x)
              (lambda (f)
                (f x y))))
   '(2))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ apply-closure を評価
```scheme
(apply
 (apply
  (meaning '(lambda (x)
              (lambda (f)
                (f x y)))
           '(((y) (2))))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ meaning を評価

```scheme
(apply
 (apply
  '(non-primitive ((((y) (2))) (x) (lambda (f)
                                     (f x y))))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ apply を評価

```scheme
(apply
 (apply-closure
  '((((y) (2))) (x) (lambda (f)
                      (f x y)))
  '(1))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ apply-closure を評価

```scheme
(apply
 (meaning '(lambda (f)
             (f x y))
          '(((x) (1)) ((y) (2))))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ meaning を評価

```scheme
(apply
 '(non-primitive ((((x) (1)) ((y) (2))) (f) (f x y)))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ apply を評価

```scheme
(meaning '(f x y)
         '(((f) ((non-primitive (() (a b) (cons a b)))))
           ((x) (1)) ((y) (2))))
```

↓ meaning を評価

```scheme
(apply
 (meaning 'f
          '(((f) ((non-primitive (() (a b) (cons a b)))))
            ((x) (1)) ((y) (2))))
 (evlis '(x y)
        '(((f) ((non-primitive (() (a b) (cons a b)))))
          ((x) (1)) ((y) (2)))))
```

↓ evlis を評価

```scheme
(apply
 (meaning 'f
          '(((f) ((non-primitive (() (a b) (cons a b)))))
            ((x) (1)) ((y) (2))))
 '(1 2))
```

↓ meaning を評価

```scheme
(apply
 (*identifier 'f
          '(((f) ((non-primitive (() (a b) (cons a b)))))
            ((x) (1)) ((y) (2))))
 '(1 2))
```

↓ identifier を評価

```scheme
(apply
 '(non-primitive (() (a b) (cons a b)))
 '(1 2))
```

↓ apply を評価

```scheme
(meaning
 '(cons a b)
 '(((a b) (1 2))))
```

↓ meaning を評価

```scheme
(apply
 (meaning 'cons '(((a b) (1 2))))
 (evlis '(a b) '(((a b) (1 2)))))
```

↓ evlis を評価

```scheme
(apply
 (meaning 'cons '(((a b) (1 2))))
 '(1 2))
```

↓ meaning を評価

```scheme
(apply
 '(primitve cons)
 '(1 2))
```

↓ apply を評価

```scheme
(cons 1 2)
```

↓ cons を評価

```scheme
(1 . 2)
```