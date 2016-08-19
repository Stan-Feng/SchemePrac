(define (filter-accumulate condition-proc combiner null-value term a next b)
  (cond
    ((> a b) null-value)
    ((not (condition-proc a))
      (filter-accumulate condition-proc combiner null-value term (next a) next b))
    (else
      (combiner
        (term a)
        (filter-accumulate condition-proc combiner null-value term (next a) next b)))
  )
)

(define (filter-accumulate condition-proc combiner null-value term a next b)
  (define (iter result i)
    (if (> i b)
      result
      (if (condition-proc i)
        (iter (combiner result (term i)) (next i))
        (iter result (next i))
      )
    )
  )
  (iter null-value a)
)

(define (even-sum-square a b)
  (filter-accumulate even? + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b))

(define (relative-prime a b)
  (define (gcd x y)
    (if (= y 0)
      x
      (gcd y (remainder x y))
    )
  )
  (= (gcd a b) 1)
)

(define (relative-prime-product n)
  (filter-accumulate
    (lambda (x) (relative-prime x n))
    * 1 (lambda (x) x)
    1 (lambda (x) (+ x 1)) n))
