(define (make-interval upper lower)
  (cons upper lower))
(define (bound-lower x)
  (cdr x))
(define (bound-upper x)
  (car x))

(define (add-interval x y)
  (make-interval
    (+ (bound-upper x) (bound-upper y))
    (+ (bound-lower x) (bound-lower y))
  )
)

(define (mul-interval x y)
  (let ((p1 (* (bound-lower x) (bound-lower y)))
        (p2 (* (bound-lower x) (bound-upper y)))
        (p3 (* (bound-upper x) (bound-lower y)))
        (p4 (* (bound-upper x) (bound-upper y))))
    (make-interval
      (min p1 p2 p3 p4)
      (max p1 p2 p3 p4)
    )
  )
)

(define (div-interval x y)
  (mul-interval x
    (make-interval (/ 1.0 (bound-upper y))
                   (/ 1.0 (bound-lower y))
    )
  )
)
