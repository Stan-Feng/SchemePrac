(define (average a b)
  (/ (+ a b) 2))

(define (close-enough? a b)
  (< (abs (- a b)) ))

(define (search func neg-point pos-point)
  (let ((mid-point (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      mid-point
      (let ((test-value (f mid-point)))
        (cond
          ((positive? test-value) (search f neg-point mid-point))
          ((negative? test-value) (search f mid-point pos-point))
          (else mid-point))))))

(define (cube x )
  (* x x x))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))

  (define (iter guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
        guess
        (iter (f guess))
      )
    )
  )

  (iter first-guess)
)

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (average-damp proc)
  (lambda (x) (average x (proc x))))

(define golden-ratio
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(define x-to-power
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0))

(define average-damp-power
  (fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 10.0))
