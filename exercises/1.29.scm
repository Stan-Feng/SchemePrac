(define (inc x)
  (+ x 1))
(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+
      (term a)
      (sum term (next a) next b)
    )
  )
)

(define (simpson f a b n)
  (define h
    (/ (- b a) n))

  (define (yk k)
    (f (+ a (* h k))))

  (define (term k)
    (*
      (cond
        ((or (= k 0) (= k n)) 1)
        ((odd? k) 4)
        (else 2)
      )
      (yk k)
    )
  )

  (* (/ h 3) (sum term 0 inc n))
)