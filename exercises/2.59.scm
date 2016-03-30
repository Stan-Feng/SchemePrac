; In order to give a definition of set, we can employ method of data abstraction
; That is we define "Set" by specifying the operations to be used on sets
; Such as union-set, interaction-set, element-of-set? and join-set
; This set is implemented by unsorted list
(define (element-of-set? x set)
  (cond
    ((null? set) #f)
    ((equal? x (car set)) #t)
    (else (element-of-set? x (cdr set)))
  )
)

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set))
)

(define (interaction-set set1 set2)
  (cond
    ((or (null? set1) (null? set2)) `())
    ((element-of-set? (car set1) set2)
      (cons (car set1) (interaction-set (cdr set1) set2)))
    (else (interaction-set (cdr set1) set2))
  )
)

; TODO: Implement union-set operations for the unordered-list representation
(define (union-set set1 set2)
  (cond
    ((or (null? set1) (null? set2)) `())
    ((not (element-of-set? (car set1) set2))
      (cons (car set1) (union-set (cdr set1) set2)))
    (else (union-set (cdr set1) set2))
  )
)
