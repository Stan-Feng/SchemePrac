; One way to speed up our set operations is to change the representation so that the set elements are listed in increasing order
; One advantage of ordering shis up in element-of-set? can only search the items smaller than given target
(define (element-of-set? x set)
  (cond
    ((null? set) #f)
    ((= x (car set)) #t)
    ((< x (car set)) #f)
    (else (element-of-set? x (cdr set)))
  )
)

(define (interaction-set set1 set2)
  (if (or (null? set1) (null? set2))
    `()
    (let ((x1 (car set1)) (x2 (car set2)))
      (cond
        ((= x1 x2) (cons x1 (interaction-set (cdr set1) (cdr set2))))
        ((< x1 x2) (interaction-set (cdr set1) set2))
        ((< x2 x1) (interaction-set set1 (cdr set2)))
      )
    )
  )
)
  