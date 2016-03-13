; ***************** Helpers from exercise 2.2 *********************
(define (average x y) (/ (+ x y) 2))

(define (make-point x y)
 (cons x y))
(define (get-point-x point)
  (car point))
(define (get-point-y point)
  (cdr point))

(define (make-segment start end)
  (cons start end))
(define (get-start-point segment)
  (car segment))
(define (get-end-point segment)
  (cdr segment))

(define (midpoint-segment segment)
  (let ((start-point (get-start-point segment))
        (end-point (get-end-point segment)))
      (make-point
        (average (get-point-x start-point) (get-point-x end-point))
        (average (get-point-y start-point) (get-point-y end-point))
      )
  )
)
; ***************** Helpers from exercise 2.2 *********************

 ;The first rectangle definition
(define (make-rect left-bottom-p right-top-p)
  (cons left-bottom-p right-top-p))
(define (rect-height rect)
  (let ((sp (car rect))
        (ep (cdr rect)))
        (- (cdr ep) (cdr sp))))
(define (rect-length rect)
  (let ((sp (car rect))
        (ep (cdr rect)))
        (- (car ep) (car sp))))
; Rectangle abstraction barriers
(define (area rect)
  (* (rect-height rect) (rect-length rect)))
(define (circu rect)
  (+ (* 2 (rect-length rect)) (* 2 (rect-height rect))))

;(define sp (make-point 0 0))
;(define ep (make-point 6 6))
;(define r1 (make-rect sp ep))


; The second rectangle definition
(define (make-rect left-segment bottom-segment)
  (cons left-segment bottom-segment))
(define (rect-height rect)
  (let ((height-segment (car rect)))
    (- (cdr (cdr height-segment)) (cdr (car height-segment)))
  )
)
(define (rect-length rect)
  (let ((length-segment (cdr rect)))
    (- (car (cdr length-segment)) (car (car length-segment)))
  )
)

;(define left-line (make-segment (make-point 0 0) (make-point 6 6)))
;(define bottom-line (make-segment (make-point 0 0) (make-point 9 9)))
;(define r2 (make-rect left-line bottom-line))
