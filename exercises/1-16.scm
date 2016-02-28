;; Calculate power used a seris of square operations
;; x--> base, n--> power
(define (fast-expt x n)
  (if (even? n)
    (expt-iter x n)
    (* x (expt-iter x (- n 1)))
  )
)

(define (expt-iter x n)
  (cond
    ((= n 0) 1)
    ((= n 1) x)
    (else (*
            (expt-iter x (/ n 2))
            (expt-iter x (/ n 2))
          )
    )
  )
)