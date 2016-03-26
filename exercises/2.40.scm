; Define a procedure unique-pairs that given an integer n
; generates the sequence of pairs (i,j) with 1< j< i< n.
; Use unique-pairs to simplify the definition of prime-sum-pairs given above.
(define (enumerate-interval low high)
  (if (> low high)
    `()
    (cons low (enumerate-interval (+ low 1) high))
  )
)

(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)

(define (flatmap proc sequence)
  (accumulate append `() (map proc sequence)))

(define (unique-pairs n)
 (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
     (enumerate-interval 1 (- i 1)))
   )
   (enumerate-interval 1 n))
)

;(unique-pairs 6)

(define (prime? num)
  (define (iter x)
    (if (= x 1)
      #t
      (if (= (remainder num x) 0)
        #f
        (iter (- x 1))
      )
    )
  )

  (iter (- num 1))
)

(define (is-sum-prime? pair)
  (prime? (+ (car pair) (cadr pair)))
)

(define (prime-sum-pairs n)
  (map (lambda (prime-pair)
    (list (car prime-pair) (cadr prime-pair)
      (+ (car prime-pair) (cadr prime-pair))))
  (filter is-sum-prime? (unique-pairs n)))

)

(prime-sum-pairs 6)
