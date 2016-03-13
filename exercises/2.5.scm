(define (exp base pow)
  (define (iter times result)
    (if (= times 0)
      result
      (iter (- times 1) (* result base))
    )
  )
  (iter pow 1)
)

; 2^a -> a
(define find-exp
  (lambda (num base)
    (define (iter times rest)
      (if (<= rest 1)
        times
        (iter (+ times 1) (/ rest base))
      )
    )
    (iter 0 num)
  )
)
; 2^a*3^b -> a || b, depends on "base" param
(define (find num base)
  (let ((remain (remainder num base)))
    (if (= remain 0)
      (find (/ num base) base)
      num
    )
  )
)
; Order pair expressed as procedures
(define (exp-cons a b)
  (* (exp 2 a) (exp 3 b)))
(define (exp-car z)
  (find-exp (find z 3) 2)
)
(define (exp-cdr z)
  (find-exp (find z 2) 3)
)


(define num (exp-cons 4 3)) ;435
(exp-car num) ; 4
(exp-cdr num) ; 3