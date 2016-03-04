 ;Calculate power used a seris of square operations
 ;x--> base, n--> power
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