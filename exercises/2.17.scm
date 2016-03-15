(define (last-pair l)
  (if (null? (cdr l))
    (car l)
    (last-pair (cdr l))
  )
)

(define squares (list 1 4 9 16 25))
(last-pair squares)