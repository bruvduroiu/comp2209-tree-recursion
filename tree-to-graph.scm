
(define the-edge-tag 'edge)
(define the-vertex-tag 'vertex)

(define make-vertex
  (lambda (id labels)
    (list the-vertex-tag id labels)))

(define make-edge
  (lambda (v1 v2)
    (list the-edge-tag v1 v2)))

(define vertex-labels cddr)
(define vertex-id cadr)
(define edge-vertices cdr)

(define tree-to-graph
  (lambda (t)
    (tree-to-graph-acc t (list 't))))
    
(define tree-to-graph-acc
  (lambda (t l)
    (if (leaf? t) 
      (list (make-vertex (create-label l) (tree-labels t)))
      (append
	(list (make-vertex (create-label l) (tree-labels t)))
	(list (make-edge (create-label l) (create-label (append (list 'l) l))))
	(list (make-edge (create-label l) (create-label (append (list 'r) l))))
	(tree-to-graph-acc (node-left t) (append (list 'l) l)) (tree-to-graph-acc (node-right t) (append (list 'r) l))))))
