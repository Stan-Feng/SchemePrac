; ***************** Copy from solutions ****************
(define (smallest-div n)
  (define (divides? a b)
    (= 0 (remainder b a)))
    (define (square x) (* x x))
  (define (find-div n test)
     (cond ((> (square test) n) n) ((divides? test n) test)
           (else (find-div n (+ test 1)))))
  (find-div n 2))

 (define (prime? n)
   (if (= n 1) false (= n (smallest-div n))))
; *************** Copy from solutions *************


(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond
      ((> a b) result)
      ((filter a) (iter (next a) (combiner result (term a))))
      (else (iter (next a) result))
    )
  )

  (iter a null-value)
)

; Question 'a'
(define (identity x) x)
(define (inc x) (+ x 1))
(define (sum-primes a b)
  (filtered-accumulate + 0 identity a inc b prime?))

; Question 'b'


(define (product-of-relative-primes n)
  (define (relative-prime? m)
    (define (gcd m n)
      (cond
        ((< m n) (gcd n m))
        ((= n 0) m)
        (else (gcd n (remainder m n)))
      )
    )
    (= (gcd m n) 1)
  )

  (filtered-accumulate * 1 identity 1 inc n relative-prime?)
)
