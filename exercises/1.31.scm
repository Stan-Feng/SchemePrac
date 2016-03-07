; Define a procedure which is similar to sum
(define (inc x) (+ x 1))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )

  (iter a 1)
)

(define (product term a next b)
  (if (> a b)
    1
    (*
      (term a)
      (product term (next a) next b)
    )
  )
)

; Question 'a'
(define (factorial n)
  (define (identity x) x)
  (product identity 1 inc n)
)

(define (pi n)
  (define (identity x) x)
  (define (pi-term n)
    (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))
    )
  )

  (*
    4.0
    (product pi-term 1 inc n)
  )
)

; Question 'b'

