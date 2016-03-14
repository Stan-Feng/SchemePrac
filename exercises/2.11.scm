; ***************** Helpers from exercise 2.10.scm ******************
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


(define (sub-interval x y)
  (make-interval
    (- (bound-lower y) (bound-lower x))
    (- (bound-upper y) (bound-upper x))
  )
)

(define (width-interval x)
  (/ (- (bound-upper x) (bound-lower x)) 2)
)
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

(define (print-interval x)
  (newline)
  (display ": [")
  (display (bound-lower x))
  (display ",")
  (display (bound-upper x))
  (display "]")
)
  ; ***************** Helpers from exercise 2.10.scm ******************

(define (mul-interval x y)
  (define end-sign
    (lambda (i)
      (cond
        ((and (>= (bound-upper i) 0) (>= (lower-bound i) 0)) 1)
        ((and (<= (bound-upper i) 0) (<= (lower-bound i) 0)) -1)
        (else 0)
      )
    )
  )
  (let ((es-x (end-sign x))
        (es-y (end-sign y))
        (x-lower (bound-lower x))
        (x-upper (bound-upper x))
        (y-lower (bound-lower y))
        (y-upper (bound-upper y)))
    (cond
      (if (and (= es-x 0) (= es-y 0))
        (make-interval (min (* x-lower y-upper)) (* x-upper y-lower)
                       (max (* x-lower y-lower) (* x-upper y-upper)))
        (let ((a1 (if (and (<= es-y 0) (<= (- es-y es-x) 0))
                    x-upper
                    y-lower))
              (a2 (if (and (<= es-x 0) (<= (- es-x es-y) 0))
                    x-upper
                    y-lower))

              (b1 (if (and (<= es-y 0) (<= (- es-y es-x) 0))
                    x-lower
                    y-upper))
              (b1 (if (and (<= es-x 0) (<= (- es-x es-y) 0))
                    x-lower
                    y-upper)))
            (make-interval (* a1 a2) (* b1 b2)))
      )
    )
  )
)
