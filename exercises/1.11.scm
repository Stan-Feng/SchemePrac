 ;Define a funciton accepts one parameter 'n'
 ;When n < 3 --> f(n) = n
 ;When n >= 3 --> f(n) = f(n-1) + 2f(n-2) + 3f(n-3)

(define (recu n)
  (if (< n 3)
      n
      (+
        (recu (- n 1))
        (* (recu (- n 2)) 2)
        (* (recu (- n 3)) 3)
      )
  )
)

(define (iterator f1 f2 f3 count)
  (if (= count 0)
    f1
    (iterator
      (+ f1 (* f2 2) (* f3 3))
      f1
      f2
      (- count 1)
    )
  )
)

(define (iter n)
  (if (< n 3)
    n
    (iterator 2 1 0 (- n 2))
  )
)