
(define tree-equal?
  (lambda (t1 t2)
    (if (set-equal? (tree-labels t1) (tree-labels t2))
	(cond ((and (leaf? t1) (leaf? t2)) #t)
	      ((and (node? t1) (node? t2))
		(and (tree-equal? (node-left t1) (node-left t2)) (tree-equal? (node-right t1) (node-right t2))))
	      (else #f))
        #f)))
