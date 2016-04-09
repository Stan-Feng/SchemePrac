(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond
    ((null? set) #f)
    ((= x (entry set)) #t)
    ((< x (entry set)) (element-of-set? x (left-branch set)))
    ((> x (entry set)) (element-of-set? x (right-branch set)))
  )
)

(define (adjoin-set x set)
  (cond
    ((null? set) (make-tree x `() `()))
    ((= x (entry set)) set)
    ((< x (entry set))
      (make-tree (entry set)
        (adjoin-set x (left-branch set))
        (right-branch set)))
    ((> x (entry set))
      (make-tree (entry set)
        (left-branch set)
        (adjoin-set x (right-branch set))))
  )
)
(define (partial-tree elts n)
  (if (= n 0)
    (cons `() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (none-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car none-left-elts))
                (right-result (partial-tree (cdr none-left-elts) right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree) remaining-elts))))))))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

; TODO: Implementat union-set and intersection-set as balanced binary tree
(define (union-set set1 set2)
  (cond
    ((null? set1) set2)
    ((null? set2) set1)
    (else
      (let ((entry1 (entry set1))
            (left-branch1 (left-branch set1))
            (right-branch1 (right-branch set1))
            (entry2 (entry set2))
            (left-branch2 (left-branch set2))
            (right-branch2 (right-branch set2)))
        (cond
          ((= entry1 entry2) (make-tree entry1
                (union-set left-branch1 left-branch2) (union-set right-branch1 right-branch2)))
          ((< entry1 entry2) (make-tree entry2
                (union-set set1 left-branch2) right-branch2))
          ((> entry1 entry2) (make-tree entry1
                (union-set left-branch1 set2) right-branch1))
        )
      )
    )
  )
)

(union-set (list->tree `(1 3 5)) (list->tree `(2 3 4)))

(define (intersection-set set1 set2)
  (cond
    ((null? set1) ())
    ((null? set2) ())
    (else
      (let ((a-entry (entry set1))
            (a-left-branch (left-branch set1))
            (a-right-branch (right-branch set1))
            (b-entry (entry set2))
            (b-left-branch (left-branch set2))
            (b-right-branch (right-branch set2)))
        (cond
          ((= a-entry b-entry)
            (make-tree a-entry
                (intersection-set a-left-branch b-left-branch)
                (intersection-set a-right-branch b-right-branch)))
            ((< a-entry b-entry)
              (union-set
                (intersection-set a-right-branch
                  (make-tree b-entry () b-right-branch))
                (intersection-set
                  (make-tree a-entry a-left-branch ()) b-left-branch)))
            ((> a-entry b-entry)
              (union-set (intersection-set (make-tree a-entry () a-right-branch)
                            b-right-branch)
                          (intersection-set a-left-branch
                            (make-tree b-entry b-left-branch ()))))
        )
      )
    )
  )
)

(intersection-set (list->tree `(3 5 10)) (list->tree `(1 2 3 4 5 7)))
