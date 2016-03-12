(define dx 0.00001)
(define (square x) (* x x))
(define (compose f g)
  (lambda (x) (f (g x)))
)

(define (repeated procedure times)
  (if (< times 1)
    (lambda (x) x)
    (compose procedure (repeated procedure (- times 1)))
  )
)

(define (smooth f)
  (lambda (x)
    (/
      (+
        (f (- x dx))
        (f x)
        (f (+ x dx))
      )
      3
    )
  )
)

(define (n-times-smooth f n)
  (repeated smooth n) f)
