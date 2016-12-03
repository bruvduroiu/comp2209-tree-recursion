(define create-label (lambda (l)
       (string->symbol (symbol-append-reverse l))))

(define symbol-append-reverse (lambda (los)
       (if (null? los)
           ""
           (string-append (symbol-append-reverse (cdr los))
                          (symbol->string (car los))))))

(define the-edge-tag 'edge)
(define the-vertex-tag 'vertex)

(define make-vertex
  (lambda (id labels)
    (list the-vertex-tag id labels)))

(define make-edge
  (lambda (v1 v2)
    (list the-edge-tag v1 v2)))

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
