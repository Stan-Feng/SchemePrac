; Please define a procedure given a positive number 'n'
; which can produce (i, j, k) where i j k are not equal, i j k < n
; where i + j + k = s
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

(define (triples-sum n s)
  (filter (lambda (l) (= (accumulate + 0 )))
    (flatmap
     (lambda (i)
        (flatmap (lambda (j)
            (map (lambda (k) (list i j k))
                  (enumerate-interval 1 ( - j 1))))
            (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n))))

(ordered-triples-sum 6 10)
