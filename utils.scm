(define the-node-tag (list 'node))
(define the-leaf-tag (list 'leaf))

(define node? 
	(lambda (tree)
    		(and (pair? tree) (eq? (tree-tag tree) the-node-tag))))

(define leaf? 
	(lambda (tree)
    		(and (pair? tree) (eq? (tree-tag tree) the-leaf-tag))))

(define tree-tag car) 
(define tree-labels cadr)
(define node-left caddr)
(define node-right cadddr)

(define make-node
	(lambda (labels left right)
    		(list the-node-tag labels left right)))

(define make-leaf 
	(lambda (labels)
    		(list the-leaf-tag labels)))
