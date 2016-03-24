; Given a positive integer n
; find all ordered pairs of distinct positive integers i and j
; where 1< j< i< n, such that i + j is prime.
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

(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)

(define (enumerate-interval low high)
  (if (> low high)
    `()
    (cons low (enumerate-interval (+ low 1) high))
  )
)

(define (flatmap proc sequence)
  (accumulate append `() (map proc sequence)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pair n)
  (map make-pair-sum
    (filter prime-sum?
      (flatmap
        (lambda (i)
          (map (lambda (j) (list i j))
               (enumerate-interval 1 (- i 1)))
        )
        (enumerate-interval 1 n)
      )
    )
  )
)

(prime-sum-pair 6)
