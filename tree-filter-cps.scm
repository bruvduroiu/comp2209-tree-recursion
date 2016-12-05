;;; Coursework 2
;;; Question 05
;;; Bogdan Buduroiu (bb4g15@soton.ac.uk)

;;; solution:
(define tree-filter-cps
  (lambda (p t c)
    (cond ((null? t) (c '() #f))
	  ((leaf? t) (c (make-leaf (p (tree-labels t) 
					(lambda (bool) 
					  (if bool (tree-labels t) '()))))
			(make-leaf (p (tree-labels t)
					 (lambda (bool)
					   (if (not bool) (tree-labels t) '()))))))
	  (else (c (make-node (p (tree-labels t) 
				   (lambda (bool)
				     (if bool (tree-labels t) '())))
			(tree-filter-cps p (node-left t) c) 
			(tree-filter-cps p (node-right t) c))
		   (make-node (p (tree-labels t)
				   (lambda (bool)
				     (if (not bool) (tree-labels t) '()))) 
			(tree-filter-cps p (node-left t) c) 
			(tree-filter-cps p (node-right t) c)))))))

;;; The base case is when the tree/subtree is a leaf. Here we just pass
;;; to the continuation two leaves, where the second one is the set
;;; logically equivalent to the set of the node's labels minus the result
;;; of applying the predicate to those labels

;;; In the other case, we use the same approach as above, only that we 
;;; recursively call the function on the left & right subtree of each
;;; node.
