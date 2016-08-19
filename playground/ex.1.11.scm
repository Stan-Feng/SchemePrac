(define (f-recu n)
  (if (< n 3)
    n
    (+ (f-recu (- n 1)) (* 2 (f-recu (- n 2))) (* 3 (f-recu (- n 3))))
  )
)

(define (f-iter n)
  (define (iter x a b c)
    (cond
      ((> x n) (add-all a b c))
      ((or (= x 0) (= x 1)) (iter (+ x 1) 0 0 0))
      ((= x 2) (iter (+ x 1) 1 0 0))
      (else (iter (+ x 1) (add-all a b c) a b))
    )
  )

  (iter 0 0 0 0)
)

(define (add-all a b c)
  (+ a (* 2 b ) (* 3 c)))
