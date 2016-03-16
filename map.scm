(define (map proc items)
  (if (null? items)
    (list)
    (cons (proc (car items))
          (map proc (cdr items)))
  )
)

(map abs (list -10 2.5 -12 -11.7 17))

(define (scale-list items factor)
  (map (lambda (x) (* x factor)) items))

(scale-list (list 1 3 5 7 9) 2)
