(define dx 0.00001)

(define (deriv f)
  (lambda (x)
    (/
      (- (f (+ x dx)) (f x))
      dx)))

(define (cube x)
  (* x x x))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (double proc)
  (lambda (x)
    (proc (proc x))))

(define (inc x)
  (+ x 1))
(define (square x)
  (* x x))

(define inc-two (double inc))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated proc time)
  (define (iter curr-proc curr-time)
    (if (> curr-time time)
      curr-proc
      (iter (lambda (x) (curr-proc (curr-proc x))) (+ time 1))
    )
  )
  (iter proc 0)
)

;; @return: a procedure which takes a guess as argument and keeps improving guess untill it is good enough
(define (iterative-improve good-enough improve-guess)
  (lambda (guess)
    (let ((next-guess (improve-guess guess)))
      (if (good-enough guess next-guess)
        next-guess
        ((iterative-improve good-enough improve-guess) next-guess)
      )
    )
  )
)

(define (sqrt x)
  (define (good-enough a b)
    (define tolerance 0.00001)
    (if (< (abs (- a b)) tolerance)
      #t
      #f))
  (define (improve-guess guess)
    (/ (+ guess x) 2))

  ((iterative-improve good-enough improve-guess) 1.0)
)

(define (fixed-point func first-guess)
  (define (good-enough a b)
    (define tolerance 0.00001)
    (if (< (abs (- a b)) tolerance)
      #t
      #f))

  (define (improve-guess guess)
    (func guess))

  ((iterative-improve good-enough improve-guess) first-guess)
)
