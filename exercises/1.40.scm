(define dx 0.0001)
(define tolarence 0.0001)

(define (square x) (* x x))
(define (cube x) (* x x x))
(define (fixed-point f guess)
  (let ((next (f guess)))
    (if (< (abs (- guess (f guess))) tolarence)
      guess
      (fixed-point f next)
    )
  )
)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)
  )
)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))
  )
)

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+
      (cube x)
      (* a (square x))
      (* b x)
      c
    )
  )
)
(newton-method (cubic 1 5 7) 1.0) ;-1.2991338