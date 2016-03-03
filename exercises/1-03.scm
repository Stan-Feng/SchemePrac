;ex1.3: Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.
(define (larger-two-sum a b c)
  (if (= a (larger a b))
      (sum a (larger b c))
      (sum b (larger a c))
  )
)

(define (larger a b)
  (if (> a b) a b)
)

(define (sum a b)
  (+ a b)
)