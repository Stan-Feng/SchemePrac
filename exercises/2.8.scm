; ***************** Helpers from exercise 2.7.scm ******************
(define (make-interval lower upper)
  (cons lower upper))
(define (bound-lower x)
  (min (cdr x) (car x)))
(define (bound-upper x)
  (max (cdr x) (car x)))

(define (add-interval x y)
  (make-interval
    (+ (bound-lower x) (bound-lower y))
    (+ (bound-upper x) (bound-upper y))
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
    (make-interval (/ 1.0 (bound-lower y))
                   (/ 1.0 (bound-upper y))
    )
  )
)
; ***************** Helpers from exercise 2.7.scm ******************

(define (sub-interval x y)
  (make-interval
    (- (bound-lower y) (bound-lower x))
    (- (bound-upper y) (bound-upper x))
  )
)

;(define x (make-interval 2 4))
;(define y (make-interval 5 8))
;(sub-interval x y)