; Define a procedure 'fringe' which accepts a tree as para
; return a list contains all leaves in this tree from left to right
(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))
  )
)
; Manipulate tree
; The key abstraction of this problem is to extract the "list"
; which contains element traversed
; Then append them together to get the correct output format
(define (fringe tree)
  (cond
    ((null? tree) (list))
    ((not (pair? tree)) (list tree))
    (else (append (fringe (car tree)) (fringe (cdr tree))))
  )
)

(define y (list (list 1 2) (list 3 4)))
(define x (list 2 (list 2 3 4)))
(fringe y)
(fringe x)
