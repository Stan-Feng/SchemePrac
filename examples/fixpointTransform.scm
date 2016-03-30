(define tolarence 0.00001)
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (fixed-point f guess)
  (let ((next (f guess)))
    (if (< (abs (- guess (f guess))) tolarence)
      guess
      (fixed-point f next)
    )
  )
)

(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))
  )
)

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y) (/ x y))
    average-damp
    1.0
  )
)

(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y) (- (square y) x))
    newton-transform
    1.0
  )
)
