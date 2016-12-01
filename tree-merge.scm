
(define tree-merge
  (lambda (t1 t2)
    (cond ((leaf? t1)
	    (if (leaf? t2) (make-leaf (set-union (tree-labels t1) (tree-labels t2)))
			   (make-node (set-union (tree-labels t1) (tree-labels t2)) (node-left t2) (node-right t2))))
	  ((leaf? t2) (make-node (set-union (tree-labels t1) (tree-labels t2)) (node-left t1) (node-right t1)))
	  (else (make-node (set-union (tree-labels t1) (tree-labels t2)) (tree-merge (node-left t1) (node-left t2)) (tree-merge (node-right t1) (node-right t2)))))))
