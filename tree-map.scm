;;; Coursework 2
;;; Question 02
;;; Bogdan Buduroiu (bb4g15@soton.ac.uk)

;;; solution:
(define memq?
  (lambda (elem l)
    (cond ((null? l) #f)
          ((eq? (car l) elem) #t)
          (else (memq? elem (cdr l))))))

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

;;; tree-map recreates the original tree, with labels the result of
;;; the application of function f on the current labels

;;; remove-labels makes use of tree-map, by creating a function that
;;; removes matching elements from a generic list, and then passing 
;;; this new function to tree-map
