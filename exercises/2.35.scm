(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)
(define (enumerate-tree tree)
  (cond
    ((null? tree) `())
    ((not (pair? tree)) (list tree))
    (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
  )
)


; TODO: Implement count-leaves as accumulation
(define (count-leaves tree)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree tree)))
)
; Consider the process of count-leaves
; We should do add 1 operation for each node exists
; The most straight way of thought

(define l1 (list 1 (list 2 (list 3 4) 5) 6))
(count-leaves l1)
