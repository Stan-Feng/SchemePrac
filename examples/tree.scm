(define x (cons (list 1 2) (list 3 5)))

(define (count-leaves tree)
  (cond
    ((null? tree) 0)
    ((not (pair? tree)) 1)
    (else (+ (count-leaves (car tree))
             (count-leaves (cdr tree))))
  )
)

(count-leaves x)
