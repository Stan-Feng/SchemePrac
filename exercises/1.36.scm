(define tolarence 0.0001)
(define (average x y) (/ (+ x y) 2))

(define (fixed-point f guess)
  (display guess)
  (newline)
  (let ((next (f guess)))
    (if (< (abs (- guess (f guess))) tolarence)
      guess
      (fixed-point f next)
    )
  )
)

(define (calculate y)
  (fixed-point (lambda (x) (average x (/ (log y) (log x)))) 2.0) ; 8 steps
)

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0) ; more than 20 steps
