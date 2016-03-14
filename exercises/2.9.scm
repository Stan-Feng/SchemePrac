; ***************** Helpers from exercise 2.8.scm ******************
(define (make-interval lower upper)
  (cons (min lower upper) (max lower upper)))
(define (bound-lower x)
  (car x))
(define (bound-upper x)
  (cdr x))

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

(define (sub-interval x y)
  (make-interval
    (- (bound-lower y) (bound-lower x))
    (- (bound-upper y) (bound-upper x))
  )
)
; ***************** Helpers from exercise 2.8.scm ******************

(define (width-interval x)
  (/ (- (bound-upper x) (bound-lower x)) 2)
)

(define x (make-interval 2 6))
(define y (make-interval 4 9))
(define x-width (width-interval x))
(define y-width (width-interval y))

(define x+y (add-interval x y))
(define x+y-width (width-interval x+y)) ; 9/2
;(+ x-width y-width) ; 9/2

(define x*y (mul-interval x y))
(define x*y-width (width-interval x*y)) ; 23
(* x-width y-width) ; 5
