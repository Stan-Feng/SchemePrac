; Define a procedure which accepts a procedure as input will return a special procedure
;   This return procedure can remember the times called
;   can also reset the counter
;   can also been called as functional purpose

(define (make-monitored f)
  (define counter 0)
  (lambda (x)
    (cond
      ((eq? x `how-many-calls?) counter)
      ((eq? x `reset-count) (begin (set! counter 0) counter))
      (else (begin (set! counter (+ counter 1)) (f x)))
    )
  )
)

(define s (make-monitored sqrt))
(s 100)
(s 100)
(s 100)
(s `how-many-calls?)
(s `reset-count)
