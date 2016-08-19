(define (cube x)
  (* x x x))
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))
  )
)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

; Calculate sum from a to b
(define (sum-integers a b)
  (sum (lambda (x) x) a (lambda (x) (+ x 1)) b))

(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2.0))
    (lambda (x) (+ x dx)) b)
  dx))
;(define (integral f a b dx)
;  (define (add-dx x) (+ x dx))
;  (*
;    (sum f a (+ dx (/ dx 2.0) a))
;    dx
;  )
;)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)
