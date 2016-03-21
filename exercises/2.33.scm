(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)

; TODO: Implement several basic list operations as accumulations
(define (map proc sequence)
  (accumulate
    (lambda (curr-el accumulated-el)
      (cons (proc curr-el) accumulated-el))
    `() sequence
  )
)

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(define (length sequence)
  (accumulate
    (lambda (curr-el accumulated-el) (+ accumulated-el 1))
    0 sequence
  )
)

(define x (list 1 2 3 4 5 6))
(define y (list 9 12 14))
(map square x)
(append x y)
(length x)
