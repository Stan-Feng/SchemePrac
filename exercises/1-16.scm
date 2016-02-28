;; Calculate power used a seris of square operations
;; x--> base, n--> power
(define (fast-expt base n)
  (if (even? base)
    (expt-iter base n)
    (* base (expt-iter base (- n 1)))
  )
)

(define (expt-iter b n)
  (cond
    ((= n 0) 1)
    ((= n 1) b)
    (else (*
            (expt-iter b (/ n 2))
            (expt-iter b (/ n 2))
          )
    )
  )
)

(define (square x)
  (* x x)
)

(define (iter-expt base power)
  (define (iter a base power)
    (cond
      ((= power 0) a)
      ((even? power) (iter a (square base) (/ power 2)))
      (else (iter (* a base) base (- power 1)))
    )
  )
  (iter 1 base power)
)