; TODO: Give an implementation of union-set with n growdth as ordered list set representation
(define (union-set set1 set2)
  (cond
    ((and (null? set1) (null? set2)) `())
    ((null? set1) (append set1 set2))
    ((null? set2) (append set2 set1))
    (else (let ((x1 (car set1)) (x2 (car set2)))
      (cond
        ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
        ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
        ((> x1 x2) (cons x2 (union-set set1 (cdr set2))))
      )
    ))
  )
)

(define s1 (list 2 3 4))
(define s2 (list 4 5 6))
(union-set s1 s2)
