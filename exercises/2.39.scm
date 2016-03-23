; 'accumulte' is also called fold-right
(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)

(define (fold-right operator initial sequence)
  (accumulate operator initial sequence))

(define (fold-left operator initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (operator result (car rest)) (cdr rest))
    )
  )
  (iter initial sequence)
)

(fold-left / 1 (list 1 2 3)) ; 1/6
(fold-right / 1 (list 1 2 3)); 3/2

; TODO: Implement reverse by using fold-left and fold-right
(define (reverse-fold-left sequence)
  (fold-left (lambda (curr accu) (cons accu curr)) `() sequence))

(define (reverse-fold-right sequence)
  (fold-right (lambda (curr accu) (append accu (list curr))) `() sequence))

(define l1 (list 3 4 5 8 9))
(reverse-fold-left l1)
(reverse-fold-right l1)
