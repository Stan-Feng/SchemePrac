(define uncertainty 0.00001)
(define (average x y)
  (/ (+ x y) 2))
(define (improve-guess x guess)
  (average (/ x guess) guess))
(define (good-enough? x guess)
  (< (abs (- (/ x guess) (average (/ x guess) guess))) uncertainty))

(define (sqrt x)
  (define (sqrt-iter x guess)
    (if (good-enough? x guess)
      guess
      (sqrt-iter x (improve-guess x guess))
    )
  )

  (sqrt-iter x 1.0)
)
