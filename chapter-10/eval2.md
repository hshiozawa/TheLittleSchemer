## 適用するコード
``scheme
((lambda (f)
  ((lambda (x)
    ((lambda (y)
       (f x y))
     2))
   1))
  (lambda (a b)
    (cons a b)))
```

## value による評価
```scheme
(value '((lambda (f)
           ((lambda (x)
              ((lambda (y)
                 (f x y))
               2))
            1))
         (lambda (a b)
           (cons a b))))
```

↓ value を評価

```scheme
(meaning '((lambda (f)
             ((lambda (x)
                ((lambda (y)
                   (f x y))
                 2))
              1))
           (lambda (a b)
             (cons a b)))
         '())
```

↓ meaning を評価

```scheme
(apply
 (meaning '(lambda (f)
             ((lambda (x)
                ((lambda (y)
                   (f x y))
                 2))
              1))
             '())
 (evlis '((lambda (a b)
            (cons a b))) '()))
```

↓ evlis を評価

```scheme
(apply
 (meaning '(lambda (f)
             ((lambda (x)
                ((lambda (y)
                   (f x y))
                 2))
              1))
             '())
 '((non-primitive (() (a b) (cons a b)))))
```

↓ meanining を評価

```scheme
(apply
 '(non-primitive (() (f) ((lambda (x)
                            ((lambda (y)
                               (f x y))
                             2))
                          1)))
 '((non-primitive (() (a b) (cons a b)))))
```

↓ apply を評価

```scheme
(meaning '((lambda (x)
             ((lambda (y)
                (f x y))
              2))
           1)
         '(((f) ((non-primitive (() (a b) (cons a b)))))))
```

↓ meaning を評価

```scheme
(apply
 (meaning '(lambda (x)
             ((lambda (y)
                (f x y))
              2))
          '(((f) ((non-primitive (() (a b) (cons a b)))))))
 (evlis '(1) '(((f) ((non-primitive (() (a b) (cons a b))))))))
```

↓ evlis を評価

```scheme
(apply
 (meaning '(lambda (x)
             ((lambda (y)
                (f x y))
              2))
          '(((f) ((non-primitive (() (a b) (cons a b)))))))
 '(1))
```

↓ meaning を評価

```scheme
(apply
 '(non-primitive ((
                  (x)
                  ((lambda (y)
                     (f x y))
                   2)))
 '(1))
```

↓ apply を評価

```scheme
(meaning '((lambda (y)
             (f x y))
           2)
         '(((x) (1))
           ((f) ((non-primitive (() (a b) (cons a b)))))))
```

↓ meaning を評価

```scheme
(apply
 (meaning '(lambda (y)
             (f x y))
          '(((x) (1))
            ((f) ((non-primitive (() (a b) (cons a b)))))))
 (evlis '(2)
        '(((x) (1))
          ((f) ((non-primitive (() (a b) (cons a b))))))))
```

↓ evlis を評価

```scheme
(apply
 (meaning '(lambda (y)
             (f x y))
          '(((x) (1))
            ((f) ((non-primitive (() (a b) (cons a b)))))))
 '(2))
```

↓ meaning を評価

```scheme
(apply
 '(non-primitive ((((x) (1))
                   ((f) ((non-primitive (() (a b) (cons a b))))))
                  (y)
                  (f x y)))
 '(2))
```

↓ apply を評価

```scheme
(meaning '(f x y)
         '(((y) (2))
           ((x) (1))
           ((f) ((non-primitive (() (a b) (cons a b)))))))           
```

↓ meaning を評価

```scheme
(apply
 (meaning 'f
          '(((y) (2))
           ((x) (1))
           ((f) ((non-primitive (() (a b) (cons a b)))))))
 (evlis '(x y)
        '(((y) (2))
           ((x) (1))
           ((f) ((non-primitive (() (a b) (cons a b))))))))
```

↓ evlis を評価

```scheme
(apply
 (meaning 'f
          '(((y) (2))
           ((x) (1))
           ((f) ((non-primitive (() (a b) (cons a b)))))))
'(1 2))
```

↓ meaning を評価

```scheme
(apply
 '(non-primitive (() (a b) (cons a b)))
 '(1 2))
```

↓ apply を評価

```
(meaning '(cons a b)
         '(((a b) (1 2))))
```

↓ meaning を評価

```scheme
(apply
 (meaning 'cons '(((a b) (1 2))))
 (evlis '(a b) '(((a b) (1 2)))))
```

↓ elivs を評価

```scheme
(apply
 (meaning 'cons '(((a b) (1 2))))
 '(1 2))
```

↓ meaning を評価

```scheme
(apply
 '(primitve cons)
 '(1 2)))
```

↓ apply を評価

```scheme
(cons 1 2)
```

↓ cons を評価

```scheme
(1 . 2)
```
  
