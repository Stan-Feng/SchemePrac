(define tolarence 0.0001)
(define (fixed-point f guess)
  (let ((next (f guess)))
    (if (< (abs (- guess (f guess))) tolarence)
      guess
      (fixed-point f next)
    )
  )
)

(define (goldern-rate x)
  (+ 1 (/ 1 x)))
