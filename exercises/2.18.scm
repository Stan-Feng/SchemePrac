; The key of reversing this list is the way how it constructs
(define squares (list 1 4 9 16 25))
(define (reverse l)
  (define (iter items result)
    (if (null? items)
      result
      (iter (cdr items) (cons (car items) result))
    )
  )

  (iter l (list))
)
(reverse squares)