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

(define l1 (list 1 3 5 8 9))
(for-each (lambda (x) (newline) (display x)) l1)
