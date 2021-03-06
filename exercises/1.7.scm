(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2)
  )

  (define (good-enough? guess accuracy)
    (< (abs (- (square guess) x)) accuracy)
  )
  (define (improve guess)
    (average guess (/ x guess))
  )

  (define (sqrt-iter guess)
    (if (good-enough? guess (/ x 1000))
      guess
      (sqrt-iter (improve guess))
    )
  )

  (sqrt-iter 1.0)
)