(define (cc amount coin-list)
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (no-more? coin-list)) 0)
    (else
      (+
        (cc amount (except-first-denomination coin-list))
        (cc (- amount (first-denomination coin-list)) coin-list)
      )
    )
  )
)

(define us-coins (list 50 25 10 5 1))
(define us-coins-reverse (list 1 5 10 25 50))
(define uk-coins (list 100 50 20 10 5 2 1))
(define uk-coins-reverse (list 1 2 5 10 20 50 100))

(define (no-more? coin-list)
  (null? coin-list))
(define (except-first-denomination coin-list)
  (cdr coin-list))
(define (first-denomination coin-list)
  (car coin-list))

(cc 100 us-coins) ; 292
(cc 100 us-coins-reverse)  ; 292
(cc 50 uk-coins) ; 451
(cc 50 uk-coins-reverse) ; 451