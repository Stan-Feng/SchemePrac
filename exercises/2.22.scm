; This square-list return a list order is reversed, try to figure it out
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things) (cons (square (car things)) answer))
    )
  )

  (iter items (list))
)
; I think there is no way to directly construct a correct order list by recursion using (cons a b)
; Because the list passed in is the correct order which means the list to be constructed will be reversed
; The first element selected out from passed list will be the first one put in to constructed list and will be shown at last position in the end

(define l1 (list 1 3 5 7 9))
(square-list l1)  ; 81 49 25 9 1
