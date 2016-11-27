(load "memq")

(define tree-map
  (lambda (f tree)
    (if (leaf? tree)
        (make-leaf (f (tree-labels tree)))
	(make-node (f (tree-labels tree)) (tree-map f (node-left tree)) (tree-map f (node-right tree))))))


(define remove-labels
  (lambda (l tree)
    (letrec ((f (lambda (label)
	       (cond ((null? label) '())
		     ((memq? (car label) l) (f (cdr label)))
		     (else (cons (car label) (f (cdr label))))))))
	(tree-map f tree))))
