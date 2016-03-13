(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(define one (add-1 zero))
;(define two (one add-1))
(define one
  ;(lambda (f) (lambda (x) (f ((zero f) x))))
  ;(lambda (f) (lambda (x) (f (((lambda (a) (lambda (b) b)) f) x))))
  (lambda (f) (lambda (x) (f x)))
)

(define two (lambda (x) (f (f x))))