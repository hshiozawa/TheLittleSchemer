(will-stop? length) ; => #t
(will-stop? eternity) ; => #f

(define (last-try x)
  (and (will-stop? last-try)
       (eternity x)))

;;; (will-stop? last-try) => #f
;;; => last-try は停止するはず。
;;; => でも、(will-stop? last-try) は #f を仮定したはず

;;; (will-stop? last-try) => #t
;;; => last-try は停止しない
;;; => でも、(will-stop? last-try) は #t を仮定したはず

;;; => will-stop? は定義できない
