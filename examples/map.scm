; Map to list
(define (map proc items)
  (if (null? items)
    (list)
    (cons (proc (car items))
          (map proc (cdr items)))
  )
)

(map abs (list -10 2.5 -12 -11.7 17))

(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))

(scale-list (list 1 3 5 7 9) 2)

; Map to tree
(define (scale-tree tree factor)
  (map
    (lambda (sub-tree)
      (if (pair? sub-tree)
        (scale-tree sub-tree factor)
        (* sub-tree factor)
      )
    )
  tree)
)

(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) 10)
