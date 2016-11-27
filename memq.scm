
(define memq?
  (lambda (elem l)
    (cond ((null? l) #f)
          ((eq? (car l) elem) #t)
          (else (memq? elem (cdr l))))))
