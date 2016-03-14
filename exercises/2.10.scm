; ***************** Helpers from exercise 2.9.scm ******************
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


(define (sub-interval x y)
  (make-interval
    (- (bound-lower y) (bound-lower x))
    (- (bound-upper y) (bound-upper x))
  )
)

(define (width-interval x)
  (/ (- (bound-upper x) (bound-lower x)) 2)
)
; ***************** Helpers from exercise 2.9.scm ******************
(define (div-interval x y)
  (if (= (* (bound-upper y) (bound-lower y)) 0)
    (error "Cannot divided by 0")
    (mul-interval x
      (make-interval (/ 1.0 (bound-upper y))
                     (/ 1.0 (bound-lower y))
      )
    )
  )
)

(define (print-interval i)
  (newline)
  (display ": [")
  (display (bound-lower i))
  (display ",")
  (display (bound-upper i))
  (display "]"))

;(define x (make-interval -4 4))
;(define y (make-interval 2 0))
;(div-interval x y)
