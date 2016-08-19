(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 2)) (fib (- n 1))))
  )
)

(define (fib n)
  (define (fib-iter a b curr-index)
    (if (= curr-index n)
      (+ a b)
      (fib-iter b (+ a b) (+ curr-index 1))
    )
  )

  (fib-iter 0 1 2)
)
