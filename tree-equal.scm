(load "memq")

(define tree-equal?
  (lambda (t1 t2)
    (if (equal? (tree-labels t1) (tree-labels t2))
      (if (leaf? t1) 
          (if (leaf? t2) 
              (equal? t1 t2) 
              #f)
           (and (equal? (node-left t1) (node-left t2))
                (equal? (node-right t1) (node-right t2))))
       #f)))

