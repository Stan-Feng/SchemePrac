; Draw Pascal Triangle
(define (pascal row col)
  (cond
    ((= col 0) 0)
    ((< row col) 0)
    ((or (= row 1) (= row 2)) 1)
    (else
      (+
        (pascal (- row 1) col)
        (pascal (- row 1) (- col 1))
      )
    )
  )
)
