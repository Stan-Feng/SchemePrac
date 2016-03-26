; Given a set [1, 2, 3] return all permutations of this set
; The problem can be reduced of generating fewer elements than S.
; In the terminal case, we work on our empty list which means no element.
(define (flatmap proc sequence)
  (accumulate append `() (map proc sequence)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
  sequence))

(define (permutations s)
  (if (null? s)
    (list `())
    (flatmap (lambda (x)
      (map (lambda (y) (cons x y)) (permutations (remove x s))))
    s)))

(permutations (list 1 2 3))
