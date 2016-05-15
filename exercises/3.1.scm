; Define an accumulator which is called repeatedly with single numeric argument and accumulate its arguments into a sum.
; Each time it is called will return the currently accumulated sum.
; Write a procedure make-accumulator that generates arrumulators
; Each maintaining an independent sum. The input make-accumulator should specify the initial value of the sum
(define (make-accumulator init-value)
  (define init init-value)
  (lambda (x) (set! init (+ init x)) init)
)

(define acc (make-accumulator 10))
(acc 10)
