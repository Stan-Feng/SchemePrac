(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define (make-point x y)
  (cons x y))
(define p (make-point 2 4))
(display (car p))
(display (cdr p))