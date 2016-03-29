; Please define a procedure 'equal?' which can return boolean
; whether two list contains same elements in the same order
(define (equal? list1 list2)
  (cond
    ((and (null? list1) (null? list2)) #t)
    ((not (eq? (car list1) (car list2))) #f)
    (else (equal? (cdr list1) (cdr list2)))
  )
)

(define l1 `(this is a list))
(define l2 `(this is a list))
(define l3 `(this is another list))

(equal? l1 l2)
(equal? l2 l3)
