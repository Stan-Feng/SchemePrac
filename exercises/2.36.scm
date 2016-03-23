; Define accumulate-n which is similar to accumulate except it accepts a third param
; Suppose the third param is a sequence, each sequence in it has same length
; Expect accumulate-n produce ((1 2 3) (4 5 6)) --> (5 7 9)
(define (accumulate operand initial sequence)
  (if (null? sequence)
    initial
    (operand (car sequence) (accumulate operand initial (cdr sequence)))
  )
)

(define (accumulate-n operator initial sequence)
  (if (null? (car sequence))
    `()
    (cons (accumulate operator initial (map car sequence))
          (accumulate-n operator initial (map cdr sequence)))
  )
)

; The problem can be devided into:
;  --> Define a procedure which will return all the first element as a list
;  --> Define a procedure which will return all rest lists
; Therefore the key point of this problem is:
; (map car l1) --> (1 4 7 10)
; (map cdr  l1) --> ((2 3) (5 6) (8 9) (11 12))

(define l1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 l1) ; (22 26 30)
