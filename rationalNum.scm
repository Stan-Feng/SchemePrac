(define numer car)
(define denom cdr)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))
  )
)
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
)