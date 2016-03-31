; Each of the following two procedures converts a binry tree to a list
; Do the two procedures produce the same result for every tree? If not, how differ?
; Do the two procedures have the same order of growth in the number of steps required?
(define (tree->list-1 tree)
  (if (null? tree)
    `()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree) (tree->list-1 (right-branch tree))))
  )
)

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list
        (left-branch tree)
        (cons (entry tree)
          (copy-to-list (right-branch tree) result-list)))
    )
  )

  (copy-to-list tree `())
)

; The results produced are the same because both of them are in-order traversal
; The complexity of first one is n*log(n) while the second one is n
