(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))
  )
)
(define (length items)
  (define (iter sum node)
    (if (null? node)
      sum
      (iter (+ sum 1) (cdr node))
    )
  )

  (iter 0 items)
)

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))
  )
)

(define squares (list 1 4 9 16 25))
(define odds (list 1 3 5 7 9))
(list-ref squares 3)
(length squares)
(append squares odd)