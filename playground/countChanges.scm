(define (get-coin-val coin-type)
  (cond
    ((= coin-type 1) 1)
    ((= coin-type 2) 5)
    ((= coin-type 3) 10)
    ((= coin-type 4) 25)
    ((= coin-type 5) 50)))

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
    (else
      (+
        (cc amount (- kinds-of-coins 1))
        (cc (- amount (get-coin-val kinds-of-coins)) kinds-of-coins)
      )
    )
  )
)
