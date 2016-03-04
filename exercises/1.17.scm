(define (mul a b)
  (define (double x)
    (+ x x)
  )

  (define (halve x)
    (/ x 2)
  )

  (define (iter a b sum)
    (if (= b 1)
      (+ sum a)
      (iter a (halve b) (+ sum (double a)))
    )
  )

  (cond
    ((or (= a 0) (= b 0)) 0)
    ((even? b) (iter a b 1))
    (else (+
            b
            (iter a (- b 1) 1)
          )
    )
  )
)