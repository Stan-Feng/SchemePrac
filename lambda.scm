(define (sum term a next b)
  (if (> a b)
    a
    (+ (term a) (sum term (next a) next b))
  )
)

(define (pi-sum a b)
  (sum
    (lambda (x) (/ 1.0 (* x (+ x 2))))
    a
    (lambda (x) (+ x 4))
    b
  )
)

(define (f g)
  (g 2))

(define (average a b) (/ (+ a b) 2))
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      midpoint
      (let ((test-value (f midpoint)))
        (cond
          ((positive? test-value) (search f neg-point midpoint))
          ((negative? test-value) (search f midpoint pos-point))
          (else midpoint)
        )
      )
    )
  )
)

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond
      ((and (negative? a-value) (positive? b-value)) (search f a b))
      ((and (negative? b-value) (positive? a-value)) (search f b a))
      (else (error "Values are not of oppotsite sign" a b))
    )
  )
)

(define tolarence 0.0001)
(define (fixed-point f guess)
  (let ((next (f guess)))
    (if (< (abs (- guess (f guess))) tolarence)
      guess
      (fixed-point f next)
    )
  )
)
