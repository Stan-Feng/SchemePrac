; Please define a procedure which is similar to square-list
; Define directly
(define (square x) (* x x))
(define (square-tree tree)
  (cond
    ((null? tree) (list))
    ((not (pair? tree)) (square tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
  )
)

(define z (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;(define x (list 1 2 4))
;(define x (list 7 (list 1 2 3 4)))
(square-tree z)


; Define use high order procedure
(define (map proc tree)
  (if (null? tree)
    (list)
    (cons (proc (car tree)) (map proc (cdr tree)))
  )
)
(define (square-tree tree)
  (map
    (lambda (sub-tree)
      (if (pair? sub-tree)
        (square-tree sub-tree)
        (square sub-tree)
      )
    )
  tree)
)

(define x (list 1 2 4))
(define y (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree x)
(square-tree y)
