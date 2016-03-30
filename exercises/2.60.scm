; Suppose there is a set representation allow duplicate
; Please define element-of-set? adjoin-set, union-set, interaction-set
; Would you prefer to use this representation to the non-duplicate one?
(define (element-of-set? set x)
  (cond
    ((or (null? set) false))
    ((equal? x (car set)) true)
    (else (element-of-set? (cdr set) x))
  )
)

(define (adjoin-set set x)
  (cons x set))

(define (interaction-set set1 set2)
  (cond
    ((or (null? set1) (null? set2)) `())
    ((element-of-set? (car set1) set2)
      (cons (car set1) (interaction-set (cdr set1) set2)))
    (else (interaction-set (cdr set1) set2))
  )
)

(define (union-set set1 set2)
  (append set1 set2))

; The main difference of set representation is union-set and adjoin-set
; It is more efficiency because duplicate set representation does not need to check duplicate element
