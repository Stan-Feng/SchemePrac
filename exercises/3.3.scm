; Modify the make-account procedure so that it creates password-protected accounts.
; That is, make-account should take a symbol as an additional argument.
; (define acc (make-account 100 'secret-password))
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond
          ((not (eq? p password)) (error "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define acc (make-account 100 `secret-password))
(acc `secret-password `deposit 50)
;(acc `some-other-password `withdraw 50)
