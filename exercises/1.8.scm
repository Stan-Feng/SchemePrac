(define (square x) (* x x))
(define (cube x) (* x x x))

(define (improve x guess)
  (/
    (+
      (/ x (square guess))
      (* 2 guess)
    )
    3
  )
)

(define (is-enough? x guess)
  (< (abs (- (cube guess) x)) 0.001)
)

(define (cube-iter x guess)
  (if (is-enough? x guess)
    guess
    (cube-iter x (improve x guess))
  )
)

(define (cube-root x)
  (cube-iter x 1.0))
