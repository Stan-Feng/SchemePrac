; Please define 'subsets s'
; such that (1 2 3) --> (() (1) (2) (3) (1 2) (2 3) (1 3) (1 2 3))

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))
  )
)


(define (map proc tree)
  (if (null? tree)
    (list)
    (cons (proc (car tree)) (map proc (cdr tree)))
  )
)

(define (subsets s)
  (if (null? s)
    (list `())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (sub-sets) (cons (car s) sub-sets)) rest))
    )
  )
)

(define x (list 1 2 3))
;(define y (list 1 2 3 4 5 6 7))
(subsets x)

; The map procedure should be like this:             (cons 3 `()) --> (3)
; Given --> Return
;   (()) --> (3)
;   (() (3)) --> ((2) (2 3))
;   ((3) (2) (2 3)) --> ((1) (1 3) (1 2) (1 2 3))

; So that we can:
; (subsets (list 1 2 3))
; rest <-- (subsets (list 2 3))
;     rest <-- (subsets (list 3))
;         rest <-- (subsets ())
;         (append `() map.... `())
;     (append (() 3) (map....(3) ))
;     (2)
;     (2 3)
; ...........
