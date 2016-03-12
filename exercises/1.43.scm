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

((repeated square 3) 2)
