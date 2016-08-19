(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

(define (multiplication a b)
  (sum (lambda (x) a) 1 (lambda (x) (+ x 1)) b))

(define (factorial n)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (* result i))
    )
  )
  (iter n 1)
)

; Recursive product version
(define (product proc a b)
  (if (> a b)
    1
    (* (proc a) (product proc (+ a 1) b))
  )
)

; Iterative product version
(define (product proc a b)
  (define (iter i result)
    (if (> a b)
      result
      (iter (+ i 1) (* result i))
    )
  )
  (iter a 1)
)
