(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))
  )
)

(define (accumulate combiner null-value term a next b)
  (define (iter result i)
    (if (> i b)
      result
      (iter (combiner result (term i)) (next i))
    )
  )
  (iter null-value a)
)

(define (sum term a next b)
  (accumulate + 0 term a next b)
)

(define (product proc a b)
  (accumulate * 1 (lambda (x) (proc x)) a (lambda (x) (+ x 1)) b))

(define (cube x)
  (* x x x))

(define (integer-sum a b)
  (sum (lambda (x) x) a (lambda (x) (+ x 1)) b) )
