(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
      (sum term (next a) next b)
    )
  )
)

(define (identity x) x)
(define (inc n) (+ n 1))
(define (cube n) (* n n n))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-integers a b)
  (sum identity a inc b))

(define (pi-sum a b)

  (define (pi-next x)
    (+ x 4))

  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))

  (sum pi-term a pi-next b)
)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))

  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
)


