(define (square-list items)
  (if (null? items)
    (list)
    (cons
      (* (car items) (car items))
      (square-list (cdr items))
    )
  )
)

(define (square-list items)
  (map (lambda (x) (* x x)) items))

(define l1 (list 1 3 5 7 9))
(square-list l1)
