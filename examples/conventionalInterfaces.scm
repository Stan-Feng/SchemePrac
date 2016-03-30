(define (map proc tree)
  (if (null? tree)
    (list)
    (cons (proc (car tree)) (map proc (cdr tree)))
  )
)
(map (lambda (x) (* x x)) (list 1 2 3 4 5)) ; (1 4 9 16 25)

(define (filter predicate sequence)
  (cond
    ((null? sequence) `())
    ((predicate (car sequence))
      (cons (car sequence) (filter predicate (cdr sequence))))
    (else (filter predicate (cdr sequence)))
  )
)
(filter odd? (list 1 3 5 8 0 9 12 13)) ; (1 3 5 9 13)

(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)
(accumulate + 0 (list 1 2 3 4 5)) ; 15
(accumulate * 1 (list 1 2 3 4 5)) ; 120
(accumulate cons `() (list 2 3 4 5 6)) ; (2 3 4 5 6)


(define (enumerate-interval low high)
  (if (> low high)
    `()
    (cons low (enumerate-interval (+ low 1) high))
  )
)
(enumerate-interval 2 7) ; (2 3 4 5 6 7)


(define (enumerate-tree tree)
  (cond
    ((null? tree) `())
    ((not (pair? tree)) (list tree))
    (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
  )
)
(enumerate-tree (list 1 (list 2 (list 3 4)) 5)) ; (1 2 3 4 5)


(define (sum-odd-squares tree)
  (accumulate
    +
    0
    (map square
      (filter odd? (enumerate-tree tree)))
  )
)
(sum-odd-squares (list 1 (list 2 (list 3 4) 5))) ; 35

;For even-fibs, we enumerate the integers from 0 to n
; generate the Fibonacci number for each of these integers
; filter the resulting sequence to keep only the even elements
; accumulate the results into a list:
(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    ((= n 2) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))
  )
)
(define (even-fibs n)
  (accumulate cons `()
    (filter even?
      (map fib (enumerate-interval 0 n)))
  )
)
(even-fibs 10) ; (0 2 8 34)
