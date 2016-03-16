; Implement forEach procedure
(define (for-each proc items)
  (define (iter items proc-call)
    (if (null? items)
      #t
      (iter (cdr items) (proc (car items)))
    )
  )

  (iter items proc)
)

; ********** Code from lecture ***************
(define (for-each proc list)
  (cond
    ((null? list) "done")
    (else (proc (car list))
          (for-each proc (cdr list)))
  )
)
; ********** Code from lecture ***************

(define l1 (list 1 3 5 8 9))
(for-each (lambda (x) (newline) (display x)) l1)
