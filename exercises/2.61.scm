; TODO: Implement adjoin-set
(define (adjoin-set x set)
  (cond
    ((null? set) (list x))
    ((= x (car set)) set)
    ((< x (car set)) (cons x set))
    (else (cons (car set) (adjoin-set x (cdr set))))
  )
)

(define s1 (list 1 2 3 5))
(adjoin-set 4 s1)
