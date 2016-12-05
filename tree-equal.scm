;;; Coursework 2
;;; Question 01
;;; Bogdan Buduroiu (bb4g15@soton.ac.uk)

;;; solution:

(define tree-equal?
  (lambda (t1 t2)
    (if (set-equal? (tree-labels t1) (tree-labels t2))
	(cond ((and (leaf? t1) (leaf? t2)) #t)
	      ((and (node? t1) (node? t2))
		(and (tree-equal? (node-left t1) (node-left t2)) (tree-equal? (node-right t1) (node-right t2))))
	      (else #f))
        #f)))

;;; This function checks to whether the current nodes have the same set
;;; of labels first.
;;; If the check is successful, it checks to see that the structure of the
;;; tree is the same, before recursively calling itself on the left and
;;; right subtree of each tree.
