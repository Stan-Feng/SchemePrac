(define (iterative-improve good-enough? improve)
  (lambda (x)
    (let ((improved-guess (improve x)))
      (if (good-enough? x improved-guess)
        improved-guess
        ((iterative-improve good-enough? improve) improved-guess)
      )
    )
  )
)

(define (sqrt-good-enough? v1 v2)
  (< (abs (- v1 v2)) 0.00001)
)

(define (sqrt x)
  (
    (iterative-improve
      sqrt-good-enough?
      (lambda (y) (/ (+ (/ x y) y) 2))
    )
  1.0)
)

(define (fixed-point f guess)
  ((iterative-improve sqrt-good-enough? (lambda (x) (f x))) guess)
)
