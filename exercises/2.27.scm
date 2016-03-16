(define x (list (list 1 2) (list 3 4) (list 5 6)))

; Implement deep-reverse, receives a list as paramter return a list
; ((1 2) (3 4)) --> ((4 3) (2 1))

; ********** Helpers from exercise 2.18 ********************
(define nil '())

(define (map proc items)
  (if (null? items)
    (list)
    (cons (proc (car items))
          (map proc (cdr items)))
  )
)

(define (reverse items)
 (define (iter items result)
   (if (null? items)
       result
       (iter (cdr items) (cons (car items) result))))

 (iter items nil))
; ********** Helpers from exercise 2.18 ********************

; ********************** Solutions **************************
(define (deep-reverse items)
  (if (pair? items)
    (reverse (map deep-reverse items))
    items
  )
)
; ********************** Solutions **************************
(deep-reverse x)

; My solution is failed
; The key of mastering is always abstraction
; Try to make abstraction first next time
(define (deep-reverse items)
  (define (iter rest-items result)
    (newline)
    (display rest-items)
    (if (null? rest-items)
      result
      (cond
        ((and (pair? rest-items) (not (pair? (car rest-items))) (not (pair? (cdr rest-items))))
          (list (cdr rest-items) (car rest-items))
        )
        ((pair? rest-items)
          (list
            (iter (cdr rest-items) (car (list (car rest-items) (cdr rest-items))))
            (iter (car rest-items) (car (list (cdr rest-items) (car rest-items))))
          )
        )
        (else
          rest-items
        )
      )
    )
  )

  (iter items (list))
)
