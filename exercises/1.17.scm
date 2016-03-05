(define (double x)
  (+ x x)
)

(define (halve x)
  (/ x 2)
)

(define (mul a b)
  (cond
    ((or (= b 0) (= a 0)) 0)
    ((even? b) (double (mul a (halve b))))
    (else (+ a (mul a (- b 1))))
  )
)
