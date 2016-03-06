(define (halve x) (/ x 2))
(define (double x) (+ x x))

; a * b^n should not be changed
; Therefore, every time (halve b) it should (double a)
; 'product' is designed for keep track of odd state situation
; In the end, 'a' will be added to 'product'
(define (mul a b)
  (define (iter a b product)
    (cond
      ((or (= b 0) (= a 0)) product)
      ((even? b) (iter (double a) (halve b) product))
      (else (iter a (- b 1) (+ product a)))
    )
  )

  (iter a b 0)
)
