(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)

; TODO: Implement Horner polynomial calculation
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff high-terms) (+ (* high-terms x) this-coeff))
  0 coefficient-sequence))

; To calculate the value of 1 + 3x + 5x^3 + x^5 when x = 2
(horner-eval 2 (list 1 3 0 5 0 1)) ; 79
